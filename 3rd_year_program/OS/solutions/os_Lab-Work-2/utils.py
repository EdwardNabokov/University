import numpy as np

def printCPUs(cpuList):
    print('\nAvailable CPUs (resources)')
    for i, cpu in enumerate(cpuList):
        print('CPU {0} -- Speed: {1} MHz'.format(i+1, *cpu))


def printTasks(tasksList):
    print('\nGiven tasks (jobs)')
    for i, task in enumerate(tasksList):
        print('Task {:<2} -- Time execution: {:<5} s -- Priority: {:<2} -- Wait time: {:<5} s'.format(i+1, *task))


def printResult(result):
    for cpu, task in result:
        print('CPU {:<2} -- Task: {}'.format(cpu + 1, task + 1))


def generateCPUs(quantity):
    return np.sort(np.random.randint(20, 60, size=quantity))[:, np.newaxis]


def generateTasks(quantity):
    return np.random.randint(100, 500, size=quantity)[:, np.newaxis]


def generatePriorities(quantity):
    return (np.random.randint(1, 10, size=quantity))[:, np.newaxis]


def generateTimeWaiting(quantity):
    return (np.random.randint(10, 500, size=quantity))[:, np.newaxis]


def normalize(l):
    return np.round(l / np.max(l), 3)


def getAppropriationMatrix(cpuList, tasksList):

    # create empty matrix
    RJ = np.empty([len(cpuList), len(tasksList)])

    # loop through each cpu and task
    # estimate each possible variant
    # fill matrix RJ
    for i, cpu_speed in enumerate(cpuList):
        for j, (task_time, task_priority, task_waittime) in enumerate(tasksList):
            RJ[i, j] = np.round(cpu_speed \
            * np.random.random() \
            * task_priority \
            * task_time \
            * task_waittime, 3)

    return RJ


def getDefinedScale(resources_N, jobs_M):
    if len(jobs_M) > len(resources_N):
        return min(len(jobs_M), len(resources_N))

    if len(jobs_M) < len(resources_N):
        return max(len(jobs_M), len(resources_N))


def getInitEstimation(cpuList, tasksList):

    total_sum = 0
    for cpu_speed, task_criterion in zip(cpuList, tasksList):
        total_sum += cpu_speed * np.prod(task_criterion)

    return round(total_sum[0], 3)
