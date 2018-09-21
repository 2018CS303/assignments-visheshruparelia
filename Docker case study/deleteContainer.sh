echo -n "Enter 'all' if you want to delete all user containers or enter 'user' if you want to delete a specific user container: "
read typ
if [ "$typ" == "all" ]
then
    echo -n "Enter the user list file: "
    read file
    while read user
        do
            docker rm $user
        done < $file
else
    echo -n "Enter the username: "
    read name
    docker rm $name
fi
