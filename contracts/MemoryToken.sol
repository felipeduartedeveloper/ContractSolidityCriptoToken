/*
 SPDX-License-Identifier: MIT
*/
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract MemoryToken is ERC721Enumerable, ERC721URIStorage {

  using Counters for Counters.Counter;

  Counters.Counter private _tokenIdCounter;

      function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId)
        internal
        override(ERC721, ERC721URIStorage)
    {
        super._burn(tokenId);
    }    

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    } 

  constructor() ERC721("Memory Token", "MTN") {}

  function mint(address _wallet, string memory _tokenURI) public returns(uint256) {

    uint256 tokenId = _tokenIdCounter.current();

    _safeMint(_wallet, tokenId);
    _setTokenURI(tokenId, _tokenURI);

    _tokenIdCounter.increment();

    return tokenId;
  }
}