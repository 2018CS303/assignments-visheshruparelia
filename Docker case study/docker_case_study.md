# **Docker Case Study** - Automate Infra allocation for L&D

### **Objective**:-
- Dynamic Allocation of Linux systems for users
- Each user should have independent Linux System
- Specific training environment should be created in Container
- User should not allow to access other containers/images
- User should not allow to access docker command
- Monitor participants containers
- Debug/live demo for the participants if they have any doubts/bug in running applications.
- Automate container creation and deletion.

## Allocate Linux systems for users
1.  To dynamically allocate the users a linux system create a shell script `create_userContainers.sh` to automatically create docker containers using a specific environment docker image for every user.
`users.txt` is used to extract name of each container.

    - `users.txt`
        ```
        user1
        user2
        user3
        user4
        user5
        ```
    - `create_userContainers.sh`
        ```sh
        echo -n "Enter user list file: "
        read file

        while read user
            do
                docker create -it --name $user <Docker Image> /bin/bash
            done < $file
        ```
2.  Run the shell script `create_userContainers.sh` and enter filename `users.txt`. This will create a docker container corresponding to each username from that file.
3.  The user can then use the container allocated to him/her using `useContainer.sh` script.
    - `useContainer.sh`
        ```sh
        echo -n "Enter your username: "
        read name
        docker start $name
        docker attach $name
        ```
4.  This allows user to access his/her allocated container with linux installed in it and only has access to the bash of that system.

## Monitoring the container
- One can monitor the participants container using the `monitorContainer.sh` script.

    - `monitorContainer.sh`
        ```sh
        echo -n "Enter container name to be monitored: "
        read name
        docker logs -f $name
        ```
- This shows the live display of their bash which helps the participants if they have any doubts/bug in running applications.

## Automating deletion of the containers
- Automate the deletion using the `deleteContainers.sh` script.

    - `deleteContainers.sh`
        ```sh
        echo -n "Enter 'all' to delete all user containers or enter 'user' to delete a specific user container: "
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
        ```
- This gives two options:<br>
  1) Delete all users containers at once. <br>
  2) Delete a specific user container.

**Note:** To run any shell script in the terminal use the following command:
```
sh <shell script>
```
or  
```
bash <shell script>
```
