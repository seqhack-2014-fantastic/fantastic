defmodule Fantastic.DataParser do

  @int_suffix "_i"
  @float_suffix "_f"
  @string_suffix "_s"
  @text_suffix "_t"


  def parse(data) when is_map(data) do
    parse Map.to_list(data), %{}
  end


  def parse([], parsed_data) do
    parsed_data
  end


  def parse([ {key, value} | rest], parsed_data) do
    parsed_data = add_value_to_parsed_data(parsed_data, key, value)
    parse(rest, parsed_data)
  end


  def add_value_to_parsed_data(parsed_data, name, value) when is_integer(value) do
    Map.put parsed_data, "#{name}#{@int_suffix}", value
  end


  def add_value_to_parsed_data(parsed_data, name, value) when is_float(value) do
    Map.put parsed_data, "#{name}#{@float_suffix}", value
  end


  def add_value_to_parsed_data(parsed_data, name, value) when is_binary(value) do
    Map.put parsed_data, "#{name}#{@text_suffix}", value
  end
end
