defmodule Inmana.Restaurants.Create do
  alias Inmana.{ Repo, Restaurant }

  def call(params) do
    params
    |> Restaurant.changeset()
    |> Repo.insert()
    |> handle_response()
  end

  defp handle_response({:ok, %Restaurant{}} = result), do: result

  defp handle_response({:error, changeset}) do
    {:error, %{result: changeset, status: :bad_request}}
  end
end
