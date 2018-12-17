require "../presenter"

module Pager
  class Bootstrap < Presenter
    DISABLED_CLASS = "disabled"

    def render
      String.build do |io|
        io << "<nav><ul class='pagination'>"
        previous_page(io)
        visible_pages(io)
        next_page(io)
        io << "</ul></nav>"
      end
    end

    private def visible_pages(io)
      each_page do |index|
        disabled = index == collection.current_page
        page_item(io, index + 1, build_page_path(index, disabled), disabled)
      end
    end

    private def previous_page(io)
      io << %(<li class="page-item #{DISABLED_CLASS if collection.first?}">)
      io << %(<a class="page-link" href=")
      io << build_page_path(collection.current_page - 1, collection.first?)
      io << %(" aria-label="Previous">)
      io << %(<span class="sr-only">)
      io << previous_label
      io << %(</span>)
      io << %(</a>)
      io << %(</li>)
    end

    private def next_page(io)
      io << %(<li class="page-item #{DISABLED_CLASS if collection.last?}">)
      io << %(<a class="page-link" href=")
      io << build_page_path(collection.current_page + 1, collection.last?)
      io << %(" aria-label="Previous">)
      io << %(<span class="sr-only">)
      io << next_label
      io << %(</span>)
      io << %(</a>)
      io << %(</li>)
    end

    private def page_item(io, value, path : String, disabled : Bool)
      io << "<li class='page-item "
      io << DISABLED_CLASS if disabled
      io << "'><a class='page-link' href='"
      io << path
      io << "'>"
      io << value
      io << "</a></li>"
    end
  end
end
