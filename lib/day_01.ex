defmodule AdventOfCode2017.Day01 do
  def captcha1(input) when is_integer(input) do
    list = divide([], input)
    list = list ++ [List.first(list)]
    
    add(list, 0, 0)
  end


  defp divide(list, i) when (i < 10 and i > 0), do: [i] ++ list
  defp divide(list, i) when i > 10 do
    digit = rem(i, 10)
    divide([digit] ++ list, div(i, 10))
  end

  defp add([], _last, _sum), do: 0
  defp add(list, last, sum) do
    [a | rest] = list
    case a == last do
      true -> sum + a + add(rest, a, sum)
      _ -> sum + add(rest, a, sum)
    end
  end


  def captcha2(input) do
    list = divide([], input)
    offset = div(length(list), 2)
    shift_left(list, offset)
    |> Enum.zip(list)
    |> Enum.reduce(0, fn ({a, b}, acc) -> 
      case a == b do
        true -> acc + a
        _ -> acc
      end
    end)
  end

  defp shift_left(list, 0), do: list
  defp shift_left(list, count) do
    [head | tail] = list
    shift_left(tail ++ [head], count - 1)
  end
end

# part 1
# https://github.com/pcorey/advent_of_code_2017/blob/master/01/01.exs
# https://github.com/michallepicki/advent_of_code_2017/blob/master/1/a.exs
# https://gitlab.com/NobbZ/aoc17/blob/master/lib/aoc/day1.ex
# https://github.com/JEG2/advent_of_code_2017/blob/master/day_01/inverse_captcha.exs

# part 2

