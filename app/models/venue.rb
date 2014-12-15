class Venue
  include Mongoid::Document
  include Mongoid::Timestamps::Short

  field :name, type: String
  field :slurl, type: String
  field :description, type: String
  field :radio, type: String
  field :partner_program, type: Mongoid::Boolean
  field :photo, type: String
  field :facebook, type: String
  field :tagline, type: String, default: "Here to party!"

  field :active, type: Mongoid::Boolean, default: true
  field :feature, type: Mongoid::Boolean, default: false


  # additional information
  field :sim_rating, type: String
  field :hiring, type: Mongoid::Boolean, default: false

  #TODO Job Listings
  #TODO Business hours
  #TODO Event Feed
  #TODO Content Rating (ESRP/PEGI)

  belongs_to :user
  has_and_belongs_to_many :djs
  has_many :categories

  def genres(short=false)
    if self.categories.count > 0
      list = []
      limit = 15
      if short
        limit = 2
      end
      for c in self.categories.limit(limit)
        list.append(c.name)
      end
      return list.join(', ')
    end
    return "Unknown"
  end

  def picture
    if self.photo.blank?
      return "/images/stock/radio.png"
    else
      return self.photo
    end
  end

end
