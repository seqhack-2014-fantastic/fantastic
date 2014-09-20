defmodule AppRouter do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch


  forward "/api", to: ApiRouter

  get "/" do
    send_resp(conn, 200, "hello world")
  end

  forward "/", to: NoRouteFoundRouter
end
