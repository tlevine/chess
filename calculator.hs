-- +, -, digit, =
type Operation = Integer -> Integer -> Integer

-- Previous number, current number, stored number, current operation
type State = (Integer, Integer, Integer, Operation)

-- Each character is a command.
type Command = State -> State

emptyOperation :: Operation
emptyOperation left right = (left * 10) + right

m :: Command
m (previous, current, _, operation) = (previous, current, current, operation)

r :: Command
r :: (_, current, stored, operation) = (current, stored, stored, operation)

applyOperation :: Operation -> Command
applyOperation operation (previous, current, stored, _) = (previous, current, stored, operation)

-- When a new operation command is run, the old operation is executed.

runCommand :: State -> State
runCommand (previous, current, stored, operation) = (current, operation previous current, stored, operation)

initialState = (0, 0, 0, equal)


runCommand initialState


