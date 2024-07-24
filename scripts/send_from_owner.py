from ape import Contract, accounts


def main():
    a = accounts.load("a2")
    a.unlock()
    a2 = accounts.load("test_acc")
    c = Contract("0xDB413C04D1A956f7Aa5812b8ab70CB08D798b014")
    c.transfer(a2, 1 * (10 ** 18), sender=a)