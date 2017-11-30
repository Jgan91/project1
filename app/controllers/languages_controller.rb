class LanguagesController < ApplicationController
  before_action :check_if_admin, :only => [:new, :edit]

  def index
    @languages = Language.order :name
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
    @family_tree = []

    ancestor = @language.language_family
    until ancestor.nil?
      @family_tree << ancestor
      ancestor = ancestor.proto_language
    end

    @family_tree_names = @family_tree.map { |f| f.name }

    @nested_list = make_nested_list( @family_tree_names, '', @family_tree_names.length ) unless @family_tree_names.empty?
  end

  def destroy
    language = Language.find params[:id]
    language.destroy
    redirect_to languages_path
  end

  def make_nested_list( array, str, length )
    str += "<ul>"
    str += "<li>" + array[length - 1] + "</li>"
    str = make_nested_list( array, str, length - 1 ) unless length == 1
    str += "</ul>"
  end

  private
  def language_params
    params.require(:language).permit(:name, :region, :num_native_speaker)
  end
end
