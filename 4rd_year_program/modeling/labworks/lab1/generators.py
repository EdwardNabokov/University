import numpy as np
from math import log


def first_generator(_lambda):
    xi = np.random.uniform(0, 1)
    return -(1 / _lambda) * log(xi)


def second_generator(sigma, a):
    mu = sum([np.random.uniform(0, 1) for _ in range(12)]) - 6
    return sigma * mu + a


def third_generator(a=5 ** 13, c=2 ** 31):
    zi = np.random.uniform(0, 1)

    zi1 = (a * zi) % c
    x1 = zi1 / c
    zi = x1 * c

    return x1


def generate(generator, *args, **kwargs):
    return [generator(*args, **kwargs) for _ in range(10000)]
