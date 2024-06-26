# Project Setup

This directory contains an example setup using [OpenZeppelin Subgraph Modules](https://docs.openzeppelin.com/subgraphs/0.1.x/).

```shell
npm init -y
npm install @openzeppelin/subgraphs @graphprotocol/graph-cli --save
```

# Example Configuration

Add `configs/VeBetterDAO.json`:

```json
{
  "output": "generated/sample.vebetterdao.",
  "chain": "mainnet",
  "datasources": [
    {
      "address": "0x76Ca782B59C74d088C7D2Cce2f211BC00836c602",
      "startBlock": 18870000,
      "module": ["erc20", "voting"]
    },
    {
      "address": "0x7B7EaF620d88E38782c6491D7Ce0B8D8cF3227e4",
      "startBlock": 18870000,
      "module": ["timelock", "accesscontrol"]
    },
    {
      "address": "0x1c65C25fABe2fc1bCb82f253fA0C916a322f777C",
      "startBlock": 18870000,
      "module": ["governor"]
    }
  ]
}
```

# Compile Subgraph

```shell
npx graph-compiler \
  --config configs/VeBetterDAO.json \
  --include node_modules/@openzeppelin/subgraphs/src/datasources \
  --export-schema \
  --export-subgraph
```

# Deploy Subgraph

```shell
npx graph codegen generated/sample.vebetterdao.subgraph.yaml
npx graph build generated/sample.vebetterdao.subgraph.yaml
graph create sample/vebetterdao --node http://127.0.0.1:8020
npx graph deploy sample/vebetterdao --ipfs http://localhost:5001 --node http://localhost:8020 generated/sample.vebetterdao.subgraph.yaml --version-label 1
```

# Update Subgraph

```shell
npx graph deploy sample/vebetterdao --ipfs http://localhost:5001 --node http://localhost:8020 generated/sample.vebetterdao.subgraph.yaml --version-label 1
```

# Delete Subgraph

```shell
npx graph remove sample/vebetterdao --node http://localhost:8020
```
