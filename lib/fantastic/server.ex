defmodule Fantastic.Server do
  def start_link do
    Plug.Adapters.Cowboy.http AppRouter, []
  end
end
