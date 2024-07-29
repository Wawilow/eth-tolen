# Learn solidity

## [**`Repository with actual code`**](https://github.com/Wawilow/eth-tolen)

## Sources

- [cryptozombies](https://cryptozombies.io/) (mostly useless, I need data, no so called 'gamification')
- [degencode](https://www.degencode.com/)
- [pyk’s blog](https://pyk.sh/)
- [???](https://archive.trufflesuite.com/guides/pet-shop/)
- [zepellin](https://ethernaut.zeppelin.solutions/level/1)
- [geek for geek guide](https://www.geeksforgeeks.org/introduction-to-solidity/?ref=lbp) - it’s always really good

[libevm](https://www.libevm.com/) - very small

[noxx.substack.com](http://noxx.substack.com/)

[banteg.xyz](http://banteg.xyz)

[mudit.blog](https://mudit.blog)

[nathanworsley.com](http://nathanworsley.com/) - local coin swap dude (best p2p exchange)

Extra

[safe.ape.tax](http://safe.ape.tax/) - save transaction builder

Instruments

[eigenphi.io](http://eigenphi.io/) - analytics

## Learning notes

[Video](https://www.youtube.com/watch?v=yM6oRMdMiTM) - I've learn about solidity in 20 mins long video more than reading 3 days docs -_- bruh

- So cool developer environment is [remix.ethereum.org](https://remix.ethereum.org/)
- [goerli.net](https://goerli.net/) - good test network, so I can test my contract

I guess I'm ready to develop my first smart contract…

**Brownie** is outdated → use [**Ape Framework**](https://www.degencode.com/p/introduction-to-ape-framework)

`pip3 install eth-ape` - installing ape framework

`ape —vesion` - check is installation is successful

`ape —help` - CLI manual

1. `ape accounts generate <account name>` - generate account
2. `ape accounts export <account name>` - export private key (I don’t trust this cli at all… , **always keep private keys on a paper or something**)

I got no fucking clue how to add my own test network to `ape` , it's way to complicated for my ape brain so I've just use basic testnet, idk why I've tried to add third testnet in the first place, but I've spend on it like 3 hours (I just really really liked `g**oerli`** [website](https://goerli.net))

Build asf simple contract by [article](https://docs.moonbeam.network/builders/ethereum/dev-env/ape/)

```solidity
// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.1;

contract Box {
    uint256 private value;

    event ValueChanged(uint256 newValue);

    function store(uint256 newValue) public {
        value = newValue;
        emit ValueChanged(newValue);
    }

    function retrieve() public view returns (uint256) {
        return value;
    }
}
```

```python
a = accounts.load("test_acc")
c = Contract("0xC3be2A551483c2366101122399D7ac210a288B04")
c.retrieve()
# 0
c.store(4, sender=a)
c.retrieve()
# 4
```

This shit is working!!!!

It’s and for today

# I got problem with nodes working horrible, so “How to host my own holesky node”

[Link](https://docs.taiko.xyz/guides/node-operators/run-an-ethereum-testnet-node/)

[Link 2](https://notes.ethereum.org/@launchpad/holesky)

Easiest thing ever, just 1 docker command and nginx config - **all good**

# Trying to reverse engineer DJT token from test task

Sooooo… I've just copy and comment all structures which is available for public.

Rewrote some of the functions which I've just copy, I get it, it's pretty, pretty cool

The gorgeous dude who help mine testnet gas - [github](https://github.com/pk910/PoWFaucet?tab=readme-ov-file)

> A simple example demonstrating this effect looks like this:
> 
> 
> ```csharp
> pragma solidity^0.4.12;
> 
> contract Test {
>     function test(uint[20] a) public returns (uint){
>          return a[10]*2;
>     }
> 
>     function test2(uint[20] a) external returns (uint){
>          return a[10]*2;
>     }
> }
> 
> ```
> 
> Calling each function, we can see that the `public` function uses 496 gas, while the `external` function uses only 261.
> 
> The difference is because in public functions, Solidity immediately 
> copies array arguments to memory, while external functions can read 
> directly from calldata. Memory allocation is expensive, whereas reading 
> from calldata is cheap.
> 
> The reason that `public` functions need to write all of 
> the arguments to memory is that public functions may be called 
> internally, which is actually an entirely different process than 
> external calls. Internal calls are executed via jumps in the code, and 
> array arguments are passed internally by pointers to memory. Thus, when 
> the compiler generates the code for an internal function, that function 
> expects its arguments to be located in memory.
> 
> For external functions, the compiler doesn't need to allow internal 
> calls, and so it allows arguments to be read directly from calldata, 
> saving the copying step.
> 
> As for best practices, you should use `external` if you expect that the function will only ever be called externally, and use `public` if you need to call the function internally. It almost never makes sense to use the `this.f()` pattern, as this requires a real `CALL`
>  to be executed, which is expensive. Also, passing arrays via this 
> method would be far more expensive than passing them internally.
> 
> You will essentially see performance benefits with `external` any time you are only calling a function externally, and passing in a lot of calldata (eg, large arrays).
> 
> Examples to differentiate:
> 
> **public -** all can access
> 
> **external -** Cannot be accessed internally, only externally
> 
> **internal -** only this contract and contracts deriving from it can access
> 
> **private -** can be accessed only from this contract
> 

So, I’ve create public interface and I have to somehow block blacklisted transactions

[solution 1](https://stackoverflow.com/questions/73365543/how-to-prevent-users-from-calling-my-smart-contract-function-while-still-being-a)

[solution 2](https://ethereum.stackexchange.com/questions/140532/how-do-i-block-the-sale-of-a-token-after-it-has-been-purchased)

[Elevator](https://ethernaut.zeppelin.solutions/level/0xEf996437EB2DC6C7a721B1743daEdfCB311AE2b6) - same struct as in DJT token

Anyway, my journey was pretty tuff, but I got some success

1. I can’t make regular inheritance `from one contract to another`
2. To create `inheritance` I have to create `second contract` and make `link` on it in the first `contract`
3. To make this link I have to create `interface`
4. [Source 1](https://ethereum.stackexchange.com/questions/109530/calling-function-from-another-contract), [Source 2](https://ethereum.stackexchange.com/questions/15663/cannot-call-internal-function-via-call), [Source 3](https://ethernaut.zeppelin.solutions/level/0xF695A9661A3b909ffb15F97556bAb286b19520E7), [Source 4](https://ethereum.stackexchange.com/questions/107324/solidity-interfaces-calling-other-contract-functions), [Source 5](https://www.geeksforgeeks.org/solidity-inheritance/?ref=lbp)
5. Result - [IUniswapV2Router02](https://holesky.etherscan.io/address/0x9D24183c7AFBe12ca35adcCe6177517bD6A48657#code), [DJT](https://holesky.etherscan.io/address/0xdb413c04d1a956f7aa5812b8ab70cb08d798b014#code)

Basically at this point I have to just write final function

Nope, I don’t, I already got in in transaction function!


# Starting
Set up local python `venv`
```bash
python3 -m venv .venv
source .venv/bin/activate
```

Install required packages
```bash
pip3 install -r requirements.txt
```
or manually insall all packages from `requirements.txt` file with `pipx`
```bash
pipx install <package name>
```

# Actual writing some code
Init ape project
```bash
ape init
ape plugins install solidity
ape plugins install etherscan
ape plugins install tokens
```

Go to testnet console
```bash
ape console --network ethereum:holesky:https://ethereum-holesky-rpc.publicnode.com
```
Get gas - go to the `https://holesky-faucet.pk910.de/`, verify your wallet with something like github or what ever `passport.gitcoin.co` and collect some gas.

# Ape console
Get account variable
```bash
acct = accounts.load(<account name>)
```
Get account eth balance
```bash
acct.balance
```
Unlock account and get private key
```bash
acct.unlock()
acct._KeyfileAccount__cached_key
```

# Ape deploy
```bash
ape compile
ape run deploy --network ethereum:holesky:https://ethereum-holesky-rpc.publicnode.com
```


Interact with contract
```bash
ape console --network ethereum:holesky:https://ethereum-holesky-rpc.publicnode.com
```
```python
# set constants
a = accounts.load("test_acc")
a2 = accounts.load("a2")
a.unlock()
a2.unlock()
c = Contract("0xc91f5Ac42A9f3533DaA6477c1c52e8E00B2A4E3A")      # IUniswapV2Router02 contract
c2 = Contract("0xEb35afe5E4Dd7013B38D6eb33DcFD524F56503d4")     # DJT contracy

# contract is open on start

# sending from owner to test account 1000 coins
c2.transfer("0x6669a333e0c2b5911C2dfe3f64867832684175c1", 1000 * (10 ** 18), sender=a)
c.getOwner()    # check what a is the owner

# sending test coin back to owner, to check secure param (basic is false - everyone can send anything)
c2.transfer("0xAA5EbB1aF4F273e6e2f973622cb9bD61Fb257032", 1 * (10 ** 18), sender=a2)

# set secure param true - only owner or white list users can send coints
c.updateSecureParam(True, sender=a)

# send coins from not white listed account - function return error
c2.transfer("0xAA5EbB1aF4F273e6e2f973622cb9bD61Fb257032", 1 * (10 ** 18), sender=a2)
c2.transfer("0x6669a333e0c2b5911C2dfe3f64867832684175c1", 1 * (10 ** 18), sender=a)      # send coin from owner account

c.getAllowTransactions("0x6669a333e0c2b5911C2dfe3f64867832684175c1")
c.allowTransactions("0x6669a333e0c2b5911C2dfe3f64867832684175c1", 1, sender=a)        # allow 1 transaction for not owner account
c2.transfer("0xAA5EbB1aF4F273e6e2f973622cb9bD61Fb257032", 1 * (10 ** 18), sender=a2)    # send coins from white listed account

c2.transfer("0xAA5EbB1aF4F273e6e2f973622cb9bD61Fb257032", 1 * (10 ** 18), sender=a2)    # send coins from previously white listed account - function return error
```
