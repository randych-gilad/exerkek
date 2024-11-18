defmodule Exerkek do
  @moduledoc """
  Exerkek
  """
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
    case parseable do
      {:ok, %HTTPoison.Response{body: body}} -> body |> filter_elixir_track()
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
