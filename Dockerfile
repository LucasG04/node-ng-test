# lucasg04/node-ng-test:latest

# use ubuntu as base image
FROM ubuntu:latest

# use bash as shell
SHELL ["/bin/bash", "-c"]

RUN touch ~/.bashrc && chmod +x ~/.bashrc

# add proxy to apt and install packages
RUN apt update && \
   apt install -y build-essential wget curl git rsync unzip && \
   git config --global http.sslVerify false

# Install nvm and node
RUN echo "insecure" >> ~/.curlrc && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash && \
    . ~/.nvm/nvm.sh && \
    nvm install 18 && \
    nvm use 18 && \
    source ~/.bashrc && \
    node -v && \
    npm -v && \
    npm set strict-ssl false && \
    npm set progress false && \
    npm set audit false

# Download chrome and install required packages
RUN cd /opt && \
   curl -k -o chrome-linux.zip https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F1019997%2Fchrome-linux.zip?alt=media && \
   apt install -y ca-certificates fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils && \
   unzip chrome-linux.zip && rm chrome-linux.zip && \
   ln -s /opt/chrome-linux/chrome /usr/bin/chrome

# Set env for karma / jasmine test runner
ENV CHROME_BIN=/opt/chrome-linux/chrome