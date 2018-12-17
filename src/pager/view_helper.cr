module Pager
  module ViewHelper
    def paginate(collection, path, visible_pages = Pager.visible_pages)
      Pager.default_presenter.new(collection, path, visible_pages).render
    end
  end
end
