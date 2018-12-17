module Jennifer
  module QueryBuilder
    class ModelQuery(T)
      @limit : Int32?
      @offset : Int32?

      def rearrange
        @limit = nil
        @offset = nil
        self
      end

      def paginate(page : Int32, per_page : Int32 = Pager.per_page)
        Pager::JenniferCollection(T).new(offset(page * per_page).limit(per_page), page, per_page)
      end
    end
  end
end
