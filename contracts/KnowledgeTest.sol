//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;
    address public owner;

    modifier onlyOwner {
        require(msg.sender == owner, "ONLY_OWNER");

        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function changeTokens() public {
        tokens[0] = "VET";
    }


    receive() external payable {

    }


    fallback() external payable {

    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }


    function transferAll (address payable to) public onlyOwner {
        to.transfer(address(this).balance);
    }

    function start() public {
        players.push(msg.sender);
    }


    function concatenate(string calldata a, string calldata b) external pure returns(string memory) {    
        return string(abi.encodePacked(a, b));
    }
}
