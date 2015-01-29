# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150129001158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "pg_trgm"
  enable_extension "citext"
  enable_extension "fuzzystrmatch"
  enable_extension "intarray"
  enable_extension "xml2"
  enable_extension "uuid-ossp"
  enable_extension "btree_gist"
  enable_extension "pgcrypto"
  enable_extension "btree_gin"
  enable_extension "cube"
  enable_extension "dict_int"
  enable_extension "dblink"
  enable_extension "pgrowlocks"
  enable_extension "ltree"
  enable_extension "dict_xsyn"
  enable_extension "unaccent"
  enable_extension "tablefunc"
  enable_extension "earthdistance"
  enable_extension "pgstattuple"
  enable_extension "pg_stat_statements"
  enable_extension "plv8"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
