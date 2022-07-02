FROM node:16-alpine

COPY ./frontend /app
RUN chown -R node:node /app

USER node
WORKDIR /app

RUN yarn install --ignore-scripts && \
    yarn build && \
    yarn install --production --ignore-scripts && \
    yarn cache clean
CMD ["yarn", "start"]
