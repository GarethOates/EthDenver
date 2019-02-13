# ERC 721 Meetup

* Collectible: Something unique, for example a jigglypuff pokemon card
* Something that you can prove you own
* Web domains are "collectible" and you can prove ownership
* Stocks in a company.  Share certificate

## What is ERC

Next stage of an EIP,  Ethereum Improvement Proposal. Submitted via GitHub Pull Requests.

The number of an EIP matches the Issue number on GitHub.  EIP can graduate to an Ethereum
Request for Comment (ERC).

The first ERC idea was in EIP16, which was the concept of ERCs.

## ERC-721

Allows for the implementation of standard API for [Non Fungible Tokens (NFT)] within
smart contracts.

If something is non fungible, it is not equvalent to something else, even if they share
the same value.  JigglyPuff card value $1, cannot be used to pay for something worth $1.

* Decimals = 0.  Cannot be divided up.

Fungible means that their value is equivalent between different instances of the same
type.  e.g. a $1 dollar bill.  Don't care which physical dollar I have or use, just the value.

## ERC-721 Functions

* balanceOf
* ownerOf
* safeTransferFrom
* approve

Implementation of the functions are up to the user, but there exists guidelines
on how to implement them.

## Why Follow a Standard

Benefits of following a standard are interoperability and availability of shared
user experiences.  Potential ability to trade between different implementations of
ERC721 compliant tokens.

## ERC-721 Implementation Examples

* Airbus Foundation uses tokens to track donations using Heritage.

* OpenSea is an Token marketplace which allows you to trade between various different ERC721 tokens.  Even though tokens are implemented by different people.

* superrare.co - You can sell art online and always know who owns them.

## Representation in Solidity

When initializing a mapping object, the default value is always 0.

`mapping(address => uint):`

|key|value|
|---|-----|
| Bob | 0 |
| Colin | 0 |
| Andy | 0 |
| 0x43243j | 0 |

`mapping(uint => object):`

|key|value|
| -- | --- |
| 0 | { type: jigglypuff, attack: 5 } |
| 1 | { type: charmadner, attack: 20 } |

`mapping(uint => address):`

|key|value|
| -- | --- |
| 0 | 0x24242 |
| 1 | 0xabcdfe |
