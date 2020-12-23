FROM cypress/included:6.2.0

# install older Chrome browser
ENV CHROME_VERSION 85.0.4183.121
RUN wget -O /usr/src/google-chrome-stable_current_amd64.deb "http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROME_VERSION}-1_amd64.deb" && \
  dpkg -i /usr/src/google-chrome-stable_current_amd64.deb ; \
  apt-get install -f -y && \
  rm -f /usr/src/google-chrome-stable_current_amd64.deb

# install Emoji font
RUN apt-get update && apt-get install --no-install-recommends -y fonts-symbola

# Install plugins
RUN npm install -g "cypress-file-upload@4.1.1"
RUN npm install -g "cypress-wait-until@1.7.1"

# Link required libraries
RUN npm link cypress-file-upload
RUN npm link cypress-wait-until
