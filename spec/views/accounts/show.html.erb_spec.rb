# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'accounts/show', type: :view do
  let(:source) { create(:source) }

  before(:each) do
    @account = assign(:account, Account.create!(
                                  source: source,
                                  name: 'Name',
                                  account_number: 'Account Number',
                                  address_ln1: 'Address Ln1',
                                  address_ln2: 'Address Ln2',
                                  city: 'City',
                                  state: 'State',
                                  zip: 'Zip',
                                  phone_number: 'Phone Number',
                                  extension: 'Extension'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Account Number/)
    expect(rendered).to match(/Address Ln1/)
    expect(rendered).to match(/Address Ln2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zip/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Extension/)
  end
end
