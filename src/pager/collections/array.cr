module Pager
  class ArrayCollection(T) < Collection
    getter collection : Array(T)

    def initialize(array : Array(T), current_page, per_page)
      super(current_page, per_page, array.size)
      end_index = Math.min((current_page + 1) * per_page, array.size)
      start_index = Math.max(current_page * per_page, 0)
      @collection = array[start_index...end_index]
    end
  end
end

class Array(T)
  def paginate(page : Int32, per_page : Int32 = Pager.per_page)
    Pager::ArrayCollection.new(self, page, per_page)
  end
end
