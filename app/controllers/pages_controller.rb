class PagesController < ApplicationController

  layout 'admin'

  def edit
   @page = Page.find(params[:id])  
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(conv_params)
      flash[:notice] = "Data updated successfully!"
      redirect_to(page_path(@page))
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end
  
  def destroy 
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page \"#{@page.name}\" has been destroyed successfully!" 
    redirect_to(pages_path)
  end

  def index
    @pages = Page.sorted
  end

  def new
    @page = Page.new(:name => 'default')
  end

  def create 
    @page = Page.new(conv_params)

    if @page.save
      flash[:notice] = "Record #{@page.name} has been created successfully!"
      redirect_to(pages_path)
    else
      render('new')
    end
  end

  def show
    @page = Page.find(params[:id])
  end

private
  def conv_params
    params.require(:page).permit(:name, :position, :permalink, :visible, :subject_id)
  end
end
