# Can review here how to migrate existing DBs (or backups) to MSSQL on Linux:
# https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-migrate-restore-database?view=sql-server-linux-2017

image="microsoft/mssql-server-linux:latest"
container="mssql"

docker container stop $container >/dev/null && docker container rm $container >/dev/null

docker container run \
    -e 'ACCEPT_EULA=Y' \
    -e 'SA_PASSWORD=M$$QL$3RV3R' \
    -p 1433:1433 \
   -v mssql_data:/var/opt/mssql \
    --name $container \
    -d \
    $image

# Add mssql-tools to PATH
docker container exec $container sh -c "echo 'export PATH=\"$PATH:/opt/mssql-tools/bin\"' >> /root/.bashrc"

printf "MS SQL Server running on port 1433.\n"
