defmodule ApiRouter do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  post "/events" do
    {:ok, body, conn} = read_body(conn)
    data = Poison.decode!(body)

    parsed_data = Fantastic.DataParser.parse(data)
    {:ok, key} = Fantastic.Data.insert parsed_data
    send_resp conn, 200, Poison.encode!(%{key: key})
  end

  forward "/", to: NoRouteFoundRouter
end
