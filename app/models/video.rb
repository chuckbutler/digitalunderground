class Video
  include Mongoid::Document
  include Mongoid::Timestamps::Short

  field :title, type: String
  field :description, type: String
  field :embed, type: String
  field :active, type: Boolean
end
