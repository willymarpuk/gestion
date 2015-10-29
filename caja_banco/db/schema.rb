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

ActiveRecord::Schema.define(version: 20151028224654) do

  create_table "bancos", force: true do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.integer  "telefono"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sucursal"
    t.integer  "pais_id"
    t.integer  "departamento_id"
    t.integer  "ciudad_id"
    t.string   "correo"
  end

  add_index "bancos", ["ciudad_id"], name: "index_bancos_on_ciudad_id"
  add_index "bancos", ["departamento_id"], name: "index_bancos_on_departamento_id"
  add_index "bancos", ["pais_id"], name: "index_bancos_on_pais_id"

  create_table "cheques_entrantes", force: true do |t|
    t.integer  "banco_id"
    t.integer  "numero"
    t.date     "fecha"
    t.decimal  "monto"
    t.string   "concepto"
    t.integer  "persona_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cheques_entrantes", ["banco_id"], name: "index_cheques_entrantes_on_banco_id"
  add_index "cheques_entrantes", ["persona_id"], name: "index_cheques_entrantes_on_persona_id"

  create_table "ciudades", force: true do |t|
    t.string   "descripcion"
    t.integer  "codigo_postal"
    t.integer  "departamento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ciudades", ["departamento_id"], name: "index_ciudades_on_departamento_id"

  create_table "cuentas_bancarias", force: true do |t|
    t.integer  "banco_id"
    t.integer  "numero_cuenta"
    t.date     "fecha_apertura"
    t.decimal  "saldo"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cuentas_bancarias", ["banco_id"], name: "index_cuentas_bancarias_on_banco_id"
  add_index "cuentas_bancarias", ["estado_id"], name: "index_cuentas_bancarias_on_estado_id"

  create_table "departamentos", force: true do |t|
    t.string   "descripcion"
    t.integer  "pais_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departamentos", ["pais_id"], name: "index_departamentos_on_pais_id"

  create_table "estados", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "firmantes", force: true do |t|
    t.integer  "cuenta_bancaria_id"
    t.integer  "persona_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "firmantes", ["cuenta_bancaria_id"], name: "index_firmantes_on_cuenta_bancaria_id"
  add_index "firmantes", ["persona_id"], name: "index_firmantes_on_persona_id"

  create_table "paises", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personas", force: true do |t|
    t.integer  "tipo_de_persona_id"
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "telefono"
    t.integer  "cedula_identidad"
    t.integer  "pais_id"
    t.integer  "departamento_id"
    t.integer  "ciudad_id"
    t.string   "direccion"
    t.date     "fecha_de_nacimiento"
    t.string   "correo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "personas", ["ciudad_id"], name: "index_personas_on_ciudad_id"
  add_index "personas", ["departamento_id"], name: "index_personas_on_departamento_id"
  add_index "personas", ["pais_id"], name: "index_personas_on_pais_id"
  add_index "personas", ["tipo_de_persona_id"], name: "index_personas_on_tipo_de_persona_id"

  create_table "tipos_de_movimientos", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos_de_personas", force: true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
