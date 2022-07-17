require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'belongs_to' do
    order = create(:order)
    puts order.description
    puts order.customer
    puts order.customer.name
    expect(order.customer).to be_kind_of(Customer)
  end  

  it 'Possui 3 pedidos - create_list' do
    #orders = create_list(:order, 3)
    orders = create_pair(:order)
    expect(orders.count).to eq(2)
  end  

  it 'has_many' do
    #customer = create(:customer, :with_orders, qtt_orders: 5)
    #puts customer.inspect
    #puts customer.orders.inspect
    #expect(customer.orders.count).to eq(5)

    customer = create(:customer_with_orders)
    expect(customer.orders.count).to eq(3)
  end  
  
end
