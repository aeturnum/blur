defmodule Blur.Parser.TwitchTest do
  use ExUnit.Case

  doctest Blur.Parser.Twitch
  alias Blur.Parser.Twitch

  describe "parse twitch tags into parts" do
    test "demo data" do
      assert [["x", "y"], ["a", "b"]] === Twitch.parse("x=y;a=b")
    end

    test "display-name" do
      assert [["display-name", "rockerBOO"]] === Twitch.parse("display-name=rockerBOO")
    end
  end
end
