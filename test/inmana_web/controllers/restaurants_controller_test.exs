defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase

  describe "create/2" do
    test "when all params are valid, creates user", %{conn: conn} do
      params = %{name: "Siri cascudo", email: "siri@cascudo.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "siri@cascudo.com",
                 "id" => _id,
                 "name" => "Siri cascudo"
               }
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{name: "Siri cascudo"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == %{"message" => %{"email" => ["can't be blank"]}}
    end
  end
end
