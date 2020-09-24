defmodule SquareUp.V2.Disputes do
  import Norm
  import SquareUp.Client, only: [call: 2]

  def list(client, params) do
    norm_spec =
      schema(%{
        "cursor" => spec(is_binary()),
        "states" => spec(is_binary()),
        "location_id" => spec(is_binary())
      })

    call(client, %{
      method: :get,
      params: params,
      spec: norm_spec,
      path: "/v2/disputes"
    })
  end
end