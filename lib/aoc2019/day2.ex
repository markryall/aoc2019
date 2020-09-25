defmodule Aoc2019.Day2 do
  def op(state, position) do
    case state[position] do
      1 -> {:continue, add(state, state[position + 1], state[position + 2], state[position + 3]), position + 4}
      2 -> {:continue, multiply(state, state[position + 1], state[position + 2], state[position + 3]), position + 4}
      99 -> {:halt, state}
    end
  end

  def add(state, op1, op2, result) do
    %{state | result => state[op1] + state[op2]}
  end

  def multiply(state, op1, op2, result) do
    %{state | result => state[op1] * state[op2]}
  end
end
