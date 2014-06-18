# 
# Note "> /dev/null" workaround for fig-bug https://github.com/orchardup/fig/issues/239
#
FROM dockerfile/nodejs

MAINTAINER Matthias Luebken, matthias@catalyst-zero.com

WORKDIR /home/mean

# Install Mean.JS Prerequisites
RUN npm install -g grunt-cli > /dev/null
RUN npm install -g bower > /dev/null

# Install Mean.JS packages
ADD package.json /home/mean/package.json
RUN npm install > /dev/null

# Make everything available for start
ADD . /home/mean

# currently only works for development
ENV NODE_ENV development

EXPOSE 3000
CMD ["grunt"]