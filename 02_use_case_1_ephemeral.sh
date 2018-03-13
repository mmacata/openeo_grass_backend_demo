print_comment "## openEO use case 1: Ephemeral database approach with POST"
print_comment "# Specify an export process to store the final NDVI raster layer into a cloud storage"


present_json ${SCREENDIR}/resources/02_use_case_1_ephemeral.json

do_post_or_put "POST"

request_status

poll_status

store_result_tiff ${TEMP_OUTPUT}/use_case_1.tiff

open_qgis ${TEMP_OUTPUT}/use_case_1.tiff

sleep_short
echo
