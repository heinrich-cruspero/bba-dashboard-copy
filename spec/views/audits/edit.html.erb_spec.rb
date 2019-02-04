# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'audits/edit', type: :view do
  before(:each) do
    @audit = assign(:audit, Audit.create!(
                              sku: 'MyString',
                              status: '',
                              notes: 'MyText',
                              internal_price_1: 1.5,
                              internal_price_2: 1.5,
                              internal_price_3: 1.5,
                              internal_price_4: 1.5
                            ))
  end

  it 'renders the edit audit form' do
    render

    assert_select 'form[action=?][method=?]', audit_path(@audit), 'post' do
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
