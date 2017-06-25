class Api::V1::MFolksController < Api::V1::ApiController
  before_action :set_api_format, :require_app_api_key

  def index
    if params[:q]
      folk_translations = FolkTranslation.by_language(language_id).ransack(params[:q]).result.limit(10)
      api_response(build_list_search_result(folk_translations), 200)
    else
      api_response(build_list_folk_translations, 200)
    end
  end

  def show
    if @folk = M::Folk.find_by(id: params[:id])
      folk_translation = @folk.folk_translations.by_language(language_id).first
      api_response(build_folk_translation_data(folk_translation), 200)
    else
      api_response({ errors: { message: 'not found record' } }, 404)
    end
  end

  private
  def build_list_search_result folk_translations
    folk_translations.map do |folk_translation|
      {
        id: folk_translation.folk.id,
        background_url: folk_translation.folk.background_picture_url,
        name: folk_translation.name
      }
    end
  end

  def build_list_folk_translations
    {
      top: M::Folk.top_land.map do |m_folk|
        { id: m_folk.id,
          background_url: m_folk.background_picture_url
        }
      end,
      groups: FolkCategoryTranslation.by_language(language_id).map do |folk_category_translation|
        {
          category_name: folk_category_translation.name,
          folks: folk_category_translation.folk_category.folks.map do |folk|
            {
              id: folk.id,
              background_url: folk.background_picture_url,
              name: folk.folk_translations.by_language(language_id).first.name
            }
          end
        }
      end
    }
  end

  def build_folk_translation_data folk_translation
    {
      id: folk_translation.folk.id,
      teaser_url: folk_translation.folk.teaser_picture_url,
      background_url: folk_translation.folk.teaser_picture_url,
      folk_translation:{
        name: folk_translation.name,
        introduction: folk_translation.introduction,
        population: folk_translation.population,
        residence_area: folk_translation.residence_area,
        community_organization: folk_translation.community_organization,
        feature_translations: folk_translation.feature_translations.map do |feature_translation|
          {
            description: feature_translation.description,
            feature_type: t("#{feature_translation.feature_type}"),
            images: feature_translation.images.map do |image|
              {
                image_url: image.picture_url,
                description: image.image_description_translations.by_language(language_id).try(:first).try(:description_content)
              }
            end
          }
        end
      }
    }
  end
end
