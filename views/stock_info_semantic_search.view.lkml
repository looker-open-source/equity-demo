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
