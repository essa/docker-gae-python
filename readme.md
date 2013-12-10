# Google AppEngine for python in Docker 

This Dockerfile will create a new Docker container with Google AppEngine SDK for python

## Installation

### Step 0: Install Docker

[Follow these instructions](http://www.docker.io/gettingstarted/#h_installation) to get Docker running on your server.

### Step 1: Build Container

**Build It Yourself**

    git clone https://github.com/essa/docker-gae-python.git
    cd docker-gae-python
    docker build -t gae-python .

### Step 2: Create A New Container Instance

    sudo docker run -d -p 2022:22 -p 8080:8080 -v /path/to/gae-python/home:/home/gae:rw gae-python

### Step 3: Copy your ssh stuff to home

    cat ~/.ssh/id_rsa.pub >> home/.ssh/authorized_keys

./home in host is mapped to home directory of Docker Container. So you can copy or link your sources here.

### Step 4: login with ssh and run demo

    ssh gae@localhost -p 2022
    /usr/local/google_appengine/dev_appserver.py /usr/local/google_appengine/demos/python/guestbook/ --port 8080 --host 0.0.0.0

you can access to http://localhost:8080/ from host

##### Default username and password

This Dockerfile will create following user with password. If you want to change them, edit Dockerfile and rebuild.

username: gae
password: python

username: root
password: root-defaultpassword



