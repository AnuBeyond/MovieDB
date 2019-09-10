class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show

  end

  def new
    @roots = Category.where(parent_id: nil).order(:name)
    @category = Category.new
  end

  def edit
    @roots = Category.where(parent_id: nil).order(:name)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      redirect_to admin_categories_path, notice: 'Category was not created.'
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_path, notice: 'Category was successfully destroyed.'
    else
      redirect_to categories_path, notice: 'Category was not destroyed.'
    end
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end
