# defmodule Exerkek.Application do
#   # See https://hexdocs.pm/elixir/Application.html
#   # for more information on OTP Applications
#   @moduledoc false

#   use Application

#   @impl true
#   def start(_type, _args) do
#     children = [
#       {Task, fn -> Exerkek.tracklist() end}
#     ]

#     # See https://hexdocs.pm/elixir/Supervisor.html
#     # for other strategies and supported options
#     opts = [strategy: :one_for_one, name: Exerkek.Supervisor]
#     Supervisor.start_link(children, opts)
#   end
# end

defmodule Exerkek.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    task =
      Task.async(fn ->
        Exerkek.tracklist()
      end)

    Task.await(task)
    {:ok, self()}
  end
end
