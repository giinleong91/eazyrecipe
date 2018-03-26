require "rails_helper"

RSpec.describe Recipe, type: :model do 
  context "validation" do 
    it "should have title, user_id, description, video and image" do

      should have_db_column(:title).of_type(:string)
      should have_db_column(:user_id).of_type(:integer)
      should have_db_column(:description).of_type(:string)
      should have_db_column(:video).of_type(:string)
      should have_db_column(:image).of_type(:string)
      end
    describe "validates the presence of attributes" do 
      it {is_expected.to validate_presence_of(:title)}
      it {is_expected.to validate_presence_of(:description)}
      it {is_expected.to validate_presence_of(:video)}
      it {is_expected.to validate_presence_of(:image)}
    end
    end

    context "association" do 
      it { is_expected.to belong_to(:user)}
      it { is_expected.to have_many(:ingredients)}
      it { is_expected.to have_many(:directions)}
    end

end