defmodule NoRouteFoundRouter do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  match _ do
    send_resp conn, 200, "Oolaa ~! no gold found"
  end
end
