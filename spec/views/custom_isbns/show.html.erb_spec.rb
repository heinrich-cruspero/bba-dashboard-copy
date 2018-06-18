require 'rails_helper'

RSpec.describe "custom_isbns/show", type: :view do
  before(:each) do
    @custom_isbn = assign(:custom_isbn, CustomIsbn.create!(
      :text_isbn => "Text Isbn",
      :alt_isbn => "Alt Isbn",
      :custom_isbn => "Custom Isbn",
      :code_isbn => "Code Isbn",
      :tag => "Tag"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text Isbn/)
    expect(rendered).to match(/Alt Isbn/)
    expect(rendered).to match(/Custom Isbn/)
    expect(rendered).to match(/Code Isbn/)
    expect(rendered).to match(/Tag/)
  end
end
