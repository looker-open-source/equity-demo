view: stock_info_semantic_search {
  derived_table: {
    datagroup_trigger: history
    sql_create:
            CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
      REMOTE WITH CONNECTION `@{BQML_REMOTE_CONNECTION_ID}`
      OPTIONS (ENDPOINT = 'textembedding-gecko@002');
    ;;
  }
}
