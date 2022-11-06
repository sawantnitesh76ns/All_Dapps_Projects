pragma solidity ^0.4.17;

// Also refer these - https://github.com/PatrickAlphaC/smartcontract-upgrades-example/tree/main/contracts
// You Tube Link    - https://www.youtube.com/watch?v=bdXJmWajZRY

// ******************IMP***********************
// For ABI function refer - https://medium.com/@libertylocked/what-are-abi-encoding-functions-in-solidity-0-4-24-c1a90b5ddce8

// Introduce the possibility to upgrade smart contracts without breaking any dependencies.
contract LogicContract{
    uint public num;
    address public sender;
    uint public value;
    function setVars (uint _num) external payable{
        num=2*_num;
        sender=msg.sender;
        value=msg.value;
    }
}

contract StorageContract{
    uint public num;
    address public sender;
    uint public value;
    function setVars(address _test, uint _num) external payable{
       // _test.delegatecall(
        // abi.encodeWithSignature("setVars (uint256)",
        // );
        (bool success, bytes memory data)=_test.delegatecall(
           abi.encodeWithSelector(LogicContract.setVars.selector, _num)
       );
        require(success, "delegatecall failed");
    }I
}
