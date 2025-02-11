SELECT
  fact.INVOICE_COMPARATOR_ID,
  fact.COY_CODE,
  fact.ORDER_NUM,
  fact.INVOICE_NUM,
  fact.INVOICE_DATE,
  fact.ORDER_TYPE,
  fact.SUPPLIER_NAME,
  fact.CURRENCY_SK,
  fact.IS_PROCESSED,
  fact.IS_PART_INVOICE,
  fact.GOODS_VALUE_AMT,
  fact.FREIGHT_AMT,
  fact.VAT_AMT,
  fact.TAX1_AMT,
  fact.TAX2_AMT,
  fact.TAX3_AMT,
  fact.TOTAL_AMT
FROM
  dw.FACT_VESSEL_INVOICE_COMPARATOR AS fact
  INNER JOIN dw.DIM_CURRENCY AS curr ON curr.CURRENCY_SK = fact.CURRENCY_SK