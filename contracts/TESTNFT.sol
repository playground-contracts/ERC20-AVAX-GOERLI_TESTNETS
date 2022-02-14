// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract TESTNFT is ERC721URIStorage, ERC721Enumerable, Ownable {
    constructor(string memory name, string memory symbol) ERC721("TESTNFT", "FLO") {}

    mapping (address => bool) isMinter;

    string baseURI;

    function setMinter(address a, bool b) external onlyOwner {
        isMinter[a] = b;
    }

    function mint(address to, string memory uri, uint256 tokenId) external onlyMinter {
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function setBaseURI(string memory s) external onlyOwner {
        baseURI = s;
    }

    function setURI(uint256 tokenId, string memory uri) external onlyOwner {
        _setTokenURI(tokenId, uri);
    }


    modifier onlyMinter() {
        require(isMinter[msg.sender] || msg.sender == owner());
        _;
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override(ERC721, ERC721Enumerable) {
        ERC721Enumerable._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        ERC721URIStorage._burn(tokenId);
    }

    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return ERC721URIStorage.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable) returns (bool) {
        return ERC721Enumerable.supportsInterface(interfaceId);
    }
}