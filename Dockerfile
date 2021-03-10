FROM maven:3.6.3-jdk-11-slim
MAINTAINER alexandrelunkes

RUN apt-get update && apt-get install sudo -y
RUN apt-get install wget -y
RUN apt-get install gnupg -y
RUN apt-get install gnupg1 -y
RUN apt-get install gnupg2 -y

RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' -y
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
RUN sudo apt-get update && sudo apt-get install google-chrome-stable -y

COPY ./driver/. /home

