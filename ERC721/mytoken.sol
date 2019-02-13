pragma solidity ^0.5.0;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

contract MyToken is ERC721 {
    uint total_pokemons = 0;
    mapping(uint => address) id_to_owner;
    mapping(uint => Pokemon) pokemon_list;
    address owner;

    struct Pokemon {
        uint attack;
        uint health;
        string image_url;
    }

    constructor() public {
        owner = msg.sender;

        Pokemon memory instance = Pokemon(total_pokemons, 100, 100, "example.com");

        _mint(owner, total_pokemons);
        id_to_owner[0] = owner;
        total_pokemons++;
    }

    function sendPokemon(uint tokenId, address to) public {
        require(msg.sender == id_to_owner[tokenId], "You do not own this token");

        safeTransferFrom(to, id_to_owner[tokenId], tokenId);

        id_to_owner[tokenId] = to;
    }
}
