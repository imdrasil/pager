require "../spec_helper"

describe Pager::Collection do
  describe ".empty" do
    it do
      Pager::Collection.empty.any?.should be_false
    end

    it do
      Pager::Collection.empty.per_page.should eq(20)
    end
  end
end
