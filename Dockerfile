# First line of doc file is the image that we're going to inherit your docker file from
# Python Alpine is Light Weight version of DOcker
FROM python:3.8-alpine
# Label is option but we have to know who maintaining the project
LABEL maintainer="Suresh Koochana"
# Python unbuffered -> it doesn't allow python to buffer outputs. It Just Print directly
# and this avoid some complications and things like that when the docker image when you running python application
ENV PYTHONUNBUFFERED 1
# Next we're going to install dependencies. we're going to store our dependencies in a requirement.txt
COPY ./requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt
# to store application create an empty app in docker image
RUN mkdir /app
# switches to default dir 
WORKDIR /app
# copy from our local machine the app folder on an image
COPY ./app /app
# create an user i.e going to run our application usind docker , reason for this 2 cmds for security purpose, if we don't it will run on root level 
RUN adduser -D user
USER user


