require 'rails_helper'

RSpec.describe Movie, type: :model do

  it "is not valid without title" do
    Movie.new(title: nil)
    expect(subject).to_not be_valid
  end

end
