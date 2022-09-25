require "../../spec_helper"

describe Pager::Bootstrap do
  described_class = Pager::Bootstrap
  path = "/"

  describe "#render" do
    context "with empty collection" do
      it do
        described_class.new(Pager::Collection.empty, path).should match_snippet("bootstrap_1_0_20")
      end
    end

    describe "the 1st page" do
      it do
        collection = array_collection(21, 1, 8)
        described_class.new(collection, path).should match_snippet("bootstrap_1_21_8")
      end
    end

    describe "the 2nd page" do
      it do
        collection = array_collection(100, 2, 8)
        described_class.new(collection, path, 5).should match_snippet("bootstrap_2_100_8")
      end
    end

    describe "the last page" do
      it do
        collection = array_collection(21, 3, 8)
        described_class.new(collection, path).should match_snippet("bootstrap_3_21_8")
      end
    end

    describe "in the middle far away from borders" do
      it do
        collection = array_collection(100, 6, 10)
        described_class.new(collection, path).should match_snippet("bootstrap_6_100_10")
      end
    end
  end
end
