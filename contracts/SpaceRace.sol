// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

contract IntergalacticCockroaches is ERC721, Ownable {
using Counters for Counters.Counter;
Counters.Counter private _tokenIds;

uint256 private _maxSupply = 10000;

string public _provenanceHash;
string public _baseURL;
uint public MAX_NFT_PURCHASE = 5;
uint256 public mintPrice = 0.1 ether;
uint256 public presalePrice = 0.08 ether;
bytes32 public rootHash;
mapping(address => uint256) public claimed;

constructor() ERC721("IntergalacticCockroaches", "ICC") {}

function mint(uint256 count) external payable {
require(_tokenIds.current() < _maxSupply, "Can not mint more than max supply");
require(_tokenIds.current() + count <= _maxSupply, "Can not mint more than max supply");
require(count > 0 && count <= MAX_NFT_PURCHASE, "You can mint between 1 and 5 at once");
require(msg.value >= count * mintPrice, "Insufficient payment");

for (uint256 i = 0; i < count; i++) {
_mint(msg.sender, _tokenIds.current());
_tokenIds.increment();
}
}

function setPrice(uint256 _price) public onlyOwner {
mintPrice = _price;
}

function setMaxNFTPurchase(uint256 count) public onlyOwner {
MAX_NFT_PURCHASE = count;
}

function setProvenanceHash(string memory provenanceHash) public onlyOwner {
_provenanceHash = provenanceHash;
}

function setBaseURL(string memory baseURI) public onlyOwner {
_baseURL = baseURI;
}

function _baseURI() internal view override returns (string memory) {
return _baseURL;
}

function maxSupply() public view returns (uint256) {
return _maxSupply;
}

function totalSupply() public view returns (uint256) {
return _tokenIds.current();
}


function withdraw() external onlyOwner {
uint balance = address(this).balance;
payable(owner()).transfer(balance);
}
}