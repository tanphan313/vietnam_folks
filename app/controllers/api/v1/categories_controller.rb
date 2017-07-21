class Api::V1::CategoriesController < Api::V1::ApiController
  before_action :set_api_format, :require_app_api_key

  def index
    categories = Category.all
    if categories.present?
      api_response(build_list_categories(categories), 200)
    else
      api_response({ errors: { message: 'not found record' } }, 404)
    end
  end

  def show
    if category = Category.find_by(id: params[:id])
      api_response(build_category_detail(category), 200)
    else
      api_response({ errors: { message: 'not found record' } }, 404)
    end
  end

  private
  def build_list_categories categories
    categories.map do |category|
      {
        id: category.id,
        title: category.title,
        description: category.description,
        background_url: category.background_picture_url
      }
    end
  end

  def build_category_detail category
    {
      words: category.words.map do |word|
        {
          id: word.id,
          content: word.content,
          meaning: word.meaning,
          picture_url: word.background_picture_url
        }
      end,
      sentences: category.sentences.map do |sentence|
        {
          id: sentence.id,
          content: sentence.content,
          meaning: sentence.meaning,
          description: sentence.description
        }
      end,
      questions: category.questions.random_questions.map do |question|
        {
          id: question.id,
          content: question.content,
          question_answers: question.question_answers.map do |question_answer|
            {
              id: question_answer.id,
              content: question_answer.content,
              correct: question_answer.correct
            }
          end
        }
      end
    }
  end
end
