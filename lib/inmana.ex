defmodule Inmana do
  alias Inmana.Restaurants.Create, as: CreateRestaurant
  alias Inmana.Supplies.Create, as: CreateSupply
  alias Inmana.Supplies.Get, as: GetSupply
  @moduledoc """
  Inmana keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defdelegate create_restaurant(params), to: CreateRestaurant, as: :call

  defdelegate create_supply(params), to: CreateSupply, as: :call
  defdelegate get_all_supplies(params), to: GetSupply, as: :call
  defdelegate get_supply_by_id(id), to: GetSupply, as: :by_id
end
