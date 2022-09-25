module Pager
  abstract class Collection
    getter current_page : Int32, per_page : Int32, total_size : Int32

    def initialize(@current_page, @per_page, @total_size)
      raise ArgumentError.new if @per_page < 1

      @current_page = 1 if @current_page < 1
    end

    abstract def collection

    def size
      collection.size
    end

    def each
      collection.each { |item| yield item }
    end

    def map
      collection.map { |item| yield item }
    end

    def to_a
      collection
    end

    def any? : Bool
      collection.any? # ameba:disable Performance/AnyInsteadOfEmpty
    end

    def any? : Bool
      collection.any? { |item| yield item }
    end

    def empty? : Bool
      collection.empty?
    end

    def pages : Int32
      (total_size / per_page.to_f).ceil.to_i
    end

    def last? : Bool
      current_page == pages || pages == 0
    end

    def first? : Bool
      current_page == 1
    end

    def self.empty(per_page = Pager.per_page)
      EmptyCollection.new(1, per_page, 0)
    end
  end

  class EmptyCollection < Collection
    def collection
      [] of String
    end
  end
end
