class Price
  def code
    raise NotImplementedError.new('You must implement code.')
  end

  def charge(days_rented)
    raise NotImplementedError.new('You must implement charge.')
  end

  def frequent_renter_points(days_rented)
    1
  end
end
