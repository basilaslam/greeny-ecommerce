# Use an official Node.js runtime as a parent image
FROM node:20-alpine

RUN mkdir -p /usr/src/greeny && chown -R node:node /usr/src/greeny

WORKDIR /usr/src/greeny

# Copy package json and yarn lock only to optimise the image building
COPY package.json package-lock.json ./

# copy prepare.js prior. It will be executed after package installation and before ROOT dir is cloned

USER node

RUN yarn

COPY --chown=node:node . .

ENV DB_CLOUD DB_CLOUD
ENV DB_PASSWORD DB_PASSWORD
ENV SESSION_SECRET SESSION_SECRET
ENV RAZ_KEY_ID_DEV RAZ_KEY_ID_DEV
ENV RAZ_KEY_SECRET_DEV RAZ_KEY_SECRET_DEV
ENV EMAIL_ADDRESS EMAIL_ADDRESS
ENV EMAIL_PASSWORD EMAIL_PASSWORD
ENV SENDGRID_HOST SENDGRID_HOST
ENV SENDGRID_PORT SENDGRID_PORT
ENV SENDGRID_USER SENDGRID_USER
ENV SENDGRID_PASS SENDGRID_PASS

ENV PORT 3000

EXPOSE 3000

CMD [ "npm", "start" ]

