require_relative '../lib/price'
require_relative '../lib/movie'

class ChildrensPrice < Price
  def code
    Movie::CHILDRENS
  end

  def charge(days_rented)
    result = 1.5
    result += (days_rented - 3) * 1.5 if days_rented > 3
    result
  end
end
