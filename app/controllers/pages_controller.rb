class PagesController < ApplicationController
  def home
    countries = Country.all
    @countries_json = countries.to_json
  end
end
