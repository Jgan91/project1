class CountriesController < ApplicationController
  before_action :check_if_admin, :only => [:new, :edit]

  def index
    @countries = Country.order :name
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new country_params
    if @country.save
      redirect_to @country
    else
      render :new
    end
  end

  def edit
    @country = Country.find params[:id]
  end

  def update
    country = Country.find params[:id]
    country.update country_params
    redirect_to countries_path
  end

  def show
    @country = Country.find params[:id]
    @countries = Country.nice_json
  end

  def destroy
    country = Country.find params[:id]
    country.destroy
    redirect_to countries_path
  end

  private
  def country_params
    params.require(:country).permit(:name)
  end
end
