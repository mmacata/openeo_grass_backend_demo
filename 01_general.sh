cat ${SCREENDIR}/resources/01_general.header
sleep_long

print_comment "# Get the API description using curl"
print_curl "curl -X GET http://openeo.mundialis.de:5000/capabilities"
curl -X GET http://openeo.mundialis.de:5000/capabilities
echo
sleep_long

print_comment "# List all available data in the GRaaS database:"
print_curl "curl -X GET http://openeo.mundialis.de:5000/data"
#curl -X GET http://openeo.mundialis.de:5000/data #takes too long
sleep_long
cat ${SCREENDIR}/resources/sample_data.json
echo
sleep_long

print_comment "# Get information about band 04 of the Sentinel-2A time series:"
print_curl "curl -X GET http://openeo.mundialis.de:5000/data/LL.sentinel2A_openeo_subset.strds.S2A_B04"
curl -X GET http://openeo.mundialis.de:5000/data/LL.sentinel2A_openeo_subset.strds.S2A_B04
echo
sleep_long

print_comment "# Get information about band 08 of the Sentinel-2A time series:"
print_curl "curl -X GET http://openeo.mundialis.de:5000/data/LL.sentinel2A_openeo_subset.strds.S2A_B08"
curl -X GET http://openeo.mundialis.de:5000/data/LL.sentinel2A_openeo_subset.strds.S2A_B08
echo
sleep_long

print_comment "# List process information about all processes that are available for computation:"
print_curl "curl -X GET http://openeo.mundialis.de:5000/processes"
curl -X GET http://openeo.mundialis.de:5000/processes
echo
sleep_long

print_comment "# Get information about each available process:"
print_curl "curl -X GET http://openeo.mundialis.de:5000/processes/udf_reduce_time"
curl -X GET http://openeo.mundialis.de:5000/processes/udf_reduce_time
echo
sleep_long

print_curl "curl -X GET http://openeo.mundialis.de:5000/processes/NDVI"
curl -X GET http://openeo.mundialis.de:5000/processes/NDVI
echo
sleep_long
