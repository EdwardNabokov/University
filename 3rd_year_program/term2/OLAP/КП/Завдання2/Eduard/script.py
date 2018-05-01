import random

if __name__ == '__main__':
    lines = 0
    with open('./newtestdataTEST.sql', 'a+') as infile, open('./testdata.sql', 'r') as f:
        for line in f:
            l = line.strip()
            if l:
                lines += 1
            if 'STORE' in l:
                without_last_two = l[:-2]
                new_one = f'{without_last_two}, {random.randint(1, 20)});'
                infile.write(new_one + '\n')
                continue
            if 'INVOICE' in l:
                splitted = l.split(", ")
                splitted[-2] = f'TO_DATE({splitted[-2]})'
                splitted[-1] = f'{splitted[-1][:-2]}, {random.randint(1, 50)}, {random.randint(1, 50)});'
                joined = ', '.join(splitted)
                print(joined)
                infile.write(joined + '\n')
                continue
            if l:
                infile.write(l + '\n')
    print(f'Total {lines}')
