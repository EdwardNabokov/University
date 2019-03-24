import json
import numpy as np

NAMES = ['Brad', 'Mitchel', 'Sofie', 'Clark', 'Bruce', 'David',
'Mark', 'Frank', 'Nick', 'Louise', 'James']

BRANDS = ['Volkswagen', 'Ferrari', 'Ford', 'Volvo', 'Schkoda', 'Suzuki', 'Subaru', 'Mercedes', 'BMW']

TYPES_CODE = ['Small fixes', 'Middle fixes', 'Large fixes', 'Repair wheels', 'Recolor', 'Improve handle', 'Paint wheels', 'Paint base', 'Inside cleaning',
'Outside cleaning', 'Full cleaning']

if __name__ == '__main__':
    with open('trailers_park_data.json', 'w')  as opened:
        with open('stuff_data.json', 'w') as opened_2:
            with open('repairs_data.json', 'w') as opened_3:
                for i in range(10):
                    index_brand = np.random.randint(0, len(BRANDS))
                    auto_num = np.random.randint(1000, 9999)
                    data = {
                        "_id": i,
                        "auto_num": auto_num,
                        "auto_brand": BRANDS[index_brand],
                        "released_date": str(np.random.randint(1, 30)) + "." + str(np.random.randint(1, 12)) + "." +
                        str(np.random.randint(1, 99)),
                        "garage_number": np.random.randint(1, 1000),
                    }
                    json.dump(data, opened, sort_keys=True, indent=4)
                    opened.write(',')

                    index_name = np.random.randint(0, len(NAMES))
                    user_data = {
                        "_id": i + 20,
                        "surname": NAMES[index_name],
                        "ipb": "A.A",
                        "garage_number_id": i,
                        "start_date": str(np.random.randint(1, 30)) + "." + str(np.random.randint(1, 12)) + "." +
                        str(np.random.randint(1, 99)),
                        "end_date": str(np.random.randint(1, 30)) + "." + str(np.random.randint(1, 12)) + "." +
                        str(np.random.randint(1, 99)),
                        "salary": np.random.randint(100, 15000),
                    }
                    json.dump(user_data, opened_2, indent=4)
                    opened_2.write(',')

                    index_code_1 = np.random.randint(0, len(TYPES_CODE))
                    index_code_2 = np.random.randint(0, len(TYPES_CODE))
                    index_code_3 = np.random.randint(0, len(TYPES_CODE))
                    repairs_data = {
                        "_id": i + 30,
                        "rdate": str(np.random.randint(1, 30)) + "." + str(np.random.randint(1, 12)) + "." +
                        str(np.random.randint(1, 99)),
                        "auto_num_id": i,
                        "mechanic_id": i + 20,
                        "types_code": [TYPES_CODE[index_code_1], TYPES_CODE[index_code_2], TYPES_CODE[index_code_3]],
                    }
                    json.dump(repairs_data, opened_3, indent=4)
                    opened_3.write(',')
