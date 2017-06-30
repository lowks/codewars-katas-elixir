defmodule Codewars do
  @moduledoc """
  Documentation for Codewars.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Codewars.hello
      :world

  """
  defmodule TwoToOne do
    def longest(a, b) do
      # Put your code here
      Enum.join([a, b],"")
      |> Stream.unfold(&String.split_at(&1, 1))
      |> Enum.take_while(&(&1 != ""))
      |> Enum.uniq
      |> Enum.sort
      |> Enum.join("")
    end
  end

  @doc """
  Your task is to construct a building which will be a pile of n cubes.
  The cube at the bottom will have a volume of n^3, the cube above will have volume of (n-1)^3 and so on until the top which will have a volume of 1^3.
  You are given the total volume m of the building.
  Being given m can you find the number n of cubes you will have to build?
  The parameter of the function findNb (find_nb, find-nb, findNb) will be an integer m and you have to return the integer n such as n^3 + (n-1)^3 + ... + 1^3 = m if such a n exists or -1 if there is no such n.
  """

  defmodule Pilecubes do

    def find_nb(m, n \\ 0) # Needed because it's called find_nb(number)
    def find_nb(0, n), do: n # Case when m - find_nb(number) = 0
    def find_nb(m, _) when m < 0, do: -1 # Case when m - find_nb(number) = -ve
    def find_nb(m, n), do: find_nb(m - cube(n + 1), n + 1) # Main iterator

    defp cube(n) do
      n * n * n
    end
  end

  defmodule Divisible13 do

    @doc """
    When you divide the successive powers of 10 by 13 you get the following remainders of the integer divisions:

1, 10, 9, 12, 3, 4.

Then the whole pattern repeats.

Hence the following method: Multiply the right most digit of the number with the left most number in the sequence shown above, the second right most digit to the second left most digit of the number in the sequence. The cycle goes on and you sum all these products. Repeat this process until the sequence of sums is stationary.

...........................................................................

Example: What is the remainder when 1234567 is divided by 13?

7×1 + 6×10 + 5×9 + 4×12 + 3×3 + 2×4 + 1×1 = 178

We repeat the process with 178:

8x1 + 7x10 + 1x9 = 87

and again with 87:

7x1 + 8x10 = 87

...........................................................................

From now on the sequence is stationary and the remainder of 1234567 by 13 is the same as the remainder of 87 by 13: 9

Call thirt the function which processes this sequence of operations on an integer n (>=0). thirt will return the stationary number.

thirt(1234567) calculates 178, then 87, then 87 and returns 87.

thirt(321) calculates 48, 48 and returns 48
"""

    def thirt(n) do
      thirt(n, 0)
    end

    def thirt(n, n) do
      n
    end

    def thirt(n, _) do
      # your code
      # flip the number then map each with number to process then sum
      # IO.inspect n
      # number_to_process = [1, 10, 9, 12, 3, 4] |> Enum.take(String.length n)
      # number_to_process = [1, 10, 9, 12, 3, 4] |> Enum.take(String.length n)
      # number_to_process = [1, 10, 9, 12, 3, 4] |> Enum.take(String.length(Integer.to_string(n)))
      number_to_process = [1, 10, 9, 12, 3, 4] |> Stream.cycle
      # number_reverse = n |> String.to_integer |> Integer.digits |> Enum.reverse
      number_reverse = n |> Integer.digits |> Enum.reverse
      # Enum.reduce((for {i, j} <- Enum.zip(number_reverse, number_to_process), do: i*j), 0, fn(x, acc) -> x + acc end)
      (for {i, j} <- Enum.zip(number_reverse, number_to_process), do: i*j) |> Enum.sum |> thirt(n)
      # to_sum |> Enum.sum |> thirt(n)
    end
  # end
  end
#   defmodule Divisible13 do
#
#   def thirt(n) do
#     thirt(n, 0)
#   end
#
#   def thirt(n, n) do
#     n
#   end
#
#   def thirt(n, _) do
#     n
#     |> Integer.digits
#     |> Enum.reverse
#     |> Stream.zip(Stream.cycle([1, 10, 9, 12, 3, 4]))
#     |> Stream.map(fn {a, b} -> a * b end)
#     |> Enum.sum
#     |> thirt(n)
#   end
#
# end
  defmodule FizzBuzz do
    def fizzbuzz(input) do
      cond do
        rem(input, 3) == 0 and rem(input, 5) == 0 -> "fizzbuzz"
        rem(input, 3) == 0 -> "fizz"
        rem(input, 5) == 0 -> "buzz"
      end
    end
  end

  defmodule Revrot do

      defp rotate_or_reverse(number) do
        sum_of_cube = number
                      |> String.to_integer
                      |> Integer.digits
                      |> Enum.map(fn(x) -> x * x * x end)
                      |> Enum.sum
        cond do
          (sum_of_cube |> rem(2) == 0) -> number |> String.reverse
          (sum_of_cube |> rem(2) != 0) -> number |> String.split_at(1) |> Tuple.to_list |> Enum.reverse |> Enum.join
        end
      end

      defp do_process_string(string, sz) do
        # break string down into chunks of sz and if each chunk sum_of_cubes_divisible_by_two is true reverse else rotate
        string
        |> Stream.unfold(&String.split_at(&1, sz))
        |> Enum.take_while(&(&1 != "" && String.length(&1) >= sz))
        |> Enum.map(fn(x) -> rotate_or_reverse(x) end)
        |> Enum.join
      end

      def revrot(str, sz) do
        # your code
        cond do
          (sz == 0) or (sz > String.length(str)) -> ""
          (sz < String.length(str)) -> do_process_string(str, sz)
        end
      end

  end
end
