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
ape run deploy --network ethereum:holesky:node
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
