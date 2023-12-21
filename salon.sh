#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -X -c"

SERVICES=$($PSQL "SELECT * FROM services")

TRIM_TEXT(){
    echo $(echo $1 | sed -r "s/^ *| *$//g")
}

MAIN_MENU(){
    echo -e "\nThese are the services we offer:"
    echo "$SERVICES" | while read ID BAR NAME
    do
        echo $ID\) $NAME
    done

    echo -e "\nPlease select a service:"
    read SERVICE_ID_SELECTED
    
    FETCH_SERVICE_RESULT=$($PSQL "SELECT * FROM services WHERE service_id=$SERVICE_ID_SELECTED")

    if [[ -z $FETCH_SERVICE_RESULT ]]
    then
        echo -e "\nThat is not a valid service, please try again"
        MAIN_MENU
    else
        echo -e "\nCan I get your phone number?"
        read CUSTOMER_PHONE

        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

        if [[ -z $CUSTOMER_ID ]]
        then
            echo -e "\nAnd your name is?"
            read CUSTOMER_NAME

            INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")

            CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        else
            CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
        fi

        echo -e "\nWhen are you coming in?"
        read SERVICE_TIME

        CREATE_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

        SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
        echo -e "\nI have put you down for a $(TRIM_TEXT $SERVICE_NAME_SELECTED) at $SERVICE_TIME, $(TRIM_TEXT $CUSTOMER_NAME).\n"
    fi    
}

echo -e "\nHi! Welcome to the salon.\nHow can I help you today?"
MAIN_MENU
