require 'rails_helper'

RSpec.describe Customer, type: :model do

  #fixtures :customers

  it '#full_name' do
    # Utilizando FactoryBot
    customer = create(:customer)

    # Utilizando Fixtures
    #customer = customers(:jackson)

    # Utilizando Rails
    # subject.name = "Jackson Pires"
    # subject.email = "jackson@pires.com"
    # subject.save

    expect(customer.full_name).to start_with("Sr. ")
  end

  it { expect{ create(:customer)}.to change {Customer.all.size}.by(1) }
end
