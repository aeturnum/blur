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
    # This function is called when the Application is started, which is not the same as a Bot starting.
    # It is just going to start our Supervisor that will keep the bots running.
    # So if we are expecting the twitch_client_key to be in the options we don't need to check
    # the environment.
    opts = Keyword.put(opts, :client_key_source, Application.get_env(:blur, :client_key_source, :env))
    if Keyword.get(opts, :client_key_source) == :env do
      System.fetch_env!("TWITCH_CLIENT_KEY")
    end

    Supervisor.start_link(Blur.Supervisor, [])
  end
end
