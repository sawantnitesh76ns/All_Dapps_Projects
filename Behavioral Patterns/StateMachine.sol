pragma solidity ^0.4.17;

contract StateMachine {

    enum Stages {
        readyToOrder,
        makeBurger,
        deliverBurger
    }

    address public customer;

    Stages public stage = Stages.readyToOrder;


    modifier atStage(Stages _stage) {
        require(stage == _stage, "Not at correct stage");
        _;
    }

    function order() public atStage(Stages.readyToOrder) {
        customer = msg.sender;
        stage = Stages.makeBurger;
    }

    function madeBurger() public atStage(Stages.makeBurger){
        stage = Stages.deliverBurger;
    }

    function pickup() public atStage(Stages.deliverBurger) {
        require(customer == msg.sender);
        stage = Stages.readyToOrder;
        customer == address(0);
    }

}