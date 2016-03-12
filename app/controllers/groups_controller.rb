class GroupsController < ApplicationController
  before_action :load_group, only: [:delete, :edit, :show, :update, :destroy]

  def index
    @my_groups = current_user.groups.paginate page: params[:page], per_page: 10
  end

  def show

  end

  def new
    @group = Group.new
  end

  def create
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

  end

  def update
    if @group.update_attributes group_params
      flash[:success] = t "flash.update_success"
      redirect_to root_url
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
    params.require(:group).permit :name, :description
  end
end
