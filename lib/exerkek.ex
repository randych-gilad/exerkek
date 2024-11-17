defmodule Exerkek do
  @api_url "https://api.exercism.io/v2"

  defp filter_elixir_track(parseable) do
    parseable
    |> Jason.decode!(keys: :atoms)
    |> Map.get(:tracks)
    |> Enum.filter(fn map -> map.title == "Elixir" end)
  end

  def decode_to_only(parseable) when is_binary(parseable) do
    parseable
    |> filter_elixir_track()
  end

  def decode_to_only(parseable) do
    with {:ok, %HTTPoison.Response{body: body}} <- parseable do
      body
      |> filter_elixir_track()
    else
      error -> {:error, error}
    end
  end

  def tracklist() do
    decode_to_only(HTTPoison.get(@api_url <> "/tracks"))
    # |> IO.inspect()
  end

  def main(_args) do
    tracklist()
  end
end
