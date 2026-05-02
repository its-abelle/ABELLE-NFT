# AbelleNFT Mini Project

A small Foundry project for learning how to build, test, and deploy a simple ERC-721 NFT contract.

## Project Overview

This repository demonstrates:

- a custom ERC-721 NFT contract using OpenZeppelin's `ERC721`
- a minting function that stores token metadata URI on-chain
- a deployment script built with Foundry `Script`
- unit tests written with `forge-std/Test.sol`

## Smart Contract

### `src/AbelleNFT.sol`

- Inherits from `ERC721`
- Sets token name to `ABELLE` and symbol to `ABL`
- Tracks minted token IDs using an internal counter
- Stores token metadata in a `mapping(uint256 => string)`
- Implements `mintNft(string memory tokenUri)` to mint an NFT and associate metadata
- Overrides `tokenURI(uint256 tokenId)` to return stored metadata

## Test Coverage

### `test/testAbelleNFT.t.sol`

- Deploys the `AbelleNFT` contract using the `DeployAbelleNFT` script
- Verifies the contract name is `ABELLE`
- Checks that minting works and the user receives ownership of the token
- Confirms the stored token metadata URI is returned correctly

## Scripts

### `script/DeployAbelleNFT.s.sol`

- Deploys the `AbelleNFT` contract
- Uses `vm.startBroadcast()` and `vm.stopBroadcast()` to send a real transaction when run with Foundry

## Requirements

- Foundry (`forge`, `cast`, `anvil`)
- Solidity `^0.8.0`
- `lib/openzeppelin-contracts`
- `lib/forge-std`
- `lib/foundry-devops` (optional for extra tooling)

## Setup

1. Install Foundry if needed:

```sh
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

2. Install dependencies from `lib/` if not already present:

```sh
forge install
```

## Common Commands

```sh
forge build
forge test
forge test -vv
forge fmt
forge clean
```

## Deploy Locally

To deploy the contract locally using `forge script`:

```sh
forge script script/DeployAbelleNFT.s.sol:DeployAbelleNFT --fork-url <RPC_URL> --private-key <PRIVATE_KEY>
```

## Notes

- The contract stores off-chain metadata URIs on-chain. This is simple and good for learning, but in production you may prefer a separate metadata contract or IPFS pinning.
- You can mint multiple NFTs sequentially; token IDs start at `0` and increment by `1`.

## Recommended `foundry.toml` Remappings

```toml
[profile.default]
src = "src"
out = "out"
libs = ["lib"]
remappings = [
  "@openzeppelin/contracts=lib/openzeppelin-contracts/contracts",
  "forge-std=lib/forge-std/src",
  "foundry-devops=lib/foundry-devops/src"
]
```

## License

MIT
