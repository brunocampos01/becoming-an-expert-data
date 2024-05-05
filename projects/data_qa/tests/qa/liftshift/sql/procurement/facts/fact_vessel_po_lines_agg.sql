SELECT ---dimensions-------------
	 fact.FVPOLA_VESSEL_PO_SK
      ,fact.FVPOLA_VESSEL_PART_SK
      ,fact.FVPOLA_VESSEL_SK
      ,fact.FVPOLA_REGION_SK
      ,fact.FVPOLA_SUPPLIER_SK
      ,fact.FVPOLA_ACCOUNT_SK
      ,fact.FVPOLA_PROC_ITEM_TYPE_SK
      ,fact.FVPOLA_CURRENCY_SK
      ,fact.FVPOLA_ORDER_DATE_SK
      ,fact.FVPOLA_REQUESTED_DELIVERY_DATE_SK
      ,fact.FVPOLA_EXPECTED_DELIVERY_DATE_SK
      ,fact.FVPOLA_RECEIVED_DATE_SK
	  ---measures------------------
      ,FVPOLA_UNIT_PRICE_NET_AMT
      ,FVPOLA_UNIT_PRICE_NET_CAD_AMT
      ,FVPOLA_REQUESTED_QTY
      ,FVPOLA_ORDERED_QTY
      ,FVPOLA_RECEIVED_QTY
      ,FVPOLA_ORDER_MATERIAL_NET_AMT
      ,FVPOLA_ORDER_MATERIAL_NET_CAD_AMT
      ,FVPOLA_ORDER_FREIGHT_AMT
      ,FVPOLA_ORDER_FREIGHT_CAD_AMT
FROM dw.FACT_VESSEL_PO_LINES_AGG fact
JOIN dw.DIM_VESSEL_PO_HEADER po
	ON po.VESSEL_PO_SK = fact.FVPOLA_VESSEL_PO_SK
JOIN dw.DIM_VESSEL_PART part
	ON part.VESSEL_PART_SK = fact.FVPOLA_VESSEL_PART_SK
JOIN dw.DIM_VESSEL_SHIPSURE ves
	ON ves.VESSEL_SS_SK = fact.FVPOLA_VESSEL_SK
JOIN dw.DIM_REGION reg 
	ON reg.REGION_SK = fact.FVPOLA_REGION_SK
JOIN dw.DIM_CONTACT_SHIPSURE supp
	ON supp.CONTACT_SS_SK = fact.FVPOLA_SUPPLIER_SK
JOIN dw.DIM_ACCOUNT_SHIPSURE acc
	ON acc.ACCOUNT_SS_SK = fact.FVPOLA_ACCOUNT_SK
JOIN dw.DIM_PROCUREMENT_ITEM_TYPE itemtype
	ON itemtype.PROC_ITEM_TYPE_SK = fact.FVPOLA_PROC_ITEM_TYPE_SK
JOIN dw.DIM_CURRENCY curr
	ON curr.CURRENCY_SK = fact.FVPOLA_CURRENCY_SK
WHERE fact.FVPOLA_ORDER_DATE_SK 
	BETWEEN CAST(CONVERT(char(8), getdate()-91,112) as int) -- filter on a primary key to reduce query execution time (last 90 days since yesterday)
	AND CAST(CONVERT(char(8), getdate()-1,112) as int)