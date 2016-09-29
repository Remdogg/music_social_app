require 'rails_helper'

RSpec.describe "bandtogethers/index", type: :view do
  before(:each) do
    assign(:bandtogethers, [
      Bandtogether.create!(
        :title => "Title",
        :start_time => "Start Time",
        :end_time => "End Time",
        :description => "MyText",
        :concert => nil
      ),
      Bandtogether.create!(
        :title => "Title",
        :start_time => "Start Time",
        :end_time => "End Time",
        :description => "MyText",
        :concert => nil
      )
    ])
  end

  it "renders a list of bandtogethers" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Start Time".to_s, :count => 2
    assert_select "tr>td", :text => "End Time".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
