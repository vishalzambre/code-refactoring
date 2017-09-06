require_relative '../lib/price'
require_relative '../lib/regular_price'
require_relative '../lib/childrens_price'
require_relative '../lib/new_release_price'

class Movie
  attr_reader :title, :price

  NEW_RELEASE = 1
  REGULAR     = 0
  CHILDRENS   = 2

  def initialize(title, code)
    @title = title
    @price = get_price(code)
  end

  def charge(days_rented)
    price.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    price.frequent_renter_points(days_rented)
    # if price_code == Movie::NEW_RELEASE && days_rented > 1
    #   2
    # else
    #   1
    # end
  end

  def price_code
    price.code
  end

  def get_price(code)
    case code
    when REGULAR
      RegularPrice.new
    when NEW_RELEASE
      NewReleasePrice.new
    when CHILDRENS
      ChildrensPrice.new
    else
      raise 'Incorrect Price Code'
    end
  end
end
