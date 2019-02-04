# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'audits/show', type: :view do
  before(:each) do
    @audit = assign(:audit, Audit.create!(
                              sku: 'Sku',
                              status: '',
                              notes: 'MyText',
                              internal_price_1: 2.5,
                              internal_price_2: 3.5,
                              internal_price_3: 4.5,
                              internal_price_4: 5.5
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Sku/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/5.5/)
  end
end
