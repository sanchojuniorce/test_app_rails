require 'rails_helper'

RSpec.describe Customer, type: :model do

  #fixtures :customers

  it 'Create a customer' do
    # Utilizando FactoryBot
    customer = create(:customer)

    # Utilizando Fixtures
    #customer = customers(:jackson)

    # Utilizando Rails
    # subject.name = "Jackson Pires"
    # subject.email = "jackson@pires.com"
    # subject.save

    expect(customer.full_name).to eq("Sr. Jackson Pires")
  end
end
