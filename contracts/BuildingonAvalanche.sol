// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    // Store product prices in a mapping
    mapping(uint256 => uint256) public productPrices;
    // Track purchased products for users
    mapping(address => uint256) public userInventory;

    // Initialize the token with "Degen" as the name and "DGN" as the symbol
    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        productPrices[1] = 400;
        productPrices[2] = 350;
        productPrices[3] = 250;
        productPrices[4] = 50;
    }

    // Function for the owner to mint new tokens
    function mintDGN(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }

    // Transfer tokens from one user to another
    function transferDGN(address _to, uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Transfer Failed: Insufficient balance.");
        approve(msg.sender, _amount);
        transferFrom(msg.sender, _to, _amount);
    }

    // Display the list of products available in the marketplace
    function showMarketplaceProducts() external pure returns (string memory) {
        string memory products = "Available products: {1} NFT (400) {2} T-shirt & Hoodie (350) {3} Item (250) {4} Sticker (50)";
        return products;
    }

    // Allow users to purchase products from the marketplace
    function purchaseProduct(uint256 _product) public {
        require(productPrices[_product] > 0, "Product not available.");
        require(_product <= 4, "Invalid product ID.");
        require(balanceOf(msg.sender) >= productPrices[_product], "Purchase Failed: Insufficient balance.");

        userInventory[msg.sender] = _product;
        transfer(owner(), productPrices[_product]);
    }

    // Redeem a purchased product by transferring its value back
    function redeemProduct() public {
        uint256 product = userInventory[msg.sender];
        require(product > 0, "No product to redeem.");
        require(productPrices[product] > 0, "Product not available.");
        
        transferFrom(owner(), msg.sender, productPrices[product]);
        delete userInventory[msg.sender];
    }

    // Burn tokens to reduce the supply
    function burnDGN(uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Burn Failed: Insufficient balance.");
        approve(msg.sender, _amount);
        _burn(msg.sender, _amount);
    }

    // Retrieve the token balance of the caller
    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    // Override decimals to set token divisibility to whole numbers
    function decimals() override public pure returns (uint8) {
        return 0;
    }
}
