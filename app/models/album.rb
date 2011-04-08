class Album < ActiveRecord::Base
  has_many :songs
  belongs_to :artist

  def to_s
    name
  end
end
