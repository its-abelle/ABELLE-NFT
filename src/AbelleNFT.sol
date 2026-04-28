//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract AbelleNFT is ERC721 {
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdtoURI;

    //QmPQ8SY19mZY2ziw2FPGMd7RRBTi1XC4DjSMMqCDCV6PWn

    constructor() ERC721("AbelleNFT", "ABELLE") {
        s_tokenCounter = 0;
    }

    function mintNFT(string memory tokenURI) public {
        s_tokenIdtoURI[s_tokenCounter] = tokenURI;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return s_tokenIdtoURI[tokenId];
    }
}
