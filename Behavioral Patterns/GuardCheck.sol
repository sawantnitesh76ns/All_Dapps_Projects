// Tells solidity compiler using which version he have to compile these file
// So that the future changes won't affect it

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.4.17;


// Guard Check: Ensure that the behavior of a smart contract and its input parameters are as expected.
contract GuardCheck {
    
    function donate(address addr) payable public {
        require(addr != address(0));
        require(msg.value != 0);
        uint balanceBeforeTransfer = this.balance;
        uint transferAmount;
        
        if (addr.balance == 0) {
            transferAmount = msg.value;
        } else if (addr.balance < msg.sender.balance) {
            transferAmount = msg.value / 2;
        } else {
            revert();
        }
        
        addr.transfer(transferAmount);
        assert(this.balance == balanceBeforeTransfer - transferAmount);      
    }
}
