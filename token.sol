// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your token (Name, Symbol, Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the recipient address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

contract NewToken {
    // public variables here
    string public coinName = "SmartToken";    
    string public coinSymbol = "SMT";        
    uint256 public supplyTotal = 0;          

    // mapping variable here
    mapping(address => uint256) public walletBalances;

    // mint function
    function createTokens(address _recipient, uint256 _value) public {
        supplyTotal += _value;               // Increase the total supply
        walletBalances[_recipient] += _value; // Increase the balance of the recipient address
    }

    // burn function
    function removeTokens(address _holder, uint256 _value) public {
        require(walletBalances[_holder] >= _value, "Not enough balance to burn"); // Ensure the holder has sufficient balance
        supplyTotal -= _value;               // Decrease the total supply
        walletBalances[_holder] -= _value;   // Decrease the balance of the holder address
    }
}
