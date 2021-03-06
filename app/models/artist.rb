class Artist < ActiveRecord::Base
  has_many :albums
  default_scope order('name')

  def to_s
    name
  end

  def <=>(other)
    name.gsub(/^(the|a|an) /i, '') <=> other.name.gsub(/^(the|a|an) /i, '')
  end
end
