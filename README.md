# DegenToken Smart Contract
The DegenToken Smart Contract is an Ethereum-compatible smart contract written in Solidity, designed to be deployed on the Avalanche Fuji testnet. It implements an ERC-20 token with added functionalities, such as minting, transferring, and burning tokens, as well as an in-game store where tokens can be redeemed for items.

## Getting Started
## Contract Deployment on Avalanche Fuji Testnet
Solidity ^0.8.0 (compatible with Avalanche)
Avalanche-compatible wallet for deploying and interacting with the contract

To deploy this contract on the Avalanche Fuji testnet, follow these steps:

1. Make sure you have access to an Avalanche wallet compatible with the Fuji testnet.
2. Compile the contract code using a Solidity compiler compatible with Avalanche, and obtain the compiled bytecode.
3. Deploy the contract to the Avalanche Fuji testnet using your Avalanche wallet's deployment functionality.
4. After deployment, interact with the contract using Avalanche-compatible tools and wallets.

## ERC-20 Token Standard
This contract follows the ERC-20 token standard, offering core functionalities such as transferring tokens, checking balances, and managing allowances.

## Minting Tokens
The contract owner holds the exclusive authority to mint new tokens through the mint function. This allows for the creation and distribution of additional tokens to designated accounts.

## Token Transfers
Users can transfer tokens to other addresses via the transferTokens function. This function ensures the recipient address is valid, the sender has sufficient balance, and the transfer amount is greater than zero.

## Redeeming Tokens for Items
The contract includes a feature enabling users to exchange tokens for in-game items. By specifying an item ID, users can redeem an item if it exists and their token balance is sufficient. The required tokens are deducted from the user’s balance.

## Adding Items to the Store
The contract owner can populate the in-game store by adding items and their corresponding prices using the addItemToStore function.

## Viewing Token Balances
Users can check their token balances with the getTokenBalance function, which returns the token balance associated with a specific address.

## Burning Tokens
Users can destroy their tokens using the burnTokens function. This reduces their token balance by a specified amount, provided they have enough tokens to perform the action.

## Authors
Metacrafter Haurrey

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.
