defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Supplies.Get, as: GetSupplies
  alias Inmana.Supplies.ExpirationEmail
  alias Inmana.Mailer

  def send() do
    data = GetSupplies.by_expiration()

    data
    |> Task.async_stream(fn {email, supply_list} -> send_email(email, supply_list) end)
    |> Stream.run()
  end

  defp send_email(email, supplies) do
    email
    |> ExpirationEmail.create(supplies)
    |> Mailer.deliver_later!()
  end
end
