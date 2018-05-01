import asyncio
import logging
from typing import Dict
from generateData import GenData
import asyncpg
from asyncpg.connection import Connection
import time

logger = logging.getLogger('DBWrapper')


class DBWrapper:
    def __init__(self, config: Dict[str, str]):
        self.config = config

    async def open_connection(self):
        self._connection: Connection = await asyncpg.connect(**self.config)

    async def close_connection(self):
        await self._connection.close()

    async def exec_query(self, query: str) -> str:
        """
        Execute query and return result code
        """
        result = await self._connection.execute(query)
        return result

    async def fetch_query(self, query: str) -> list:
        """
        Execute query and get NamedTuples with result
        """
        result = await self._connection.fetch(query)
        return result

    async def create_tables_no_index(self):
        table1 = """CREATE TABLE garages (
                    id    SERIAL,
                    num   INTEGER NOT NULL
                    );
                  """

        table2 = """CREATE TABLE staff (
                    id            SERIAL PRIMARY KEY,
                    mechanic_id   INTEGER NOT NULL,
                    surname       VARCHAR(50) NOT NULL,
                    ipd           VARCHAR(50) NOT NULL,
                    garage_number INTEGER NOT NULL,
                    start_date    TIMESTAMP,
                    end_date      TIMESTAMP
                  );"""
        await self.exec_query(table1)
        await self.exec_query(table2)

    async def create_tables_with_index(self):
        table1 = """CREATE TABLE garages (
                    id    SERIAL PRIMARY KEY,
	                num   INTEGER NOT NULL
                    );
                  """

        table2 = """CREATE TABLE staff (
                	id            SERIAL PRIMARY KEY,
                	mechanic_id   INTEGER NOT NULL,
                	surname       VARCHAR(50) NOT NULL,
                	ipd           VARCHAR(50) NOT NULL,
                	garage_number INTEGER NOT NULL REFERENCES garages(id),
                	start_date    TIMESTAMP,
                	end_date      TIMESTAMP
                  );"""
        await self.exec_query(table1)
        await self.exec_query(table2)

    async def drop_tables(self):
        await self.exec_query('DROP TABLE garages, staff;')

    async def fill_with_random(self):
        gen = GenData()
        print('Generate data')
        garages = gen.gen_data_for_garages(500000)
        mechanics = gen.gen_data_for_mechanic(500000)

        print('- Insert garages data')
        st = time.time()
        await self.exec_query(garages)
        print(f'Inserting time: {time.time() - st} s')

        print('- Insert mechanics data')
        st = time.time()
        await self.exec_query(mechanics)
        print(f'Inserting time: {time.time() - st} s \n')

    async def make_join(self):
        query = "SELECT * FROM staff JOIN garages ON garages.id = staff.garage_number WHERE staff.surname = 'Wilson';"
        await self.exec_query(query)


if __name__ == '__main__':
    config = {
        'host': 'localhost',
        'port': 5432,
        'database': 'trailers',
    }


    async def run():
        db = DBWrapper(config)

        print('- Open connection to DB')
        await db.open_connection()

        print('- Create data with no indexies')
        await db.create_tables_no_index()

        print('- Generate and insert data')
        await db.fill_with_random()

        print('- Make JOIN without indexies')
        st = time.time()
        await db.make_join()
        print(f'JOIN time: {time.time() - st} s\n')

        print('Drop tables')
        await db.drop_tables()

        print('\nRun with indexies\n' + '-' * 30)

        print('- Create data with indexies')
        await db.create_tables_with_index()

        print('- Generate and insert data')
        await db.fill_with_random()

        print('- Make JOIN with indexies')
        st = time.time()
        await db.make_join()
        print(f'JOIN time: {time.time() - st} s\n')

        await db.drop_tables()


    loop = asyncio.get_event_loop()

    loop.run_until_complete(run())
