defmodule SquareUp.V2.BankAccounts do
  import Norm
  import SquareUp.Client, only: [call: 2]

  @spec list(SquareUp.Client.t(), %{}, %{}, %{
          optional(:cursor) => binary(),
          optional(:limit) => integer(),
          optional(:location_id) => binary()
        }) :: SquareUp.Client.response(SquareUp.TypeSpecs.list_bank_accounts_response())
  def list(client, path_params \\ %{}, params \\ %{}, query_params \\ %{}) do
    path_params_spec = schema(%{})
    params_spec = schema(%{})

    query_params_spec =
      schema(%{
        cursor: spec(is_binary()),
        limit: spec(is_integer()),
        location_id: spec(is_binary())
      })

    response_spec = {:delegate, &SquareUp.ResponseSchema.list_bank_accounts_response/0}

    call(client, %{
      method: :get,
      path_params: path_params,
      params: params,
      query_params: query_params,
      path_params_spec: path_params_spec,
      params_spec: params_spec,
      query_params_spec: query_params_spec,
      response_spec: response_spec,
      path: "/v2/bank-accounts"
    })
  end
end
