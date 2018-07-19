class CLI

  def start
    puts "Welcome to games reviews"
    puts ""
    puts "Here are all the games that are reviewed!"

    #display a list of the games
    Scraper.scrape_games
  end
end