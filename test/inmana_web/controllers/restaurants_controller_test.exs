defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase, async: true

  describe "create/2" do
    test "valid params should create a restaurant", %{conn: conn} do
      params = %{name: "Restaurante do Ze", email: "restaurante@ze.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
        "message" => "Restaurant created.",
        "restaurant" => %{
          "email" => "restaurante@ze.com",
          "id" => _id,
          "name" => "Restaurante do Ze"
        }
      } = response
    end

    test "invalid params should return an error", %{conn: conn} do
      params = %{name: "", email: ""}
      expected_response = %{"message" => %{"email" => ["can't be blank"], "name" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end
