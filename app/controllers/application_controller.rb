class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def change_locale_to_en
    I18n.default_locale = :en

    redirect_back(fallback_location: root_path)
  end

  def change_locale_to_uk
    I18n.default_locale = :uk

    redirect_back(fallback_location: root_path)
  end
end
