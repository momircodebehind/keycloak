FROM node:20

RUN apt-get update && apt-get install -y maven

WORKDIR /app

COPY ./package*.json ./

RUN npm install

COPY ./ ./

RUN npm run build

RUN npx keycloakify build

CMD ["echo", "Build complete. Check the output folder for the JAR."]

