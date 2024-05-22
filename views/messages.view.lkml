# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
# explore: messages {
#   hidden: yes
#     join: messages__oracle_report__raw_reports {
#       view_label: "Messages: Oracle Report Raw Reports"
#       sql: LEFT JOIN UNNEST(${messages.oracle_report__raw_reports}) as messages__oracle_report__raw_reports ;;
#       relationship: one_to_many
#     }
#     join: messages__cosmos_sdk_msg_send__amount {
#       view_label: "Messages: Cosmos Sdk Msgsend Amount"
#       sql: LEFT JOIN UNNEST(${messages.cosmos_sdk_msg_send__amount}) as messages__cosmos_sdk_msg_send__amount ;;
#       relationship: one_to_many
#     }
#     join: messages__cosmos_sdk_msg_multi_send__inputs {
#       view_label: "Messages: Cosmos Sdk Msgmultisend Inputs"
#       sql: LEFT JOIN UNNEST(${messages.cosmos_sdk_msg_multi_send__inputs}) as messages__cosmos_sdk_msg_multi_send__inputs ;;
#       relationship: one_to_many
#     }
#     join: messages__cosmos_sdk_msg_multi_send__outputs {
#       view_label: "Messages: Cosmos Sdk Msgmultisend Outputs"
#       sql: LEFT JOIN UNNEST(${messages.cosmos_sdk_msg_multi_send__outputs}) as messages__cosmos_sdk_msg_multi_send__outputs ;;
#       relationship: one_to_many
#     }
#     join: messages__cosmos_sdk_msg_multi_send__inputs__coins {
#       view_label: "Messages: Cosmos Sdk Msgmultisend Inputs Coins"
#       sql: LEFT JOIN UNNEST(${messages__cosmos_sdk_msg_multi_send__inputs.coins}) as messages__cosmos_sdk_msg_multi_send__inputs__coins ;;
#       relationship: one_to_many
#     }
#     join: messages__cosmos_sdk_msg_multi_send__outputs__coins {
#       view_label: "Messages: Cosmos Sdk Msgmultisend Outputs Coins"
#       sql: LEFT JOIN UNNEST(${messages__cosmos_sdk_msg_multi_send__outputs.coins}) as messages__cosmos_sdk_msg_multi_send__outputs__coins ;;
#       relationship: one_to_many
#     }
# }
view: messages {
  sql_table_name: `public-data-finance.crypto_band.messages` ;;

  dimension: block_height {
    type: number
    sql: ${TABLE}.block_height ;;
  }
  dimension: block_timestamp {
    type: string
    sql: ${TABLE}.block_timestamp ;;
  }
  dimension_group: block_timestamp_truncated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.block_timestamp_truncated ;;
  }
  dimension: cosmos_sdk_msg_begin_redelegate__amount__amount {
    type: number
    sql: ${TABLE}.cosmos_sdk_MsgBeginRedelegate.amount.amount ;;
    group_label: "Cosmos Sdk Msg Begin Redelegate Amount"
    group_item_label: "Amount"
  }
  dimension: cosmos_sdk_msg_begin_redelegate__amount__denom {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgBeginRedelegate.amount.denom ;;
    group_label: "Cosmos Sdk Msg Begin Redelegate Amount"
    group_item_label: "Denom"
  }
  dimension: cosmos_sdk_msg_begin_redelegate__delegator_address {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgBeginRedelegate.delegator_address ;;
    group_label: "Cosmos Sdk Msg Begin Redelegate"
    group_item_label: "Delegator Address"
  }
  dimension: cosmos_sdk_msg_begin_redelegate__validator_dst_address {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgBeginRedelegate.validator_dst_address ;;
    group_label: "Cosmos Sdk Msg Begin Redelegate"
    group_item_label: "Validator Dst Address"
  }
  dimension: cosmos_sdk_msg_begin_redelegate__validator_src_address {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgBeginRedelegate.validator_src_address ;;
    group_label: "Cosmos Sdk Msg Begin Redelegate"
    group_item_label: "Validator Src Address"
  }
  dimension: cosmos_sdk_msg_create_validator__commission__max_change_rate {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgCreateValidator.commission.max_change_rate ;;
    group_label: "Cosmos Sdk Msg Create Validator Commission"
    group_item_label: "Max Change Rate"
  }
  dimension: cosmos_sdk_msg_create_validator__commission__max_rate {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgCreateValidator.commission.max_rate ;;
    group_label: "Cosmos Sdk Msg Create Validator Commission"
    group_item_label: "Max Rate"
  }
  dimension: cosmos_sdk_msg_create_validator__commission__rate {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgCreateValidator.commission.rate ;;
    group_label: "Cosmos Sdk Msg Create Validator Commission"
    group_item_label: "Rate"
  }
  dimension: cosmos_sdk_msg_create_validator__delegator_address {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgCreateValidator.delegator_address ;;
    group_label: "Cosmos Sdk Msg Create Validator"
    group_item_label: "Delegator Address"
  }
  dimension: cosmos_sdk_msg_create_validator__description__details {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgCreateValidator.description.details ;;
    group_label: "Cosmos Sdk Msg Create Validator Description"
    group_item_label: "Details"
  }
  dimension: cosmos_sdk_msg_create_validator__description__identity {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgCreateValidator.description.identity ;;
    group_label: "Cosmos Sdk Msg Create Validator Description"
    group_item_label: "Identity"
  }
  dimension: cosmos_sdk_msg_create_validator__description__moniker {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgCreateValidator.description.moniker ;;
    group_label: "Cosmos Sdk Msg Create Validator Description"
    group_item_label: "Moniker"
  }
  dimension: cosmos_sdk_msg_create_validator__description__security_contact {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgCreateValidator.description.security_contact ;;
    group_label: "Cosmos Sdk Msg Create Validator Description"
    group_item_label: "Security Contact"
  }
  dimension: cosmos_sdk_msg_create_validator__description__website {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgCreateValidator.description.website ;;
    group_label: "Cosmos Sdk Msg Create Validator Description"
    group_item_label: "Website"
  }
  dimension: cosmos_sdk_msg_create_validator__min_self_delegation {
    type: number
    sql: ${TABLE}.cosmos_sdk_MsgCreateValidator.min_self_delegation ;;
    group_label: "Cosmos Sdk Msg Create Validator"
    group_item_label: "Min Self Delegation"
  }
  dimension: cosmos_sdk_msg_create_validator__pubkey {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgCreateValidator.pubkey ;;
    group_label: "Cosmos Sdk Msg Create Validator"
    group_item_label: "Pubkey"
  }
  dimension: cosmos_sdk_msg_create_validator__validator_address {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgCreateValidator.validator_address ;;
    group_label: "Cosmos Sdk Msg Create Validator"
    group_item_label: "Validator Address"
  }
  dimension: cosmos_sdk_msg_create_validator__value__amount {
    type: number
    sql: ${TABLE}.cosmos_sdk_MsgCreateValidator.value.amount ;;
    group_label: "Cosmos Sdk Msg Create Validator Value"
    group_item_label: "Amount"
  }
  dimension: cosmos_sdk_msg_create_validator__value__denom {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgCreateValidator.value.denom ;;
    group_label: "Cosmos Sdk Msg Create Validator Value"
    group_item_label: "Denom"
  }
  dimension: cosmos_sdk_msg_delegate__amount__amount {
    type: number
    sql: ${TABLE}.cosmos_sdk_MsgDelegate.amount.amount ;;
    group_label: "Cosmos Sdk Msg Delegate Amount"
    group_item_label: "Amount"
  }
  dimension: cosmos_sdk_msg_delegate__amount__denom {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgDelegate.amount.denom ;;
    group_label: "Cosmos Sdk Msg Delegate Amount"
    group_item_label: "Denom"
  }
  dimension: cosmos_sdk_msg_delegate__delegator_address {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgDelegate.delegator_address ;;
    group_label: "Cosmos Sdk Msg Delegate"
    group_item_label: "Delegator Address"
  }
  dimension: cosmos_sdk_msg_delegate__validator_address {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgDelegate.validator_address ;;
    group_label: "Cosmos Sdk Msg Delegate"
    group_item_label: "Validator Address"
  }
  dimension: cosmos_sdk_msg_deposit__amount__amount {
    type: number
    sql: ${TABLE}.cosmos_sdk_MsgDeposit.amount.amount ;;
    group_label: "Cosmos Sdk Msg Deposit Amount"
    group_item_label: "Amount"
  }
  dimension: cosmos_sdk_msg_deposit__amount__denom {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgDeposit.amount.denom ;;
    group_label: "Cosmos Sdk Msg Deposit Amount"
    group_item_label: "Denom"
  }
  dimension: cosmos_sdk_msg_deposit__depositor {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgDeposit.depositor ;;
    group_label: "Cosmos Sdk Msg Deposit"
    group_item_label: "Depositor"
  }
  dimension: cosmos_sdk_msg_deposit__proposal_id {
    type: number
    sql: ${TABLE}.cosmos_sdk_MsgDeposit.proposal_id ;;
    group_label: "Cosmos Sdk Msg Deposit"
    group_item_label: "Proposal ID"
  }
  dimension: cosmos_sdk_msg_edit_validator__address {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgEditValidator.address ;;
    group_label: "Cosmos Sdk Msg Edit Validator"
    group_item_label: "Address"
  }
  dimension: cosmos_sdk_msg_edit_validator__commission_rate {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgEditValidator.commission_rate ;;
    group_label: "Cosmos Sdk Msg Edit Validator"
    group_item_label: "Commission Rate"
  }
  dimension: cosmos_sdk_msg_edit_validator__description__details {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgEditValidator.description.details ;;
    group_label: "Cosmos Sdk Msg Edit Validator Description"
    group_item_label: "Details"
  }
  dimension: cosmos_sdk_msg_edit_validator__description__identity {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgEditValidator.description.identity ;;
    group_label: "Cosmos Sdk Msg Edit Validator Description"
    group_item_label: "Identity"
  }
  dimension: cosmos_sdk_msg_edit_validator__description__moniker {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgEditValidator.description.moniker ;;
    group_label: "Cosmos Sdk Msg Edit Validator Description"
    group_item_label: "Moniker"
  }
  dimension: cosmos_sdk_msg_edit_validator__description__security_contact {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgEditValidator.description.security_contact ;;
    group_label: "Cosmos Sdk Msg Edit Validator Description"
    group_item_label: "Security Contact"
  }
  dimension: cosmos_sdk_msg_edit_validator__description__website {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgEditValidator.description.website ;;
    group_label: "Cosmos Sdk Msg Edit Validator Description"
    group_item_label: "Website"
  }
  dimension: cosmos_sdk_msg_edit_validator__min_self_delegation {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgEditValidator.min_self_delegation ;;
    group_label: "Cosmos Sdk Msg Edit Validator"
    group_item_label: "Min Self Delegation"
  }
  dimension: cosmos_sdk_msg_fund_community_pool__amount__amount {
    type: number
    sql: ${TABLE}.cosmos_sdk_MsgFundCommunityPool.amount.amount ;;
    group_label: "Cosmos Sdk Msg Fund Community Pool Amount"
    group_item_label: "Amount"
  }
  dimension: cosmos_sdk_msg_fund_community_pool__amount__denom {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgFundCommunityPool.amount.denom ;;
    group_label: "Cosmos Sdk Msg Fund Community Pool Amount"
    group_item_label: "Denom"
  }
  dimension: cosmos_sdk_msg_fund_community_pool__depositor {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgFundCommunityPool.depositor ;;
    group_label: "Cosmos Sdk Msg Fund Community Pool"
    group_item_label: "Depositor"
  }
  dimension: cosmos_sdk_msg_modify_withdraw_address__delegator_address {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgModifyWithdrawAddress.delegator_address ;;
    group_label: "Cosmos Sdk Msg Modify Withdraw Address"
    group_item_label: "Delegator Address"
  }
  dimension: cosmos_sdk_msg_modify_withdraw_address__withdraw_address {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgModifyWithdrawAddress.withdraw_address ;;
    group_label: "Cosmos Sdk Msg Modify Withdraw Address"
    group_item_label: "Withdraw Address"
  }
  dimension: cosmos_sdk_msg_multi_send__inputs {
    hidden: yes
    sql: ${TABLE}.cosmos_sdk_MsgMultiSend.inputs ;;
    group_label: "Cosmos Sdk Msg Multi Send"
    group_item_label: "Inputs"
  }
  dimension: cosmos_sdk_msg_multi_send__outputs {
    hidden: yes
    sql: ${TABLE}.cosmos_sdk_MsgMultiSend.outputs ;;
    group_label: "Cosmos Sdk Msg Multi Send"
    group_item_label: "Outputs"
  }
  dimension: cosmos_sdk_msg_send__amount {
    hidden: yes
    sql: ${TABLE}.cosmos_sdk_MsgSend.amount ;;
    group_label: "Cosmos Sdk Msg Send"
    group_item_label: "Amount"
  }
  dimension: cosmos_sdk_msg_send__from_address {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgSend.from_address ;;
    group_label: "Cosmos Sdk Msg Send"
    group_item_label: "From Address"
  }
  dimension: cosmos_sdk_msg_send__to_address {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgSend.to_address ;;
    group_label: "Cosmos Sdk Msg Send"
    group_item_label: "To Address"
  }
  dimension: cosmos_sdk_msg_submit_evidence__evidence {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgSubmitEvidence.evidence ;;
    group_label: "Cosmos Sdk Msg Submit Evidence"
    group_item_label: "Evidence"
  }
  dimension: cosmos_sdk_msg_submit_evidence__submitter {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgSubmitEvidence.submitter ;;
    group_label: "Cosmos Sdk Msg Submit Evidence"
    group_item_label: "Submitter"
  }
  dimension: cosmos_sdk_msg_submit_proposal__content {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgSubmitProposal.content ;;
    group_label: "Cosmos Sdk Msg Submit Proposal"
    group_item_label: "Content"
  }
  dimension: cosmos_sdk_msg_submit_proposal__initial_deposit__amount {
    type: number
    sql: ${TABLE}.cosmos_sdk_MsgSubmitProposal.initial_deposit.amount ;;
    group_label: "Cosmos Sdk Msg Submit Proposal Initial Deposit"
    group_item_label: "Amount"
  }
  dimension: cosmos_sdk_msg_submit_proposal__initial_deposit__denom {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgSubmitProposal.initial_deposit.denom ;;
    group_label: "Cosmos Sdk Msg Submit Proposal Initial Deposit"
    group_item_label: "Denom"
  }
  dimension: cosmos_sdk_msg_submit_proposal__proposer {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgSubmitProposal.proposer ;;
    group_label: "Cosmos Sdk Msg Submit Proposal"
    group_item_label: "Proposer"
  }
  dimension: cosmos_sdk_msg_undelegate__amount__amount {
    type: number
    sql: ${TABLE}.cosmos_sdk_MsgUndelegate.amount.amount ;;
    group_label: "Cosmos Sdk Msg Undelegate Amount"
    group_item_label: "Amount"
  }
  dimension: cosmos_sdk_msg_undelegate__amount__denom {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgUndelegate.amount.denom ;;
    group_label: "Cosmos Sdk Msg Undelegate Amount"
    group_item_label: "Denom"
  }
  dimension: cosmos_sdk_msg_undelegate__delegator_address {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgUndelegate.delegator_address ;;
    group_label: "Cosmos Sdk Msg Undelegate"
    group_item_label: "Delegator Address"
  }
  dimension: cosmos_sdk_msg_undelegate__validator_address {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgUndelegate.validator_address ;;
    group_label: "Cosmos Sdk Msg Undelegate"
    group_item_label: "Validator Address"
  }
  dimension: cosmos_sdk_msg_unjail__address {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgUnjail.address ;;
    group_label: "Cosmos Sdk Msg Unjail"
    group_item_label: "Address"
  }
  dimension: cosmos_sdk_msg_verify_invariant__invariant_module_name {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgVerifyInvariant.invariant_module_name ;;
    group_label: "Cosmos Sdk Msg Verify Invariant"
    group_item_label: "Invariant Module Name"
  }
  dimension: cosmos_sdk_msg_verify_invariant__invariant_route {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgVerifyInvariant.invariant_route ;;
    group_label: "Cosmos Sdk Msg Verify Invariant"
    group_item_label: "Invariant Route"
  }
  dimension: cosmos_sdk_msg_verify_invariant__sender {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgVerifyInvariant.sender ;;
    group_label: "Cosmos Sdk Msg Verify Invariant"
    group_item_label: "Sender"
  }
  dimension: cosmos_sdk_msg_vote__option {
    type: number
    sql: ${TABLE}.cosmos_sdk_MsgVote.option ;;
    group_label: "Cosmos Sdk Msg Vote"
    group_item_label: "Option"
  }
  dimension: cosmos_sdk_msg_vote__proposal_id {
    type: number
    sql: ${TABLE}.cosmos_sdk_MsgVote.proposal_id ;;
    group_label: "Cosmos Sdk Msg Vote"
    group_item_label: "Proposal ID"
  }
  dimension: cosmos_sdk_msg_vote__voter {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgVote.voter ;;
    group_label: "Cosmos Sdk Msg Vote"
    group_item_label: "Voter"
  }
  dimension: cosmos_sdk_msg_withdraw_delegation_reward__delegator_address {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgWithdrawDelegationReward.delegator_address ;;
    group_label: "Cosmos Sdk Msg Withdraw Delegation Reward"
    group_item_label: "Delegator Address"
  }
  dimension: cosmos_sdk_msg_withdraw_delegation_reward__validator_address {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgWithdrawDelegationReward.validator_address ;;
    group_label: "Cosmos Sdk Msg Withdraw Delegation Reward"
    group_item_label: "Validator Address"
  }
  dimension: cosmos_sdk_msg_withdraw_validator_commission__validator_address {
    type: string
    sql: ${TABLE}.cosmos_sdk_MsgWithdrawValidatorCommission.validator_address ;;
    group_label: "Cosmos Sdk Msg Withdraw Validator Commission"
    group_item_label: "Validator Address"
  }
  dimension: message_type {
    type: string
    sql: ${TABLE}.message_type ;;
  }
  dimension: oracle_activate__validator {
    type: string
    sql: ${TABLE}.oracle_Activate.validator ;;
    group_label: "Oracle Activate"
    group_item_label: "Validator"
  }
  dimension: oracle_add_reporter__reporter {
    type: string
    sql: ${TABLE}.oracle_AddReporter.reporter ;;
    group_label: "Oracle Add Reporter"
    group_item_label: "Reporter"
  }
  dimension: oracle_add_reporter__validator {
    type: string
    sql: ${TABLE}.oracle_AddReporter.validator ;;
    group_label: "Oracle Add Reporter"
    group_item_label: "Validator"
  }
  dimension: oracle_create_data_source__description {
    type: string
    sql: ${TABLE}.oracle_CreateDataSource.description ;;
    group_label: "Oracle Create Data Source"
    group_item_label: "Description"
  }
  dimension: oracle_create_data_source__executable {
    type: string
    sql: ${TABLE}.oracle_CreateDataSource.executable ;;
    group_label: "Oracle Create Data Source"
    group_item_label: "Executable"
  }
  dimension: oracle_create_data_source__name {
    type: string
    sql: ${TABLE}.oracle_CreateDataSource.name ;;
    group_label: "Oracle Create Data Source"
    group_item_label: "Name"
  }
  dimension: oracle_create_data_source__owner {
    type: string
    sql: ${TABLE}.oracle_CreateDataSource.owner ;;
    group_label: "Oracle Create Data Source"
    group_item_label: "Owner"
  }
  dimension: oracle_create_data_source__sender {
    type: string
    sql: ${TABLE}.oracle_CreateDataSource.sender ;;
    group_label: "Oracle Create Data Source"
    group_item_label: "Sender"
  }
  dimension: oracle_create_oracle_script__code {
    type: string
    sql: ${TABLE}.oracle_CreateOracleScript.code ;;
    group_label: "Oracle Create Oracle Script"
    group_item_label: "Code"
  }
  dimension: oracle_create_oracle_script__description {
    type: string
    sql: ${TABLE}.oracle_CreateOracleScript.description ;;
    group_label: "Oracle Create Oracle Script"
    group_item_label: "Description"
  }
  dimension: oracle_create_oracle_script__name {
    type: string
    sql: ${TABLE}.oracle_CreateOracleScript.name ;;
    group_label: "Oracle Create Oracle Script"
    group_item_label: "Name"
  }
  dimension: oracle_create_oracle_script__owner {
    type: string
    sql: ${TABLE}.oracle_CreateOracleScript.owner ;;
    group_label: "Oracle Create Oracle Script"
    group_item_label: "Owner"
  }
  dimension: oracle_create_oracle_script__schema {
    type: string
    sql: ${TABLE}.oracle_CreateOracleScript.schema ;;
    group_label: "Oracle Create Oracle Script"
    group_item_label: "Schema"
  }
  dimension: oracle_create_oracle_script__sender {
    type: string
    sql: ${TABLE}.oracle_CreateOracleScript.sender ;;
    group_label: "Oracle Create Oracle Script"
    group_item_label: "Sender"
  }
  dimension: oracle_edit_data_source__data_source_id {
    type: number
    sql: ${TABLE}.oracle_EditDataSource.data_source_id ;;
    group_label: "Oracle Edit Data Source"
    group_item_label: "Data Source ID"
  }
  dimension: oracle_edit_data_source__description {
    type: string
    sql: ${TABLE}.oracle_EditDataSource.description ;;
    group_label: "Oracle Edit Data Source"
    group_item_label: "Description"
  }
  dimension: oracle_edit_data_source__executable {
    type: string
    sql: ${TABLE}.oracle_EditDataSource.executable ;;
    group_label: "Oracle Edit Data Source"
    group_item_label: "Executable"
  }
  dimension: oracle_edit_data_source__name {
    type: string
    sql: ${TABLE}.oracle_EditDataSource.name ;;
    group_label: "Oracle Edit Data Source"
    group_item_label: "Name"
  }
  dimension: oracle_edit_data_source__owner {
    type: string
    sql: ${TABLE}.oracle_EditDataSource.owner ;;
    group_label: "Oracle Edit Data Source"
    group_item_label: "Owner"
  }
  dimension: oracle_edit_data_source__sender {
    type: string
    sql: ${TABLE}.oracle_EditDataSource.sender ;;
    group_label: "Oracle Edit Data Source"
    group_item_label: "Sender"
  }
  dimension: oracle_edit_oracle_script__code {
    type: string
    sql: ${TABLE}.oracle_EditOracleScript.code ;;
    group_label: "Oracle Edit Oracle Script"
    group_item_label: "Code"
  }
  dimension: oracle_edit_oracle_script__description {
    type: string
    sql: ${TABLE}.oracle_EditOracleScript.description ;;
    group_label: "Oracle Edit Oracle Script"
    group_item_label: "Description"
  }
  dimension: oracle_edit_oracle_script__name {
    type: string
    sql: ${TABLE}.oracle_EditOracleScript.name ;;
    group_label: "Oracle Edit Oracle Script"
    group_item_label: "Name"
  }
  dimension: oracle_edit_oracle_script__oracle_script_id {
    type: number
    sql: ${TABLE}.oracle_EditOracleScript.oracle_script_id ;;
    group_label: "Oracle Edit Oracle Script"
    group_item_label: "Oracle Script ID"
  }
  dimension: oracle_edit_oracle_script__owner {
    type: string
    sql: ${TABLE}.oracle_EditOracleScript.owner ;;
    group_label: "Oracle Edit Oracle Script"
    group_item_label: "Owner"
  }
  dimension: oracle_edit_oracle_script__schema {
    type: string
    sql: ${TABLE}.oracle_EditOracleScript.schema ;;
    group_label: "Oracle Edit Oracle Script"
    group_item_label: "Schema"
  }
  dimension: oracle_edit_oracle_script__sender {
    type: string
    sql: ${TABLE}.oracle_EditOracleScript.sender ;;
    group_label: "Oracle Edit Oracle Script"
    group_item_label: "Sender"
  }
  dimension: oracle_edit_oracle_script__source_code_url {
    type: string
    sql: ${TABLE}.oracle_EditOracleScript.source_code_url ;;
    group_label: "Oracle Edit Oracle Script"
    group_item_label: "Source Code URL"
  }
  dimension: oracle_remove_reporter__reporter {
    type: string
    sql: ${TABLE}.oracle_RemoveReporter.reporter ;;
    group_label: "Oracle Remove Reporter"
    group_item_label: "Reporter"
  }
  dimension: oracle_remove_reporter__validator {
    type: string
    sql: ${TABLE}.oracle_RemoveReporter.validator ;;
    group_label: "Oracle Remove Reporter"
    group_item_label: "Validator"
  }
  dimension: oracle_report__raw_reports {
    hidden: yes
    sql: ${TABLE}.oracle_Report.raw_reports ;;
    group_label: "Oracle Report"
    group_item_label: "Raw Reports"
  }
  dimension: oracle_report__reporter {
    type: string
    sql: ${TABLE}.oracle_Report.reporter ;;
    group_label: "Oracle Report"
    group_item_label: "Reporter"
  }
  dimension: oracle_report__request_id {
    type: number
    sql: ${TABLE}.oracle_Report.request_id ;;
    group_label: "Oracle Report"
    group_item_label: "Request ID"
  }
  dimension: oracle_report__validator {
    type: string
    sql: ${TABLE}.oracle_Report.validator ;;
    group_label: "Oracle Report"
    group_item_label: "Validator"
  }
  dimension: oracle_request__ask_count {
    type: number
    sql: ${TABLE}.oracle_Request.ask_count ;;
    group_label: "Oracle Request"
    group_item_label: "Ask Count"
  }
  dimension: oracle_request__calldata {
    type: string
    sql: ${TABLE}.oracle_Request.calldata ;;
    group_label: "Oracle Request"
    group_item_label: "Calldata"
  }
  dimension: oracle_request__min_count {
    type: number
    sql: ${TABLE}.oracle_Request.min_count ;;
    group_label: "Oracle Request"
    group_item_label: "Min Count"
  }
  dimension: oracle_request__oracle_script_id {
    type: number
    sql: ${TABLE}.oracle_Request.oracle_script_id ;;
    group_label: "Oracle Request"
    group_item_label: "Oracle Script ID"
  }
  dimension: oracle_request__sender {
    type: string
    sql: ${TABLE}.oracle_Request.sender ;;
    group_label: "Oracle Request"
    group_item_label: "Sender"
  }
  dimension: txhash {
    type: string
    sql: ${TABLE}.txhash ;;
  }
  measure: count {
    type: count
    drill_fields: [oracle_edit_data_source__name, oracle_edit_oracle_script__name, oracle_create_data_source__name, oracle_create_oracle_script__name, cosmos_sdk_msg_verify_invariant__invariant_module_name]
  }
}

view: messages__oracle_report__raw_reports {

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }
  dimension: exit_code {
    type: number
    sql: ${TABLE}.exit_code ;;
  }
  dimension: external_id {
    type: number
    sql: ${TABLE}.external_id ;;
  }
}

view: messages__cosmos_sdk_msg_send__amount {

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }
  dimension: denom {
    type: string
    sql: ${TABLE}.denom ;;
  }
}

view: messages__cosmos_sdk_msg_multi_send__inputs {

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }
  dimension: coins {
    hidden: yes
    sql: ${TABLE}.coins ;;
  }
}

view: messages__cosmos_sdk_msg_multi_send__outputs {

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }
  dimension: coins {
    hidden: yes
    sql: ${TABLE}.coins ;;
  }
}

view: messages__cosmos_sdk_msg_multi_send__inputs__coins {

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }
  dimension: denom {
    type: string
    sql: ${TABLE}.denom ;;
  }
}

view: messages__cosmos_sdk_msg_multi_send__outputs__coins {

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }
  dimension: denom {
    type: string
    sql: ${TABLE}.denom ;;
  }
}
