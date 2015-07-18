class News
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String
  field :news_type, type: String
  field :lang, type: String
  def self.search(search)
    if search
      where(title: /#{search}/i)
    else
      all
    end
  end
end
