echo -n "Enter container name to be monitored: "
read name
docker logs -f $name
