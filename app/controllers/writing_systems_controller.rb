class WritingSystemsController < ApplicationController
  def index
    @writing_systems = WritingSystem.all
  end

  def new
    @writing_system = WritingSystem.new
  end

  def create
    @writing_system = WritingSystem.new country_params
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
    writing_system.update country_params
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
