# !/bin/bash
# This is script it is just used as an url-handler in common Linux systems
# you have to add it to intercept uris like phone:+341234567
# and this will invoke chrome with a circuit url to make a phone call
# 
# author: Jose Gato Luis <jgato.luis@gmail.com>


# input phone:+34123456 (or others)
# output google-crhome /usr/bin/google-chrome https://eu.yourcircuit.com/#/phone?number=%u

BROWSER_COMMAND='/usr/bin/google-chrome '
CIRCUIT_CALL_URL='https://eu.yourcircuit.com/#/phone?number='
URI_PROTOCOL='phone:'



case "$1" in 
    phone:*|tel:*|circuit:*)
            PHONE_NUMBER=`echo $1| cut -d':' -f 2`
            echo $PHONE_NUMBER 
            echo "$BROWSER_COMMAND $CIRCUIT_CALL_URL$PHONE_NUMBER" 
            eval "$BROWSER_COMMAND $CIRCUIT_CALL_URL$PHONE_NUMBER";;
        *)
            echo "invoking url-handler with wrong uri";;
esac


