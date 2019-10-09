# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fedex_accounts/new', type: :view do
  before(:each) do
    allow(controller).to receive(:action_name).and_return('new')

    assign(:fedex_account, FedexAccount.new(
                             key: 'MyString',
                             password: 'MyString',
                             account_number: 'MyString',
                             meter_number: 'MyString',
                             company_name: 'MyString',
                             phone_number: 'MyString',
                             street: 'MyString',
                             city: 'MyString',
                             state: 'MyString',
                             zip_code: 'MyString'
    ))
  end

  it 'renders new fedex_account form' do
    render

    assert_select 'form[action=?][method=?]', fedex_accounts_path, 'post' do
      assert_select 'input[name=?]', 'fedex_account[key]'

      assert_select 'input[name=?]', 'fedex_account[password]'

      assert_select 'input[name=?]', 'fedex_account[account_number]'

      assert_select 'input[name=?]', 'fedex_account[meter_number]'

      assert_select 'input[name=?]', 'fedex_account[company_name]'

      assert_select 'input[name=?]', 'fedex_account[phone_number]'

      assert_select 'input[name=?]', 'fedex_account[street]'

      assert_select 'input[name=?]', 'fedex_account[city]'

      assert_select 'input[name=?]', 'fedex_account[state]'

      assert_select 'input[name=?]', 'fedex_account[zip_code]'
    end
  end
end
