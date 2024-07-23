import pytest


@pytest.fixture
def owner(accounts):
    return accounts[0]


@pytest.fixture
def djt(owner, project):
    return owner.deploy(project.DJT)