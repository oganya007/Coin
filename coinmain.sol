// SPDX-License-Identifier: MIT
//declare the compiler version
pragma solidity ^0.8.0;
//import the interface file
import "./coininter.sol";
// create a contract and allow the contract to inherit the interface
contract COIN is ICOIN{
    /*create state variable called totalSupply and make it public. override because a function
    on the interface has same name*/
    uint public override totalSupply;
    /*create mapping called balanceOf and make it public. override because a function
    on the interface has same name*/
    mapping(address => uint) public override balanceOf;
    /*create a nested mapping and make it public. override because a function
    on the interface has same name*/
    mapping(address => mapping(address => uint)) public override allowance;
    //create token name
    string public name= "tech4dev";
    //create token symbol
    string public symbol= "T4D";
    //create the decimal
    uint public  decimal = 18;

//create a transfer function which returns a bool
    function transfer(address recipient, uint amount) external override returns (bool){
        balanceOf[msg.sender] -= amount;//method1 deducting from sender balance
        //balanceOf[msg.sender] = balanceOf[msg.sender] - amount; method 2
        balanceOf[recipient] += amount;
        //balanceOf[recipient] = balanceOf[msg.sender] + amount; adding the deducted above to the recipient

//use emit to implement the Transfer event created on the interface
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }
//create approve function which returns a bool
    function approve(address spender, uint amount) external override returns(bool) {
        //activate the allowance feature to allow for the value to be accessed
        allowance[msg.sender][spender] = amount;
  //use emit to implement the Approval event created on the interface      
        emit Approval(msg.sender, spender, amount);
        return true;
    }
//create the transferFrom function which returns a bool
    function transferFrom(address sender, address recipient, uint amount) external override returns(bool){
        ////activate the allowance feature to allow for the value to be accessed
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
 //use emit to implement the Transfer event created on the interface       
        emit Transfer(sender, recipient, amount);
        return true;
    }
//create the mint function to allow me create more tokens
    function mint(uint amount) public{
        //add the inputed amount to the caller's balance
        balanceOf[msg.sender] += amount;
        //increase total supply by the amount
        totalSupply += amount;
        
        //emit to implement Transfer event on the interface
        emit Transfer(address(0), msg.sender, amount);
    }
//create the burn function to allow me destroy the tokens
    function burn(uint amount)public{
        //destroy inputted amount from the caller's balance
        balanceOf[msg.sender] -= amount;
        //reduction of total amount of supply
        totalSupply -= amount;
        //emit to implement Transfer event that is on the interface
        emit Transfer(msg.sender, address(0), amount);
    }

}
