pragma solidity ^0.4.17;


// Do not trust on external for not being crash
// transfer() could be crash if there is some issue
// So rather than executing such function by self let user execute them
contract BadAuction {

    address highestBidder;
    uint highestBid;

    function bid() public payable {
        require(msg.value >= highestBid);

        if (highestBidder != 0) {
            highestBidder.transfer(highestBid);
        }

        highestBidder = msg.sender;
        highestBid = msg.value;
    }
}

contract PullOverPush {
    mapping(address => uint) credits;


    function allowForPull( address _receiver , uint _amount) public payable {
        credits[_receiver] += _amount;
    }

    function withDrawCash() public payable {
        uint amount = credits[msg.sender];
        
        require(amount != 0);
        require(address(this).balance >= amount);
        
        credits[msg.sender] = 0;

        msg.sender.transfer(amount);
    }
}