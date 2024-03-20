FROM node:18

WORKDIR /app
RUN yarn global add @vechain.energy/vet-rpc@1.1.0
ENTRYPOINT ["vet-rpc"]
