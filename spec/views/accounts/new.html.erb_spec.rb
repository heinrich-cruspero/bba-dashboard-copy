# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'accounts/new', type: :view do
  before(:each) do
    allow(controller).to receive(:action_name).and_return('new')

    assign(:account, Account.new(
                       source: nil,
                       name: 'MyString',
                       account_number: 'MyString',
                       address_ln1: 'MyString',
                       address_ln2: 'MyString',
                       city: 'MyString',
                       state: 'MyString',
                       zip: 'MyString',
                       phone_number: 'MyString',
                       extension: 'MyString'
                     ))
  end

  it 'renders new account form' do
    render

    assert_select 'form[action=?][method=?]', accounts_path, 'post' do
      assert_select 'select[name=?]', 'account[source_id]'

      assert_select 'input[name=?]', 'account[name]'

      assert_select 'input[name=?]', 'account[account_number]'

      assert_select 'input[name=?]', 'account[address_ln1]'

      assert_select 'input[name=?]', 'account[address_ln2]'

      assert_select 'input[name=?]', 'account[city]'

      assert_select 'input[name=?]', 'account[state]'

      assert_select 'input[name=?]', 'account[zip]'

      assert_select 'input[name=?]', 'account[phone_number]'

      assert_select 'input[name=?]', 'account[extension]'
    end
  end
end
