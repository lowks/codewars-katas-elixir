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
      IO.puts("Test TwoToOne #{numtest}")
      assert Codewars.TwoToOne.longest(a, b) == ans
    end

    test "longest" do
      testing(1, "aretheyhere", "yestheyarehere", "aehrsty")
      testing(2, "loopingisfunbutdangerous", "lessdangerousthancoding", "abcdefghilnoprstu")
      testing(3, "inmanylanguages", "theresapairoffunctions", "acefghilmnoprstuy")
    end

end
end
