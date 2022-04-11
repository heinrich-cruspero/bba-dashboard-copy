# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'rental_returns/index', type: :view do
  it 'renders rental_returns index' do
    current_user = create(:user)
    allow(view).to receive(:current_user).and_return(current_user)

    render

    expect(rendered).to have_selector('#rental_returns-table')
  end
end
