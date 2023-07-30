FROM node:14 as build

WORKDIR /src

COPY package*.json .

RUN npm install

COPY . .

FROM node:14-slim

WORKDIR /src 

COPY --from=build /src .

EXPOSE 3000

CMD ["npm", "start"]
