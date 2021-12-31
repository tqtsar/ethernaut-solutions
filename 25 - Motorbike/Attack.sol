contract EngineKiller {
    function kill() public {
        selfdestruct(0x0000000000000000000000000000000000000000);
    }
}