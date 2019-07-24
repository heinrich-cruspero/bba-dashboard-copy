# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'thrift_orders/index', type: :view do
  it 'renders a list of thrift_orders' do
    render
    expect(rendered).to have_selector('#thrift_orders-table')
  end
end
