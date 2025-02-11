SELECT
  REF_CODE_SK,
  TRIM(REF_SUBJECT_NAME) AS REF_CODE_SUBJECT_NAME,
  TRIM(REF_CODE_NAME) AS REF_CODE_NAME,
  TRIM(REF_CODE_VALUE) AS REF_CODE_VALUE,
  TRIM(REF_CODE_VALUE_DESC_EN) AS REF_CODE_VALUE_DESC_EN,
  TRIM(REF_CODE_VALUE_DESC_FR) AS REF_CODE_VALUE_DESC_FR
--  ETL_CREATED_DATE,
--  ETL_CREATED_PROCESS_ID,
--  ETL_UPDATED_DATE,
--  ETL_UPDATED_PROCESS_ID
FROM
  dw.DIM_REFERENCE_CODE