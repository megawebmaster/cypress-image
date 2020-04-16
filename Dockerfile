FROM cypress/browsers:node13.6.0-chrome80-ff72

# avoid too many progress messages
# https://github.com/cypress-io/cypress/issues/1243
ENV CI=1

# should be root user
RUN echo "whoami: $(whoami)"
RUN npm config -g set user $(whoami)

# command "id" should print:
# uid=0(root) gid=0(root) groups=0(root)
# which means the current user is root
RUN id

# point Cypress at the /root/cache no matter what user account is used
# see https://on.cypress.io/caching
ENV CYPRESS_CACHE_FOLDER=/root/.cache/Cypress
RUN npm install -g "cypress@4.4.0"
RUN cypress verify

# Cypress cache and installed version
# should be in the root user's home folder
RUN cypress cache path
RUN cypress cache list

# give every user read access to the "/root" folder where the binary is cached
# we really only need to worry about the top folder, fortunately
RUN ls -la /root
RUN chmod 755 /root

# always grab the latest NPM and Yarn
# otherwise the base image might have old versions
RUN npm i -g yarn@latest npm@latest

ENTRYPOINT ["cypress", "run"]
