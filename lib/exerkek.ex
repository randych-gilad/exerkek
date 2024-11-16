defmodule Exerkek do
  @api_url "https://api.exercism.io/v2"

  def tracklist() do
    with {:ok, %HTTPoison.Response{body: body}} <- HTTPoison.get(@api_url <> "/tracks") do
      body
      |> Jason.decode!()
      |> Map.get("tracks")
      |> Enum.filter(fn map -> map["title"] == "Elixir" end)
      |> IO.inspect()
    else
      error -> error
    end
  end

  def main(_args) do
    tracklist()
  end
end
