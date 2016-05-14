class Api::GroupsController < ApplicationController
  def index
    @name = params[:name]
    @groups = Group.filter_by_name @name
    respond_to do |format|
      format.html { render partial: "index", locals: {groups: @groups}  }
      format.js {}
    end
  end

  def my_owner_group
  	name = params[:name]
    @groups = Group.filter_by_name name
    respond_to do |format|
      format.html { render partial: "my_owner_group", locals: {groups: @groups}  }
      format.js {}
    end
  end
end
