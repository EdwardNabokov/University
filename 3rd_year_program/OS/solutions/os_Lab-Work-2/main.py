import numpy as np
import copy
from utils import *
from algorithm import findZoneSearchSolution

def main_loop_batch(cpuList, tasksList, n):
    counter = 0
    for batch_tasks in range(0, len(tasksList), n):
        start = batch_tasks
        end = n + batch_tasks
        counter += 1
        # create matrix of relevance
        RJ = getAppropriationMatrix(cpuList, tasksList[start:end])

        # search for max pair match for weighted/unweighted graph
        cpus_tasks, total_sum = findZoneSearchSolution(RJ, batch_tasks)

        print('\nAppropriate sequently -- total sum is {0} for {1} tasks'\
            .format(getInitEstimation(cpuList, tasksList[start:end]), n))
        printResult(cpus_tasks)
        print('Zone of solution -- total sum is {0} for {1} batch ({2} tasks)'\
            .format(total_sum, counter, n))

        print('Left tasks: ', len(tasksList) - batch_tasks - n)

if __name__ == '__main__':

    # input of quantity jobs and resources
    jobs_M = int(input('Enter m jobs: '))
    resources_N = int(input('Enter n resources: '))

    # generate tasks, cpus, priority and wait time for each given task
    tasksList = normalize(generateTasks(jobs_M))
    cpuList = normalize(generateCPUs(resources_N))
    priorities = generatePriorities(jobs_M)
    waittime = normalize(generateTimeWaiting(jobs_M))

    # [task required time], [priority for each tasks] => [task, priority]
    tasksList = np.concatenate([tasksList, priorities, waittime], axis=1)

    # sort tasks by priority
    tasksList = sorted(tasksList, key=lambda x: x[1], reverse=True)

    # print out initial jobs and CPUs
    printCPUs(cpuList)
    printTasks(tasksList)

    # each resource can operate only with one task
    n = getDefinedScale(cpuList, tasksList)

    # iterate through each batch of tasks, that is defined by getDefinedScale
    main_loop_batch(cpuList, tasksList, n)
