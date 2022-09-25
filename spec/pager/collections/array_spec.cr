require "../../spec_helper"

describe Pager::ArrayCollection do
  described_class = Pager::ArrayCollection

  describe ".new" do
    it do
      collection = described_class.new([1, 2, 3, 4, 5], 1, 2)
      collection.current_page.should eq(1)
      collection.per_page.should eq(2)
      collection.total_size.should eq(5)
    end
  end

  describe "#collection" do
    it do
      collection = array_collection(5, 2, 2)
      collection.collection.should eq([3, 4])
    end
  end

  describe "#size" do
    it do
      array_collection(21, 1, 8).size.should eq(8)
      array_collection(21, 3, 8).size.should eq(5)
    end
  end

  describe "#each" do
    it do
      result = [] of Int32
      array_collection(21).each { |element| result << element }
      result.should eq([1, 2, 3, 4, 5, 6, 7, 8])
    end
  end

  describe "#any?" do
    it do
      array_collection(21).any?.should be_true # ameba:disable Performance/AnyInsteadOfEmpty
    end

    it do
      described_class.new([] of Int32, 1, 8).any?.should be_false # ameba:disable Performance/AnyInsteadOfEmpty
    end
  end

  describe "#pages" do
    it do
      array_collection(21).pages.should eq(3)
    end
  end

  describe "#last?" do
    it do
      array_collection(21, 2).last?.should be_false
    end

    it do
      array_collection(21, 3).last?.should be_true
    end
  end

  describe "#first?" do
    it do
      array_collection(21, 2).first?.should be_false
    end

    it do
      array_collection(21, 1).first?.should be_true
    end
  end
end
