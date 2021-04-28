defmodule Inmana.WelcomerTest do
  use ExUnit.Case, async: true

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when user is special, return special message" do
      params = %{"name" => "banana", "age" => "42"}

      result = Welcomer.welcome(params)

      assert result == {:ok, "You are very special"}
    end

    test "when user is not special, return special message" do
      params = %{"name" => "rafael", "age" => "25"}

      result = Welcomer.welcome(params)

      assert result == {:ok, "Welcome rafael | 25"}
    end

    test "when user is under age, return an error" do
      params = %{"name" => "rafael", "age" => "15"}

      result = Welcomer.welcome(params)

      assert result == {:error, "You shall not pass rafael"}
    end
  end
end
