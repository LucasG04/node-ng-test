# lucasg04/node-ng-test:latest

# use ubuntu as base image
FROM ubuntu:latest

# use bash as shell
SHELL ["/bin/bash", "-c"]

# Install packages
RUN apt update && \
   apt install -y build-essential wget curl git rsync unzip && \
   git config --global http.sslVerify false

# Install node, install npm and configure npm
RUN echo "insecure" >> ~/.curlrc && \
    apt install nodejs npm -y && \
    node -v && \
    npm -v && \
    npm set strict-ssl false && \
    npm set progress false && \
    npm set audit false

# Install n
RUN npm install -g n && \
    n latest

# Download chrome and install required packages
RUN cd /opt && \
   curl -k -o chrome-linux.zip https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F1019997%2Fchrome-linux.zip?alt=media && \
   apt install -y ca-certificates fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils && \
   unzip chrome-linux.zip && rm chrome-linux.zip && \
   ln -s /opt/chrome-linux/chrome /usr/bin/chrome

# Set env for karma / jasmine test runner
ENV CHROME_BIN=/opt/chrome-linux/chrome