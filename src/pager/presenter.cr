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

      if left_index < 1
        right_index = Math.min(collection.pages, right_index - left_index + 1)
        left_index = 1
      elsif right_index > collection.pages
        left_index = Math.max(1, left_index - (right_index - collection.pages))
        right_index = collection.pages
      end
      {left: left_index, right: right_index}
    end

    private def half_visible_pages
      pages // 2
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
