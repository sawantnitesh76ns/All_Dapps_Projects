// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.6.0;


import "https://github.com/provable-things/ethereum-api/blob/master/provableAPI_0.5.sol";
// Gain access to data stored outside of the blockchain.
contract Oracle is usingProvable{

    string public randomMessage;

    function randomMessage() payable public {
        provable_query("URL", "json(https://www.boredapi.com/api/activity).activity");
    }

    function _callBack(byte32 _myid, string memory result) public {
        if(msg.sender != provable_cbAddress()) revert();
        randomMessage = result;
        _myid;
    }

}

