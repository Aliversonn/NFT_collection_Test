// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "./ERC721A.sol";

contract NFTERC721A is Ownable, ERC721A {
    using Strings for uint;

    constructor() ERC721A("Daemon", "DMN") {}

    function mint(uint256 quantity) external onlyOwner {
        _mint(msg.sender, quantity);
    }

    function tokenURI(uint _tokenId) public view virtual override returns (string memory) {
        require(_exists(_tokenId), "URI query for nonexistent token");

        return string(abi.encodePacked("ipfs://bafybeic5hpdasswijjjk35eotwzc3ck6hl2cnxptwg4s5bbwyq4watrtda/", _tokenId.toString(), ".json"));
    }
}