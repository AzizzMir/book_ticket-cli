require_relative "movie"
require "date"
require "active_support/all"

class Book_ticket
  def initialize
    @movies = {
      "Alien": 9,
      "Smile 2": 10,
      "Transformers One": 15,
      "The Wild Robot": 7,
      "Terrifier": 12
    }
  end


  def main_list
    loop do
      break if @exit_program
      puts "\n" 
      puts "Welcome to AMC Movie World!"
      puts "1. Movies list"
      puts "2. Book a ticket"
      puts "3. Exit"
      print "Choose an option: "
      option = gets.chomp.to_i
      puts "\n"
    case option
      when 1
        movies_list
      when 2
        book_ticket
      when 3
        puts "Thank you for visiting movie ticket system. Goodbye!"
        @exit_program = true
        break
      else
        puts "Please choose a valid option!"
    end
end 
  end
end


  def list_2
    loop do
      break if @exit_program
      puts "\n" 
      puts "1. Price: Low-High"
      puts "2. Price: High-Low"
      puts "3. Search a movie"
      puts "4. Main menu"
      print "Choose an option: "
      option = gets.chomp.to_i
      puts "\n"
    case option
      when 1
        price_l_h
      when 2
        price_h_l
      when 3
        search_movie
      when 4
        main_list
        break
      else
        puts "Please choose a valid option!"
    end
  end 
  end 
  

    private

    def movies_list
      @movies.each do |title, price|
        puts "#{title}: $#{price.to_f}"
      end
      list_2
    end

    def price_l_h
      sorted_array = @movies.sort_by { |key, value| value }.to_h
        sorted_array.each do |title, price|
          puts "#{title}: $#{price.to_f}"
        end
    end

    def price_h_l
      sorted_array = @movies.sort_by { |key, value| value }.reverse.to_h
        sorted_array.each do |title, price|
          puts "#{title}: $#{price.to_f}"
        end
    end

    def search_movie
      puts "Movie name?"
      movie_name = gets.chomp
      @movies.each do |title, price|
        if movie_name == title.to_s
          puts "\n"
          puts "#{title}: $#{price.to_f}"
          break
        else
          puts "\n"
          puts "Movie not available!"
          break
        end
      end   
      list_2
    end

    def book_ticket
      puts "\nAvailable movies for booking:"
      @movies.each_with_index do |(title, price), index|
        puts "#{index + 1}. #{title}: $#{price.to_f}"
      end
      print "\nEnter the number of the movie you'd like to tickets for: "
      movie_choice = gets.chomp.to_i
      selected_movie = @movies.keys[movie_choice - 1] if movie_choice.between?(1, @movies.size)
      if selected_movie
        selected_price = @movies[selected_movie]

        print "\nHow many tickets would you like to book for #{selected_movie}?"
          if gets.chomp.to_i > 0
          
          end
        number_of_tickets = gets.chomp.to_i
        tickets_cost = selected_price * number_of_tickets
        tax = (selected_price * number_of_tickets) * 0.1
        total_cost = tickets_cost + tax
        puts "\nMovie title: #{selected_movie}"
        puts "Number of tickets: #{number_of_tickets}"
        puts "Total: #{total_cost.to_fs(:currency)}, Tax: #{tax.to_fs(:currency)}"
        puts "\nConfirm to purchase?(Yes|No)"
        choice = gets.chomp
        if choice == "Yes" || choice.downcase == "yes"
          puts "\nYou have successfully booked #{number_of_tickets} tickets for #{selected_movie}."
          puts "Total cost: #{total_cost.to_fs(:currency)}, tax: #{tax.to_fs(:currency)}"
          puts Time.now 
        else
          puts "\n"
          book_ticket
        end
        

        
      
      else
        puts "\nInvalid selection. Please try again."
        book_ticket
      end
    end
