defmodule Inmana.Supplies.Get do
  alias Inmana.{ Repo, Supply, Restaurant }
  import Ecto.Query

  def call(params) do
    name_query = "%#{params.name}%"
    responsible_query = "%#{params.responsible}%"
    query = from s in Supply,
              where: ilike(s.description, ^name_query) and ilike(s.responsible, ^responsible_query)
    supplies = Repo.all(query)
    {:ok, supplies}
  end

  def by_id(id) do
    case Repo.get(Supply, id) do
      %Supply{} = supply -> {:ok, supply}
      _whatever -> {:error, %{result: "Supply not found", status: :not_found}}
    end
  end

  def by_expiration() do
    today = Date.utc_today()
    beginning_of_week = Date.beginning_of_week(today)
    end_of_week = Date.end_of_week(today)

    query = from s in Supply,
              where: s.expiration_date >= ^beginning_of_week and s.expiration_date <= ^end_of_week,
              preload: [:restaurant]

    Repo.all(query)
    |> Enum.group_by(fn %Supply{restaurant: %Restaurant{email: email}} -> email end)
  end
end
