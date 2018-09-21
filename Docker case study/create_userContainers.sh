echo -n "Enter user list file: "
read file

while read user
    do 
        docker create -it --name $user ubuntu:latest /bin/bash
    done < $file
