class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_params, :set_locale

  private
    def set_params
      @site_title = SiteConfig.site_title
      @home_title = SiteConfig.home_title
      @home_nav_image = Picture.get_image('home_nav_image')
    end

    def set_locale  
      I18n.locale = params[:lang] || I18n.default_locale  
    end

    def default_url_options(options = {})
      if I18n.locale == I18n.default_locale
        options
      else      
        { lang: I18n.locale }.merge options
      end
    end
end
