# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'rental_returns/edit', type: :view do
  let(:fedex_account) { create(:fedex_account) }

  before(:each) do
    allow(controller).to receive(:action_name).and_return('edit')

    @rental_return = assign(:rental_return, RentalReturn.create!(
                                              fedex_account: fedex_account,
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

  it 'renders the edit rental_return form' do
    render

    assert_select 'form[action=?][method=?]', rental_return_path(@rental_return), 'post' do
      assert_select 'select[name=?]', 'rental_return[fedex_account_id]'

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
