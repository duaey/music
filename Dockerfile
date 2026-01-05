FROM node:18-alpine

# Build bağımlılıklarını yükle (sodium-native için)
RUN apk add --no-cache python3 make g++

WORKDIR /app

COPY package*.json ./

RUN npm install --legacy-peer-deps --omit=dev

# Build bağımlılıklarını kaldır (image boyutunu küçült)
RUN apk del python3 make g++

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
