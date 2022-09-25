require "../../spec_helper"

describe Jennifer::QueryBuilder::ModelQuery do
  describe "#rearrange" do
    it do
      setup_records(5)
      User.all.offset(1).limit(1).rearrange.to_a.size.should eq(5)
    end
  end

  describe "#paginate" do
    it do
      records = setup_records(21)
      User.all.order(id: :asc).paginate(1).map(&.id).should eq(records[0...20].map(&.id))
    end

    it do
      records = setup_records(21)
      User.all.order(id: :asc).paginate(0).map(&.id).should eq(records[0...20].map(&.id))
    end

    it do
      records = setup_records(21)
      User.all.order(id: :asc).paginate(1, 5).map(&.id).should eq(records[0...5].map(&.id))
    end

    it do
      records = setup_records(21)
      User.all.order(id: :asc).paginate(2, 5).map(&.id).should eq(records[5...10].map(&.id))
    end

    it do
      records = setup_records(21)
      User.all.order(id: :asc).paginate(2).map(&.id).should eq(records[20..20].map(&.id))
    end
  end
end
