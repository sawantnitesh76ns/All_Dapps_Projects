pragma solidity ^0.4.17;

contract StringEqualityComparison {

    bytes public lenghtA;
    bytes public lenghtB;
    bytes32 public kekaEncodeA;
    bytes32 public kekaEncodeB;

    function hashCompareWithLengthCheck(string a, string b) external returns(bool) {
        lenghtA = bytes(a);
        lenghtB = bytes(b);
        kekaEncodeA = keccak256(abi.encodePacked(a));
        kekaEncodeB = keccak256(abi.encodePacked(b));
        if(bytes(a).length != bytes(b).length) {
            return false;
        } else {
            return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
        }
    }
}