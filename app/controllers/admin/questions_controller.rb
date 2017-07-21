class Admin::QuestionsController < ApplicationController
  load_and_authorize_resource param_method: :question_params

  def index
    @category = category
    @questions = @category.questions.paginate page: params[:page], per_page: Settings.number_per_page
  end

  def new
    @question = category.questions.build
    4.times do
      @question.question_answers.build correct: false
    end
  end

  def create
    if @question.save
      flash[:success] = "Tạo câu hỏi thành công"
      redirect_to :back
    else
      flash[:danger] = "Tạo câu hỏi thất bại"
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update_attributes question_params
      flash[:success] = "Cập nhật câu hỏi thành công"
    else
      flash[:danger] = "Cập nhật câu hỏi thất bại"
    end
    redirect_to admin_category_questions_path(category)
  end

  def destroy
    if @question.destroy
      flash[:success] = "Xoá thành công"
    else
      flash[:danger] = "Xoá thất bại"
    end
    redirect_to :back
  end

  private
  def question_params
    params.require(:question).permit :id, :content, :category_id,
      question_answers_attributes: [:id, :content, :correct]
  end

  def category
    @category ||= Category.find(params[:category_id])
  end
end
