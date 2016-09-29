require 'rails_helper'

RSpec.describe "bandtogethers/show", type: :view do
  before(:each) do
    @bandtogether = assign(:bandtogether, Bandtogether.create!(
      :title => "Title",
      :start_time => "Start Time",
      :end_time => "End Time",
      :description => "MyText",
      :concert => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Start Time/)
    expect(rendered).to match(/End Time/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
