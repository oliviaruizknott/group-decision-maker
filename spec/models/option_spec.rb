require 'rails_helper'

describe Option do
  question = FactoryGirl.create(:question)

  it "has a valid factory" do
    factory = FactoryGirl.create(:option, question: question)
    expect(factory).to be_valid
  end

  it "is valid without notes" do
    option = FactoryGirl.create(:option, notes: nil, question: question)
    expect(option).to be_valid
  end

  it "is not valid without option text" do
    option = FactoryGirl.build(:option, text: nil, question: question)
    expect(option).to_not be_valid
  end

  it "is not valid without an associated question" do
    option = FactoryGirl.build(:option)
    expect(option).to_not be_valid
  end
end
