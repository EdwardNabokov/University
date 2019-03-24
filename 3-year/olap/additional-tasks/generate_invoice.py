import random
from faker import Faker
from datetime import datetime, timedelta


insert_q = '''
    insert into INVOICE ("id_invoice", 
    "id_supplier", "id_payment_type", "id_product", "id_store", "id_stuff", "id_client", "id_stock", "id_oper_type",
    "id_fact_type", "purchase_time", "quantity", "total_cost_sale", "profit",  "description")
    values ({}, {}, {}, {}, {}, {}, {}, {}, {}, {}, to_date('{}', 'yyyy-mm-dd hh24:mi:ss'), {}, {}, '{}', null);
'''


fake = Faker()

facts = {
    1: "ONLINE_SALES",
    2: "STORE_SALES",
    3: "STOCK",
}

with open('data-sql-python-invoice.sql', 'w') as f:
    for i in range(1000):
        id_invoice = i + 1
        id_supplier = random.randint(1, 4)
        id_payment_type = random.randint(1, 2)
        id_product = random.randint(1, 10)
        id_store = random.randint(1, 8)
        id_stuff = random.randint(1, 10)
        id_client = random.randint(1, 450)
        id_stock = random.randint(1, 9)
        oper_type = random.randint(1, 2)
        fact_type = random.randint(1, 2)

        # if facts[fact_type] != 'STOCK':
        #     oper_type = 'NULL'

        _date = str(datetime.utcnow() - timedelta(days=random.randint(100, 15000))).split('.')[0]
        quantity = random.randint(1, 450)
        #
        total = random.randint(1, 450)
        #
        profit = str(random.randint(-100, 100)) + '%'
        q = insert_q.format(
            id_invoice, id_supplier, id_payment_type, id_product, id_store, id_stuff, id_client, id_stock,
            oper_type, fact_type, _date, quantity, total, profit)
        f.write(q)
