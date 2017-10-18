class Book < ApplicationRecord
  include CommonIdenticon
  require 'identicon'

  enum type: [:fantasy, :crime, :drama]

  self.inheritance_column = nil

  has_many :reviews
  has_and_belongs_to_many :authors

  def to_s
    self.title
  end

end
