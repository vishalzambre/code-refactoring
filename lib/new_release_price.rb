require_relative '../lib/price'
require_relative '../lib/movie'

class NewReleasePrice < Price
  def code
    Movie::NEW_RELEASE
  end

  def charge(days_rented)
    days_rented * 3
  end

  def frequent_renter_points(days_rented)
    days_rented > 1 ? 2 : super
  end
end
