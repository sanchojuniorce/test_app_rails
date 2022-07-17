require 'rails_helper'

RSpec.describe Customer, type: :model do

  #fixtures :customers

  it '#full_name - Sobrescrevendo Atributo' do
    customer = create(:customer, name: "Jackson Pires")
    customer1 = create(:customer, name: "Jackson Pires")
    puts customer.email
    puts customer1.email
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

  it 'Atributo Trasitório' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end  

  it 'Cliente Feminino Vip' do
    customer = create(:customer_female_vip)
    expect(customer.gender).to eq('F')
    expect(customer.vip).to eq(true)
  end

  it 'Cliente Feminino' do
    customer = create(:customer_female)
    expect(customer.gender).to eq('F')
  end

  it 'Cliente Feminino Default' do
    customer = create(:customer_female_default)
    expect(customer.gender).to eq('F')
  end

  it 'Cliente Masculino Vip' do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(true)
  end

  it 'Cliente Masculino' do
    customer = create(:customer_male)
    expect(customer.gender).to eq('M')
  end

  it { expect{ create(:customer)}.to change {Customer.all.size}.by(1) }
end
