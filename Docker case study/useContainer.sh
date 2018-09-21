echo -n "Enter your username: "
read name
docker start $name
docker attach $name
