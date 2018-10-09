require 'rails_helper'

describe "Viewing the list of movies" do
  it "show single movie detail" do
    movie = Movie.create(title: "Iron Man",
                          rating: "PG-13",
                          total_gross: 318412101.00,
                          description: "Tony Stark builds an armored suit to fight the throes of evil",
                          released_on: "2008-05-02")

    visit movie_url(movie)

    expect(page).to have_text(movie.title)
    expect(page).to have_text(movie.rating)
    expect(page).to have_text(movie.description[0..10])
    expect(page).to have_text(movie.released_on)
    # expect(page).to have_text("$318,412,101.00")
  end

  it "shows if the total gross exceeds $50M" do
    movie = Movie.create(movie_attributes(total_gross: 60000000.00))

    visit movie_url(movie)
    expect(page).to have_text("$60,000,000.00")
  end

  it "shows 'Flop!' if the total gross is less than $50M" do
    movie = Movie.create(movie_attributes(total_gross: 10000000.00))

    visit movie_url(movie)
    expect(page).to have_text("Flop!")  
  end

end