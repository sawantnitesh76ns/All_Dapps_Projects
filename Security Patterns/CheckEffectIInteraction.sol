pragma solidity ^0.4.17;

contract CheckEffectInteraction {

    mapping(address => uint) balances;

    function deposit() public payable {
        balances[msg.sender] = msg.value;
    }

    function withdraw(uint _amount) public {
        require(balances[msg.sender] >= _amount);

        balances[msg.sender] -= _amount;
        msg.sender.transfer(_amount);
    }
}