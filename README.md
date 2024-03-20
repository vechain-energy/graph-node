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
  

## Example Subgraph Deployment for vet.domains

```shell
$ git clone https://github.com/vechain-energy/vet-domains-subgraph.git
$ cd vet-domains-subgraph
$ yarn install

$ yarn create-local
 ›   Warning: In next major version, this command will be merged as a subcommand for `graph 
 ›   local`.
Created subgraph: vns

$ yarn codegen
  Skip migration: Bump mapping apiVersion from 0.0.1 to 0.0.2
  Skip migration: Bump mapping apiVersion from 0.0.2 to 0.0.3
  Skip migration: Bump mapping apiVersion from 0.0.3 to 0.0.4
  Skip migration: Bump mapping apiVersion from 0.0.4 to 0.0.5
  Skip migration: Bump mapping apiVersion from 0.0.5 to 0.0.6
  Skip migration: Bump manifest specVersion from 0.0.1 to 0.0.2
  Skip migration: Bump manifest specVersion from 0.0.2 to 0.0.4
✔ Apply migrations
✔ Load subgraph from subgraph.yaml
  Load contract ABI from abis/Registry.json
  Load contract ABI from abis/PublicResolver.json
  Load contract ABI from abis/BaseRegistrar.json
  Load contract ABI from abis/EthRegistrarController.json
  Load contract ABI from abis/NameWrapper.json
✔ Load contract ABIs
  Generate types for contract ABI: EnsRegistry (abis/Registry.json)
  Generate types for contract ABI: Resolver (abis/PublicResolver.json)
  Generate types for contract ABI: BaseRegistrar (abis/BaseRegistrar.json)
  Generate types for contract ABI: EthRegistrarController (abis/EthRegistrarController.json)
  Generate types for contract ABI: NameWrapper (abis/NameWrapper.json)
  Write types to src/types/ENSRegistry/EnsRegistry.ts
  Write types to src/types/Resolver/Resolver.ts
  Write types to src/types/BaseRegistrar/BaseRegistrar.ts
  Write types to src/types/EthRegistrarController/EthRegistrarController.ts
  Write types to src/types/NameWrapper/NameWrapper.ts
✔ Generate types for contract ABIs
✔ Generate types for data source templates
✔ Load data source template ABIs
✔ Generate types for data source template ABIs
✔ Load GraphQL schema from schema.graphql
  Write types to src/types/schema.ts
✔ Generate types for GraphQL schema

Types generated successfully

$ yarn deploy-local
  Skip migration: Bump mapping apiVersion from 0.0.1 to 0.0.2
  Skip migration: Bump mapping apiVersion from 0.0.2 to 0.0.3
  Skip migration: Bump mapping apiVersion from 0.0.3 to 0.0.4
  Skip migration: Bump mapping apiVersion from 0.0.4 to 0.0.5
  Skip migration: Bump mapping apiVersion from 0.0.5 to 0.0.6
  Skip migration: Bump manifest specVersion from 0.0.1 to 0.0.2
  Skip migration: Bump manifest specVersion from 0.0.2 to 0.0.4
✔ Apply migrations
✔ Load subgraph from subgraph.yaml
  Compile data source: ENSRegistry => build/ENSRegistry/ENSRegistry.wasm
  Compile data source: Resolver => build/Resolver/Resolver.wasm
  Compile data source: BaseRegistrar => build/BaseRegistrar/BaseRegistrar.wasm
  Compile data source: EthRegistrarController => build/BaseRegistrar/BaseRegistrar.wasm (already compiled)
  Compile data source: NameWrapper => build/NameWrapper/NameWrapper.wasm
✔ Compile subgraph
  Copy schema file build/schema.graphql
  Write subgraph file build/ENSRegistry/abis/Registry.json
  Write subgraph file build/Resolver/abis/PublicResolver.json
  Write subgraph file build/BaseRegistrar/abis/BaseRegistrar.json
  Write subgraph file build/EthRegistrarController/abis/EthRegistrarController.json
  Write subgraph file build/NameWrapper/abis/NameWrapper.json
  Write subgraph manifest build/subgraph.yaml
✔ Write compiled subgraph to build/
  Add file to IPFS build/schema.graphql
                .. QmRM6NgACH946o9YQNqnGHv82aWj68GZnovtATNKboVyN4
  Add file to IPFS build/ENSRegistry/abis/Registry.json
                .. QmRTphmVWBbKAVNwuc8tjJjdxzJsxB7ovpGHyUUCE6Rnsb
  Add file to IPFS build/Resolver/abis/PublicResolver.json
                .. QmRZXXMw2f72WgvrPF1Cp3x7UqECJwKuEgEa9ULq4LLuMD
  Add file to IPFS build/BaseRegistrar/abis/BaseRegistrar.json
                .. QmWqXtDCvMtpnV28Z5f6P6rPCaCA2d8gKnacGaohDWgALN
  Add file to IPFS build/EthRegistrarController/abis/EthRegistrarController.json
                .. QmeDwtusXJdQ2UxGjwb5YbFXXGeZdzm7WxdLXR9QxLUYGS
  Add file to IPFS build/NameWrapper/abis/NameWrapper.json
                .. QmREsrGckZQXY2V2PVb7SvVtAZqTeeNYi3dyjX1dGPqBho
  Add file to IPFS build/ENSRegistry/ENSRegistry.wasm
                .. QmQUfTuBUZAFCWisjJgoMYMUGvQ2BAZudk5uHW9AJhsBQw
  Add file to IPFS build/Resolver/Resolver.wasm
                .. QmX3eBuLa4hA7sYboRFEDWasbz8do8sG3UxrP3pfEY4zHY
  Add file to IPFS build/BaseRegistrar/BaseRegistrar.wasm
                .. QmWZbWwuYCuPjvxbjtx3uezi3obR5joyWzBz2StmdVkXcE
  Add file to IPFS build/BaseRegistrar/BaseRegistrar.wasm
                .. QmWZbWwuYCuPjvxbjtx3uezi3obR5joyWzBz2StmdVkXcE (already uploaded)
  Add file to IPFS build/NameWrapper/NameWrapper.wasm
                .. Qme6fiswncTSU7GH8KktbqqyJjs8M8NkRbW2hbSdxGFAGQ
✔ Upload subgraph to IPFS

Build completed: QmZrYcmjGAAHKZi576NKWA8X2SY42kpt13ZiLC6F8HT4wj

Deployed to http://127.0.0.1:8000/subgraphs/name/vns/graphql

Subgraph endpoints:
Queries (HTTP):     http://127.0.0.1:8000/subgraphs/name/vns

$ open http://127.0.0.1:8000/subgraphs/name/vns

```