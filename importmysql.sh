PWD=$(printf '%q\n' "${PWD##*/}")
PWD=${PWD//[^a-zA-Z\d\-:]/}

SQL_CONTAINER=$(docker ps | awk '{print $NF}' | grep mysql | grep $PWD)
OCT_CONTAINER=$(docker ps | awk '{print $NF}' | grep october | grep $PWD)

SQLFILE=$1
USERNAME=$(grep "^OC_DB_USERNAME" .env | cut -f2- -d=)
PASSWORD=$(grep "^OC_DB_PASSWORD" .env | cut -f2- -d=)
DATABASE=$(grep "^OC_DB_DATABASE" .env | cut -f2- -d=)
TYPE=$(grep "^OC_DB_CONNECTION" .env | cut -f2- -d=)

if [ -z $SQLFILE ] || [ ! -e $SQLFILE ] ; then
    echo "You must specify an input file as the first argument"
    exit 1
fi

if [ "$TYPE" != "mysql" ] ; then
    echo "To use this tool you must be using the mysql database connection"
    exit 1
fi

if [ ! -z $USERNAME ] && [ ! -z $PASSWORD ] && [ ! -z $DATABASE ] ; then
    docker exec -i $SQL_CONTAINER mysql -u$USERNAME -p$PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DATABASE" > /dev/null 2>&1
    docker exec -i $SQL_CONTAINER mysql -u$USERNAME -p$PASSWORD $DATABASE < $SQLFILE
    docker exec -i $OCT_CONTAINER php artisan cache:clear
else
    printf "You must set the following variables in your .env file: \n \
    OC_DB_USERNAME\n \
    OC_DB_PASSWORD\n \
    OC_DB_DATABASE\n"
fi
