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

  def details
    
    # Hash.new(|hash, v|
    # require 'pry';binding.pry
    
    # "address" => @address }
    #******     at the 2 Hour mark - unable to finish*****
  end
end
