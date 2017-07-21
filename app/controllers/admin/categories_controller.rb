class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
    @category.build_background.build_image unless @category.background
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

  def edit
    @category.build_background.build_image unless @category.background
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = "Cập nhật chủ đề thành công"
    else
      flash[:danger] = "Cập nhật chủ đề thất bại"
    end
    redirect_to admin_categories_path
  end

  def destroy
    if @category.destroy
      flash[:success] = "Xoá thành công"
    else
      flash[:danger] = "Xoá thất bại"
    end
    redirect_to :back
  end

  private
  def category_params
    params.require(:category).permit :title, :description, background_attributes: CategoryBackground::PARAMS_ATTRIBUTES
  end
end
