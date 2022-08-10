require 'rails_helper'

RSpec.feature "Customers", type: :feature, js: true do
  it 'Visit index page' do
    visit(customers_path)
    #save_and_open_page
    #print page.html
    page.save_screenshot('screenshot.png')
    expect(page).to have_current_path(customers_path)
  end
end

