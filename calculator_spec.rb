require_relative 'calculator'
require 'rspec'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  it "returns 0 for an empty string" do
    expect(calculator.add("")).to eq(0)
  end

  it "returns number itself when a single number is passed" do
    expect(calculator.add("1")).to eq(1)
  end

  it "returns sum of two numbers separated by comma" do
    expect(calculator.add("1,5")).to eq(6)
  end

  it "returns sum for multiple comma-separated numbers" do
    expect(calculator.add("1,2,3,4")).to eq(10)
  end

  it "handles newline characters between numbers" do
    expect(calculator.add("1\n2,3")).to eq(6)
  end

  it "supports custom single-character delimiter" do
    expect(calculator.add("//;\n1;2")).to eq(3)
  end

  it "raises an exception for negative numbers" do
    expect { calculator.add("1,-2,3,-5") }.to raise_error("negative numbers not allowed -2,-5")
  end
end
