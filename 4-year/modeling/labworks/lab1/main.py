# from bar_charts import build_chart
from generators import generate, first_generator, second_generator, third_generator
from utils import get_intervals, expected_value, dispersion, get_chi_squared, get_expected_amount_1, get_expected_amount_2, get_expected_amount_3


expected_amount = {
    first_generator: get_expected_amount_1,
    second_generator: get_expected_amount_2,
    third_generator: get_expected_amount_3,
}


def explore_generator(generator, **kwargs):
    arr = generate(generator, **kwargs)
    intervals = get_intervals(arr)
    # build_chart(intervals)
    expected_value_ = expected_value(arr)

    print('Expected value: ', expected_value_)
    print('Dispersion: ', dispersion(arr, expected_value_))
    print('chi2: ', get_chi_squared(intervals, expected_amount[generator], **kwargs))


explore_generator(first_generator, _lambda=8)
explore_generator(second_generator, sigma=3, a=10)
explore_generator(third_generator, a=5**13, c=2*31)
