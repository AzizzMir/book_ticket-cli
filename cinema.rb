require_relative "movie"
require "active_support/all"

class Cinema
  def initialize
    @movies = {
      "Alien": 9,
      "The Wild Robot": 15,
      "Terrifier": 7,
      "Transformers One": 13,
      "Joker 2": 5,
    }
  end


  def run
    loop do
      puts "\n"
      puts "Welcome to Cinima!"
      puts "1. Movies List"
      puts "2. Book a ticket"
      puts "3. Exit"
      print "Choose an option: "
      option = gets.chomp.to_i
      puts "\n"
      case option
      when 1
        show_list
      when 2
        book_ticket
      when 3
        puts "Thank you for visiting Cinema. Goodbye!"
        break
      else
        puts "Please input valid option!"
      end
    end
  end

  private

  def show_list
    @movies.each do |title, price|
      puts "#{title}: #{price.to_fs(:currency)}"
    end
  end

  def book_ticket
    @movies.each_with_index do |(title, price), index|
      puts "#{index + 1}. #{title}: #{price.to_fs(:currency)}"
    end
    puts "\nChoose a movie: "
    movie_choice = gets.chomp.to_i
    if movie_choice.between?(1, @movies.size)
      selected_movie = @movies.keys[movie_choice - 1]
      selected_price = @movies[selected_movie]
      print "\nHow many tickets for #{selected_movie}?"
      num_ticket = gets.chomp.to_i
      if num_ticket > 0
        tax = calculate_tax(selected_price, num_ticket)
        total = calculate_total(selected_price, num_ticket)
        puts "\nMovie title: #{selected_movie}, Number of tickets baught: #{num_ticket}"
        puts "Total cost: #{total.to_fs(:currency)}, Tax: #{tax.to_fs(:currency)}"
        puts Time.now
      else
        puts "\nInvalid input, please try again!"
        book_ticket
      end
    else
      puts "\nInvalid input, please try again!"
      book_ticket
    end
  end

  public

  def calculate_tax(price, number)
    return (price * number) * 0.1
  end

  def calculate_total(price, number)
    return calculate_tax(price, number) + (price * number)
  end

end
