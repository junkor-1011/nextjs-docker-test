FROM node:16-alpine

COPY ./frontend /app
RUN chown -R node:node /app

USER node
WORKDIR /app

RUN yarn install --frozen-lockfile && \
    yarn cache clean
RUN yarn build
CMD ["yarn", "start"]
