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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121127123646) do

  create_table "accounting_accounts", :force => true do |t|
    t.string   "name"
    t.boolean  "entrable"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "accounting_entries", :force => true do |t|
    t.integer  "number"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "accounting_entries_details", :force => true do |t|
    t.string   "account_id"
    t.boolean  "is_debe"
    t.string   "header_id"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "app_configs", :id => false, :force => true do |t|
    t.string   "id",         :limit => 36, :null => false
    t.string   "valor",      :limit => 36, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.datetime "deleted_at"
  end

  create_table "categorias", :id => false, :force => true do |t|
    t.string   "id",          :limit => 36,                     :null => false
    t.string   "nombre",      :limit => 36,                     :null => false
    t.string   "descripcion", :limit => 250,                    :null => false
    t.boolean  "vendible",                   :default => false, :null => false
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.datetime "deleted_at"
  end

  create_table "componentes", :id => false, :force => true do |t|
    t.string   "id",           :limit => 36,  :null => false
    t.string   "codigo",       :limit => 36,  :null => false
    t.integer  "precio",                      :null => false
    t.integer  "stock_minimo",                :null => false
    t.string   "nombre",       :limit => 36,  :null => false
    t.string   "descripcion",  :limit => 250, :null => false
    t.string   "categoria_id", :limit => 36,  :null => false
    t.string   "marca_id",     :limit => 36,  :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.datetime "deleted_at"
  end

  create_table "devoluciones_componentes", :id => false, :force => true do |t|
    t.string   "id",         :limit => 36,  :null => false
    t.integer  "numero",                    :null => false
    t.string   "motivo",     :limit => 250, :null => false
    t.string   "usuario_id", :limit => 36,  :null => false
    t.string   "estado_id",  :limit => 36,  :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.datetime "deleted_at"
  end

  create_table "devoluciones_componentes_detalles", :id => false, :force => true do |t|
    t.string   "id",                         :limit => 36, :null => false
    t.integer  "cantidad",                                 :null => false
    t.string   "devoluciones_componente_id", :limit => 36, :null => false
    t.string   "componente_id",              :limit => 36, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.datetime "deleted_at"
  end

  create_table "devoluciones_productos", :id => false, :force => true do |t|
    t.string   "id",         :limit => 36,  :null => false
    t.integer  "numero",                    :null => false
    t.string   "motivo",     :limit => 250, :null => false
    t.string   "usuario_id", :limit => 36,  :null => false
    t.string   "estado_id",  :limit => 36,  :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.datetime "deleted_at"
  end

  create_table "devoluciones_productos_detalles", :id => false, :force => true do |t|
    t.string   "id",                        :limit => 36, :null => false
    t.integer  "cantidad",                                :null => false
    t.string   "devoluciones_productos_id", :limit => 36, :null => false
    t.string   "producto_id",               :limit => 36, :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.datetime "deleted_at"
  end

  create_table "lca_acciones", :id => false, :force => true do |t|
    t.string   "id",         :limit => 36,                    :null => false
    t.boolean  "extra",                    :default => false, :null => false
    t.text     "simbolo",                                     :null => false
    t.string   "nombre",     :limit => 36,                    :null => false
    t.string   "entidad_id", :limit => 36
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.datetime "deleted_at"
  end

  create_table "lca_entidades", :id => false, :force => true do |t|
    t.string   "id",         :limit => 36, :null => false
    t.text     "const",                    :null => false
    t.text     "nombre",                   :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.datetime "deleted_at"
  end

  create_table "lca_permisos", :id => false, :force => true do |t|
    t.string   "id",         :limit => 36, :null => false
    t.boolean  "concedido",                :null => false
    t.string   "rol_id",     :limit => 36, :null => false
    t.string   "entidad_id", :limit => 36
    t.string   "accion_id",  :limit => 36, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.datetime "deleted_at"
  end

  create_table "lca_roles", :id => false, :force => true do |t|
    t.string   "id",         :limit => 36, :null => false
    t.string   "nombre",     :limit => 36, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.datetime "deleted_at"
  end

  create_table "marcas", :id => false, :force => true do |t|
    t.string   "id",          :limit => 36,  :null => false
    t.string   "descripcion", :limit => 250
    t.string   "nombre",      :limit => 36,  :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.datetime "deleted_at"
  end

  create_table "ordenes_producciones", :id => false, :force => true do |t|
    t.string   "id",         :limit => 36, :null => false
    t.integer  "numero",                   :null => false
    t.string   "estado_id",  :limit => 36, :null => false
    t.string   "usuario_id", :limit => 36, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.datetime "deleted_at"
  end

  create_table "ordenes_producciones_detalles", :id => false, :force => true do |t|
    t.string   "id",                    :limit => 36, :null => false
    t.integer  "cantidad",                            :null => false
    t.string   "producto_terminado_id", :limit => 36, :null => false
    t.string   "orden_produccion_id",   :limit => 36, :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.datetime "deleted_at"
  end

  create_table "pedidos_compras_componentes", :id => false, :force => true do |t|
    t.string   "id",         :limit => 36, :null => false
    t.integer  "numero",                   :null => false
    t.string   "estado_id",  :limit => 36, :null => false
    t.string   "usuario_id", :limit => 36, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.datetime "deleted_at"
  end

  create_table "pedidos_compras_componentes_detalles", :id => false, :force => true do |t|
    t.string   "id",                            :limit => 36, :null => false
    t.integer  "cantidad",                                    :null => false
    t.string   "pedidos_compras_componente_id", :limit => 36, :null => false
    t.string   "componente_id",                 :limit => 36, :null => false
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.datetime "deleted_at"
  end

  create_table "productos_terminados", :id => false, :force => true do |t|
    t.string   "id",           :limit => 36,  :null => false
    t.integer  "precio",                      :null => false
    t.string   "descripcion",  :limit => 250, :null => false
    t.integer  "stock_minimo",                :null => false
    t.string   "nombre",       :limit => 36,  :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.datetime "deleted_at"
  end

  create_table "productos_terminados_detalles", :id => false, :force => true do |t|
    t.string   "id",                    :limit => 36, :null => false
    t.integer  "cantidad",                            :null => false
    t.string   "componente_id",         :limit => 36, :null => false
    t.string   "producto_terminado_id", :limit => 36, :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.datetime "deleted_at"
  end

  create_table "solicitudes_componentes", :id => false, :force => true do |t|
    t.string   "id",         :limit => 36, :null => false
    t.integer  "numero",                   :null => false
    t.string   "estado_id",  :limit => 36, :null => false
    t.string   "usuario_id", :limit => 36, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.datetime "deleted_at"
  end

  create_table "solicitudes_componentes_detalles", :id => false, :force => true do |t|
    t.string   "id",                      :limit => 36, :null => false
    t.integer  "cantidad",                              :null => false
    t.string   "componente_id",           :limit => 36, :null => false
    t.string   "solicitud_componente_id", :limit => 36, :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.datetime "deleted_at"
  end

  create_table "solicitudes_transferencias_componentes", :id => false, :force => true do |t|
    t.string   "id",                  :limit => 36, :null => false
    t.integer  "numero",                            :null => false
    t.string   "estado_id",           :limit => 36, :null => false
    t.string   "usuario_id",          :limit => 36, :null => false
    t.string   "orden_produccion_id", :limit => 36
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.datetime "deleted_at"
  end

  create_table "solicitudes_transferencias_componentes_detalles", :id => false, :force => true do |t|
    t.string   "id",                                    :limit => 36, :null => false
    t.integer  "cantidad",                                            :null => false
    t.string   "solicitud_transferencia_componente_id", :limit => 36, :null => false
    t.string   "componente_id",                         :limit => 36, :null => false
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.datetime "deleted_at"
  end

  create_table "solicitudes_transferencias_productos", :id => false, :force => true do |t|
    t.string   "id",                  :limit => 36, :null => false
    t.integer  "numero",                            :null => false
    t.string   "estado_id",           :limit => 36, :null => false
    t.string   "usuario_id",          :limit => 36, :null => false
    t.string   "orden_produccion_id", :limit => 36, :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.datetime "deleted_at"
  end

  create_table "solicitudes_transferencias_productos_detalles", :id => false, :force => true do |t|
    t.string   "id",                                      :limit => 36, :null => false
    t.integer  "cantidad",                                              :null => false
    t.string   "solicitudes_transferencias_productos_id", :limit => 36, :null => false
    t.string   "producto_terminado_id",                   :limit => 36, :null => false
    t.string   "orden_produccion_detalle_id",             :limit => 36, :null => false
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.datetime "deleted_at"
  end

  create_table "stock_materias_primas", :id => false, :force => true do |t|
    t.string   "id",              :limit => 36, :null => false
    t.string   "componente_id",   :limit => 36, :null => false
    t.integer  "cantidad",                      :null => false
    t.integer  "precio_unitario",               :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.datetime "deleted_at"
  end

  create_table "stock_producciones", :id => false, :force => true do |t|
    t.string   "id",                         :limit => 36, :null => false
    t.integer  "cantidad_componente"
    t.integer  "cantidad_producto"
    t.string   "componente_id",              :limit => 36
    t.string   "producto_terminado_id",      :limit => 36
    t.integer  "precio_unitario_producto"
    t.integer  "precio_unitario_componente"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.datetime "deleted_at"
  end

  create_table "stock_productos_terminados", :id => false, :force => true do |t|
    t.string   "id",                         :limit => 36,  :null => false
    t.integer  "precio_unitario_producto"
    t.integer  "precio_unitario_componente"
    t.string   "cantidad_producto",          :limit => nil
    t.integer  "cantidad_componente"
    t.string   "producto_terminado_id",      :limit => 36
    t.string   "componente_id",              :limit => 36
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.datetime "deleted_at"
  end

  create_table "transacciones_estados", :id => false, :force => true do |t|
    t.string   "id",         :limit => 36, :null => false
    t.string   "nombre",     :limit => 36, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.datetime "deleted_at"
  end

  create_table "users", :id => false, :force => true do |t|
    t.string   "id",                     :limit => 36,                :null => false
    t.integer  "sign_in_count",                        :default => 0
    t.text     "encrypted_password",                                  :null => false
    t.text     "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.text     "current_sign_in_ip"
    t.text     "last_sign_in_ip"
    t.string   "email",                  :limit => 36,                :null => false
    t.string   "acl_role_id",            :limit => 36,                :null => false
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.datetime "deleted_at"
  end

  create_table "versions", :force => true do |t|
    t.string   "item_type",                :null => false
    t.string   "item_id",    :limit => 36, :null => false
    t.string   "event",                    :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

  add_foreign_key "componentes", "categorias", :name => "Refcategorias11"
  add_foreign_key "componentes", "marcas", :name => "Refmarcas92"

  add_foreign_key "devoluciones_componentes", "transacciones_estados", :name => "Reftransacciones_estados34", :column => "estado_id"
  add_foreign_key "devoluciones_componentes", "users", :name => "Refusers33", :column => "usuario_id"

  add_foreign_key "devoluciones_componentes_detalles", "componentes", :name => "Refcomponentes36"
  add_foreign_key "devoluciones_componentes_detalles", "devoluciones_componentes", :name => "Refdevoluciones_componentes35"

  add_foreign_key "devoluciones_productos", "transacciones_estados", :name => "Reftransacciones_estados39", :column => "estado_id"
  add_foreign_key "devoluciones_productos", "users", :name => "Refusers38", :column => "usuario_id"

  add_foreign_key "devoluciones_productos_detalles", "devoluciones_productos", :name => "Refdevoluciones_productos40", :column => "devoluciones_productos_id"
  add_foreign_key "devoluciones_productos_detalles", "productos_terminados", :name => "Refproductos_terminados41", :column => "producto_id"

  add_foreign_key "lca_acciones", "lca_entidades", :name => "Reflca_entidades91", :column => "entidad_id"

  add_foreign_key "lca_permisos", "lca_acciones", :name => "Reflca_acciones90", :column => "accion_id"
  add_foreign_key "lca_permisos", "lca_entidades", :name => "Reflca_entidades89", :column => "entidad_id"
  add_foreign_key "lca_permisos", "lca_roles", :name => "Reflca_roles88", :column => "rol_id"

  add_foreign_key "ordenes_producciones", "transacciones_estados", :name => "Reftransacciones_estados19", :column => "estado_id"
  add_foreign_key "ordenes_producciones", "users", :name => "Refusers31", :column => "usuario_id"

  add_foreign_key "ordenes_producciones_detalles", "ordenes_producciones", :name => "Refordenes_producciones18", :column => "orden_produccion_id"
  add_foreign_key "ordenes_producciones_detalles", "productos_terminados", :name => "Refproductos_terminados17", :column => "producto_terminado_id"

  add_foreign_key "pedidos_compras_componentes", "transacciones_estados", :name => "Reftransacciones_estados42", :column => "estado_id"
  add_foreign_key "pedidos_compras_componentes", "users", :name => "Refusers43", :column => "usuario_id"

  add_foreign_key "pedidos_compras_componentes_detalles", "componentes", :name => "Refcomponentes45"
  add_foreign_key "pedidos_compras_componentes_detalles", "pedidos_compras_componentes", :name => "Refpedidos_compras_componentes44"

  add_foreign_key "productos_terminados_detalles", "componentes", :name => "Refcomponentes8"
  add_foreign_key "productos_terminados_detalles", "productos_terminados", :name => "Refproductos_terminados9", :column => "producto_terminado_id"

  add_foreign_key "solicitudes_componentes", "transacciones_estados", :name => "Reftransacciones_estados15", :column => "estado_id"
  add_foreign_key "solicitudes_componentes", "users", :name => "Refusers32", :column => "usuario_id"

  add_foreign_key "solicitudes_componentes_detalles", "componentes", :name => "Refcomponentes14"
  add_foreign_key "solicitudes_componentes_detalles", "solicitudes_componentes", :name => "Refsolicitudes_componentes16", :column => "solicitud_componente_id"

  add_foreign_key "solicitudes_transferencias_componentes", "ordenes_producciones", :name => "Refordenes_producciones97", :column => "orden_produccion_id"
  add_foreign_key "solicitudes_transferencias_componentes", "transacciones_estados", :name => "Reftransacciones_estados26", :column => "estado_id"
  add_foreign_key "solicitudes_transferencias_componentes", "users", :name => "Refusers29", :column => "usuario_id"

  add_foreign_key "solicitudes_transferencias_componentes_detalles", "componentes", :name => "Refcomponentes28"
  add_foreign_key "solicitudes_transferencias_componentes_detalles", "solicitudes_transferencias_componentes", :name => "Refsolicitudes_transferencias_componentes27", :column => "solicitud_transferencia_componente_id"

  add_foreign_key "solicitudes_transferencias_productos", "ordenes_producciones", :name => "Refordenes_producciones46", :column => "orden_produccion_id"
  add_foreign_key "solicitudes_transferencias_productos", "transacciones_estados", :name => "Reftransacciones_estados21", :column => "estado_id"
  add_foreign_key "solicitudes_transferencias_productos", "users", :name => "Refusers30", :column => "usuario_id"

  add_foreign_key "solicitudes_transferencias_productos_detalles", "ordenes_producciones_detalles", :name => "Refordenes_producciones_detalles93", :column => "orden_produccion_detalle_id"
  add_foreign_key "solicitudes_transferencias_productos_detalles", "productos_terminados", :name => "Refproductos_terminados23", :column => "producto_terminado_id"
  add_foreign_key "solicitudes_transferencias_productos_detalles", "solicitudes_transferencias_productos", :name => "Refsolicitudes_transferencias_productos22", :column => "solicitudes_transferencias_productos_id"

  add_foreign_key "stock_materias_primas", "componentes", :name => "Refcomponentes4"

  add_foreign_key "stock_producciones", "componentes", :name => "Refcomponentes5"
  add_foreign_key "stock_producciones", "productos_terminados", :name => "Refproductos_terminados7", :column => "producto_terminado_id"

  add_foreign_key "stock_productos_terminados", "componentes", :name => "Refcomponentes95"
  add_foreign_key "stock_productos_terminados", "productos_terminados", :name => "Refproductos_terminados94", :column => "producto_terminado_id"

  add_foreign_key "users", "lca_roles", :name => "Reflca_roles96", :column => "acl_role_id"

end
