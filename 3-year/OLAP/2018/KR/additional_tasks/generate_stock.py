import random
from faker import Faker
from datetime import datetime, timedelta

region = ['eu-central-1a', 'eu-central-1b', 'eu-central-1c', 'us-east-1', 'us-east-2', 'us-west-1', 'us-west-2']

insert_stock = '''
    insert into STOCK ("id_stock", "description", "region", "last_delivered_item", "capacity")
    values ({}, NULL , '{}', to_date('{}', 'yyyy-mm-dd hh24:mi:ss'), {});
'''

fake = Faker()


with open('data-sql-python-stock.sql', 'w') as f:
    for i in range(10):
        id_client = i + 1
        _region = region[random.randint(0, len(region) - 1)]
        _date = str(datetime.utcnow() - timedelta(days=random.randint(100, 15000))).split('.')[0]
        capacity = random.randint(500, 15000)
        q = insert_stock.format(id_client, _region, _date, capacity)
        f.write(q)
