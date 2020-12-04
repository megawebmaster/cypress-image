FROM cypress/included:5.6.0

# install Emoji font
RUN apt-get update && apt-get install --no-install-recommends -y fonts-symbola

# Install plugins
RUN npm install -g "cypress-file-upload@4.1.1"
RUN npm install -g "cypress-wait-until@1.7.1"

# Link required libraries
RUN npm link cypress-file-upload
RUN npm link cypress-wait-until
