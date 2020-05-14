class SectionsController < ApplicationController

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Save was successful"
      redirect_to(sections_path)
    else
      render('new')
    end
  end
  

  def update
    @section = Section.find(params[:id])

    if @section.update_attributes(section_params)
      flash[:notice] = "Update successful"
      redirect_to(section_path(@section))
    else
      render('edit')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section was successfully destroyed"
    redirect_to(sections_path)
  end

  def show
    @section = Section.find(params[:id])
  end

  def index
    @sections = Section.all
  end

private
  def section_params
    params.require(:section).permit(:name, :position, :content_type, :page_id, :visible)
  end
  
end
