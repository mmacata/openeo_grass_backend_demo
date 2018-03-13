cat ${SCREENDIR}/resources/03_use_case_2.header
sleep_long

print_comment "# We process the previously created NDVI time series. The user defined function will aggregate time by summing all values"
print_comment "# The user defined function is located in a file that is accessible online"
print_curl "curl -X GET 'https://storage.googleapis.com/datentransfer/aggr_func.py'"
curl -X GET 'https://storage.googleapis.com/datentransfer/aggr_func.py'
sleep_long

present_json ${SCREENDIR}/resources/03_use_case_2.json

do_post_or_put "POST"

request_status

poll_status

store_result_tiff ${TEMP_OUTPUT}/use_case_2.tiff

open_qgis ${TEMP_OUTPUT}/use_case_2.tiff

sleep_short
echo
