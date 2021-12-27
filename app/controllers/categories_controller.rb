class CategoriesController < ApplicationController

  layout 'panel_admin'

  before_action :authenticate_user!
  before_action :set_category, only: %i[ show edit update destroy move ]

  def index
    @categories = Category.where(parent_id: nil).order(position: :asc).all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.create(category_params)
    
    if @category.errors.any?
      redirect_to new_category_path
      flash[:error] = @category.errors.first.message
    else
      redirect_to categories_path
      flash[:success] = "La categoría se creó correctamente"
    end    
  end

  def update
    @category.update(category_params)

    if @category.errors.any?
      redirect_to edit_category_path
      flash[:error] = @category.errors.first.full_message
    else
      redirect_to categories_path, notice: "La categoría se actualizó correctamente."  
      flash[:success] = "La categoría se actualizó correctamente"
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
    flash[:success] = "La categoría se eliminó correctamente"
  end

  def move
    @category.insert_at(params[:position].to_i)
    head :ok
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :parent_id)
    end    
end
