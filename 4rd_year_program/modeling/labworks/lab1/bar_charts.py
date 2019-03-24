import matplotlib.pyplot as plt
import numpy as np


def build_chart(intervals):
    plt.rcdefaults()
    objects = tuple([('{0:1.2e}'.format(i[0]),
                      '{0:1.2e}'.format(i[1])) for i in intervals])
    y_pos = np.arange(len(objects))
    performance = intervals.values()

    plt.bar(y_pos, performance, align='center', alpha=0.5)
    plt.xticks(y_pos, objects, rotation='vertical')
    plt.ylabel('Amount')
    plt.title('Distribution')

    plt.show()
