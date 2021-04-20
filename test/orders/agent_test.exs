defmodule Exlivery.Orders.AgentTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrdersAgent

  describe "save/1" do
    test "saves the order" do
      order = build(:order)

      OrdersAgent.start_link()

      assert {:ok, _uuid} = OrdersAgent.save(order)
    end
  end

  describe "get/1" do
    setup do
      OrdersAgent.start_link()
      :ok
    end

    test "when the order is found, returns the user" do
      order = build(:order)

      {:ok, uuid} =
        order
        |> OrdersAgent.save()

      response = OrdersAgent.get(uuid)

      expected_response = {:ok, order}

      assert response == expected_response
    end

    test "when the order is not found, returns an error" do
      response = OrdersAgent.get("invalid_uuid")

      expected_response = {:error, "Order not found"}

      assert response == expected_response
    end
  end
end
