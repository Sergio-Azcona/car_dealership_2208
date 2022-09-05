class Dealership  
  attr_reader :name, :address, :inventory
  def initialize(name, address)
    @name = name
    @address = address
    @inventory = []
  end

  def add_car(car_name)
    @inventory.push(car_name)
  end

  def inventory_count
    @inventory.length
  end

  def has_inventory?
    inventory_count >= 1
  end

  def cars_by_make(make)
    @inventory.select { |car|(make == car.make) }       
  end

  def total_value
    # stock_worth = 0
    @inventory.sum { |car|car.total_cost }
      # require 'pry';binding.pry
      # stock_worth  
    # end 
  # stock_worth
  end

  #******     at the 2 Hour mark - unable to finish*****
  def details
     ({"total_value" => total_value, "address" => @address})
    # Hash.new(|hash, v|
    # require 'pry';binding.pry
    
    # "address" => @address }
  end

  def average_price_of_car
     total_value.div(inventory_count).to_s.reverse.scan(/.{1,3}/).join(",").reverse
    #  require 'pry';binding.pry
     
    #  .to_s.reverse.scan(/{-1, 3}/).join(",")
    # ave.to_s.reverse.scan(/{-1, 3}/).join(",")
  end
  #****  49 mins of OVERTIME: had to find ways to add the comma  ***
end
