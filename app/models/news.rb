class News
  include Mongoid::Document
  include Mongoid::Timestamps::Short
  
  field :title, type: String
  field :content, type: String
  field :image, type: String
end
