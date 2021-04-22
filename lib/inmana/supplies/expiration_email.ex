defmodule Inmana.Supplies.ExpirationEmail do
  import Bamboo.Email
  alias Inmana.Supply

  def create(to_email, supplies) do
    new_email(
      to: to_email,
      from: "app@inmana.com.br",
      subject: "supplies that expire this week",
      text_body: create_email_text(supplies)
    )
  end

  defp create_email_text(supplies) do
    initial_text = "------------ EXPIRING SUPPLIES ------------\n"

    Enum.reduce(supplies, initial_text, fn(supply, text) -> text <> supply_string(supply) end)
  end

  defp supply_string(%Supply{description: description, expiration_date: exp_date, responsible: responsible}) do
    "Description: #{description}, Expiration Date: #{exp_date}, Responsible: #{responsible}\n"
  end
end
