class GamesReview::CLI

  def start
    puts "Welcome to games reviews"
    puts ""
    
    #display a list of the games
    GamesReview::Scraper.scrape_games
    main_menu
  end
  
  def main_menu
    puts "Here are all the games that are reviewed!"
    puts ""
    
    games = GamesReview::Game.all

    games.each.with_index(1) do |game, index|
      puts "#{index}. #{game.title}"
    end

    puts ""
    puts "Please select a game to view additional details:"

    input = gets.strip
    index = input.to_i - 1

    game = GamesReview::Game.all[index]
    if !game.rating || !game.description
      GamesReview::Scraper.scrape_game_details(game)
    end

    puts "Here are the details:"

    puts game.rating
    puts game.description

    main_menu
  end
end