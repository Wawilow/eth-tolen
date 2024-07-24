# def test_store_value(djt, owner):
#     new_value = 5
#     djt.transfer(owner, new_value, sender=owner)
#     print(djt.balanceOf)
#     assert djt.balanceOf(owner) != 0

def test_gtown(djt, owner):
    assert djt.gtown()