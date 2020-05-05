class HomeController < ApplicationController
  def index
  end
  
  def about
    @firstParam = params[:firstParam]
    puts @firstParam
    @array = [1,2,3,5,6]
  end

  def other_index
      redirect_to(:action => 'index')
  end
end
