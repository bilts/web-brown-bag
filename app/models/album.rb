class Album < ActiveRecord::Base
  has_many :songs
  belongs_to :artist
  default_scope order('name')

  def to_s
    name
  end
end
