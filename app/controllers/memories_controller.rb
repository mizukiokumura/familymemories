class MemoriesController < ApplicationController
  before_action :authenticate_user!,   only: [:edit, :new, :destroy, :update]
  before_action :set_memory,           only: [:show, :edit, :update, :destroy]
  def index
    @memories = Memory.includes(:user).order(id: "DESC").limit(3)
  end

  def new
    @memory = Memory.new
  end

  def show
    @comment = Comment.new
    @comments = @memory.comments.includes(:user).order(id: "DESC")
  end

  def create
    @memory = Memory.new(memory_params)
    if @memory.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @memory.update(memory_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @memory.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def memory_params
    params.require(:memory).permit(:title, :memory, :image, :diary).merge(user_id: current_user.id)
  end

  def set_memory
    @memory = Memory.find(params[:id])
  end
end
