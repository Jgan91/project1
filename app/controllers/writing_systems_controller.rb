class WritingSystemsController < ApplicationController
  before_action :check_if_admin, :only => [:new, :edit]

  def index
    @writing_systems = WritingSystem.order :name
  end

  def new
    @writing_system = WritingSystem.new
  end

  def create
    @writing_system = WritingSystem.new writing_system_params
    if @writing_system.save
      redirect_to @writing_system
    else
      render :new
    end
  end

  def edit
    @writing_system = WritingSystem.find params[:id]
  end

  def update
    writing_system = WritingSystem.find params[:id]
    writing_system.update writing_system_params
    redirect_to writing_systems_path
  end

  def show
    @writing_system = WritingSystem.find params[:id]
  end

  def destroy
    writing_system = WritingSystem.find params[:id]
    writing_system.destroy
    redirect_to writing_systems_path
  end

  private
  def writing_system_params
    params.require(:writing_system).permit(:name, :time_period, :sample, :child_systems)
  end
end
