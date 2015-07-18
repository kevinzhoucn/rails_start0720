class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_params

  private
    def set_params
      @site_title = SiteConfig.site_title
      @home_title = SiteConfig.home_title
    end
end
