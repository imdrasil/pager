require "../spec_helper"

class DummyPresenter < Pager::Presenter
  def render
    ""
  end
end

describe Pager::Presenter do
  describe "#each_page" do
    describe "the first page" do
      it do
        indexes = [] of Int32
        DummyPresenter.new(array_collection(25), "/", 3).each_page { |index| indexes << index }
        indexes.should eq([1, 2, 3])
      end
    end

    describe "the last page" do
      it do
        indexes = [] of Int32
        DummyPresenter.new(array_collection(25, 3), "/", 3).each_page { |index| indexes << index }
        indexes.should eq([2, 3, 4])
      end
    end

    describe "in the middle" do
      it do
        indexes = [] of Int32
        DummyPresenter.new(array_collection(100, 5), "/", 3).each_page { |index| indexes << index }
        indexes.should eq([4, 5, 6])
      end
    end
  end

  describe "#previous_label" do
    it do
      DummyPresenter.new(array_collection(21), "/", 3).previous_label.should eq("&lsaquo; Previous")
    end
  end

  describe "#next_label" do
    it do
      DummyPresenter.new(array_collection(21), "/", 3).next_label.should eq("Next &rsaquo;")
    end
  end
end
