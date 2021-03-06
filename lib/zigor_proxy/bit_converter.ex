defmodule ZigorProxy.BitConverter do
  @moduledoc """
  This module handles standard binary operations.
  Converting binaries to and from general data types.
  """

  @doc """
  Converts binary of 4 bytes into an signed integer.
  First byte is considered as signature of number.

  ## Parameters:
    - arg1: a 32-bit integer in form of binary to be decoded to number

  ## Examples
    iex> ZigorProxy.BitConverter.get_int32(<<255,255,255,255>>)
    -1

    iex> ZigorProxy.BitConverter.get_int32(<<10,0,0,0>>)
    10
  """
  def get_int32(<<num::little-signed-integer-size(32)>>) do
    num
  end

  def get_int32(_) do
    {:error, :argument_exeption}
  end

  @doc """
  Converts a number into binary.
  this function handles negative and positive numbers.

  ## Parameters
    - number: an integer number not exceeding max signed int32-max and not below int32-min

  ## Examples
    iex> ZigorProxy.BitConverter.int32_bytes(-1)
    <<255,255,255,255>>

    iex> ZigorProxy.BitConverter.int32_bytes(5)
    <<5,0,0,0>>
  """
  def int32_bytes(number) do
    <<number::little-signed-32>>
  end
end
