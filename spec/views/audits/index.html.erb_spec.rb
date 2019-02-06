# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'audits/index', type: :view do
  let(:audit) { create(:audit) }

  before(:each) do
    assign(:audits, [audit, audit])
  end

  it 'renders a list of audits' do
    render
    assert_select 'tr>th', text: 'Sku', count: 1
    assert_select 'tr>th', text: 'Status', count: 1
    assert_select 'tr>th', text: 'Notes', count: 1
    assert_select 'tr>th', text: 'Internal price 4', count: 1
    assert_select 'tr>th', text: 'Internal note 1', count: 1
    assert_select 'tr>th', text: 'Internal note 2', count: 1
    assert_select 'tr>th', text: 'Internal note 3', count: 1
    assert_select 'tr>th', text: 'Date created', count: 1
  end
end
