class LanguagesController < ApplicationController
  def index
    @languages = Language.all
  end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new language_params
    if @language.save
      redirect_to @language
    else
      render :new
    end
  end

  def edit
    @language = Language.find params[:id]
  end

  def update
    language = Language.find params[:id]
    language.update language_params
    redirect_to language
  end

  def show
    @language = Language.find params[:id]
  end

  def destroy
    language = Language.find params[:id]
    language.destroy
    redirect_to languages_path
  end

  private
  def language_params
    params.require(:language).permit(:name, :region, :num_native_speaker)
  end
end
