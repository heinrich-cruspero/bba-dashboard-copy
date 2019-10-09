# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'rental_returns/show', type: :view do
  let(:fedex_account) { create(:fedex_account) }

  before(:each) do
    @rental_return = assign(:rental_return, RentalReturn.create!(
                                              fedex_account: fedex_account,
                                              email: 'Email',
                                              name: 'Name',
                                              phone_number: 'Phone Number',
                                              street: 'Street',
                                              city: 'City',
                                              state: 'State',
                                              zip_code: 'Zip Code',
                                              response: 'MyText'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/#{fedex_account.company_name}/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zip Code/)
  end
end
