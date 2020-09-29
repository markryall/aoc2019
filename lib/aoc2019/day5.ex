defmodule Aoc2019.Day5 do
  def go() do
    {:ok, contents} = File.read("tmp/5.txt")
    contents
    |> String.split([",", "\n"], trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.with_index
    |> Enum.map(fn {a, b} -> {b, a} end)
    |> Map.new
    |> start
  end

  def start(state) do
    next(op(state, 0))
  end

  def next({:continue, state, index}) do
    next(op(state, index))
  end

  def next({:halt, _state}) do
    IO.puts("halted")
  end

  def op(state, position) do
    flags = div(state[position], 100)
    command = rem(state[position], 100)
    case command do
      1 -> {:continue, add(state, state[position + 1], state[position + 2], state[position + 3], flags), position + 4}
      2 -> {:continue, multiply(state, state[position + 1], state[position + 2], state[position + 3], flags), position + 4}
      3 -> {:continue, store(state, state[position + 1]), position + 2}
      4 -> {:continue, write(state, state[position + 1], flags), position + 2}
      99 -> {:halt, state}
    end
  end

  def write(state, op, flags) do
    opflag = rem(flags, 10)
    opvalue = if opflag > 0, do: op, else: state[op]
    IO.inspect(opvalue)
    state
  end

  def store(state, result) do
    %{state | result => 1}
  end

  def add(state, op1, op2, result, flags) do
    op1flag = rem(flags, 10)
    op1value = if op1flag > 0, do: op1, else: state[op1]
    op2flag = div(flags, 10)
    op2value = if op2flag > 0, do: op2, else: state[op2]
    %{state | result => op1value + op2value}
  end

  def multiply(state, op1, op2, result, flags) do
    op1flag = rem(flags, 10)
    op1value = if op1flag > 0, do: op1, else: state[op1]
    op2flag = div(flags, 10)
    op2value = if op2flag > 0, do: op2, else: state[op2]
    %{state | result => op1value * op2value}
  end
end
