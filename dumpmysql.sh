PWD=$(printf '%q\n' "${PWD##*/}")
PWD=${PWD//[^a-zA-Z\d\-\_:]/}

TYPE=$(grep "^OC_DB_CONNECTION" .env | cut -f2- -d=)
CONTAINER=$(docker ps | awk '{print $NF}' | grep mysql | grep $PWD)
USERNAME=$(grep "^OC_DB_USERNAME" .env | cut -f2- -d=)
PASSWORD=$(grep "^OC_DB_PASSWORD" .env | cut -f2- -d=)
DATABASE=$(grep "^OC_DB_DATABASE" .env | cut -f2- -d=)

if [ "$TYPE" != "mysql" ] ; then
    echo "To use this tool you must be using the mysql database connection"
    exit 1
fi

DESTPATH=$1

if [ -z $DESTPATH ] ; then
  DESTPATH="sqldump/${DATABASE}.$(date +"%Y_%m_%d_%H%M").sql"
fi

if [ -z $(echo $DESTPATH | grep ".sql$") ] ; then
    if [ -z $(echo $DESTPATH | grep "\/$") ] ; then
        DESTPATH="${DESTPATH}.sql"
    else
        DESTPATH="${DESTPATH}${DATABASE}.$(date +"%Y_%m_%d_%H%M").sql"
    fi
fi

FILE=$(basename "${DESTPATH}")
DIR=$(dirname "${DESTPATH}")
if ! (mkdir -p $DIR) || [ ! -w $DIR ] ; then
    echo "You do not have write privileges at the specified path"
    exit
fi

if [ ! -z $USERNAME ] && [ ! -z $PASSWORD ] && [ ! -z $DATABASE ] ; then
    docker exec $CONTAINER mysqldump -u$USERNAME -p$PASSWORD $DATABASE > $DESTPATH
else
    printf "You must set the following variables in your .env file: \n \
    OC_DB_USERNAME\n \
    OC_DB_PASSWORD\n \
    OC_DB_DATABASE\n"
fi
