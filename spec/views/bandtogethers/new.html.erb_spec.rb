require 'rails_helper'

RSpec.describe "bandtogethers/new", type: :view do
  before(:each) do
    assign(:bandtogether, Bandtogether.new(
      :title => "MyString",
      :start_time => "MyString",
      :end_time => "MyString",
      :description => "MyText",
      :concert => nil
    ))
  end

  it "renders new bandtogether form" do
    render

    assert_select "form[action=?][method=?]", bandtogethers_path, "post" do

      assert_select "input#bandtogether_title[name=?]", "bandtogether[title]"

      assert_select "input#bandtogether_start_time[name=?]", "bandtogether[start_time]"

      assert_select "input#bandtogether_end_time[name=?]", "bandtogether[end_time]"

      assert_select "textarea#bandtogether_description[name=?]", "bandtogether[description]"

      assert_select "input#bandtogether_concert_id[name=?]", "bandtogether[concert_id]"
    end
  end
end
