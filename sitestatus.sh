#!/bin/bash

function ctrl_c(){
    echo -e "\n\n[!] Saliendo...\n"
    exit 1
}

trap ctrl_c INT 

output="$1"
echo -e "\n--------------------------------------------------\n"
curl -s "https://crt.sh/?q="$output"&output=json" | jq -r '.[] | "\(.name_value)\n\(.common_name)"' | sort -u | while read output

do
    code=$(curl -s -o /dev/null -w "%{http_code}" $output) 
    if [ $code -eq 000 ] || [ $code -eq 400 ] || [ $code -eq 403 ] || [ $code -eq 404 ] || [ $code -eq 408 ]|| [ $code -eq 410 ]|| [ $code -eq 422 ]|| [ $code -eq 500 ] || [ $code -eq 502 ]|| [ $code -eq 503 ] || [ $code -eq 504 ]|| [ $code -eq 508 ]|| [ $code -eq 521 ]|| [ $code -eq 525 ]; then
    	echo "Site: $output" 
    	echo "Status: Down" 
    	echo "Code: $code"
    else
    	echo "Site: $output"
    	echo "Status: Up"
    	echo "Code: $code" 
    fi
    
    echo -e "\n-------Https Verification-------"
    code=$(curl -s -o /dev/null -w "%{http_code}" https://$output)  
    if [ $code -eq 000 ] || [ $code -eq 400 ] || [ $code -eq 403 ] || [ $code -eq 404 ] || [ $code -eq 408 ]|| [ $code -eq 410 ]|| [ $code -eq 422 ]|| [ $code -eq 500 ] || [ $code -eq 502 ]|| [ $code -eq 503 ] || [ $code -eq 504 ]|| [ $code -eq 508 ]|| [ $code -eq 521 ]|| [ $code -eq 525 ]; then
    	echo "$output --> Site Down"
    	echo "Code: $code"
    	echo -e "\n--------------------------------------------------\n"
    else
    	echo "$output --> Site Up"
    	echo "Code: $code" 
  	echo -e "\n--------------------------------------------------\n"
    fi

done


#### apt install jq
