class LanguageFamiliesController < ApplicationController
  def index
    @language_families = LanguageFamily.all
  end

  def new
    @language_family = LanguageFamily.new
  end

  def create
    @language_family = LanguageFamily.new country_params
    if @language_family.save
      redirect_to @language_family
    else
      render :new
    end
  end

  def edit
    @language_family = LanguageFamily.find params[:id]
  end

  def update
    language_family = LanguageFamily.find params[:id]
    language_family.update country_params
    redirect_to language_families_path
  end

  def show
    @language_family = LanguageFamily.find params[:id]
  end

  def destroy
    language_family = LanguageFamily.find params[:id]
    language_family.destroy
    redirect_to language_families_path
  end
end
