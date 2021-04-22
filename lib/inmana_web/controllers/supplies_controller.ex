defmodule InmanaWeb.SuppliesController do
  use InmanaWeb, :controller

  alias Inmana.Supply
  alias InmanaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Supply{} = supply} <- Inmana.create_supply(params) do
      conn
      |> put_status(:created)
      |> render("create.json", supply: supply)
    end
  end

  def index(conn, params) do
    with {:ok, supplies} <- Inmana.get_all_supplies(params) do
      conn
      |> put_status(:ok)
      |> render("index.json", supplies: supplies)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Supply{} = supply} <- Inmana.get_supply_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", supply: supply)
    end
  end
end
