class Product
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :category_id, type: String
end
