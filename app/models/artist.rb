class Artist < ActiveRecord::Base
  has_many :albums

  def to_s
    name
  end
end
