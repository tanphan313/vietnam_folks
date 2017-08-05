class Admin::MFolksController < ApplicationController
  load_and_authorize_resource class: M::Folk

  def index
    @folk_categories = FolkCategory.order(id: :asc)
    folk_category = FolkCategory.find_by(id: params[:folk_category_id]) || FolkCategory.first
    @m_folks = folk_category.folks.order(id: :asc)
  end

  def show

  end

  def edit
    @folk_translation = @m_folk.folk_translations.detect{|folk_translation| folk_translation.m_language_id == language_id}

    @m_folk.build_teaser.build_image unless @m_folk.teaser
    @m_folk.build_background.build_image unless @m_folk.background

    @folk_translation.feature_translations.each do |feature_translation|
      feature_translation.images.build unless feature_translation.images.present?
    end
  end

  def update
    if @m_folk.update_attributes folk_params
      SynchronizeFeatureTranslationImagesService.new(@m_folk, language_id).perform
      flash[:success] = "Update folk successfully"
    else
      flash[:error] = "Something went wrong"
    end
    redirect_to :back
  end

  private
  def folk_params
    params.require(:m_folk).permit teaser_attributes: Teaser::PARAMS_ATTRIBUTES,
      background_attributes: Background::PARAMS_ATTRIBUTES,
      folk_translations_attributes: FolkTranslation::PARAMS_ATTRIBUTES
  end
end
