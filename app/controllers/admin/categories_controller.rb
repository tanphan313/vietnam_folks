class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Tạo chủ đề thành công"
      redirect_to :back
    else
      render :new
    end
  end

  def update

  end

  private
  def category_params
    params.require(:category).permit :title, :description
  end
end
