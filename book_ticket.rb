require_relative "movie"
require "date"

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
        break
      else
        puts "Please choose a valid option!"
    end
end 
  end
end


  def list_2
    loop do
      puts "\n" 
      puts "1. Price: Low-High"
      puts "2. Price: High-Low"
      puts "3. Main menu"
      print "Choose an option: "
      option = gets.chomp.to_i
      puts "\n"
    case option
      when 1
        price_l_h
      when 2
        price_h_l
      when 3
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
          puts "#{title}: $#{price.to_f}"
        else
          puts "Movie not available!"
        end
      end   
      list_2
    end

    def book_ticket
      

    end
