defmodule ExerkekTest do
  use ExUnit.Case
  doctest Exerkek

  @elixir_track %{
    course: true,
    icon_url: "https://assets.exercism.org/tracks/elixir.svg",
    is_new: false,
    last_touched_at: nil,
    links: %{
      self: "https://exercism.org/tracks/elixir",
      exercises: "https://exercism.org/tracks/elixir/exercises",
      concepts: "https://exercism.org/tracks/elixir/concepts"
    },
    num_concepts: 57,
    num_exercises: 159,
    slug: "elixir",
    tags: [
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
    title: "Elixir",
    web_url: "https://exercism.org/tracks/elixir"
  }

  test "able to get only Elixir track information" do
    with tracks_json <- Exerkek.decode_to_only(File.read!("test/tracks.json")) do
      assert hd(tracks_json) == @elixir_track
    end
  end
end
