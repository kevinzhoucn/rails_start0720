class News
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Searchable
  
  field :title, type: String
  field :content, type: String
  field :news_type, type: String
  field :lang, type: String  
end
