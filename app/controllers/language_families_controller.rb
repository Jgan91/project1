class LanguageFamiliesController < ApplicationController
  before_action :check_if_admin, :only => [:new, :edit]

  def index
    @language_families = LanguageFamily.order :name
  end

  def new
    @language_family = LanguageFamily.new
  end

  def create
    @language_family = LanguageFamily.new language_family_params
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
    language_family.update language_family_params
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

  private
  def language_family_params
    params.require(:language_family).permit(:name, :geographic_distribution, :proto_language)
  end
end
