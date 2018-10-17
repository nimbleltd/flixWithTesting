class Movie < ApplicationRecord
  def flop?
    total_gross.blank? || total_gross < 50000000.00
  end

  def self.released_desc
    where("released_on <= ?", Time.now).order("released_on desc")
  end
end
