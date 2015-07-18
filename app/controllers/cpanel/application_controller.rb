class Cpanel::ApplicationController < ActionController::Base
  layout 'cpanel'
  protect_from_forgery with: :exception
  
  before_filter :set_params#, :authenticate_user!

  private
    def set_params
      @site_title = SiteConfig.site_title
    end
end
