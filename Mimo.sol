pragma solidity ^0.4.24;


contract Mimo {

    ENS public ens;

    // Logged when the owner of a node publishes new info about said node.
    event Publish(bytes32 indexed _node, bytes _info);

    constructor(ENS ensAddr) public {
        ens = ensAddr;
    }


    function publish(bytes32 _node, bytes  _info) public {
        require(msg.sender == owner(_node), "You do not own this node.");
        require(owner(_node) != address(0), "This node does not exist.");
        emit Publish(_node, _info);
    }

    function owner(bytes32 _node) public view returns (address) {
        return ens.owner(_node);
    }

}
