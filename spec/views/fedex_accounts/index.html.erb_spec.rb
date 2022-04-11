# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fedex_accounts/index', type: :view do
  before(:each) do
    assign(:fedex_accounts, [
             FedexAccount.create!(
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
             ),
             FedexAccount.create!(
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
             )
           ])
  end

  it 'renders a list of fedex_accounts' do
    render
    assert_select 'tr>td', text: 'Key'.to_s, count: 2
    assert_select 'tr>td', text: 'Password'.to_s, count: 2
    assert_select 'tr>td', text: 'Account Number'.to_s, count: 2
    assert_select 'tr>td', text: 'Meter Number'.to_s, count: 2
    assert_select 'tr>td', text: 'Company Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Phone Number'.to_s, count: 2
    assert_select 'tr>td', text: 'Street'.to_s, count: 2
    assert_select 'tr>td', text: 'City'.to_s, count: 2
    assert_select 'tr>td', text: 'State'.to_s, count: 2
    assert_select 'tr>td', text: 'Zip Code'.to_s, count: 2
  end
end
