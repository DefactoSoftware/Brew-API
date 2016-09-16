defmodule Brew.Router do
  use Brew.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api
    get "/schema.json", Brew.SchemaController, :index

    forward "/", GraphQL.Plug, schema: {Brew.Schema, :schema}
  end
end
