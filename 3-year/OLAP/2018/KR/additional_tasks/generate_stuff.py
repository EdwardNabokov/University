import random
from faker import Faker

insert_data_stuff = '''
    insert into STUFF ("id_stuff", "name", "surname", "phone", "address", "salary", "description")
    values ({0}, '{1}', '{2}', '{3}', '{4}', {5}, null);\n
'''


fake = Faker()

def fake_phone():
    n = '0000000000'
    while '9' in n[3:6] or n[3:6]=='000' or n[6]==n[7]==n[8]==n[9]:
        n = str(random.randint(10**9, 10**10-1))
    return n[:3] + '-' + n[3:6] + '-' + n[6:]


with open('data-sql-python-staff.sql', 'w') as f:
    for i in range(1000):
        id_stuff = i + 1
        name, surname, *_ = fake.name().split(' ')
        phone = fake_phone()
        address = fake.address()
        salary = random.randint(500, 50000)
        description = fake.text()[:50]
        q = insert_data_stuff.format(id_stuff, name, surname, phone, address, salary)
        f.write(q)

