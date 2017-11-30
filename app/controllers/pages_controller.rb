class PagesController < ApplicationController
  def home
    @countries = Country.nice_json
  end
end
