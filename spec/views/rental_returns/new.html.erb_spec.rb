# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'rental_returns/new', type: :view do
  let(:fedex_account) { create(:fedex_account) }

  before(:each) do
    allow(controller).to receive(:action_name).and_return('new')

    assign(:rental_return, RentalReturn.new(
                             accountable: fedex_account,
                             email: 'MyString',
                             name: 'MyString',
                             phone_number: 'MyString',
                             street: 'MyString',
                             city: 'MyString',
                             state: 'MyString',
                             zip_code: 'MyString',
                             response: 'MyText'
    ))
  end

  it 'renders new rental_return form' do
    render

    assert_select 'form[action=?][method=?]', rental_returns_path, 'post' do
      assert_select 'select[name=?]', 'rental_return[accountable_id]'

      assert_select 'input[name=?]', 'rental_return[email]'

      assert_select 'input[name=?]', 'rental_return[name]'

      assert_select 'input[name=?]', 'rental_return[phone_number]'

      assert_select 'input[name=?]', 'rental_return[street]'

      assert_select 'input[name=?]', 'rental_return[city]'

      assert_select 'input[name=?]', 'rental_return[state]'

      assert_select 'input[name=?]', 'rental_return[zip_code]'
    end
  end
end
