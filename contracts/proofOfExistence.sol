pragma solidity ^0.5.0;

contract ProofOfExistence {
    mapping (bytes32 => bool) private proofs;

    function notarize(string calldata document)
    external {
        bytes32 proof = proofFor(document);
        storeProof(proof);
    }

    function proofFor(string memory document)
    public
    pure
    returns (bytes32){
        return sha256(abi.encodePacked(document));
    }

    function storeProof(bytes32 proof)
    internal {
        proofs[proof] = true;
    }

    function checkDocumnet(string memory document)
    public
    view
    returns(bool){
        bytes32 proof = proofFor(document);
        return hashProof(proof);
    }

    function hashProof(bytes32 proof) 
    internal
    view
    returns (bool){
        return proofs[proof];
    }
  
        
}