class Date
  def to_j
    JalaliDate.new self.to_date
  end
end
