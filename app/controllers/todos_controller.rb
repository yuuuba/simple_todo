class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def show
  end

  def create
    @todo = Todo.new(todo_params) #なぜnewの記載？

    if @todo.save
      redirect_to todos_path
    end
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to todos_path
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

private
  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:do)
  end
end
