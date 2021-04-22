defmodule Inmana.Supplies.Create do
  alias Inmana.{ Repo, Supply }

  def call(params) do
    params
    |> Supply.changeset()
    |> Repo.insert()
    |> handle_response()
  end

  defp handle_response({:ok, %Supply{}} = result), do: result

  defp handle_response({:error, changeset}) do
    {:error, %{result: changeset, status: :bad_request}}
  end
end
