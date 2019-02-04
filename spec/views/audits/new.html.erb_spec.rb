# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'audits/new', type: :view do
  before(:each) do
    assign(:audit, Audit.new(
                     sku: 'MyString',
                     status: '',
                     notes: 'MyText',
                     internal_price_1: 1.5,
                     internal_price_2: 1.5,
                     internal_price_3: 1.5,
                     internal_price_4: 1.5
                   ))
  end

  it 'renders new audit form' do
    render

    assert_select 'form[action=?][method=?]', audits_path, 'post' do
      assert_select 'input[name=?]', 'audit[sku]'

      assert_select 'input[name=?]', 'audit[status]'

      assert_select 'textarea[name=?]', 'audit[notes]'

      assert_select 'input[name=?]', 'audit[internal_price_1]'

      assert_select 'input[name=?]', 'audit[internal_price_2]'

      assert_select 'input[name=?]', 'audit[internal_price_3]'

      assert_select 'input[name=?]', 'audit[internal_price_4]'
    end
  end
end
