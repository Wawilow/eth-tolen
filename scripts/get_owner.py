from ape import Contract, accounts


def main():
    account = accounts.load("test_acc")

    box = Contract("0x102D392b7dEAE748c831aa290Fd5914CA68D7E04")
    store = box.store(4, sender=account)
    print("Transaction hash for updating the stored value:", store.txn_hash)

    retrieve = box.retrieve()
    print("Stored value:", retrieve)