FROM node:18

RUN git clone https://github.com/vechain-energy/rpc-proxy.git /app
WORKDIR /app
RUN yarn install
ENTRYPOINT ["yarn", "start"]
