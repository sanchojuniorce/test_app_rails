require 'rails_helper'

RSpec.describe Customer, type: :model do

  #fixtures :customers

  it '#full_name - Sobrescrevendo Atributo' do
    customer = create(:customer, name: "Jackson Pires")
    expect(customer.full_name).to start_with("Sr. Jackson Pires")
  end

  it 'Herança' do
    customer = create(:customer_vip)
    expect(customer.vip).to eq(true)
  end

  it '#full_name' do
    # Utilizando FactoryBot
    customer = create(:user) #ou create(:customer)

    # Utilizando Fixtures
    #customer = customers(:jackson)

    # Utilizando Rails
    # subject.name = "Jackson Pires"
    # subject.email = "jackson@pires.com"
    # subject.save

    expect(customer.full_name).to start_with("Sr. ")
  end

  it 'Usando o attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with("Sr. ")
  end

  it { expect{ create(:customer)}.to change {Customer.all.size}.by(1) }
end
