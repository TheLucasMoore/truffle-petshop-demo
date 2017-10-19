pragma solidity ^0.4.11;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  function testUserCanAdopt() {
    uint returnedId = adoption.adopt(7);
    uint expected = 7;
    Assert.equal(returnedId, expected, "Adoption of pet ID 7 should be recorded.");
  }

  function testGetAdopters() {
    address expected = this;
    address adopter = adoption.adopters(7);
    Assert.equal(adopter, expected, "Owner of pet ID 7 should be recorded.");
  }

  function testGetAdopterAddressByPetIdInArray() {
    address expected = this;
    address[16] memory adopters = adoption.getAdopters();
    Assert.equal(adopters[7], expected, "Owner of pet ID 8 should be recorded.");
  }
}
