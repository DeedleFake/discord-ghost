FROM node:lts AS build

WORKDIR /src
COPY ./package.json .
COPY ./package-lock.json .
COPY ./tsconfig.json .
COPY ./src ./src

RUN npm install
RUN npm run build
RUN npx pkg -o ./bin/discord-ghost ./dist/index.js --targets node10-linux-x64
RUN npm prune --production

FROM debian

WORKDIR /opt/discord-ghost
COPY --from=build /src/bin/discord-ghost .
COPY --from=build /src/node_modules ./node_modules

ENTRYPOINT ["./discord-ghost"]
