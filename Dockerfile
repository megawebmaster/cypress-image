FROM cypress/browsers:node13.8.0-chrome81-ff75

# avoid too many progress messages
# https://github.com/cypress-io/cypress/issues/1243
ENV CI=1

# update NPM and Yarn
# otherwise the base image might have old versions
RUN npm i -g yarn@latest npm@latest

RUN apt-get install -yq fonts-symbola
RUN npm config -g set user $(whoami)

# point Cypress at the /root/cache no matter what user account is used
# see https://on.cypress.io/caching
ENV CYPRESS_CACHE_FOLDER=/root/.cache/Cypress
RUN npm install -g "cypress@5.2.0"
RUN npm install -g "cypress-file-upload@4.1.1"
RUN cypress verify

# Cypress cache and installed version
# should be in the root user's home folder
RUN cypress cache path
RUN cypress cache list

# Link required libraries
RUN npm link cypress-file-upload
RUN npm link @babel/core
RUN npm link @babel/preset-env
RUN npm link @babel/preset-react
RUN npm link @babel/plugin-proposal-class-properties

# give every user read access to the "/root" folder where the binary is cached
# we really only need to worry about the top folder, fortunately
RUN chmod 755 /root

ENTRYPOINT ["cypress", "run"]
