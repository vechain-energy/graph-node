This Docker Compose setup is designed to run a [Graph Node](https://github.com/graphprotocol/graph-node/tree/master/docker) using a VeChain node as a data source.

By default, it will initiate a Thor node and set up an RPC proxy in front of it.

```sh
docker compose up
```

To run the setup with a remote node:

```sh
docker compose -f docker-compose-simple.yml up 
```

This will start IPFS, Postgres, Vechain Thor-Node with RPC and Graph Node in Docker and create persistent
data directories for IPFS, Postgres and Node in `./data/ipfs`, `./data/postgres`, `./data/thor`.

You can access these via:

- Graph Node:
  - GraphiQL: `http://localhost:8000/`
  - HTTP: `http://localhost:8000/subgraphs/name/<subgraph-name>`
  - WebSockets: `ws://localhost:8001/subgraphs/name/<subgraph-name>`
  - Admin: `http://localhost:8020/`
- IPFS:
  - `127.0.0.1:5001` or `/ip4/127.0.0.1/tcp/5001`
- Postgres:
  - `postgresql://graph-node:let-me-in@localhost:5432/graph-node`
- Thor-Node:
  - API: `http://localhost:8669`
  - RPC: `http://localhost:8545`

Once this is up and running, you can use [`graph-cli`](https://github.com/graphprotocol/graph-tooling/tree/main/packages/cli) to create and deploy your subgraph to the running Graph Node.
  