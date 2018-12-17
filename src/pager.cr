require "i18n"

require "./pager/collection"
require "./pager/link_builder"
require "./pager/presenter"
require "./pager/presenters/bootstrap"
require "./pager/view_helper"

module Pager
  VERSION = "0.1.0"

  class_property default_presenter : Pager::Presenter.class = Bootstrap,
    link_builder : Pager::LinkBuilder.class = Pager::LinkBuilder,
    visible_pages = 7,
    per_page = 20

  def self.configure
    yield self
  end
end

I18n.load_path << File.join(__DIR__, "pager", "locale")
