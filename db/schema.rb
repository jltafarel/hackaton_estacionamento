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

ActiveRecord::Schema.define(version: 20141012023622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carros", force: true do |t|
    t.string   "placa"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "motorista_id"
  end

  add_index "carros", ["motorista_id"], name: "index_carros_on_motorista_id", using: :btree

  create_table "carros_motoristas", force: true do |t|
    t.integer  "motorista_id"
    t.integer  "carro_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carros_motoristas", ["carro_id"], name: "index_carros_motoristas_on_carro_id", using: :btree
  add_index "carros_motoristas", ["motorista_id"], name: "index_carros_motoristas_on_motorista_id", using: :btree

  create_table "estacionamentos", force: true do |t|
    t.integer  "motorista_id"
    t.integer  "carro_id"
    t.datetime "data_inicio"
    t.datetime "data_final"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "estacionamentos", ["carro_id"], name: "index_estacionamentos_on_carro_id", using: :btree
  add_index "estacionamentos", ["motorista_id"], name: "index_estacionamentos_on_motorista_id", using: :btree

  create_table "motorista", force: true do |t|
    t.string   "user"
    t.string   "password"
    t.string   "nome"
    t.decimal  "creditos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recargas", force: true do |t|
    t.date     "data"
    t.decimal  "valor"
    t.integer  "motorista_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recargas", ["motorista_id"], name: "index_recargas_on_motorista_id", using: :btree

end
