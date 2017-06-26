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
end
