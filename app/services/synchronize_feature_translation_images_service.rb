class SynchronizeFeatureTranslationImagesService
  attr_reader :folk, :language_id

  def initialize folk, language_id
    @folk = folk
    @language_id = language_id
  end

  def perform
    FeatureTranslation.feature_types.each do |feature, feature_type|
      current_image_ids = folk.feature_translations.send(feature.to_sym).by_language(language_id).first.image_ids

      folk.feature_translations.send(feature.to_sym).by_other_language(language_id).each do |feature_translation|
        feature_translation.update_attributes image_ids: current_image_ids
      end
    end
  end
end
