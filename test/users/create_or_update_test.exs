defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link()

      params = %{
        name: "Vinicius",
        address: "Rua bandeirantes",
        email: "vinicius@sales.com",
        cpf: "12345678900",
        age: 22
      }

      {:ok, params: params}
    end

    test "when all params are valid, saves the user", %{params: params} do
      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error", %{params: params} do
      response = CreateOrUpdate.call(%{params | age: 17})

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
