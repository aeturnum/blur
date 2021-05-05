defmodule Blur.App do
  @moduledoc """
  Blur Application.

  Start ExIRC Client

  * Listen for:
  - Connections
  - Login
  - Messages
  """

  use Application

  @impl true
  @spec start(atom, list) :: {:error, atom} | {:ok, pid()}
  def start(_type, opts) do
    # validate environmental variables
    if not Keyword.has_key?(opts, :twitch_client_key) do
      System.fetch_env!("TWITCH_CLIENT_KEY")
    end

    Supervisor.start_link(Blur.Supervisor, [])
  end
end
