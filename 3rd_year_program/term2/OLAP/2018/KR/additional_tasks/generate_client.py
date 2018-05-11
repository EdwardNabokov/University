import random
from faker import Faker

insert_client = '''
    insert into CLIENT ("id_client", "name", "surname", "phone", "address", "email")
    values ({}, '{}', '{}', '{}', '{}', '{}');
'''

fake = Faker()

def fake_phone():
    n = '0000000000'
    while '9' in n[3:6] or n[3:6]=='000' or n[6]==n[7]==n[8]==n[9]:
        n = str(random.randint(10**9, 10**10-1))
    return n[:3] + '-' + n[3:6] + '-' + n[6:]


with open('data-sql-python-client.sql', 'w') as f:
    for i in range(1000):
        id_client = i + 1
        _name = fake.name().split(' ')
        name = _name[0]
        surname = _name[1]
        phone = fake_phone()
        address = fake.address()
        email = name + '@gmail.com'
        q = insert_client.format(id_client, name, surname, phone, address, email)
        f.write(q)
