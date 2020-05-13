class SubjectsController < ApplicationController
  
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    # here we can specify default values for fields
    @subject = Subject.new(:name => 'default')
  end

  def create

    @subject = Subject.new(subject_params)
    
    if @subject.save
      flash[:notice] = "Subject #{@subject.name} was created successfully"
      redirect_to(subjects_path)
    else
      #it just renders new form!
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject #{@subject.name} was updated successfully"
      redirect_to(subject_path(@subject))
    else
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject #{@subject.name} was destroyed successfully"
    redirect_to(subjects_path)
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

end
