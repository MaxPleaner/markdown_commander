require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database  => "dqlite:database.db"
)

begin
ActiveRecord::Schema.define do
    create_table :albums do |table|
        table.column :title, :string
        table.column :performer, :string
    end

    create_table :tracks do |table|
        table.column :album_id, :integer
        table.column :track_number, :integer
        table.column :title, :string
    end
end
rescue ActiveRecord::StatementInvalid => e
  super unless e.message.include? "already exists: CREATE TABLE"
end

class Album < ActiveRecord::Base
    has_many :tracks
end
