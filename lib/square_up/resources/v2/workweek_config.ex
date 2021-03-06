defmodule SquareUp.V2.WorkweekConfig do
  import Norm
  import SquareUp.Client, only: [call: 2]

  @spec update(
          SquareUp.Client.t(),
          %{required(:id) => binary()},
          SquareUp.TypeSpecs.update_workweek_config_request(),
          %{}
        ) :: SquareUp.Client.response(SquareUp.TypeSpecs.update_workweek_config_response())
  def update(client, path_params \\ %{}, params \\ %{}, query_params \\ %{}) do
    path_params_spec = schema(%{id: spec(is_binary())})
    params_spec = Norm.Delegate.delegate(&SquareUp.NormSchema.update_workweek_config_request/0)
    query_params_spec = schema(%{})

    response_spec = {:delegate, &SquareUp.ResponseSchema.update_workweek_config_response/0}

    call(client, %{
      method: :put,
      path_params: path_params,
      params: params,
      query_params: query_params,
      path_params_spec: path_params_spec,
      params_spec: params_spec,
      query_params_spec: query_params_spec,
      response_spec: response_spec,
      path: "/v2/labor/workweek-configs/{id}"
    })
  end
end
