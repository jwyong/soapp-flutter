pragma solidity ^0.5.16;

contract Xcoin {
    int balance;

    constructor () public {
        balance = 0;
    }

    function getBalance() view public returns (int){
        return balance;
    }

    function depositBalance(int amount) public {
        balance = balance + amount;
    }

    function withdrawBalance(int amount) public {
        balance = balance - amount;
    }
}