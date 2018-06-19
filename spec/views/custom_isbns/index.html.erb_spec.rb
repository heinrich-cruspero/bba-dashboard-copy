# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'custom_isbns/index', type: :view do
  it 'renders custom_isbns index' do
    render
    expect(rendered).to have_selector('#custom_isbns-table')
  end
end
