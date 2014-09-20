defmodule Fantastic.Data do

  def bucket do
   {"fantastic-dev", "dataset"}
  end


  def insert(data) do
    insert_fn = fn(pid)->
      encoded_data = Poison.encode! data
      object = :riakc_obj.new(bucket, :undefined, encoded_data, "application/json")

      case :riakc_pb_socket.put(pid, object) do
        {:ok, return_obj} ->
          key = get_key_from_obj(return_obj)
          { :ok, key }
        {:error, error} ->
          { :error, error }
      end
    end

    Repo.run_custom(insert_fn)
  end


  defp get_key_from_obj(obj) do
    {:riakc_obj, _bucket_name, key, _, _, _, _} = obj
    key
  end


  defp encode_data(data, "application/json") do
    {:ok, json_string} = Poison.encode data
    json_string
  end
end
