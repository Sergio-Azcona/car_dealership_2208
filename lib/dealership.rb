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

  def cars_sorted_by_price
    @inventory.sort_by { |car| car.total_cost } 
    # require 'pry';binding.pry
  end

  def inventory_hash
  # require 'pry';binding.pry
  #   @inventory.to_h { |car| 
  #   # require 'pry';bindin
  #   car.make, v}
    # by_make = Hash.new
    @inventory.find_all do |make|
      # by_make = 
      cars_by_make(make).to_h
    end
    # return by_make
  end
end
