# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'audits/edit', type: :view do
  before(:each) do
    @audit = create(:audit)
    controller.action_name = 'edit'
  end

  it 'renders the edit audit form' do
    render

    assert_select 'form[action=?][method=?]', audit_path(@audit), 'post' do
      assert_select 'input[name=?]', 'audit[sku]'

      assert_select 'select[name=?]', 'audit[status]'

      assert_select 'textarea[name=?]', 'audit[notes]'

      assert_select 'input[name=?]', 'audit[internal_price_4]'

      assert_select 'input[name=?]', 'audit[internal_notes_1]'

      assert_select 'input[name=?]', 'audit[internal_notes_2]'

      assert_select 'input[name=?]', 'audit[internal_notes_3]'

      assert_select 'select[name=?]', 'audit[date_created(1i)]'
      assert_select 'select[name=?]', 'audit[date_created(2i)]'
      assert_select 'select[name=?]', 'audit[date_created(3i)]'
    end
  end
end
