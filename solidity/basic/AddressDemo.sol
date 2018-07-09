pragma solidity ^0.4.0;

contract AddressDemo{
    address public owner;
    address boss;

    constructor() payable public {
        owner = msg.sender;
    }

    function change_owner(address _owner) public{
        owner = _owner;
    }

    function is_me() constant public returns(bool){
        if (owner == msg.sender) {
            return true;
        } else {
            return false;
        }
    }

    function getBanlance(address addr) constant public returns(uint){
        return addr.balance;
    }

    function getBanlance() constant public returns(uint) {
        return owner.balance;
    }

    function testTransfer(address target)  public{
        target.transfer(1 ether);
    }

    function testCall(address contract_addr, bytes method) public returns(address, bytes, bool) {
        bytes4 methodId = bytes4(keccak256(method));
        // bytes4 methodId =  bytes4(sha3(method));
        return (contract_addr, method, contract_addr.call(methodId));

    }

    function getContractBalance() constant public returns(uint){
        // return this.balance;
        return address(this).balance;
    }
}
