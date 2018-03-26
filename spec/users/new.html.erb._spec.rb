
require 'rails_helper'

RSpec.describe "users/new.html.erb", type: :view do
  it "displays the create user screen" do
    render

    expect(rendered).to match /First Name/
    expect(rendered).to match /Last Name/
    expect(rendered).to match /Email/
    expect(rendered).to match /Password/
    expect(rendered).to match /Password Confirmation/
  end
end


