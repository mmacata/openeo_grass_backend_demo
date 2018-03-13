sleep_short () {
    # echo ""
    sleep 2
}

sleep_long () {
    sleep 5
}

print_comment () {
    echo "$(tput setaf 9)$1$(tput sgr0)"
    echo
    sleep_short
}

print_curl () {
    echo -n "$(tput setaf 2)" #bash

    while IFS= read -n1 char
    do
        printf %s "$char"
        sleep 0.05
    done <<< $1 #bash

    #echo $1 for sh
    echo "$(tput sgr0)"

    echo
    sleep_short
}

print_curl_fast () {
    echo "$(tput setaf 2)$1$(tput sgr0)"
    echo
    sleep_short
}

present_json () {
    print_comment "# Create the process graph as JSON"

    # cat $1
    while IFS= read -r line
    do
      printf "%s\n" "$line"
      sleep 0.2
    done < "$1"

    sleep_long
    sleep_short
    echo

    print_comment "# Store JSON in a shell variable and pass it to the curl command:"

    print_curl "JSON='"
    print_curl_fast "$(cat $1)'"
    sleep_short

    JSON=$(cat $1)

    sleep_short
}

do_post_or_put () {
    print_curl "curl -H \"Content-Type: application/json\" -X $1 -d \"\${JSON}\" http://openeo.mundialis.de:5000/jobs"

    JSON_RES=`curl -H "Content-Type: application/json" -X $1 -d "${JSON}" http://openeo.mundialis.de:5000/jobs`
    printf "%s" "$JSON_RES" | json
    sleep_long
    echo
    export JSON_RES

    sleep_short
}

request_status () {
    print_comment "# We can request the status with the job id:"

    job_id=`printf "%s" "$JSON_RES" | json job_id`
    print_comment "# Job id: $job_id"

    print_curl "curl -X GET http://openeo.mundialis.de:5000/jobs/$job_id"

    curl -X GET http://openeo.mundialis.de:5000/jobs/$job_id
    sleep_long
    sleep_short
    echo
}

poll_status () {
    print_comment "# We need to poll for the final result using the job id until status is not running anymore, since the request is asynchronous:"

    print_curl "curl -X GET http://openeo.mundialis.de:5000/jobs/$job_id"

    poll () {
        JSON_RES=`curl -X GET http://openeo.mundialis.de:5000/jobs/$job_id`
        job_status=`printf "%s" "$JSON_RES" | json status`

        if [ "$job_status" != "finished" ]
        then
            print_comment "# Status is not finished, keep polling..."
            sleep_long
            poll
        else
            printf "%s" "$JSON_RES" | json
            echo
            sleep_long
            export JSON_RES
            sleep_short
        fi
    }
    poll
    export JSON_RES
}

store_result_tiff () {
    print_comment "# The resulting NDVI raster layer is stored as GeoTiff file in the google cloud storage and can be accessed via URL"

    resources_url=`printf "%s" "$JSON_RES" | json resources[0]`
    print_comment "# Locate URL in response: $resources_url"

    print_curl "curl -X GET \"$resources_url\" > $1"

    curl -X GET "$resources_url" > $1
    sleep_short
}

open_qgis () {
    qgis $1 &
    echo "opening $1 in QGIS..."
    sleep_long
    sleep_long
}
