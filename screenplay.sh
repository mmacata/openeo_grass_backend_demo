#!/bin/bash

SCREENDIR=~/openeo-grass-gis-backend-demo
TEMP_OUTPUT=${SCREENDIR}/temporal_output

. ${SCREENDIR}/functions.sh

cat ${SCREENDIR}/resources/00_welcome.header
sleep_short

cat ${SCREENDIR}/resources/00_overview.header
sleep_short

echo
print_comment "# This is a comment"
print_curl "This is a console command"
echo "This is api output"
echo

sleep_short
. ${SCREENDIR}/01_general.sh

sleep_short
. ${SCREENDIR}/02_use_case_1_persistent.sh

sleep_short
. ${SCREENDIR}/02_use_case_1_ephemeral.sh

sleep_short
. ${SCREENDIR}/03_use_case_2.sh

sleep_short
. ${SCREENDIR}/04_use_case_3.sh

cat ${SCREENDIR}/resources/00_goodbye.header
