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
end
