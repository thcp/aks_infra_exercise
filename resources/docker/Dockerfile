FROM node:16 AS build-env

WORKDIR /tmp

RUN \
    git clone https://github.com/nodejs/examples.git \
    && \
    cd examples/servers/express/api-with-express-and-handlebars \
    && \
    npm install


FROM gcr.io/distroless/nodejs:16
COPY --from=build-env /tmp/examples/servers/express/api-with-express-and-handlebars /app
WORKDIR /app
CMD ["index.js"]