require "jennifer"
require "jennifer_sqlite3_adapter"

def setup_jennifer
  Jennifer::Config.configure do |conf|
    conf.user = "anyuser"
    conf.password = "anypassword"
    conf.host = "./"
    conf.adapter = "sqlite3"
    conf.db = "test.db"
    conf.migration_files_path = "./spec/support/migrations"
    conf.logger.level = :info
    conf.verbose_migrations = false
  end
end

setup_jennifer
