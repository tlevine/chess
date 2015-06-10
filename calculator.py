DIGITS = {str(i): i for i in range(10)}
OPERATIONS = {'+': operator.add, '-': operator.sub,
              '*': operator.mul '/': operator.div, }

def evaluate(state, x):
    left, right, operation, stored = state
    if x in DIGITS:
        right = right * 10 + DIGITS[x]
    elif x in OPERATIONS:
        left = operation(left, right)
        operation = OPERATIONS[x]
    elif x == 'M':
        stored = right
    elif x == 'R':
        right = stored
    elif x == '=':
        left = 0
        right = operation(left, right)
    return left, right, operation, stored

def calculate(program):
    state = (0, 0, OPERATIONS['+'], 0)
    for x in program:
        state = evaluate(state, x)
    _, right, _, _ = state
    return right
