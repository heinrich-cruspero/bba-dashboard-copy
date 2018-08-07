# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tracked_skus/index', type: :view do
  it 'renders accounts index' do
    render
    expect(rendered).to have_selector('#tracked_skus-table')
  end
end
