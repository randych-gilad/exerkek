defmodule Exerkek do
  @api_url "https://api.exercism.io/v2"

  defp decode_to_only() do
    with {:ok, %HTTPoison.Response{body: body}} <- HTTPoison.get(@api_url <> "/tracks") do
      body
      |> Jason.decode!()
      |> Map.get("tracks")
    else
      error -> error
    end
  end

  def tracklist() do
    decode_to_only()
    |> IO.inspect()
  end

  def main(_args) do
    tracklist()
  end
end
