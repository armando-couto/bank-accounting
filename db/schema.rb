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

ActiveRecord::Schema.define(version: 2019_06_22_200542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "number"
    t.decimal "balance", precision: 10, scale: 4
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_accounts_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moviment_0031102539", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_0460503590", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_0507351025", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_0521580603", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_0666139980", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_0935446900", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_0988822112", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_1065142752", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_1312820157", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_1457422990", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_1615368219", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_1669280979", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_1679906938", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_1787940627", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_1803400067", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_1909026463", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_2192509466", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_2383518920", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_2452088740", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_2507948973", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_2643595528", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_2958406557", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_3278817585", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_3480918816", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_3574080220", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_3697342993", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_4265091343", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_4467786963", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_4544559677", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_4713322733", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_5044948119", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_5306318834", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_5347179261", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_5373212072", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_6214316222", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_6424487375", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_7092102266", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_7654053605", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_7663026106", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_7787860942", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_7892527161", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_8156206279", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_8205300190", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_8326637838", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_8416338609", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_8539723286", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_8946062921", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_9086377029", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_9283797793", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_9337444410", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  create_table "moviment_9865404433", force: :cascade do |t|
    t.string "description"
    t.string "route"
    t.decimal "amount", precision: 10, scale: 4
    t.string "observation"
    t.datetime "created_at", null: false
  end

  add_foreign_key "accounts", "clients"
end
