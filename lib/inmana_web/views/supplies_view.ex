defmodule InmanaWeb.SuppliesView do
  use InmanaWeb, :view

  def render("create.json", %{supply: supply}) do
    %{message: "Supply created.", supply: supply}
  end

  def render("index.json", supplies) do
    %{supplies: supplies}
  end

  def render("show.json", %{supply: supply}), do:  %{supply: supply}
end
