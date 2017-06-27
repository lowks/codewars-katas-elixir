defmodule CodewarsTest do
  use ExUnit.Case
  doctest Codewars
  import Codewars.TwoToOne

  test "the truth" do
    assert 1 + 1 == 2
  end

  defmodule TwoToOneTest do

  use ExUnit.Case

  def testing(numtest, a, b, ans) do
    IO.puts("Test #{numtest}")
    assert Codewars.TwoToOne.longest(a, b) == ans
  end

  test "longest" do
    testing(1, "aretheyhere", "yestheyarehere", "aehrsty")
    testing(2, "loopingisfunbutdangerous", "lessdangerousthancoding", "abcdefghilnoprstu")
    testing(3, "inmanylanguages", "theresapairoffunctions", "acefghilmnoprstuy")
    testing(4, "lordsofthefallen", "gamekult", "adefghklmnorstu")
    testing(5, "codewars", "codewars", "acdeorsw")
    testing(6, "agenerationmustconfrontthelooming", "codewarrs", "acdefghilmnorstuw")
  end

  defp _two_to_one_test(a, b), do: (a <> b) |> String.split("") |> Enum.uniq |> Enum.sort |> Enum.join

  @chars "abcdefghijklmnopqrstuvwxyz" |> String.split("")
  defp _random_string() do
    Enum.reduce((1..:rand.uniform(50)), [], fn (_i, acc) -> [Enum.random(@chars) | acc] end) |> Enum.join("")
  end

  defmodule PilecubesTest do

  use ExUnit.Case

  def testFindNb(numtest, m, ans) do
    IO.puts("Test #{numtest}")
    assert Codewars.Pilecubes.find_nb(m) == ans
  end

  test "find_nb" do
    testFindNb  1, 4183059834009, 2022
    testFindNb  2, 24723578342962, -1
    testFindNb  3, 135440716410000, 4824
    testFindNb  4, 40539911473216, 3568
  end
end

defmodule Divisible13Test do

 use ExUnit.Case

 defp testing(numtest, n, ans) do
   IO.puts("Test Divisble13: #{numtest}")
   assert Codewars.Divisible13.thirt(n) == ans
 end
 test "thirt" do
   testing(1, 8529, 79)
   testing(2, 85299258, 31)
   testing(3, 5634, 57)
   testing(4, 1111111111, 71)
   testing(5, 987654321, 30)
 end
end


  def randomtests(_, _, n) when n >= 45, do: IO.puts "Finished!"
  def randomtests(a, b, n) do
    testing(n, a, b, _two_to_one_test(a, b))
    randomtests(_random_string, _random_string, n + 1)
  end

  test "random" do
    :random.seed(:os.timestamp)
    randomtests(_random_string, _random_string, 1)
  end

end
end
