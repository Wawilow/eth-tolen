from ape import project, accounts


def main():
    # Load your account by its name
    account = accounts.load("test_acc")
    # Deploy the contract using your account
    return account.deploy(project.DJT, publish=True)
