# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_13_144302) do

  create_table "exchange_histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "products_storehouse_id"
    t.integer "amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_exchange_histories_on_product_id"
    t.index ["products_storehouse_id"], name: "index_exchange_histories_on_products_storehouse_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "storehouse_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "amount", default: 0
    t.index ["storehouse_id", "name"], name: "index_products_on_storehouse_id_and_name", unique: true
    t.index ["storehouse_id"], name: "index_products_on_storehouse_id"
  end

  create_table "products_storehouses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "source_storehouse_id"
    t.bigint "target_storehouse_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["source_storehouse_id"], name: "index_products_storehouses_on_source_storehouse_id"
    t.index ["target_storehouse_id"], name: "index_products_storehouses_on_target_storehouse_id"
  end

  create_table "storehouses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_storehouses_on_name", unique: true
  end

end
