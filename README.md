# WavelogDocker

Create a Wavelog instance on a Docker container

## Experimental

## Requirements

- MySQL engine up and running
  - A custom DB to store data
  - A custom user with write access to that DB

## Required steps

### Building the image

- Clone this repo
- cd to cloned folder
- run `sudo docker build -t wavelog:latest .`

### Execute the image

- run `docker-compose up --build -d wavelog`

### Executing full cloudlog stack

- Clone this repo
- cd to cloned folder
- run `sudo docker compose up -d`

## Full setup guide

Coming soon

- Copy the stack on your server machine
- Set the same root password to both MySQL and PhpMyAdmin in the `docker-compose.yml`
- Execute the stack with `docker compose up -d`
- Navigate to http://ipaddress:4081 and create a database for Wavelog
  - Select the newly created databse and in the `Privileges` tab, create a new user to be used by Wavelog
  - Make sure to grant all the privileges to the Database to the new user
- Navigate to http://ipaddress:4080 to access the Wavelog setup
  - Proceed by entering your user details and info
  - When you get to the DB setup enter:
    - Hostname: `wavelog-mysql`
    - Database name: the one you configured at the previous step
    - User and password: the one you created before
- Complete the configuration

## Public image

Image can be accessed on the hub at [iu2frl/wavelog](https://hub.docker.com/repository/docker/iu2frl/wavelog/general)
