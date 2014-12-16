class Dj
  include Mongoid::Document
  include Mongoid::Timestamps::Short

  # DJ Info
  field :name, type: String
  field :avatar_name, type: String
  field :secondlife, type: Mongoid::Boolean, default: false
  field :experience, type: String
  field :location, type: String
  field :bio, type: String
  field :photo, type: String

  # Site Interaction
  field :for_hire, type: Mongoid::Boolean, default: true
  field :collab, type: Mongoid::Boolean
  field :software, type: String

  # Social Channels
  field :facebook, type: String
  field :twitter, type: String
  field :soundcloud, type: String
  field :mixcloud, type: String
  field :youtube, type: String
  field :vimeo, type: String

  # internal
  field :feature, type: Mongoid::Boolean
  field :status, type: String, default: 'new'

  belongs_to :user
  has_and_belongs_to_many :venues
  has_many :categories, as: :genres

  # Validations
  validates_presence_of :name, :location, :secondlife, :experience, :if => :active_or_basic?
  validates_presence_of :avatar_name, :if => :sluser?
  validates_presence_of :bio, :if => :active_or_interactive?

  def active_or_basic?
    status.include?('basic') || active?
  end


  def active_or_interactive?
    status.include?('interactive') || active?
  end

  def active?
    status == true
  end


  def sluser?
    secondlife
  end

  # helpers and convenience methods
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

  def no_social_life?
    facebook.blank? and twitter.blank? and soundcloud.blank? and mixcloud.blank? and youtube.blank?
  end

  def unplayed?
    venues.count() == 0
  end

end
