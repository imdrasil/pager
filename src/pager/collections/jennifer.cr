require "../jennifer/*"

module Pager
  class JenniferCollection(T) < Collection
    # NOTE: because of compiler bug here we can't use ins variable of generic type
    # getter query : Jennifer::QueryBuilder::ModelQuery(M)

    getter collection : Array(T)

    def initialize(query : Jennifer::QueryBuilder::ModelQuery(T), current_page, per_page)
      @collection = query.to_a
      super(current_page, per_page, query.clone.rearrange.reorder.count)
    end

    def self.empty(per_page = Pager.per_page)
      new(T.all.none, 1, per_page)
    end
  end
end
