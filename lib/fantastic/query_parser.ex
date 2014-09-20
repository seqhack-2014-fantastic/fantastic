defmodule Fantastic.QueryParser do

  @op_terms ["show", "is", "is not", "within", "by", "export"]


  def parse(str) when is_binary(str) do
    String.split(str, " ")
    |> partition_query_parts()
    |> parse({[], []})
  end


  def parse([], query) do
    query
  end


  def parse([part | parts], {non_query_parts, query_parts}) do
    [operator_term | operator_args] = part

    query = case operator(String.strip(operator_term), operator_args) do
      non_query_part when is_tuple(non_query_part) ->
        {non_query_parts ++ [non_query_part], query_parts}
      query_part ->
        {non_query_parts, query_parts ++ [query_part]}
    end
    parse(query_parts, query)
  end


  def operator("show", [field]) do
    {:show, field}
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
    "#{field}:[* TO #{value}]"
  end


  def operator("with", [field, "greater than", value]) do
    "#{field}:[#{value} TO *]"
  end


  def operator("by", [field]) do
    "group=true&group.field=#{field}"
  end


  def partition_query_parts(str_parts) do
    Enum.reduce str_parts, [], fn(part, query_parts)->
      cond do
        Enum.empty?(query_parts) || Enum.member?(@op_terms, part) ->
          query_parts ++ [[part]]
        true ->
          query_parts
          |> List.replace_at length(query_parts) - 1, List.last(query_parts) ++ [part]
      end
    end
  end


end



# {
#   x: 1,
#   y: 2,
#   object: "sold"
# }
