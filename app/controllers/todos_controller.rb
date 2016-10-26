class TodosController < ApplicationController
  #before_action :require_sign_in
  #before_action :authorize_user, only: [:destroy]


  def create
    @list = List.find(params[:list_id])
    @todo = @list.todos.new(todo_params)
    @todo.list = @list

    if @todo.save
       flash[:notice] = "To-do was added successfully."
       redirect_to @list
     else
       flash.now[:alert] = "There was an error adding that to-do. Please try again or contact support."
       render :new
     end
  end

  def edit
    @list = List.find(params[:list_id])
    @todo = @list.todos.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @todo = @list.todos.find(params[:id])
    @todo.title = params[:todo][:title]

    if @todo.save
      flash[:notice] = "This todo has been updated!"
      redirect_to @list
    else
      flash.now[:alert] = "There was a updating this todo. Please try again or contact support."
      redirect_to @list
    end
  end

  def destroy
    @list = List.find(params[:list])
    @todo = @list.todos.find(params[:id])

    if @todo.destroy
      flash[:notice] = "Todo deleted successfully."
      redirect_to @list
    else
      flash[:alert] = "There was a problem deleting that to-do. Please try again or contact support."
      redirect_to @list
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end
