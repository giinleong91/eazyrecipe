require "rails_helper"

RSpec.describe User, type: :model do 
  context "validation" do 
    it "should have first_name, last_name, email, password_digest and remember_digest" do

      should have_db_column(:first_name).of_type(:string)
      should have_db_column(:last_name).of_type(:string)
      should have_db_column(:email).of_type(:string)
      should have_db_column(:password_digest).of_type(:string)
      should have_db_column(:remember_digest).of_type(:string)
      end
    describe "validates the presence of attributes" do 
      it {is_expected.to validate_presence_of(:first_name)}
      it {is_expected.to validate_presence_of(:last_name)}
      it {is_expected.to validate_presence_of(:email)}
      it {is_expected.to validate_presence_of(:password)}
    end
    end

    context "association" do 
      it { is_expected.to have_many(:recipes)}
      it { is_expected.to have_many(:fridges)}
    end

end