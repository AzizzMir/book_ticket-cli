require "minitest/autorun"
require "./cinema.rb"

class TestCinema < Minitest::Test
  def test_calculate_tax
    cinema = Cinema.new
    assert_equal 2, cinema.calculate_tax(10, 2), "Calculate tax method failed"
  end
end

class TestCinema < Minitest::Test
  def test_calculate_total
    cinema = Cinema.new
    assert_equal 22, cinema.calculate_total(10, 2), "Calculate total cost method failed"
  end
end
