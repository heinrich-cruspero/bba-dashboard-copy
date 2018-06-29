# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'accounts/index', type: :view do
  it 'renders accounts index' do
    render
    expect(rendered).to have_selector('#accounts-table')
  end
end
