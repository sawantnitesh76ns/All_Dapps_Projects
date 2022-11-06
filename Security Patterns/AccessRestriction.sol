pragma solidity ^0.4.17;

contract AccessRestriction {

    address public owner = msg.sender;
    uint public lastOwnerChange = now;

    modifier onlyBy(address _account) {
        require(msg.sender == _account);
        _;
    }

    modifier changeAfter(uint _timePeriod) {
        require(now > _timePeriod);
        _;
    }

    modifier costs(uint _amount) {
        require( msg.value >= _amount);
        _;
        if( msg.value > _amount) {
            msg.sender.transfer(msg.value - _amount);
        }
    }

    function changeOwner(address _account) public onlyBy(owner) {
        owner = _account;
    }

    function buyContract() public changeAfter(lastOwnerChange + 4 weeks) costs(1 ether) {
        owner = msg.sender;
        lastOwnerChange = now;
    }
}