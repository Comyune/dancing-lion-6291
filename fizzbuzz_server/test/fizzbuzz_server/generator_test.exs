defmodule FizzBuzzServer.GeneratorTest do
  alias FizzbuzzServer.Generator
  use ExUnit.Case

  describe "Basic functionality" do
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

  describe "Edge cases" do
    test "returns an error if anything other than an integer is passed" do
      expected = {:error, :input_must_be_an_integer}

      assert Generator.call(nil) == expected
      assert Generator.call("1") == expected
      assert Generator.call([]) == expected
    end
  end
end
