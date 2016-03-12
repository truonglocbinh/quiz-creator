class Admin::CategoriesController < ApplicationController
  before_action :load_category, only: [:edit, :update,:show, :destroy]

  def index
    @categories = Category.all.paginate page: params[:page], per_page: 10
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Successfully created..."
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @category.update_attributes category_params
      flash[:success] = "Successfully created..."
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = "Successfully created..."
    else
      flash[:danger] = "failed created..."
    end
    redirect_to admin_categories_path
  end

  private
  def load_category
    @category = Category.find params[:id]
  end

  def category_params
    params.require(:category).permit :title
  end
end
