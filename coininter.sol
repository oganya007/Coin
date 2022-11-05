// SPDX-License-Identifier: MIT
//declare the compiler version
pragma solidity ^0.8.0;
//create an interface
interface ICOIN{
//create all the functions you want to be written fully on the main file
    function totalSupply() external view returns(uint);
    function balanceOf(address account) external view returns(uint);
    function transfer(address recipient, uint amount) external returns(bool);
    function allowance(address owner, address spender) external view returns(uint);
    function approve(address spender,uint amount) external returns(bool);
    function transferFrom(address sender, address recipient, uint amount) external returns(bool);
    
//create the events you want to be emitted on the main file
    event Transfer(address indexed from, address indexed to, uint amount);
    event Approval(address indexed owner, address indexed spender, uint amount);
}
