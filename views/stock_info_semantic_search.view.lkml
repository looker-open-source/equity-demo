view: stock_info_embeddings_model {
  derived_table: {
    datagroup_trigger: history
    sql_create:
      CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
      REMOTE WITH CONNECTION `@{BQML_REMOTE_CONNECTION_ID}`
      OPTIONS (ENDPOINT = 'textembedding-gecko@002');
    ;;
  }
}
view: stock_info_embeddings {
  derived_table: {
    datagroup_trigger: history
    publish_as_db_view: yes
    sql_create:
    -- This SQL statement creates embeddings for all the rows in the given table (in this case the products lookml view) --
    CREATE OR REPLACE TABLE ${SQL_TABLE_NAME} AS
    SELECT ml_generate_embedding_result as text_embedding
      , * FROM ML.GENERATE_EMBEDDING(
      MODEL ${stock_info_embeddings_model.SQL_TABLE_NAME},
      (
        SELECT *, name as content
        FROM ${stock_info.SQL_TABLE_NAME}
      )
    )
    WHERE LENGTH(ml_generate_embedding_status) = 0; ;;
  }
}

view: stcok_info_embeddings_index {
  derived_table: {
    datagroup_trigger: history
    sql_create:
    -- This SQL statement indexes the embeddings for fast lookup. We specify COSINE similarity here --
      CREATE OR REPLACE VECTOR INDEX ${SQL_TABLE_NAME}
      ON ${stock_info_embeddings.SQL_TABLE_NAME}(text_embedding)
      OPTIONS(index_type = 'IVF',
        distance_type = 'COSINE',
        ivf_options = '{"num_lists":500}') ;;
  }
}

view: stock_info_semantic_search {
  derived_table: {
    sql:
    -- This SQL statement performs the vector search --
    -- Step 1. Generate Embedding from natural language question --
    -- Step 2. Specify the text_embedding column from the embeddings table that was generated for each product in this example --
    -- Step 3. Use BQML's native Vector Search functionality to match the nearest embeddings --
    -- Step 4. Return the matche products --
    SELECT query.query
    ,base.symbol as matched_stock_symbol
    ,base.shortName as matched_stock_name
    ,base.id as matched_stock_id
    ,base.sector as matched_stock_sector
    ,base.industry as matched_stock_industry
    ,base.currentPrice as matched_stock_current_price
    ,base.marketCap as matched_stock_market_cap
    FROM VECTOR_SEARCH(
      TABLE ${stock_info_embeddings.SQL_TABLE_NAME}, 'text_embedding',
      (
        SELECT ml_generate_embedding_result, content AS query
        FROM ML.GENERATE_EMBEDDING(
          MODEL ${stock_info_embeddings_model.SQL_TABLE_NAME},
          (SELECT {% parameter stock_info_description %} AS content)
        )
      ),
      top_k => {% parameter stock_info_matches %}
      ,options => '{"fraction_lists_to_search": 0.5}'
    ) ;;
  }

  parameter: stock_info_description {
    type: string
  }

  parameter: stock_info_matches {
    type: number
  }

  dimension: stock_info_description_chosen {
    type: string
    sql: {% parameter stock_info_description %} ;;
  }

  dimension: stock_info_matches_chosen {
    type: string
    sql:  {% parameter stock_info_matches %} ;;
  }

  dimension: matched_stock_symbol {
    type: string
    sql: ${TABLE}.matched_stock_symbol ;;
  }

  dimension: matched_stock_name {
    type: string
    sql: ${TABLE}.matched_stock_name ;;
  }

  dimension: matched_stock_id {
    type: string
    sql: ${TABLE}.matched_stock_id ;;
  }

  dimension: matched_stock_sector {
    type: string
    sql: ${TABLE}.matched_stock_sector ;;
  }

  dimension: matched_stock_industry {
    type: string
    sql: ${TABLE}.matched_stock_industry ;;
  }

  dimension: matched_stock_current_price {
    type: number
    sql: ${TABLE}.matched_stock_current_price ;;
  }

  dimension: matched_stock_market_cap {
    type: number
    sql: ${TABLE}.matched_stock_market_cap ;;
  }
}
