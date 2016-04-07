class MyClassController < ApplicationController
  def all_class
    @my_classes = current_user.joined_groups
  end
end
