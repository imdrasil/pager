require "../spec_helper"

describe Pager::Collection do
  describe ".empty" do
    it do
      (!Pager::Collection.empty.empty?).should be_false
    end

    it do
      Pager::Collection.empty.per_page.should eq(20)
    end
  end
end
