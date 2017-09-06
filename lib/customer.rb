require_relative '../lib/movie'
require_relative '../lib/rental'

class Customer
  attr_reader :name, :rentals

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(rental)
    rentals.push(rental)
  end

  def statement
    result = "Rental Record for #{name}\n"
    rentals.each do |rental|
      # show figures for this rental
      result += "\t #{rental.movie.title}\t#{rental.charge}\n"
    end

    # add footer lines
    result += "Amount owed is #{total_charged}\n"
    result += "You earned #{total_frequent_renter_points} frequent renter points"
    result
  end

  def total_charged
    rentals.inject(0) { |total, rental| total + rental.charge }
  end

  def total_frequent_renter_points
    rentals.inject(0) { |total, rental| total + rental.frequent_renter_points }
  end

  private

  attr_writer :name, :rentals
end
