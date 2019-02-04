# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'custom_isbns/new', type: :view do
  before(:each) do
    allow(controller).to receive(:action_name).and_return('new')
    assign(:custom_isbn, CustomIsbn.new(
                           text_isbn: 'MyString',
                           alt_isbn: 'MyString',
                           custom_isbn: 'MyString',
                           code_isbn: 'MyString',
                           tag: 'MyString'
                         ))
  end

  it 'renders new custom_isbn form' do
    render

    assert_select 'form[action=?][method=?]', custom_isbns_path, 'post' do
      assert_select 'input[name=?]', 'custom_isbn[text_isbn]'

      assert_select 'input[name=?]', 'custom_isbn[alt_isbn]'

      assert_select 'input[name=?]', 'custom_isbn[custom_isbn]'

      assert_select 'input[name=?]', 'custom_isbn[code_isbn]'

      assert_select 'input[name=?]', 'custom_isbn[tag]'
    end
  end
end
