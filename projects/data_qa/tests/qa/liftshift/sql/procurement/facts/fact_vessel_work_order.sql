SELECT
  fact.FVWO_VESSEL_SS_SK,
  fact.FVWO_VESSEL_COMP_SK,
  fact.FVWO_MAINT_JOB_SK,
  fact.FVWO_DIVISION_SK,
  fact.FVWO_WO_TYPE_SK,
  fact.FVWO_ORIGINAL_DUE_DATE_SK,
  fact.FVWO_STARTED_DATE_SK,
  fact.FVWO_COMPLETED_DATE_SK,
  fact.FVWO_RESCH_DATE_SK,
  fact.FVWO_RESCH_REASON_SK,
  fact.FVWO_DUE_DATE_SK,
  fact.FVWO_INTERVAL_LENGHT_UOM,
  fact.FVWO_INTERVAL_LENGHT_VALUE,
  fact.FVWO_ESTIMATED_MAN_HOURS,
  fact.FVWO_NB_OVERDUE_MONTHS,
  fact.FVWO_NB_OVERDUE_DAYS
FROM
  dw.FACT_VESSEL_WORK_ORDER AS fact
  INNER JOIN dw.DIM_VESSEL_SHIPSURE AS ves ON ves.VESSEL_SS_SK = fact.FVWO_VESSEL_SS_SK
  INNER JOIN dw.DIM_VESSEL_COMPONENT AS com ON com.VESSEL_COMP_SK = fact.FVWO_VESSEL_COMP_SK
  INNER JOIN dw.DIM_MAINTENANCE_JOB AS maintjob ON maintjob.MAINT_JOB_SK = fact.FVWO_MAINT_JOB_SK
  INNER JOIN dw.DIM_REGION AS reg ON reg.REGION_SK = fact.FVWO_DIVISION_SK
  INNER JOIN dw.DIM_WORK_ORDER_TYPE AS wo ON wo.WO_TYPE_SK = fact.FVWO_WO_TYPE_SK
  LEFT OUTER JOIN dw.DIM_RESCHEDULED_REASON AS rea ON rea.RESCH_REASON_SK = fact.FVWO_RESCH_REASON_SK