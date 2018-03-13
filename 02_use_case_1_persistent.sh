cat ${SCREENDIR}/resources/02_use_case_1.header
sleep_long
print_comment "# There are two approaches:"
print_comment "## openEO use case 1: Persistent database approach with PUT"

present_json ${SCREENDIR}/resources/02_use_case_1_persistent.json

do_post_or_put "PUT"

request_status

poll_status

print_comment "# Several raster time series datasets were produced in the process, that are now available, e.g."

print_curl "curl -X GET http://openeo.mundialis.de:5000/data/LL.openeo_mapset_0.strds.S2A_B08_filter_daterange_NDVI"

curl -X GET http://openeo.mundialis.de:5000/data/LL.openeo_mapset_0.strds.S2A_B08_filter_daterange_NDVI
sleep_long
echo

print_curl "curl -X GET http://openeo.mundialis.de:5000/data/LL.openeo_mapset_0.raster.S2A_B08_filter_daterange_NDVI_min_time"

curl -X GET http://openeo.mundialis.de:5000/data/LL.openeo_mapset_0.raster.S2A_B08_filter_daterange_NDVI_min_time
sleep_long

echo
