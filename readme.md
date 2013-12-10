# Google AppEngine for python in Docker 

This Dockerfile will create a new Docker container with Google AppEngine for python

## Installation

### Step 0: Install Docker

[Follow these instructions](http://www.docker.io/gettingstarted/#h_installation) to get Docker running on your server.

### Step 1: Pull Or Build GitLab

**Build It Yourself**

    git clone https://github.com/essa/docker-gae-python.git
    cd docker-gae-python
    docker build -t gae-python .

### Step 2: Create A New Container Instance

    sudo docker run -d -p 22 -v /path/to/gae-python/home:/home/gae:rw gae-python

### Step 3: Copy your ssh stuff to home

    cat ~/.ssh/id_rsa.pub >> home/authorized_keys


##### Default username and password

username: gae
password: python

username: root
password: root-defaultpassword



