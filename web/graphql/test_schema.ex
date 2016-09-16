defmodule Brew.Schema do
  alias GraphQL.Type.{ObjectType, List, NonNull, ID, String, Int, Boolean}

  def schema do
    %GraphQL.Schema{query: query}
  end

  defmodule WorkTime do
    def type do
      %ObjectType {
        name: "WorkTime",
        description: "",
        fields: %{
          id: %{type: %String{}, description: "WorkTime ID"},
          start_time: %{ type: %String{}, description: "THe time that the user starts working" },
          minutes: %{ type: %Int{}, description: "The amount of time that a user wants to work" }
        }
      }
    end
  end

  def query do
    %ObjectType{
      name: "Query",
      description: "All the queries available to the client",
      fields: %{
        work_time: %{
          type: %List{ofType: WorkTime},
          description: "A time set to work for the user",
          args: %{
            id: %{type: %ID{}, description: "ID of WorkTime"},
          },
          resolve: fn
            _source, %{id: id}, _info -> [Brew.Data.get_work_time(id)]
            _source, _args, _info     -> for id <- 1..2, do: Brew.Data.get_work_time(id)
          end
        }
      }
    }
  end
end

defmodule Brew.Data do
  def get_work_time(id) do
    first
    # Map.get(list_of_minutes, String.to_atom(id), nil)
  end

  def list_of_minutes do
    %{"1": first, "2": second}
  end

  def first do
    %{id: "1",
     start_time: "yes",
     minutes: 25,
    }
  end

  def second do
    %{id: "1",
     start_time: "yes",
     minutes: 25,
    }
  end
end
