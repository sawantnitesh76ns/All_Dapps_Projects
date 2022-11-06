pragma solidity ^0.4.17;


// Generate a random number of a predefined interval in the deterministic environment of a blockchain.
contract RandomNess {

    // abi.encodePacked(args) -> These encode the given arguments(behave same as keccak256)
    // Then encoded into keccak256 which returns 32byte 
    function random(uint256 _seed) public view returns(uint256) {
        uint256 randomNumber = uint256(keccak256(abi.encodePacked(block.timestamp, _seed))) % (10 + 1);
    } 

    function convert256(bytes32 _num) public pure returns (uint256) {
        return uint256(_num) % (10 + 1);
    }
}