module ApplicationHelper
  def language_id locale
    M::Language.find_by(name: locale.to_s.upcase).id
  end
end
