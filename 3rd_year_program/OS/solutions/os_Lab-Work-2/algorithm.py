import numpy as np
import copy

mark_plain = 0
mark_star = 1
mark_prime = 2

def _markZeroes(matrix, _matrix_mask, _crow, _ccol):
    while True:
        zero = True
        # search unmarked zeros and grant it to prime
        # if no mark_star zero in the row containing this mark_prime zero, continue
        # otherwise cover mark_prime zero row and uncover the mark_star zero
        while zero:
            zero = _findNonCoveredZero(matrix, _crow, _ccol)
            if not zero:
                break
            else:
                row = _matrix_mask[zero[0]]
                row[zero[1]] = mark_prime

                try:
                    _index = row.index(mark_star)
                except ValueError:
                    return zero

                _crow[zero[0]] = True
                _ccol[_index] = False

        # add the value to every element of each covered row
        # subtract value from every element of each uncovered column.
        m = min(_getUncoveredValue(matrix, _crow, _ccol))
        for i, row in enumerate(matrix):
            for j, __ in enumerate(row):
                if _crow[i]:
                    matrix[i][j] += m
                if not _ccol[j]:
                    matrix[i][j] -= m

def _findNonCoveredZero(matrix, _crow, _ccol):
    for i, row in enumerate(matrix):
        for j, value in enumerate(row):
            if value == 0 and not _crow[i] and not _ccol[j]:
                return (i, j)
    else:
        return None

def _getUncoveredValue(matrix, _crow, _ccol):
    for i, row in enumerate(matrix):
        for j, value in enumerate(row):
            if not _crow[i] and not _ccol[j]:
                yield value

def _findMarkStarInColumn(_matrix_mask, j):
    for i, row in enumerate(_matrix_mask):
        if row[j] == mark_star:
            return (i, j)
    else:
        return None

def _findMarkPrimeInColumn(_matrix_mask, i):
    for j, val in enumerate(_matrix_mask[i]):
        if val == mark_prime:
            return (i, j)
    else:
        return None

def minimize(matrix, batch_counter):

    matrix = copy.deepcopy(matrix)

    n = len(matrix)

    # find min value in row and subract it from row
    for row in matrix:
        row = row - min(row)

    _matrix_mask = [[mark_plain] * n for _ in matrix]
    _crow = [False] * n
    _ccol = [False] * n

    # find in matrix all zeros and mark it
    for i, row in enumerate(matrix):
        for j, value in enumerate(row):
            if value == 0 and not _crow[i] and not _ccol[j]:
                _matrix_mask[i][j] = mark_star
                _crow[i] = _ccol = True

    _crow = [False] * n
    _ccol = [False] * n

    # if K columns have a zero, it's a complete set
    # otherwise go to step 5
    matched = False
    while not matched:
        for i in range(n):
            _ccol[i] = any(mrow[i] == mark_star for mrow in _matrix_mask)

        if all(_ccol):
            matched = True
            continue
        else:
            zero = _markZeroes(matrix, _matrix_mask, _crow, _ccol)

            # Z0 represent the uncovered mark_prime zero
            # Z1 denote the mark_star zero in the column of Z0 (any)
            # Z2 denote the mark_prime zero in the row of Z1 (exist at least one).
            # unstar each mark_star zero
            # star each mark_prime zero
            # erase all primes and uncover every line in the matrix.
            primes = [zero]
            stars = []
            while zero:
                zero = _findMarkStarInColumn(_matrix_mask, zero[1])
                if zero:
                    stars.append(zero)
                    zero = _findMarkPrimeInColumn(_matrix_mask, zero[0])
                    stars.append(zero)

            # Erase existing stars
            for star in stars:
                _matrix_mask[star[0]][star[1]] = mark_plain

            # Star existing primes
            for prime in primes:
                _matrix_mask[prime[0]][prime[1]] = mark_star

            # Erase remaining primes
            for i, row in enumerate(_matrix_mask):
                for j, val in enumerate(row):
                    if val == mark_prime:
                        _matrix_mask[i][j] = mark_plain

            _crow = [False] * n
            _ccol = [False] * n

        # end of step 3 while

    # reconstruct the solution
    solution = []
    for i, row in enumerate(_matrix_mask):
        for j, val in enumerate(row):
            if val == mark_star:
                solution.append((i, j + batch_counter))
    return solution

def findZoneSearchSolution(RJ, batch_counter):

    result = minimize(RJ, batch_counter)

    values = []
    for i, j in result:
        values.append(round(float(RJ[i, j - batch_counter]), 3))

    result = sorted(result, key=lambda x: x[0])
    return result, sum(values)
