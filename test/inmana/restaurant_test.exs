defmodule Inmana.RestaurantTest do
  use Inmana.DataCase, async: true
  alias Inmana.Restaurant
  alias Ecto.Changeset

  describe "changeset/1" do
    test "correct params should return a valid changeset" do
      params = %{name: "Restaurante do Clebinho", email: "clebinho@restaurante.com"}
      expected_response = %Changeset{changes: %{email: "clebinho@restaurante.com", name: "Restaurante do Clebinho"}, valid?: true}

      response = Restaurant.changeset(params)
      assert expected_response = response
    end

    test "empty email should return an invalid changeset and an error" do
      params = %{name: "Restaurante do Clebinho", email: ""}
      expected_changeset = %Changeset{valid?: false}
      expected_error = %{email: ["can't be blank"]}

      response_changeset = Restaurant.changeset(params)

      assert expected_changeset = response_changeset
      assert errors_on(response_changeset) == expected_error
    end

    test "invalid params should return an invalid changeset and errors" do
      params = %{name: "R", email: "adasd"}
      expected_changeset = %Changeset{valid?: false}
      expected_errors = %{email: ["has invalid format"], name: ["should be at least 2 character(s)"]}

      response_changeset = Restaurant.changeset(params)

      assert expected_changeset = response_changeset
      assert errors_on(response_changeset) == expected_errors
    end
  end
end
