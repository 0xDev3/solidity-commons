// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {ERC20Bridgeable} from "./ERC20Bridgeable.sol";

interface ICCIPBridgeableDeployer {
    
    function calculateAddress(
        string memory name,
        string memory symbol,
        string memory salt
    ) external view returns (address);
    
    function deploy(
        string memory name,
        string memory symbol,
        uint256 initialSupply,
        string memory salt
    ) external returns (address);

}

contract Deployer is ICCIPBridgeableDeployer {

    function deploy(
        string memory name,
        string memory symbol,
        uint256 initialSupply,
        string memory salt
    ) external returns (address) {
        ERC20Bridgeable token = new ERC20Bridgeable{salt: keccak256(abi.encodePacked(msg.sender, salt))}(name, symbol);
        token.mint(msg.sender, initialSupply);
        return address(token);
    }

    function calculateAddress(
        string memory name,
        string memory symbol,
        string memory salt
    ) external view returns (address) {
        bytes32 hash = keccak256(
            abi.encodePacked(
                bytes1(0xff), address(this), keccak256(abi.encodePacked(msg.sender, salt)), keccak256(getBytecode(name, symbol))
            )
        );
        return address (uint160(uint(hash)));
    }

    // get the ByteCode of the contract ERC20Bridgeable
    function getBytecode(string memory name, string memory symbol) public pure returns (bytes memory) {
        bytes memory bytecode = type(ERC20Bridgeable).creationCode;
        return abi.encodePacked(bytecode, abi.encode(name, symbol));
    }

}
