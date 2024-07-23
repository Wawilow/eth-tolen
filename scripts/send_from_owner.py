from ape import Contract, accounts


def main():
    a = accounts.load("test_acc")
    a2 = accounts.load("a2")
    c = Contract("0xe4cF57262DE8C19c83f68AaF0379374D310DE5A6")

    c.transfer("0x6669a333e0c2b5911C2dfe3f64867832684175c1", 22999999999999999999998, sender=a)