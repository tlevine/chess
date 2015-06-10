import operator

DIGITS = {str(i): i for i in range(10)}
OPERATIONS = {'+': operator.add, '-': operator.sub,
              '*': operator.mul, '/': operator.truediv, }

def evaluate(state, x):
    left, right, operation, stored = state
    if x in DIGITS:
        right = right * 10 + DIGITS[x]
    elif x in OPERATIONS:
        left = operation(left, right)
        right = 0
        operation = OPERATIONS[x]
    elif x == 'M':
        stored = right
    elif x == 'R':
        right = stored
    elif x == '=':
        right = operation(left, right)
        left = 0
    return left, right, operation, stored

def calculate(program):
    state = (0, 0, OPERATIONS['+'], 0)
    for x in program:
        state = evaluate(state, x)
    _, right, _, _ = state
    return right
