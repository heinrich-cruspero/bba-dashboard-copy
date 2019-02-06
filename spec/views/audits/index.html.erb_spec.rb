# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'audits/index', type: :view do
  let(:audit) { create(:audit) }

  before(:each) do
    assign(:audits, [audit, audit])
  end

  it 'renders a list of audits' do
    render
    assert_select 'tr>td', text: audit.sku, count: 2
    assert_select 'tr>td', text: audit.status.to_s, count: 2
    assert_select 'tr>td', text: audit.notes, count: 2
    assert_select 'tr>td', text: audit.internal_price_4.to_s, count: 2
    assert_select 'tr>td', text: audit.internal_notes_1.to_s, count: 2
    assert_select 'tr>td', text: audit.internal_notes_2.to_s, count: 2
    assert_select 'tr>td', text: audit.internal_notes_3.to_s, count: 2
    assert_select 'tr>td', text: audit.date_created.to_s, count: 2
  end
end
