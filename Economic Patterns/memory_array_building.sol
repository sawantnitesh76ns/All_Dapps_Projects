pragma solidity ^0.4.17;

// Aggregate and retrieve data from contract storage in a gas efficient way.
contract MemoryArrayBuilding {  

    struct Item {
        string name;
        string owner;
        string product;
        uint32 price;
    }

    Item[] public items;

    mapping(address => uint) public ownerItemCount;

    function getItemIdsByOwner( address _owner) public returns(uint[]) {
        uint[] memory itemsIds = new uint[](ownerItemCount[_owner]);
        uint counter = 0;

        for(uint i =0 ; i < itemsIds.length; i++) {
            if(items[i].owner == _owner) {
                itemsIds[counter] = i;
                counter++;
            }
        }
        return itemsIds;
    }

}