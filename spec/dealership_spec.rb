require './lib/car'
require './lib/dealership'
#=> true

RSpec.describe Dealership do
  let(:dealership)  { Dealership.new("Acme Auto", "123 Main Street") }
  let(:car_1)  { Car.new("Ford Mustang", 1500, 36) }
  let(:car_2)  { Car.new("Toyota Prius", 1000, 48) }
  let(:car_3) { Car.new("Toyota Tercel", 500, 48) }
  let(:car_4) { Car.new("Chevrolet Bronco", 1250, 24) }

  it 'should be a class with attributes name, address, and an inventory array'do
    expect(dealership).to be_a Dealership
    expect(dealership.name).to eq("Acme Auto")
    expect(dealership.address).to eq("123 Main Street")
    expect(dealership.inventory).to eq([])
  end

  it 'can add cars in inventory and count the number of card in inventory' do
    expect(dealership.inventory_count).to eq 0
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    expect(dealership.inventory).to eq([car_1, car_2])
    expect(dealership.inventory_count).to eq 2
  end

  it 'informs if it has inventory' do
    expect(dealership.has_inventory?).to eq false
    expect(dealership.inventory_count).to eq 0
    dealership.add_car(car_1)
    expect(dealership.inventory_count).to eq 1
    expect(dealership.has_inventory?).to eq true
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    dealership.add_car(car_4)
  end

  it 'lists all cars by the same make attribute' do
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    dealership.add_car(car_4)
    expect(dealership.cars_by_make("Toyota")).to eq([car_2, car_3])
    expect(dealership.cars_by_make("Ford")).to eq([car_1])
  end

  it 'can return the total value of all cars in stock' do
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    dealership.add_car(car_4)
    expect(dealership.total_value).to eq 156000
  end

  #******     at the 2 Hour mark - unable to finish Hash and onward within time*****
  it "stores the dealership details in a hash with the value and address" do
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    dealership.add_car(car_4)
    expect(dealership.details).to eq({"total_value" => 156000, "address" => "123 Main Street"})
  end

  it 'should return the average price of cards' do
    dealership.add_car(car_1)
    dealership.add_car(car_2)
    dealership.add_car(car_3)
    dealership.add_car(car_4)
  
    expect(dealership.average_price_of_car).to eq('39,000')
  end

end