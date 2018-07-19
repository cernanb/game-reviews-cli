class Scraper

  BASE_URL = "http://www.ign.com/reviews/games"
   
  def self.scrape_games
    doc = Nokogiri::HTML(open(BASE_URL))
    binding.pry
  end
end