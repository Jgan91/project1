class PagesController < ApplicationController
  def home
    countries = Country.all
    @countries_json = countries.to_json
    @countries = Country.nice_json
  end
end
