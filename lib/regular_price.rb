require_relative '../lib/price'
require_relative '../lib/movie'

class RegularPrice < Price
  def code
    Movie::REGULAR
  end

  def charge(days_rented)
    result = 2
    result += (days_rented - 2) * 1.5 if days_rented > 2
    result
  end
end
