class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?
  before_action :load_category, only: [:edit, :update,:show, :destroy]
  add_breadcrumb "All Category", :admin_categories_path
  def index
    @categories = Category.all.paginate page: params[:page], per_page: 10
  end

  def new
    add_breadcrumb "New"
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
    add_breadcrumb "#{@category.title}", [:admin, @category]
    add_breadcrumb "edit"
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
    params.require(:category).permit Category::ATTRIBUTES_PARAMS
  end

  def is_admin?
    unless current_user.admin?
      flash[:danger] = "You can not access it !"
      redirect_to root_url
    end
  end
end
