/*
 SPDX-License-Identifier: MIT
*/
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MemoryToken is ERC721URIStorage {

  using Counters for Counters.Counter;

  Counters.Counter private _tokenIdCounter;

  constructor() ERC721("Memory Token", "MTN") {}

  function mint(address _wallet, string memory _tokenURI) public returns(uint256) {

    uint256 tokenId = _tokenIdCounter.current();

    _safeMint(_wallet, tokenId);
    _setTokenURI(tokenId, _tokenURI);

    _tokenIdCounter.increment();

    return tokenId;
  }
}