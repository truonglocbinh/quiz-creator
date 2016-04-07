class Api::CategoriesController < ApplicationController
  def index
    @name = params[:name]
    @categories = Category.search_by_title @name
    respond_to do |format|
      format.html {render partial: "category", locals: {categories: @categories}}
      format.js {}
    end
  end
end
