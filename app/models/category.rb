class Category
  include Mongoid::Document
  field :name, type: String
  field :group, type: Integer
  field :active, type: Mongoid::Boolean, default: true

  belongs_to :venue, polymorphic: true
  belongs_to :genres, polymorphic: true
end
