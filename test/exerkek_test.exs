defmodule ExerkekTest do
  use ExUnit.Case
  doctest Exerkek

  @elixir_track %{
    "course" => true,
    "icon_url" => "https://assets.exercism.org/tracks/elixir.svg",
    "is_new" => false,
    "last_touched_at" => nil,
    "links" => %{
      "concepts" => "https://exercism.org/tracks/elixir/concepts",
      "exercises" => "https://exercism.org/tracks/elixir/exercises",
      "self" => "https://exercism.org/tracks/elixir"
    },
    "num_concepts" => 57,
    "num_exercises" => 159,
    "slug" => "elixir",
    "tags" => [
      "Compiled",
      "Functional",
      "Linux",
      "macOS",
      "Windows",
      "BEAM (Erlang)",
      "Dynamic",
      "Strong",
      "Backends",
      "Embedded systems",
      "Financial systems",
      "Web development"
    ],
    "title" => "Elixir",
    "web_url" => "https://exercism.org/tracks/elixir"
  }

  test "able to get only Elixir track information" do
    with tracks_json <-
           File.read!("test/tracks.json")
           |> Jason.decode!()
           |> Map.get("tracks")
           |> Enum.filter(fn map -> map["title"] == "Elixir" end) do
      assert hd(tracks_json) == @elixir_track
    end
  end
end
