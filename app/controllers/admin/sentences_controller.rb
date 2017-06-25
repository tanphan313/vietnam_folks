class Admin::SentencesController < ApplicationController
  load_and_authorize_resource param_method: :sentence_params

  def index
    @category = category
    @sentences = @category.sentences.paginate page: params[:page], per_page: Settings.number_per_page
  end

  def new
    @sentence = category.sentences.build
  end

  def create
    @sentence.category = category
    if @sentence.save
      flash[:success] = "Tạo câu thành công"
      redirect_to admin_category_sentences_path(category)
    else
      flash[:danger] = "Tạo câu thất bại"
      render :new
    end
  end

  def edit
  end

  def update
    if @sentence.update_attributes sentence_params
      flash[:success] = "Cập nhật câu thành công"
    else
      flash[:danger] = "Cập nhật câu thất bại"
    end
    redirect_to admin_category_sentences_path(category)
  end

  def destroy
    if @sentence.destroy
      flash[:success] = "Xoá thành công"
    else
      flash[:danger] = "Xoá thất bại"
    end
    redirect_to :back
  end

  private
  def sentence_params
    params.require(:sentence).permit :id, :content, :meaning, :description
  end

  def category
    @category ||= Category.find(params[:category_id])
  end
end
