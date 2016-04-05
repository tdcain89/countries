defmodule CountriesTest do
  use ExUnit.Case, async: true

  test "filter countries by alpha2" do
    country = Countries.filter_by(:alpha2, "DE")
    assert Enum.count(country) == 1
  end
  
  test "filter many countries by region" do
    countries = Countries.filter_by(:region, "Europe")
    assert Enum.count(countries) == 51
  end
  
  test "return empty list when there are no results" do
    countries = Countries.filter_by(:region, "Azeroth")
    assert countries == []
  end

  test "get all countries" do 
    countries = Countries.all
    assert Enum.count(countries) == 250
  end
  
  test "conversion from alpha2 to alpha3" do
    alpha3 = Countries.alpha2_to_alpha3("DE")
    assert alpha3 == "DEU"
  end
  
  test "conversion from alpha2 to alpha3" do
    alpha2 = Countries.alpha3_to_alpha2("DEU")
    assert alpha2 == "DE"
  end
end
