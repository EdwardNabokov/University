from math import exp, sqrt, pi
import scipy.integrate as integrate

NUMBER_OF_INTERVALS = 20
NUMBERS_AMOUNT = 10000


def get_intervals(array: list):
    max_element, min_element = max(array), min(array)

    step = (max_element - min_element) / NUMBER_OF_INTERVALS
    keys = [(min_element + i * step, min_element + (i + 1) * step) for i in range(NUMBER_OF_INTERVALS)]
    values = [0] * (NUMBER_OF_INTERVALS + 1)
    for element in array:
        distance = element - min_element
        i = int(distance // step)
        values[i] += 1

    return dict(zip(keys, values))


def get_normalized_intervals(intervals):
    n_intervals = {}
    last_key = None
    for i in intervals:
        if n_intervals and n_intervals[last_key] < 5:
            value = n_intervals[last_key] + intervals[i]
            del n_intervals[last_key]
            last_key = (last_key[0], i[1])
            n_intervals[last_key] = value
        else:
            n_intervals[i] = intervals[i]
            last_key = i

    if n_intervals[last_key] < 5:
        prev_key = list(n_intervals.keys())[-2]
        value = n_intervals[prev_key] + n_intervals[last_key]
        del n_intervals[prev_key]
        del n_intervals[last_key]
        key = (prev_key[0], last_key[1])
        n_intervals[key] = value
    return n_intervals


def expectation(array):
    return sum(array) / len(array)


def dispersion(array, avg=None):
    if not avg:
        avg = expectation(array)
    n = len(array)
    return (1 / (n - 1)) * sum([(e - avg) ** 2 for e in array])


def some_distribution(x, _lambda):
    return 1 - exp(-x * _lambda)


def gaussian_distribution(x, sigma, a):
    return (1 / (sigma * sqrt(2 * pi))) * exp(-((x - a) ** 2) / (2 * sigma ** 2))


def get_expected_amount_1(interval, **kwargs):
    f1 = some_distribution(interval[1], **kwargs)
    f0 = some_distribution(interval[0], **kwargs)
    return (f1 - f0) * NUMBERS_AMOUNT


def get_expected_amount_2(interval, sigma, a):
    ans = integrate.quad(gaussian_distribution, *interval, args=(sigma, a))
    return ans[0] * NUMBERS_AMOUNT


def get_expected_amount_3(*args, **kwargs):
    return NUMBERS_AMOUNT / NUMBER_OF_INTERVALS


def get_chi_squared(intervals, get_expected_amount, **kwargs):
    # print(intervals)
    # print(get_normalized_intervals(intervals))
    n_intervals = get_normalized_intervals(intervals)
    sum_ = 0
    for i in n_intervals:
        expected_amount = get_expected_amount(i, **kwargs)
        sum_ += (n_intervals[i] - expected_amount) ** 2 / expected_amount
    return sum_
