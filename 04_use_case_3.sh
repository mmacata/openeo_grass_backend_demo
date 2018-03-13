cat ${SCREENDIR}/resources/04_use_case_3.header
sleep_long

print_comment "# The zonal statistics is based on the NDVI time series that was computed in the first use case"

present_json ${SCREENDIR}/resources/04_use_case_3.json

do_post_or_put "POST"

request_status

poll_status

print_comment "# The result is located in the job info field and can be converted into a table like:"

printf "%s" "$JSON_RES" | json job_info.process_log | json -c 'this.executable === "t.rast.univar"' -a stdout

sleep_long
echo
