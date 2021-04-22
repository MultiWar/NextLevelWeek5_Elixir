defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Supplies.Get, as: GetSupplies
  alias Inmana.Supplies.ExpirationEmail
  alias Inmana.Mailer

  def send() do
    data = GetSupplies.by_expiration()

    Enum.each(data, fn {email, supply_list} ->
      email
      |> ExpirationEmail.create(supply_list)
      |> Mailer.deliver_later!()
    end)
  end
end
