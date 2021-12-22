pragma solidity ^0.8.0;

contract Deployer {
    
    function deployContract(bytes32 salt) public returns(address) {
        uint176 bytecode = 0x600A600C600039600A6000F3602A60805260206080F3;
        bytes memory code = abi.encodePacked(bytecode);
        address addr;

        assembly {
          addr := create2(0, add(code, 0x20), mload(code), salt)
        }

        return(addr);
    }

    function testDeployed(address solver) public returns (uint256) {
        (, bytes memory result) = solver.call("");

        // This should return 42.
        return uint256(bytes32(result));
    }

} 
