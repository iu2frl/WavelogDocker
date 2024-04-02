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

## Public image
Image can be accessed on the hub at [iu2frl/wavelog](https://hub.docker.com/repository/docker/iu2frl/wavelog/general)
