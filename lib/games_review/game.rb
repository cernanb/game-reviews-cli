class GamesReview::Game
  attr_accessor :title, :rating, :url, :description

  @@all = []

  def initialize(title, url)
    @title = title
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end
end