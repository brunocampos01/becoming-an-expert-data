CREATE MATERIALIZED VIEW staging.account_receivables AS
SELECT
	CAST(date_format(C.TRX_DATE,'yyyyMMdd') as int)					AS sk_date_issuance,
  CAST(date_format(R.DT_RECEBIMENTO,'yyyyMMdd') as int)		AS sk_due_date,
  CAST(date_format(RR.DT_RECEBIMENTO,'yyyyMMdd') as int) 	AS sk_date_received,
  L.LIN_NR_CONTRATO                       								AS contractNumber,
  C.CLIENTE_NOME                          								AS clientName,
	L.LIN_CONTA_CONTABIL               											AS accountCode,
	L.LIN_SEG_MERCADO                  											AS segmentCode,
	L.LIN_UNIDADE_NEGOCIO              											AS businessUnitCode,
	L.LIN_PRODUTO                      											AS productCode,
	L.LIN_CENTRO_CUSTO                 											AS costCenterCode,
	L.LIN_SERVICO                      											AS serviceCode,
	CASE WHEN C.ORG_ID = 86 THEN 'BR01'
     	 WHEN C.ORG_ID = 87 THEN 'BR02'
         WHEN C.ORG_ID = 88 THEN 'BR03'
         WHEN C.ORG_ID = 89 THEN 'BR04'
         WHEN C.ORG_ID = 90 THEN 'BR05'
         WHEN C.ORG_ID = 91 THEN 'BR06'
         WHEN C.ORG_ID = 159 THEN 'BR07'
    END  	                             										AS companyCode,
    CASE WHEN C.ORG_ID = 86 THEN 'BR01'
         WHEN C.ORG_ID = 87 THEN 'BR02'
         WHEN C.ORG_ID = 88 THEN 'BR03'
         WHEN C.ORG_ID = 89 THEN 'BR04'
         WHEN C.ORG_ID = 90 THEN 'BR05'
         WHEN C.ORG_ID = 91 THEN 'BR06'
         WHEN C.ORG_ID = 159 THEN 'BR07'
    END		                             										AS interciaCode,
	L.LIN_PROJETO                      											AS projectCode,
    C.TRX_NUMBER                            							AS nrRPS,
    C.NF_NUMBER                             							AS nrNFSE,
	    CASE WHEN C.VALOR_RECEBIDO = 0 THEN L.LIN_VALOR_RECEBIDO ELSE IF(ISNULL(L.LIN_VALOR_RECEBIDO), L.LIN_VALOR_RECEBIDO, L.LIN_VALOR_RECEBIDO * (RR.VALOR_RECEBIMENTO/C.VALOR_RECEBIDO)) END						AS vlRecebido,
	    CASE WHEN C.VALOR_RECEBIDO = 0 THEN L.LIN_VALOR_BRUTO ELSE IF(ISNULL(L.LIN_VALOR_BRUTO), L.LIN_VALOR_BRUTO, L.LIN_VALOR_BRUTO * (RR.VALOR_RECEBIMENTO/C.VALOR_RECEBIDO)) END									AS vlBruto,
	    CASE WHEN C.VALOR_RECEBIDO = 0 THEN L.LIN_VALOR_LIQUIDO ELSE IF(ISNULL(L.LIN_VALOR_LIQUIDO), L.LIN_VALOR_LIQUIDO, L.LIN_VALOR_LIQUIDO * (RR.VALOR_RECEBIMENTO/C.VALOR_RECEBIDO)) END								AS vlLiquido,
	    CASE WHEN C.VALOR_RECEBIDO = 0 THEN L.LIN_VALOR_IMPOSTO_RET ELSE IF(ISNULL(L.LIN_VALOR_IMPOSTO_RET), L.LIN_VALOR_IMPOSTO_RET, L.LIN_VALOR_IMPOSTO_RET * (RR.VALOR_RECEBIMENTO/C.VALOR_RECEBIDO)) END					AS vlImpostoRetido,
	    CASE WHEN C.VALOR_RECEBIDO = 0 THEN L.LIN_VALOR_ORIGINAL_RECEBER ELSE IF(ISNULL(L.LIN_VALOR_ORIGINAL_RECEBER), L.LIN_VALOR_ORIGINAL_RECEBER, L.LIN_VALOR_ORIGINAL_RECEBER * (RR.VALOR_RECEBIMENTO/C.VALOR_RECEBIDO)) END	AS vlOriginalReceber,
	    CASE WHEN C.VALOR_RECEBIDO = 0 THEN L.LIN_VALOR_RECEBIDO_BRUTO ELSE IF(ISNULL(L.LIN_VALOR_RECEBIDO_BRUTO), L.LIN_VALOR_RECEBIDO_BRUTO, L.LIN_VALOR_RECEBIDO_BRUTO * (RR.VALOR_RECEBIMENTO/C.VALOR_RECEBIDO)) END		AS vlRecebidoBruto,
	    CASE WHEN C.VALOR_RECEBIDO = 0 THEN L.LIN_VALOR_AJUSTES ELSE IF(ISNULL(L.LIN_VALOR_AJUSTES), L.LIN_VALOR_AJUSTES, L.LIN_VALOR_AJUSTES * (RR.VALOR_RECEBIMENTO/C.VALOR_RECEBIDO)) END								AS vlAjustes,
	    CASE WHEN C.VALOR_RECEBIDO = 0 THEN L.LIN_VALOR_AJUSTES_IMPOSTO ELSE IF(ISNULL(L.LIN_VALOR_AJUSTES_IMPOSTO), L.LIN_VALOR_AJUSTES_IMPOSTO, L.LIN_VALOR_AJUSTES_IMPOSTO * (RR.VALOR_RECEBIMENTO/C.VALOR_RECEBIDO)) END		AS vlAjustesImposto,
	    CASE WHEN C.VALOR_RECEBIDO = 0 THEN L.LIN_VALOR_SALDO_RECEBER ELSE IF(ISNULL(L.LIN_VALOR_SALDO_RECEBER), L.LIN_VALOR_SALDO_RECEBER, L.LIN_VALOR_SALDO_RECEBER * (RR.VALOR_RECEBIMENTO/C.VALOR_RECEBIDO)) END			AS vlSaldoReceber,
	    CASE WHEN C.VALOR_RECEBIDO = 0 THEN L.LIN_VALOR_ACRESCIMO ELSE IF(ISNULL(L.LIN_VALOR_ACRESCIMO), L.LIN_VALOR_ACRESCIMO, L.LIN_VALOR_ACRESCIMO * (RR.VALOR_RECEBIMENTO/C.VALOR_RECEBIDO)) END						AS vlAcrescimo
  FROM raw.oracle_ar_capa as C
  JOIN raw.oracle_ar_lancamentos L ON C.CUSTOMER_TRX_ID = L.CUSTOMER_TRX_ID
  JOIN raw.oracle_ar_recebimentos R ON C.CUSTOMER_TRX_ID = R.CUSTOMER_TRX_ID AND R.TIPO = 'RECEBER' AND R.PARAMETER_NAME1 = 'PAYMENT_SCHEDULE_ID'
  LEFT JOIN raw.oracle_ar_recebimentos RR ON C.CUSTOMER_TRX_ID = RR.CUSTOMER_TRX_ID AND RR.TIPO = 'RECEBIMENTO' AND RR.PARAMETER_NAME3 = 'PAYMENT_SCHEDULE_ID' AND R.PARAMETER_VALUE1 = RR.PARAMETER_VALUE3
