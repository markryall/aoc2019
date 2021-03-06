defmodule Aoc2019.Day2 do
  def go() do
    {:ok, contents} = File.read("tmp/2.txt")
    contents
    |> String.split([",", "\n"], trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.with_index
    |> Enum.map(fn {a, b} -> {b, a} end)
    |> Map.new
    |> startnv
  end

  def startnv(state) do
    Enum.each(0..99, fn noun -> start_noun(state, noun) end)
  end

  def start_noun(state, noun) do
    Enum.each(0..99, fn verb -> start_verb(state, noun, verb) end)
  end

  def start_verb(state, noun, verb) do
    next(op(%{state | 1 => noun, 2 => verb}, 0), noun, verb)
  end

  def next({:continue, state, index}, noun, verb) do
    next(op(state, index), noun, verb)
  end

  def next({:halt, state}, noun, verb) do
    IO.puts("noun: #{noun}, verb: #{verb}, #{state[0]}")
  end

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
