class Paperboy

  def initialize(name, side)
    @name = name
    @experience = 0
    @side = side
    @earnings = 0
  end

  def quota
    return (@experience / 2) + 50
  end

  def deliver(start_address, end_address)
    papers_delivered = 0
    pay = 0
    if start_address > end_address
      start_address, end_address = end_address, start_address
    end
    if @side == "even"
      (start_address..end_address).each do |house|
        if house.even?
          papers_delivered += 1
        end
      end
    else
      (start_address..end_address).each do |house|
        if house.odd?
          papers_delivered += 1
        end
      end
    end
    if papers_delivered >= self.quota
      pay = ((papers_delivered - self.quota) * 0.5) + (self.quota * 0.25)
    else
      pay = (papers_delivered * 0.25) - 2
    end
    @experience += papers_delivered
    @earnings += pay
    return pay
  end

  def report
    return "My name is #{@name}, I've delivered #{@experience} papers and I've earned $#{@earnings} so far"
  end

end
