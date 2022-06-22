// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "../interfaces/IBank.sol";

/**
* @title Bank Contract.
* @author Anthony (fps) https://github.com/fps8k.
* @dev 
* The bank itself.
*/


contract Bank {
    
    enum Plan {
        Free,
        Basic,
        Pro,
        Ultimate
    }

    mapping(address => bytes32) private passwords;
    mapping(Plan => uint256) private planPrices;
    mapping(Plan => uint256) private planLimits;
    mapping(address => uint256) private balances;
}