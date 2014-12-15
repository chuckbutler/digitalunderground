class Dj
  include Mongoid::Document
  include Mongoid::Timestamps::Short

  # DJ Info
  field :name, type: String
  field :avatar_name, type: String
  field :experience, type: String
  field :location, type: String
  field :bio, type: String
  field :collab, type: Mongoid::Boolean
  field :software, type: String
  field :photo, type: String

  # Site Interaction
  field :for_hire, type: Mongoid::Boolean, default: true
  field :feature, type: Mongoid::Boolean

  # Social Channels
  field :facebook, type: String
  field :twitter, type: String
  field :soundcloud, type: String
  field :mixcloud, type: String
  field :youtube, type: String
  field :vimeo, type: String


  belongs_to :user
  has_and_belongs_to_many :venues
  has_many :categories, as: :genres

  def picture
    if self.photo.blank?
      return "/images/stock/dj.png"
    else
      return self.photo
    end
  end

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

end
