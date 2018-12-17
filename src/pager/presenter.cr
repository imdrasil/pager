module Pager
  abstract class Presenter
    getter collection : Collection, path : String, pages : Int32
    private getter link_builder : LinkBuilder

    def initialize(@collection, @path, @pages = Pager.visible_pages)
      @link_builder = Pager.link_builder.new(@path)
    end

    abstract def render

    def each_page
      window = visible_window
      window[:left].upto(window[:right]) do |index|
        yield index
      end
    end

    def previous_label
      I18n.translate("pager.previous_label")
    end

    def next_label
      I18n.translate("pager.next_label")
    end

    private def visible_window
      left_index = collection.current_page - half_visible_pages
      right_index = collection.current_page + half_visible_pages

      if left_index < 0
        right_index = Math.min(collection.pages - 1, right_index - left_index)
        left_index = 0
      end

      if right_index >= collection.pages
        left_index = Math.max(0, left_index - (right_index - collection.pages + 1))
        right_index = collection.pages - 1
      end
      {left: left_index, right: right_index}
    end

    private def half_visible_pages
      pages / 2
    end

    private def build_page_path(page : Int32, skip : Bool)
      if skip
        link_builder.build_disabled
      else
        link_builder.build(page)
      end
    end
  end
end
