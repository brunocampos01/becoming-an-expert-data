#!/bin/bash
sqoop job --exec sccd-update-srs >> /opt/cronjobs/logs/sccd-update-srs.log
sqoop job --exec sccd-update-cycles >> /opt/cronjobs/logs/sccd-update-cycles.log
sqoop job --exec sccd-update-history >> /opt/cronjobs/logs/sccd-update-history.log
sqoop job --exec sccd-update-related-record >> /opt/cronjobs/logs/sccd-update-related-record.log
sqoop job --exec sccd-update-sla-records >> /opt/cronjobs/logs/sccd-update-sla-records.log
sqoop job --exec sccd-update-ticket >> /opt/cronjobs/logs/sccd-update-ticket.log
sqoop job --exec sccd-update-worklog >> /opt/cronjobs/logs/sccd-update-worklog.log
sqoop job --exec sccd-update-workperiod >> /opt/cronjobs/logs/sccd-update-workperiod.log
sqoop job --exec sccd-update-calendar >> /opt/cronjobs/logs/sccd-update-calendar.log
sqoop job --exec sccd-update-customers >> /opt/cronjobs/logs/sccd-update-customers.log
sqoop job --exec rtc-update-activities >> /opt/cronjobs/logs/rtc-update-activities.log
sqoop job --exec rtc-update-boolean >> /opt/cronjobs/logs/rtc-update-boolean.log
sqoop job --exec rtc-update-decimal >> /opt/cronjobs/logs/rtc-update-decimal.log
sqoop job --exec rtc-update-enumeration >> /opt/cronjobs/logs/rtc-update-enumeration.log
sqoop job --exec rtc-update-int >> /opt/cronjobs/logs/rtc-update-int.log
sqoop job --exec rtc-update-iterations >> /opt/cronjobs/logs/rtc-update-iterations.log
sqoop job --exec rtc-update-links >> /opt/cronjobs/logs/rtc-update-links.log
sqoop job --exec rtc-update-long >> /opt/cronjobs/logs/rtc-update-long.log
sqoop job --exec rtc-update-releases >> /opt/cronjobs/logs/rtc-update-releases.log
sqoop job --exec rtc-update-resources >> /opt/cronjobs/logs/rtc-update-resources.log
sqoop job --exec rtc-update-string >> /opt/cronjobs/logs/rtc-update-string.log
sqoop job --exec rtc-update-string_large >> /opt/cronjobs/logs/rtc-update-string_large.log
sqoop job --exec rtc-update-string_medium >> /opt/cronjobs/logs/rtc-update-string_medium.log
sqoop job --exec rtc-update-timecodes >> /opt/cronjobs/logs/rtc-update-timecodes.log
sqoop job --exec rtc-update-timelines >> /opt/cronjobs/logs/rtc-update-timelines.log
sqoop job --exec rtc-update-timesheets >> /opt/cronjobs/logs/rtc-update-timesheets.log
sqoop job --exec rtc-update-timestamp >> /opt/cronjobs/logs/rtc-update-timestamp.log
sqoop job --exec rtc-update-workitems >> /opt/cronjobs/logs/rtc-update-workitems.log
sqoop job --exec rtc-update-types >> /opt/cronjobs/logs/rtc-update-types.log
sqoop job --exec rtc-update-projects >> /opt/cronjobs/logs/rtc-update-projects.log