class GamesReview::Scraper

  BASE_URL = "http://www.ign.com/reviews/games"
   
  def self.scrape_games
    doc = Nokogiri::HTML(open(BASE_URL))
    
    doc.css('.itemList-item')[0..9].each do |game_doc|
      title = game_doc.css('.item-title a').text.strip
      url = game_doc.css('.item-title a').attribute('href').value
      GamesReview::Game.new(title, url)
    end
    
  end
  
  def self.scrape_game_details(game)
    url = game.url
    doc = Nokogiri::HTML(open(url))

    game.rating = doc.css('.score').text.strip
    game.description = doc.css('.verdict-container p').text
  end
end