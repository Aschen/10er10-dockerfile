# 10er10-dockerfile
10er10 music player in a Docker container. (https://github.com/dready92/10er10)

# Installation
- First download this repository : ```git https://github.com/Aschen/10er10-dockerfile.git 10er10-dockerfile```
- Build the image : ```docker build -t aschen/10er10 10er10-dockerfile ```
- You can also pull the images from docker registry : ```docker pull aschen/10er10```

- Launch a new container : ```docker run -d -p 8124:8124 -v /app/10er10/musics:/app/10er10/musics -e "LOGIN=your_login" -e "PASSWD=your_password" aschen/10er10 ```

You can provide two environment variables LOGIN and PASSWD to create a default user in 10er10.
You can mount an external volume to backup your song.

# Add more users
If you want to create more user you have to create them manually. 
- ``` docker exec -it your_container_name bash```
- ``` cd /app/10er10/node/admin ```
- ``` node d10-createUser.js login password -p ```
