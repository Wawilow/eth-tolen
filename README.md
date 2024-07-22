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
```

Go to testnet console
```bash
ape console --network ethereum:holesky:node
```
Get gas - go to the `https://holesky-faucet.pk910.de/`, verify your wallet with something like github or what ever `passport.gitcoin.co` and collect some gas.
