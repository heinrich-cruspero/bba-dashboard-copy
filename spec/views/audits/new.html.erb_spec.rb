# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'audits/new', type: :view do
  before(:each) do
    @audit = Audit.new
    controller.action_name = 'new'
  end

  it 'renders new audit form' do
    render

    assert_select 'form[action=?][method=?]', audits_path, 'post' do
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
