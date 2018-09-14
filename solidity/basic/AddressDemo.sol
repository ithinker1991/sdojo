pragma solidity ^0.4.0;

contract AddressDemo{
    address public owner;
    address public origin;

    // TODO array and address

    mapping(address => uint) public addr2int;
    mapping(uint => address) public int2addr;


    function recordBalance() public{
        addr2int[msg.sender] = msg.sender.balance;

    }

    function setIntMap(uint n) public{
        int2addr[n] = msg.sender;
    }

    function setIntMap(uint n, address addr) public {
        int2addr[n] = addr;
    }

    function getBalanceByAddr() public constant returns(uint) {
        return addr2int[msg.sender];
    }

    function getBalanceByAddr(address addr) public constant returns(uint){
        return addr2int[addr];
    }

    function getAddressByInt(uint n) public constant returns(address){
        return int2addr[n];
    }

    constructor() payable public {
        owner = msg.sender;
        origin = msg.sender;
    }

    function change_owner(address _owner) public {
        owner = _owner;
    }

    function isOwner() constant public returns(bool){
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
