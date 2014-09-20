defmodule Fantastic.QueryParser do

  def parse(query_str) when is_binary(query_str) do
    String.split(" ")
    |> parse
  end


  def parse(query_parts) when is_list(query_parts) do
  end


  def operator("show", [field]) do
    # show just selects the data
  end


  def operator("is not", [field, value]) do
    "-#{field}:#{value}"
  end

  def operator("is", [field, value]) do
    "#{field}:#{value}"
  end


  def operator("within", [field, value]) do
    "-#{field}:#{value}"
  end


  def operator("with", [field, "lesser than", value]) do
  end


  def operator("with", [field, "greater than", value]) do
  end


  def operator("count", field) do
    # count
  end


  def operator("by" field) do
    # group by field
    # count repositories by language
  end


end



# {
#   x: 1,
#   y: 2,
#   object: "sold"
# }
