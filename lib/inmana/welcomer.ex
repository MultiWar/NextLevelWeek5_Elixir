defmodule Inmana.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do
      age = String.to_integer(age)
      name
      |> String.trim()
      |> String.downcase()
      |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "Não pode ser... Senhor Banana???? Você é muito especial!!!"}
  end
  defp evaluate(name, 42) do
    {:ok, "Parabéns, #{name}, você é um pouco especial"}
  end
  defp evaluate(name, age) when age >= 18 do
    {:ok, "Bem vindo, #{name}, pois você é maior de idade"}
  end
  defp evaluate(_name, _age) do
    {:error, "não"}
  end
end
