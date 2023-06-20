# lucasg04/node-ng-test

This Dockerfile provides an Ubuntu-based image with Node.js and Google Chrome installed. It also includes some useful npm settings.

# Changing the Node.js version

This image contains the [n package](https://www.npmjs.com/package/n) to install Node.js. For example, to install Node.js version 18, you can extend the image like this:

```Dockerfile
FROM lucasg04/node-ng-test:latest

RUN n 18.16.0
```

If you would like to use a different Node.js mirror which has the same layout as the default https://nodejs.org/dist/, you can define `N_NODE_MIRROR`.

```sh
export N_NODE_MIRROR=https://npmmirror.com/mirrors/node
```

# Updating Google Chrome

This Dockerfile downloads Google Chrome during the build process. To update the version of Google Chrome find your version from https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Linux_x64 and add this to your `Dockerfile`.

```Dockerfile
FROM lucasg04/node-ng-test:latest

RUN cd /opt && \
   curl -k -o chrome-linux.zip https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F1019997%2Fchrome-linux.zip?alt=media && \
   unzip chrome-linux.zip && rm chrome-linux.zip && \
   ln -s /opt/chrome-linux/chrome /usr/bin/chrome
```
