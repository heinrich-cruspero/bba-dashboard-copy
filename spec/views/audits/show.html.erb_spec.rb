# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'audits/show', type: :view do
  before(:each) do
    @audit = create(:audit)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/#{@audit.sku}/)
    expect(rendered).to match(/#{@audit.status}/)
    expect(rendered).to match(/#{@audit.notes}/)
    expect(rendered).to match(/#{@audit.internal_price_4}/)
    expect(rendered).to match(/#{@audit.internal_notes_1}/)
    expect(rendered).to match(/#{@audit.internal_notes_2}/)
    expect(rendered).to match(/#{@audit.internal_notes_3}/)
    expect(rendered).to match(/#{@audit.date_created}/)
  end
end
