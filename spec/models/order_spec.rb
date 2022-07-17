require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Tem 1 pedido' do
    order = create(:order)
    puts order.description
    puts order.customer
    puts order.customer.name
    expect(order.customer).to be_kind_of(Customer)
  end  
end
