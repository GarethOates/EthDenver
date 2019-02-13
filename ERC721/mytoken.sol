pragma solidity ^0.5.0;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

contract MyToken is ERC721 {
    address owner;
    uint total_pokemons = 0;

    mapping(uint => address) id_to_owner;
    mapping(uint => Pokemon) pokemon_list;

    struct Pokemon {
        uint id;
        uint attack;
        uint health;
        string image_url;
    }

    constructor() public {
        owner = msg.sender;

        Pokemon memory instance = Pokemon(total_pokemons, 100, 100, "example.com");
        pokemon_list[total_pokemons] = instance;

        _mint(owner, total_pokemons);
        id_to_owner[0] = owner;
        total_pokemons++;
    }

    function sendPokemon(uint tokenId, address to) public {
        require(msg.sender == id_to_owner[tokenId], "You do not own this token");

        safeTransferFrom(to, id_to_owner[tokenId], tokenId);

        id_to_owner[tokenId] = to;
    }

    function createPokemon(uint _attack, uint _health, string memory _image_url) public payable {
        require(_attack < 100, "Attack too strong");
        require(_health > 0, "Cannot have negative health");
        require(msg.value >= 0.005 ether, "Insufficient Funds");

        Pokemon memory instance = Pokemon(total_pokemons, _attack, _health, _image_url);
        pokemon_list[total_pokemons] = instance;

        _mint(msg.sender, total_pokemons);
        id_to_owner[total_pokemons] = msg.sender;

        total_pokemons++;
    }

    function cashOut(address payable _payTo) public {
        require(msg.sender == owner, "You are not the contract owner");

        _payTo.transfer(address(this).balance);
    }
}
