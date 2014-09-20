defmodule Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Riak

  def conf do
    [host: "localhost", bucket_type: "fantastic-dev"]
  end

end
