from ape import project, accounts, Contract


def main():
    # Load your account by its name
    a = accounts.load("test_acc")
    a.unlock()
    # Deploy the contract using your account
    # a.deploy(project.IUniswapV2Router02, publish=True, sender=a)
    a.deploy(project.DJT, publish=True, sender=a)
    return
