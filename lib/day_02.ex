defmodule AdventOfCode2017.Day02 do
  def checksum1(input) do
    Enum.map(input, fn line ->
      Enum.reduce(line, {100000000, 0}, fn (n, {a, b}) -> 
        { if(n < a, do: n, else: a), if(n > b, do: n, else: b) }
      end)
    end)
    |> Enum.reduce(0, fn ({smallest, largest}, checksum) ->
      checksum + (largest - smallest)
    end)    
  end

  def checksum2(input) do
    Enum.reduce(input, 0, fn (line, acc) -> 
      acc + Enum.reduce(line, 0, fn(a, outer_acc) -> 
        outer_acc + Enum.reduce(line, 0, fn(b, inner_acc) ->
          inner_acc + result(a,b)
        end)
      end)
    end)
  end

  def result(a,b) when a != b and a > b do
    case rem(a,b)do
      0 -> div(a, b)
      _ -> 0
    end
  end 
  def result(_,_), do: 0
end

# https://github.com/pcorey/advent_of_code_2017/blob/master/02/02.exs
# https://github.com/michallepicki/advent_of_code_2017/tree/master/2
# https://gitlab.com/NobbZ/aoc17/blob/master/lib/aoc/day2.ex
# https://github.com/JEG2/advent_of_code_2017/blob/master/day_02/corruption_checksum.ex
