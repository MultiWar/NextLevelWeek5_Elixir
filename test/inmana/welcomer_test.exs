defmodule Inmana.WelcomerTest do
  use ExUnit.Case, async: true
  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when user has name 'banana' and age 42, they receive a special message" do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "Não pode ser... Senhor Banana???? Você é muito especial!!!"}

      result = Welcomer.welcome(params)
      assert result === expected_result
    end

    test "when user is not named banana but has age 42, they receive a somewhat special message" do
      params = %{"name" => "it doesn't matter", "age" => "42"}
      expected_result = {:ok, "Parabéns, it doesn't matter, você é um pouco especial"}

      result = Welcomer.welcome(params)
      assert result === expected_result
    end

    test "when user is neither named banana nor has age 42, but they're of age, they receive a passing message" do
      params = %{"name" => "it doesn't matter", "age" => "24"}
      expected_result = {:ok, "Bem vindo, it doesn't matter, pois você é maior de idade"}

      result = Welcomer.welcome(params)
      assert result === expected_result
    end

    test "when user is underage" do
      params = %{"name" => "banana", "age" => "15"}
      expected_result = {:error, "não"}

      result = Welcomer.welcome(params)
      assert result === expected_result
    end
  end
end
