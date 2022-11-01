defmodule FizzBuzzServer.GeneratorTest do
  alias FizzBuzzServer.Generator
  use ExUnit.Case

  test "returns any integer within range not divisible by either 3 or 5" do
    assert Generator.call(1) == 1
    assert Generator.call(2) == 2
    assert Generator.call(4) == 4
  end

  test "returns the string 'Fizz' when the input is divible by 3" do
    assert Generator.call(3) == "Fizz"
    assert Generator.call(6) == "Fizz"
    assert Generator.call(9) == "Fizz"
  end

  test "returns the string 'Buzz' when the input is divible by 5" do
    assert Generator.call(5) == "Buzz"
    assert Generator.call(10) == "Buzz"
    assert Generator.call(20) == "Buzz"
  end

  test "returns the string 'FizzBuzz' when the input is divible by both 3 and 5" do
    assert Generator.call(15) == "FizzBuzz"
    assert Generator.call(30) == "FizzBuzz"
    assert Generator.call(45) == "FizzBuzz"
  end
end
