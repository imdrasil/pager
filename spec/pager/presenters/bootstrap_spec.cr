require "../../spec_helper"

describe Pager::Bootstrap do
  described_class = Pager::Bootstrap
  empty_collection = Pager::Collection.empty()
  path = "/"

  describe "#render" do
    context "with empty collection" do
      it do
        described_class.new(Pager::Collection.empty, path).should match_snippet("bootstrap_0_0_20")
      end
    end

    describe "the 1st page" do
      it do
        collection = Pager::ArrayCollection.new((1..21).to_a, 0, 8)
        described_class.new(collection, path).should match_snippet("bootstrap_0_21_8")
      end
    end

    describe "the 2nd page" do
      it do
        collection = array_collection(100, 1, 8)
        described_class.new(collection, path, 5).should match_snippet("bootstrap_1_100_8")
      end
    end

    describe "the last page" do
      it do
        collection = Pager::ArrayCollection.new((1..21).to_a, 2, 8)
        described_class.new(collection, path).should match_snippet("bootstrap_2_21_8")
      end
    end

    describe "in the middle far away from borders" do
      it do
        collection = Pager::ArrayCollection.new((1..100).to_a, 5, 10)
        described_class.new(collection, path).should match_snippet("bootstrap_5_100_10")
      end
    end
  end
end
