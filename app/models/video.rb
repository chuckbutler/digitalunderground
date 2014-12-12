class Video
  include Mongoid::Document
  include Mongoid::Timestamps::Short

  field :link, type: String
  field :active, type: Boolean
end
