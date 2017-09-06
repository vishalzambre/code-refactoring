require 'minitest/autorun'
require_relative '../lib/customer'
require_relative '../lib/movie'
require_relative '../lib/rental'

class TestCustomer < Minitest::Test
  def setup
    new_movie = Movie.new('Don', 1)
    childrens_movie = Movie.new('Jungle Book', 2)
    regular_movie = Movie.new('Border', 0)
    @customer = Customer.new('Vishal')
    @customer.add_rental(Rental.new(new_movie, 5))
    @customer.add_rental(Rental.new(childrens_movie, 6))
    @customer.add_rental(Rental.new(regular_movie, 3))
  end

  def test_customer_name
    assert_equal 'Vishal', @customer.name
  end

  def test_statement
    assert_equal "Rental Record for Vishal\n\t Don\t15\n\t Jungle Book\t6.0\n\t Border\t3.5\nAmount owed is 24.5\nYou earned 4 frequent renter points", @customer.statement
  end
end
