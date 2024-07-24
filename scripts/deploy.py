from ape import project, accounts


def main():
    # Load your account by its name
    a = accounts.load("test_acc")
    a.estimate_gas_cost = 100
    # Deploy the contract using your account
    # a.deploy(project.IUniswapV2Router02, publish=True)
    a.deploy(project.DJT, publish=True)
    return
