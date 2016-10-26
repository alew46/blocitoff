class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create
    @list.title = params[:list][:title]

    if @list.save
      flash[:notice] = "Your list has been created! Now add some to-do's."
      redirect_to @list
    else
      flash.now[:alert] = "There was a problem creating your list. Please try again or contact support."
      redirect_to :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.title = params[:list][:title]

    if @list.save
      flash[:notice] = "Your list has been renamed!"
      redirect_to @list
    else
      flash.now[:alert] = "There was a problem renaming your list. Please try again or contact support."
      redirect_to :new
    end
  end

  def destroy
    @list = List.find(params[:id])

     if @list.destroy
       flash[:notice] = "Your To-Do list\"#{@list.title}\" was deleted successfully."
       redirect_to lists_path
     else
       flash.now[:alert] = "There was an error deleting the list. Please try again or contact support."
       render :show
     end
  end
end
