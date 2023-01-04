FROM cypress/base:14.21.1

USER root

# Install dependencies
RUN apt-get update && \
  apt-get install -y \
  fonts-liberation \
  git \
  libcurl4 \
  libcurl3-gnutls \
  libcurl3-nss \
  xdg-utils \
  wget \
  curl \
  # chrome dependencies
  gconf-service \
  libappindicator3-1 \
  lsb-release \
  # firefox dependencies
  bzip2 \
  # add codecs needed for video playback in firefox
  # https://github.com/cypress-io/cypress-docker-images/issues/150
  mplayer \
  # edge dependencies
  gnupg \
  dirmngr \
  # clean up
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

# install Chrome browser
ARG CHROME_VERSION=81.0.4044.92
RUN wget --no-verbose -O /tmp/chrome.deb "https://www.slimjetbrowser.com/chrome/files/${CHROME_VERSION}/google-chrome-stable_current_amd64.deb" && \
  dpkg -i /tmp/chrome.deb && \
  rm -f /tmp/chrome.deb

# install Microsoft Edge browser
ARG EDGE_VERSION=95.0.1020.38-1
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
  install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ && \
  sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list' && \
  rm microsoft.gpg && \
  ## Install Edge
  apt-get update && \
  apt-get install -y microsoft-edge-stable=$EDGE_VERSION && \
  ## Add a link to the browser that allows Cypress to find it
  ln -s /usr/bin/microsoft-edge /usr/bin/edge

# install Firefox browser
ARG FIREFOX_VERSION=93.0
RUN wget --no-verbose -O /tmp/firefox.tar.bz2 "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/en-US/firefox-${FIREFOX_VERSION}.tar.bz2" \
  && tar -C /opt -xjf /tmp/firefox.tar.bz2 \
  && rm /tmp/firefox.tar.bz2 \
  && ln -fs /opt/firefox/firefox /usr/bin/firefox

# "fake" dbus address to prevent errors
# https://github.com/SeleniumHQ/docker-selenium/issues/87
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

# a few environment variables to make NPM installs easier
# good colors for most applications
ENV TERM xterm
# avoid million NPM install messages
ENV npm_config_loglevel warn
# allow installing when the main user is root
ENV npm_config_unsafe_perm true

# avoid too many progress messages
# https://github.com/cypress-io/cypress/issues/1243
ENV CI=1

# disable shared memory X11 affecting Cypress v4 and Chrome
# https://github.com/cypress-io/cypress-docker-images/issues/270
ENV QT_X11_NO_MITSHM=1 _X11_NO_MITSHM=1 _MITSHM=0

# always grab the matching NPM version
RUN npm i -g npm@6.14.17

# point Cypress at the /root/cache no matter what user account is used
# see https://on.cypress.io/caching
ENV CYPRESS_CACHE_FOLDER=/root/.cache/Cypress
RUN npm install -g "cypress@12.3.0" && cypress version

# give every user read access to the "/root" folder where the binary is cached
# we really only need to worry about the top folder, fortunately
RUN chmod 755 /root

ENTRYPOINT ["cypress", "run"]

