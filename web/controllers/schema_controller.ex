defmodule Brew.SchemaController do
  use Brew.Web, :controller

  def index(conn, _params) do
    json conn, introspection
  end

  defp introspection do
    schema_module = Application.fetch_env!(:graphql_relay, :schema_module)
    {_, data} = GraphQL.execute(apply(schema_module, :schema, []), GraphQL.Type.Introspection.query)
    data
  end
end
