require 'rails_helper'

describe Question do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.question_text = "What should we watch tonight?"
    subject.passcode = 9876
    expect(subject).to be_valid
  end

  it "is not valid without a question" do
    subject.passcode = 9876
    expect(subject).to_not be_valid
  end

  it "is not valid without a passcode" do
    subject.question_text = "What should we watch tonight?"
    expect(subject).to_not be_valid
  end

  it "is not valid when passcode is the wrong length" do
    subject.question_text = "What should we watch tonight?"
    subject.passcode = 987611
    expect(subject).to_not be_valid
  end

  it "is not valid when passcode contains non-numbers" do
    subject.question_text = "What should we watch tonight?"
    subject.passcode = 98.6
    expect(subject).to_not be_valid
  end
end
