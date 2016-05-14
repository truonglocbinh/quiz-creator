class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_onwer, except: [:index, :new]
  before_action :load_group, only: [:delete, :edit, :show, :update, :destroy]
  add_breadcrumb "All Groups", :groups_path
  def index
    @my_groups = current_user.groups.paginate page: params[:page], per_page: 10
  end

  def show
    add_breadcrumb "#{@group.name}", @group
    @exam_users = ExamUser.where group_id: @group.id
  end

  def new
    add_breadcrumb "New"
    @group = Group.new
  end

  def create
    add_breadcrumb "Create"
    @group = Group.new group_params
    @group.owner = current_user
    if @group.save
      flash[:success] = t "flash.create_success"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    add_breadcrumb "Edit"
  end

  def update
    if @group.update_attributes group_params
      flash[:success] = t "flash.update_success"
      redirect_to :back
    else
      render :edit
    end
  end

  def destroy
    if @group.destroy
      flash[:success] = t "flash.delete_success"
    else
      flash[:danger] = t "flash.delete_failed"
    end
    redirect_to :back
  end

  private
  def load_group
    @group = Group.find params[:id]
  end

  def group_params
    params.require(:group).permit Group::ATTRIBUTES_PARAMS
  end

  def authenticate_onwer
    @group = Group.find params[:id]
    unless @group.owner == current_user
      flash[:danger] = "Sorry you can access this resources"
      redirect_to root_url
    end
  end
end
