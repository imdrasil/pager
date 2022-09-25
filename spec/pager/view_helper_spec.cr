require "../spec_helper"

class ViewMock
  extend Pager::ViewHelper

  def self.action(*args)
    paginate(*args)
  end
end

describe Pager::ViewHelper do
  describe "#paginate" do
    it do
      collection = Pager::ArrayCollection.new((1..21).to_a, 2, 8)
      ViewMock.action(collection, "/").should match_snippet("bootstrap_2_21_8")
    end
  end
end
