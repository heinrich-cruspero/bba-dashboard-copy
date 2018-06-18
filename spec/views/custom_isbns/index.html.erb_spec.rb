# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'custom_isbns/index', type: :view do
  before(:each) do
    assign(:custom_isbns, [
             CustomIsbn.create!(
               text_isbn: 'Text Isbn',
               alt_isbn: 'Alt Isbn',
               custom_isbn: 'Custom Isbn',
               code_isbn: 'Code Isbn',
               tag: 'Tag'
             ),
             CustomIsbn.create!(
               text_isbn: 'Text Isbn',
               alt_isbn: 'Alt Isbn',
               custom_isbn: 'Custom Isbn',
               code_isbn: 'Code Isbn',
               tag: 'Tag'
             )
           ])
  end

  it 'renders a list of custom_isbns' do
    render
    assert_select 'tr>td', text: 'Text Isbn'.to_s, count: 2
    assert_select 'tr>td', text: 'Alt Isbn'.to_s, count: 2
    assert_select 'tr>td', text: 'Custom Isbn'.to_s, count: 2
    assert_select 'tr>td', text: 'Code Isbn'.to_s, count: 2
    assert_select 'tr>td', text: 'Tag'.to_s, count: 2
  end
end
