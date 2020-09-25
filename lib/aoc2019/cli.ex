defmodule Aoc2019.Cli do
  def main(args) do
    options = [switches: [exercise: :string], aliases: [e: :exercise]]
    {opts,_,_}= OptionParser.parse(args, options)
    case opts[:exercise] do
      "1" ->
        Aoc2019.Day1.go
      "2" ->
        Aoc2019.Day2.go
      _ ->
        IO.puts "haven't got to that yet sorry"
    end
  end
end

