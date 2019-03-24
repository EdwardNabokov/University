from faker import Faker
from tqdm import tqdm


class GenData:
    def __init__(self):
        self.faker: Faker = Faker()

    def gen_data_for_garages(self, n: int):
        query = []
        for i in tqdm(range(n), desc='Generate data for garages'):
            num = self.faker.random_int()
            query.append(f"INSERT INTO garages (num) VALUES ({num})")

        return ';'.join(query)

    def gen_data_for_mechanic(self, n: int):
        query = []
        for _ in tqdm(range(n), desc='Generate data for mechanics'):
            mechanic_id = self.faker.random_int()
            surname = self.faker.last_name()
            ipd = self.faker.license_plate()
            garage_number = self.faker.random_int(min=1, max=n // 2)
            start_date = self.faker.date_this_century(before_today=True, after_today=False)
            end_date = self.faker.date_this_century(before_today=True, after_today=False)

            query.append(f"INSERT INTO staff (mechanic_id, surname, ipd, garage_number, start_date, end_date) "
                         f"VALUES ('{mechanic_id}', '{surname}', '{ipd}', '{garage_number}', '{start_date}', '{end_date}')")

        return ';'.join(query)

