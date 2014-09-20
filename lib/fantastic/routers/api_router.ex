defmodule ApiRouter do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  post "/events" do
    send_resp(conn, 200, "events")
  end

  forward "/", to: NoRouteFoundRouter
end
