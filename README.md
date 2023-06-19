# lucasg04/node-ng-test

This Dockerfile provides an Ubuntu-based image with Node.js and Google Chrome installed. It also includes some useful npm settings.

# Changing the Node.js version

This Dockerfile uses nvm to install Node.js. To change the Node.js version, you can modify the nvm install command in the Dockerfile. For example, to install Node.js version 16, you can replace the following line:

```
FROM lucasg04/node-ng-test:latest

RUN nvm install 18 && \
    nvm use 18
```

# Updating Google Chrome

This Dockerfile downloads Google Chrome during the build process. To update the version of Google Chrome find your version from https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Linux_x64 and add this to your `Dockerfile`.

```
FROM lucasg04/node-ng-test:latest

RUN cd /opt && \
   curl -k -O https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F1019997%2Fchrome-linux.zip?alt=media && \
   unzip chrome-linux.zip && rm chrome-linux.zip && \
   ln -s /opt/chrome-linux/chrome /usr/bin/chrome
```
