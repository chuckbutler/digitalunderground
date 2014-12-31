class Sitecfg
  include Mongoid::Document
  include Mongoid::Timestamps::Short

  field :primaryradio, type: String
  
end
