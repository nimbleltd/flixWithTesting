class Movie < ApplicationRecord
  def flop?
    total_gross < 50000000.00
  end
end
