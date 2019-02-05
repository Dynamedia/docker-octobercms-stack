PWD=$(printf '%q\n' "${PWD##*/}")
PWD=${PWD//[^a-zA-Z\d\s:]/}

USER=root
COMMAND=bash

if [ $1 ] ; then
    COMMAND=$1
fi

if [ $2 ] ; then
    USER=$2
fi


CONTAINERS=($(docker ps | awk '{print $NF}' | grep $PWD))

echo ""
echo "Select the container to access..."
echo ""

select CONTAINER in "${CONTAINERS[@]}"
do
    break
done

docker exec -u $USER -ti $CONTAINER $COMMAND
