import numpy as np


def generate_workers(number_cpus):
    cpus = abs(np.random.randn(number_cpus)) + np.random.random() + np.random.randint(0, 5)
    return cpus


def generate_tasks(number_tasks):
    tasks = abs(np.random.randn(number_tasks)) + np.random.random() * np.random.randint(0, 6)
    return tasks


def _print_workers(workers):
    print('====WORKERS====')
    for i, element in enumerate(workers):
        print('Worker ', i + 1, ' --- Power: ', element, 'Hrz')


def _print_tasks(tasks):
    print('====TASKS====')
    for i, element in enumerate(tasks):
        print('Task ', i + 1, ' --- Required power: ', element, 'Hrz')


def _print_assigned(pairs):
    print('===ASSIGNED TASKS/JOBS TO WORKERS/CPUS USING SEQUENTIAL DISTRIBUTION===')
    for task, worker in pairs:
        print('Task ', task + 1, ' was assigned to worker ', worker + 1)


def assign_task_worker(workers, tasks):
    not_assigned_tasks = set()
    pairs = []

    for i, task in enumerate(tasks):
        was_assigned = False
        for j, worker in enumerate(workers):
            if task <= worker:
                workers[j] -= task
                pairs.append((i, j))
                was_assigned = True
                break

        if not was_assigned:
            not_assigned_tasks.add(i + 1)

    return not_assigned_tasks, pairs


if __name__ == '__main__':
    workers = generate_workers(20)
    tasks = generate_tasks(30)

    _print_workers(workers)
    _print_tasks(tasks)

    not_assigned, pairs = assign_task_worker(workers, tasks)

    _print_assigned(pairs)
    print("Not assigned tasks: ", not_assigned)