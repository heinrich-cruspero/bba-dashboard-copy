# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fedex_accounts/show', type: :view do
  before(:each) do
    @fedex_account = assign(:fedex_account, FedexAccount.create!(
                                              key: 'Key',
                                              password: 'Password',
                                              account_number: 'Account Number',
                                              meter_number: 'Meter Number',
                                              name: 'Name',
                                              company_name: 'Company Name',
                                              phone_number: 'Phone Number',
                                              street: 'Street',
                                              city: 'City',
                                              state: 'State',
                                              zip_code: 'Zip Code'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Key/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Account Number/)
    expect(rendered).to match(/Meter Number/)
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zip Code/)
  end
end
