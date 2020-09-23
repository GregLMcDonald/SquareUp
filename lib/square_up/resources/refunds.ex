defmodule SquareUp.Refunds do
  import SquareUp.Client, only: [call: 2]

  def list(client, params) do
    call(client, %{
      method: :get,
      params: params,
      path: "/v1/#{Map.get(params, "location_id")}/refunds"
    })
  end
end