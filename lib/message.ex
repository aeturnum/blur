defmodule Blur.Message do
  @moduledoc """

  """

  defstruct bot: nil,
            ref: nil,
            mod: false,
            channel: "",
            roomid: "",
            type: "",
            system: "",
            user: nil,
            tags: %{},
            text: ""

  @type t :: %{
    bot: pid(),
    ref: reference(), # ???
    mod: atom(),
    channel: binary(),
    roomid: binary(),
    type: binary(),
    system: binary(),
    user: Blur.Twitch.User.t(),
    tags: map(),
    text: binary()
  }
end
