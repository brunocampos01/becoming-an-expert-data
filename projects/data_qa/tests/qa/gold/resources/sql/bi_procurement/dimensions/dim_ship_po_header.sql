SELECT 
	VESSEL_PO_SK, 
	VESSEL_PO_COY_CODE, 
	VESSEL_PO_ORDER_NO, 
	VESSEL_PO_ORDER_CODE, 
	VESSEL_PO_ORDER_NAME, 
	VESSEL_PO_ORDER_STAGE_DESC, 
	VESSEL_PO_ORDER_STATUS_CODE, 
	VESSEL_PO_ORDER_STATUS_DESC, 
	VESSEL_PO_ORDER_STATUS_DATE_DT, 
	VESSEL_PO_ORDER_TYPE_DESC, 
	VESSEL_PO_REQUEST_STATUS_DESC, 
	VESSEL_PO_REQS_BY_NAME, 
	VESSEL_PO_REQS_CREATED_DATE, 
	VESSEL_PO_REQS_ENTRD_DATE, 
	VESSEL_PO_ENQR_AUTH_DATE, 
	VESSEL_PO_ORDER_DATE_DT, 
	VESSEL_PO_REQUESTED_DELIVERY_DATE_DT, 
	VESSEL_PO_EXPECTED_DELIVERY_DATE_DT, 
	VESSEL_PO_RECEIVED_DATE_DT, 
	VESSEL_PO_TYPE_APPR_CERT_REQ_FLAG, 
	VESSEL_PO_CURR_ORIG_CODE, 
	VESSEL_PO_CURR_SK, 
	VESSEL_PO_CURR_CODE, 
	VESSEL_PO_CURR_NAME, 
	VESSEL_PO_AMT, 
	VESSEL_PO_FREIGHT_AMT, 
	VESSEL_PO_BALANCE_AMT, 
	VESSEL_PO_CAD_AMT, 
	VESSEL_PO_FREIGHT_CAD_AMT, 
	VESSEL_PO_BALANCE_CAD_AMT, 
	VESSEL_PO_VESSEL_ORIG_CODE, 
	VESSEL_PO_VESSEL_SK, 
	VESSEL_PO_VESSEL_CODE, 
	VESSEL_PO_VESSEL_NAME, 
	VESSEL_PO_SUPPLIER_ORIG_CODE, 
	VESSEL_PO_SUPPLIER_SK, 
	VESSEL_PO_SUPPLIER_CODE, 
	VESSEL_PO_SUPPLIER_NAME, 
	VESSEL_PO_BUYER_NAME, 
	VESSEL_PO_ACCOUNT_ORIG_CODE, 
	VESSEL_PO_ACCOUNT_SK, 
	VESSEL_PO_ACCOUNT_CODE, 
	VESSEL_PO_ACCOUNT_NAME, 
	VESSEL_PO_SHIP_TO_COMP_NAME, 
	VESSEL_PO_SHIP_TO_ADDR, 
	VESSEL_PO_SHIP_TO_CITY_NAME, 
	VESSEL_PO_SHIP_TO_STATE_NAME, 
	VESSEL_PO_SHIP_TO_POST_CODE, 
	VESSEL_PO_SHIP_TO_COUNTRY_NAME, 
	VESSEL_PO_SHIP_TO_PHONE, 
	VESSEL_PO_SHIP_TO_EMAIL, 
	VESSEL_PO_NOTES, 
	VESSEL_PO_UPDATED_DATE
	-- ETL_CREATED_DATE, 
	-- ETL_CREATED_PROCESS_ID, 
	-- ETL_UPDATED_DATE, 
	-- ETL_UPDATED_PROCESS_ID
FROM dw.DIM_VESSEL_PO_HEADER
