class FrontController < ApplicationController
  def index
    @slides = Slide.all

    @about_image = Picture.where(:key => "about_image").first
    @news_image = Picture.where(:key => "about_image").first
    @activity_image = Picture.where(:key => "activity_image").first

    @about_cn = SiteConfig.about_cn

    @front_news = News.all.limit(5)
    @front_activites = Activity.all.limit(5)
    @front_products = Product.all.limit(5)

    @partner_urls = Partner.all

    @home_company_image = Picture.where(key: "home_company_image").first
    @home_company_summary = SiteConfig.company_summary
    # @home_news_image = Picture.where(key: "home_news_image").first
    @home_news_image = Picture.get_image('home_news_image')
    @home_product_image = Picture.get_image('home_product_image')

    # @news_list = News.all.limit(5)

    # search_item = SEARCH_ITEMS.split(',')[0]
    # @search_itmes = search_item.all.first
    @search_itmes = SEARCH_ITEMS ? SEARCH_ITEMS : "SEARCH_ITEMS"
    search_item = SEARCH_ITEMS.split(',')[0]    
    @search_itmes = eval(search_item).all.first

    @search_result = site_search("prod")
  end

  def about
    @about_en = SiteConfig.about_en
    @about_cn = SiteConfig.about_cn
    @site_logo = SiteConfig.site_logo
  end

  def contact_us
    @contact_cn = SiteConfig.contact_cn
    @contact_en = SiteConfig.contact_en
  end

  def support
    @support_content = !SiteConfig.support_content ? "" : SiteConfig.support_content    
  end

  private
    def site_search(key)
      @search_result = []
      search_item = SEARCH_ITEMS.split(',').map { |item| item.strip() }
      # item = search_item[1]
      # @search_result = eval(item).where(title: /#{key}/i)
      search_item.each do |item|
        if key
          result = eval(item).where(title: /#{key}/i)
          # result = eval(item).all.first
          @search_result << result if result.length > 0
          # @search_result << eval(item).all.first.title
        end
      end
      return @search_result
    end
end
