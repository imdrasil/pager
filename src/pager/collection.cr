module Pager
  abstract class Collection
    # include Enumerable(T)

    getter current_page : Int32, per_page : Int32, total_size : Int32

    def initialize(@current_page, @per_page, @total_size)
      raise ArgumentError.new if @per_page < 1
      raise ArgumentError.new if @current_page < 0
    end

    abstract def collection

    def size
      collection.size
    end

    def each
      collection.each { |item| yield item }
    end

    def any?
      collection.any?
    end

    def pages
      (total_size / per_page.to_f).ceil.to_i
    end

    def last?
      current_page + 1 == pages || pages == 0
    end

    def first?
      current_page == 0
    end

    def self.empty(per_page = Pager.per_page)
      EmptyCollection.new(0, per_page, 0)
    end
  end

  class EmptyCollection < Collection
    def collection
      [] of String
    end
  end
end
