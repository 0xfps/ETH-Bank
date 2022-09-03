// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/**
* @title IBank interface.
* @author Anthony (fps) https://github.com/0xfps.
* @dev 
* How will the bank function?
*/


interface IBank {
    /**
    * @dev Allows the user to create an account associated with their `ownerAddress` and a set `password`.
    * 
    * @param ownerAddress :: Address of the account owner.
    * @param password :: Desired password, hashed off chain.
    */
    function createAcount(address ownerAddress, bytes32 password) external;

    /**
    * @dev Return the caller's balance in the bank.
    * `password` must match the password of the caller.
    *
    * @param password :: Password, hashed off chain.
    *
    * @return uint256 balance of the account.
    */
    function bankBalance(bytes32 password) external view returns(uint256);

    /**
    * @dev Deposits some `amount` into the callers account.
    * `password` must match the password of the caller.
    *
    * @param password :: Password, hashed off chain.
    * @param amount :: Desired amount to deposit based on the current plan.
    */
    function deposit(bytes32 password, uint256 amount) external;

    /**
    * @dev Transfers `amount` to `to` with a minimal tax paid owned by the contract.
    * `password` must match the password of the caller.
    *
    * @param password :: Password, hashed off chain.
    * @param to :: Address of the receiver.
    * @param amount :: Desired amount to deposit based on the current plan.
    */
    function transfer(bytes32 password, address to, uint256 amount) external;

    /**
    * @dev Transfers `amount` of ether to the caller's address.
    * `password` must match the password of the caller.
    *
    * @param password :: Password, hashed off chain.
    * @param amount :: Desired amount to deposit based on the current plan.
    */
    function withdraw(bytes32 password, uint256 amount) external;

    /**
    * @dev Pushes the caller level to the desired `level`.
    * `password` must match the password of the caller.
    *
    * @param password :: Password, hashed off chain.
    * @param level :: Desired level.
    */
    function upgrade(bytes32 password, uint8 level) external;

    /**
    * @dev Sets the `newPassword` as the password of the caller.
    * `oldPassword` must match the password of the caller.
    *
    * @param oldPassword :: Old password, hashed off chain.
    * @param newPassword :: Desired desired password, hashed off chain.
    */
    function changePassword(bytes32 oldPassword, bytes32 newPassword) external;

    /**
    * @dev Closes the user's account and transfers all balance to the user.
    * `password` must match the password of the caller.
    *
    * @param password :: Password, hashed off chain.
    */
    function close(bytes32 password) external;
}
