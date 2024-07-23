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
ape console --network ethereum:holesky:node
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
contract address - `0xC3be2A551483c2366101122399D7ac210a288B04`

```bash
ape compile
ape run deploy --network ethereum:holesky:node
```


Interact with contract
```bash
ape console --network ethereum:holesky:node
```
```python
a = accounts.load("test_acc")
a.unlock()
c = Contract("0xe4cF57262DE8C19c83f68AaF0379374D310DE5A6")
c.retrieve()
# 0
c.store(4, sender=a)
c.retrieve()
# 4
```
