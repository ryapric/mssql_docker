image="microsoft/mssql-server-linux"
container="mssql"

docker container stop $container >/dev/null && docker container rm $container >/dev/null

docker container run \
    -e 'ACCEPT_EULA=Y' \
    -e 'SA_PASSWORD=M$$QL$3RV3R' \
    -p 1433:1433 \
    --name $container \
    -d \
    $image

printf "MS SQL Server running on port 1433.\n"
