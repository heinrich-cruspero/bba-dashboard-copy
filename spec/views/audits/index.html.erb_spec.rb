# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'audits/index', type: :view do
  before(:each) do
    assign(:audits, [
             Audit.create!(
               sku: 'Sku',
               status: '',
               notes: 'MyText',
               internal_price_1: 2.5,
               internal_price_2: 3.5,
               internal_price_3: 4.5,
               internal_price_4: 5.5
             ),
             Audit.create!(
               sku: 'Sku',
               status: '',
               notes: 'MyText',
               internal_price_1: 2.5,
               internal_price_2: 3.5,
               internal_price_3: 4.5,
               internal_price_4: 5.5
             )
           ])
  end

  it 'renders a list of audits' do
    render
    assert_select 'tr>td', text: 'Sku'.to_s, count: 2
    assert_select 'tr>td', text: ''.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 2.5.to_s, count: 2
    assert_select 'tr>td', text: 3.5.to_s, count: 2
    assert_select 'tr>td', text: 4.5.to_s, count: 2
    assert_select 'tr>td', text: 5.5.to_s, count: 2
  end
end
