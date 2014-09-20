defmodule Fantastic.Operators do

  def translate("show", [field]) do
    {:show, field}
  end


  def translate("is not", [field, value]) do
    "-#{field}:#{value}"
  end

  def translate("is", [field, value]) do
    "#{field}:#{value}"
  end


  def translate("within", [field, value]) do
    "-#{field}:#{value}"
  end


  def translate("with", [field, "lesser than", value]) do
    "#{field}:[* TO #{value}]"
  end


  def translate("with", [field, "greater than", value]) do
    "#{field}:[#{value} TO *]"
  end


  def translate("by", [field]) do
    "group=true&group.field=#{field}"
  end

end
