# 10er10-dockerfile
10er10 application in docker container.

# Installation
- First download this repository
- Build the image : ```docker build -t aschen/10er10 . ```
- Launch the a new container : ```docker run -d -p 8124:8124 -v /app/10er10/musics:/app/10er10/musics -e "LOGIN=your_login" -e "PASSWD=your_password" aschen/10er10 ```

You can provide two environnement variables LOGIN and PASSWD to create a default user in 10er10.
You can mount an external volume to backup your song.

# Add more users
If you want to create more user you have to create them manually. 
- ``` docker exec -it your_container_name bash```
- ``` cd /app/10er10/node/admin ```
- ``` node d10-createUser.js login password -p ```
