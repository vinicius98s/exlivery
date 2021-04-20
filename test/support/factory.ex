defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Vinicius",
      email: "vinicius@sales.com",
      cpf: "12345678900",
      age: 22,
      address: "Rua bandeirantes"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza",
      category: :pizza,
      quantity: 1,
      unity_price: Decimal.new("35.50")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua bandeirantes",
      items: [
        %Item{
          category: :pizza,
          description: "Pizza",
          quantity: 1,
          unity_price: Decimal.new("35.50")
        },
        %Item{
          category: :japonesa,
          description: "Temaki",
          quantity: 1,
          unity_price: Decimal.new("25.00")
        }
      ],
      total_price: Decimal.new("60.50"),
      user_cpf: "12345678900"
    }
  end
end
