class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :set_code, only: %i[ create ]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.create(category_params)
    @category.update(code: @code)
    
    if @category.errors.any?
      redirect_to new_category_path, notice: @category.errors.first.full_message
    else
      redirect_to categories_path, notice: "La categoría se creó correctamente."  
    end    
  end

  def update
    @category.update(category_params)

    if @category.errors.any?
      redirect_to edit_category_path, errors: @category.errors.first.full_message
    else
      redirect_to categories_path, notice: "La categoría se actualizó correctamente."  
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: "La categoría se eliminó correctamente." }
      format.json { head :no_content }
    end
  end

  private
    def set_code
      if Category.all.count == 0
        @code = 1
      else
        last_code = Category.last.code
        @code = last_code.to_i + 1
      end
    end

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :position)
    end    
end
