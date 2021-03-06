defmodule SquareUpTest do
  use ExUnit.Case
  doctest SquareUp

  @client %SquareUp.Client{
    access_token: "EAAAEKcOaT3HmjOkWqtYZIzkGEfKO_ZwG3Lr3a4sagLJ22mND8SSDB5UCabrp9Ai",
    application_id: "sandbox-sq0idb-shmTb_qGngXnXVBVCTyc7A",
    base_path: "https://connect.squareupsandbox.com"
  }

  test "rejects an invalid request" do
    assert {:error, [%{input: "foo", path: [:amount_money, :amount], spec: "is_integer()"} | _]} =
             SquareUp.V2.Payment.create(@client, %{}, %{amount_money: %{amount: "foo"}})
  end

  test "create and retrieve a customer" do
    {:ok, %{customer: %{id: customer_id}}} =
      SquareUp.V2.Customer.create(@client, %{}, %{
        given_name: "Derek",
        family_name: "Kraan"
      })

    {:ok, %{customer: %{given_name: "Derek", family_name: "Kraan"}}} =
      SquareUp.V2.Customer.retrieve(@client, %{customer_id: customer_id})
  end

  test "list catalogs" do
    {:ok, _catalogs} = SquareUp.V2.Catalog.list(@client)
  end
end
