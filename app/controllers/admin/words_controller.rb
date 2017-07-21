class Admin::WordsController < ApplicationController
  load_and_authorize_resource param_method: :word_params

  def index
    @category = category
    @words = @category.words.paginate page: params[:page], per_page: Settings.number_per_page
  end

  def new
    @word = category.words.build
    @word.build_background.build_image unless @word.background
  end

  def create
    @word.category = category
    if @word.save
      flash[:success] = "Tạo từ khoá thành công"
      redirect_to admin_category_words_path(category)
    else
      flash[:danger] = "Tạo từ khoá thất bại"
      render :new
    end
  end

  def edit
    @word.build_background.build_image unless @word.background
  end

  def update
    if @word.update_attributes word_params
      flash[:success] = "Cập nhật từ khoá thành công"
    else
      flash[:danger] = "Cập nhật từ khoá thất bại"
    end
    redirect_to admin_category_words_path(category)
  end

  def destroy
    if @word.destroy
      flash[:success] = "Xoá thành công"
    else
      flash[:danger] = "Xoá thất bại"
    end
    redirect_to :back
  end

  private
  def word_params
    params.require(:word).permit :id, :content, :meaning, background_attributes: WordBackground::PARAMS_ATTRIBUTES
  end

  def category
    @category ||= Category.find(params[:category_id])
  end
end
