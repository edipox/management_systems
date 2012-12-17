--
-- ER/Studio 7.5 SQL Code Generation
-- Company :      uni
-- Project :      TO_EXPORT.DM1
-- Author :       Pablo
--
-- Date Created : Monday, December 17, 2012 15:28:52
-- Target DBMS : PostgreSQL 8.0
--

-- 
-- TABLE: app_configs 
--

CREATE TABLE app_configs(
    id       varchar(150)    NOT NULL,
    valor    char(36)        NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: asientos 
--

CREATE TABLE asientos(
    id              char(36)        NOT NULL,
    numero          int4            NOT NULL,
    descripcion     varchar(250)    NOT NULL,
    ejercicio_id    char(36)        NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: asientos_detalles 
--

CREATE TABLE asientos_detalles(
    id            char(36)    NOT NULL,
    importe       int4        NOT NULL,
    id_asiento    char(36)    NOT NULL,
    cuenta_id     char(36)    NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: balances_generales 
--

CREATE TABLE balances_generales(
    id                             char(36)       NOT NULL,
    total_sumas_debitos            int4           NOT NULL,
    total_sumas_creditos           int4           NOT NULL,
    total_saldos_deudor            int4           NOT NULL,
    total_saldos_acreedor          int4           NOT NULL,
    total_ajustes_debe             int4           NOT NULL,
    total_ajustes_haber            int4           NOT NULL,
    total_ajustados_deudor         int4           NOT NULL,
    total_ajustados_acreedor       int4           NOT NULL,
    total_patrimonial_activo       int4           NOT NULL,
    total_patrimonial_pasivo_pn    int4           NOT NULL,
    total_resultados_perdidas      char(36)       NOT NULL,
    resultados_ganancias           char(36)       NOT NULL,
    fecha_fin                      date           NOT NULL,
    numero                         int4           NOT NULL,
    descripcion                    varchar(45),
    fecha_inicio                   date           NOT NULL,
    ejercicio_id                   char(36)       NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: balances_generales_detalles 
--

CREATE TABLE balances_generales_detalles(
    id                       char(36)       NOT NULL,
    sumas_debitos            int4           NOT NULL,
    sumas_creditos           int4           NOT NULL,
    saldos_deudor            int4           NOT NULL,
    saldos_acreedor          int4           NOT NULL,
    ajustes_debe             int4           NOT NULL,
    ajustes_haber            int4           NOT NULL,
    ajustados_deudor         int4           NOT NULL,
    ajustados_acreedor       int4           NOT NULL,
    patrimonial_activo       int4           NOT NULL,
    patrimonial_pasivo_pn    int4           NOT NULL,
    resultados_perdidas      char(36)       NOT NULL,
    resultados_ganancias     char(36)       NOT NULL,
    fecha_fin                date           NOT NULL,
    numero                   int4           NOT NULL,
    descripcion              varchar(45),
    fecha_inicio             date           NOT NULL,
    balance_id               char(36)       NOT NULL,
    mayor_id                 char(36)       NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: categorias 
--

CREATE TABLE categorias(
    id             char(36)        NOT NULL,
    nombre         char(36)        NOT NULL,
    descripcion    varchar(250)    NOT NULL,
    vendible       boolean         DEFAULT false NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: componentes 
--

CREATE TABLE componentes(
    id              char(36)     NOT NULL,
    codigo          char(36)     NOT NULL,
    precio          int4         NOT NULL,
    stock_minimo    int4         NOT NULL,
    nombre          char(36)     NOT NULL,
    descripcion     char(250)    NOT NULL,
    categoria_id    char(36)     NOT NULL,
    marca_id        char(36)     NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: cuentas_contables 
--

CREATE TABLE cuentas_contables(
    id                    char(36)        NOT NULL,
    asentable             boolean         DEFAULT false NOT NULL,
    nombre                varchar(100)    NOT NULL,
    tipo                  char(1)         NOT NULL,
    cuenta_superior_id    char(36),
    numero                int4            NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: devoluciones_componentes 
--

CREATE TABLE devoluciones_componentes(
    id            char(36)        NOT NULL,
    numero        int4            NOT NULL,
    motivo        varchar(250)    NOT NULL,
    usuario_id    char(36)        NOT NULL,
    estado_id     char(36)        NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: devoluciones_componentes_detalles 
--

CREATE TABLE devoluciones_componentes_detalles(
    id                             char(36)    NOT NULL,
    cantidad                       int4        NOT NULL,
    devoluciones_componentes_id    char(36)    NOT NULL,
    componente_id                  char(36)    NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: devoluciones_productos 
--

CREATE TABLE devoluciones_productos(
    id            char(36)        NOT NULL,
    numero        int4            NOT NULL,
    motivo        varchar(250)    NOT NULL,
    usuario_id    char(36)        NOT NULL,
    estado_id     char(36)        NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: devoluciones_productos_detalles 
--

CREATE TABLE devoluciones_productos_detalles(
    id                           char(36)    NOT NULL,
    cantidad                     int4        NOT NULL,
    devoluciones_productos_id    char(36)    NOT NULL,
    producto_id                  char(36)    NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: ejercicios_contables 
--

CREATE TABLE ejercicios_contables(
    id              char(36)    NOT NULL,
    fecha_inicio    date        NOT NULL,
    fecha_fin       date        NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: lca_acciones 
--

CREATE TABLE lca_acciones(
    id            char(36)    NOT NULL,
    extra         boolean     DEFAULT false NOT NULL,
    simbolo       text        NOT NULL,
    nombre        char(36)    NOT NULL,
    entidad_id    char(36),
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: lca_entidades 
--

CREATE TABLE lca_entidades(
    id        char(36)    NOT NULL,
    const     text        NOT NULL,
    nombre    text        NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: lca_permisos 
--

CREATE TABLE lca_permisos(
    id            char(36)    NOT NULL,
    concedido     boolean     NOT NULL,
    rol_id        char(36)    NOT NULL,
    entidad_id    char(36),
    accion_id     char(36)    NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: lca_roles 
--

CREATE TABLE lca_roles(
    id        char(36)    NOT NULL,
    nombre    char(36)    NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: libros_mayor 
--

CREATE TABLE libros_mayor(
    id              char(36)    NOT NULL,
    numero          int4        NOT NULL,
    fecha_inicio    date        NOT NULL,
    fecha_fin       date        NOT NULL,
    ejercicio_id    char(36)    NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: marcas 
--

CREATE TABLE marcas(
    id             char(36)        NOT NULL,
    descripcion    varchar(250),
    nombre         char(36)        NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: mayor_registros 
--

CREATE TABLE mayor_registros(
    id                char(36)    NOT NULL,
    total_debe        int4        NOT NULL,
    tota_haber        int4        NOT NULL,
    saldo_debe        int4        NOT NULL,
    saldo_haber       int4        NOT NULL,
    cuenta_id         char(36)    NOT NULL,
    lirbo_mayor_id    char(36)    NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: mayor_registros_detalles 
--

CREATE TABLE mayor_registros_detalles(
    id                    char(36)    NOT NULL,
    asiento_detalle_id    char(36)    NOT NULL,
    libro_mayor_id        char(36)    NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: ordenes_producciones 
--

CREATE TABLE ordenes_producciones(
    id            char(36)    NOT NULL,
    numero        int4        NOT NULL,
    estado_id     char(36)    NOT NULL,
    usuario_id    char(36)    NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: ordenes_producciones_detalles 
--

CREATE TABLE ordenes_producciones_detalles(
    id                       char(36)    NOT NULL,
    cantidad                 int4        NOT NULL,
    producto_terminado_id    char(36)    NOT NULL,
    orden_produccion_id      char(36)    NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: pedidos_compras_componentes 
--

CREATE TABLE pedidos_compras_componentes(
    id            char(36)    NOT NULL,
    numero        int4        NOT NULL,
    estado_id     char(36)    NOT NULL,
    usuario_id    char(36)    NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: pedidos_compras_componentes_detalles 
--

CREATE TABLE pedidos_compras_componentes_detalles(
    id                                char(36)    NOT NULL,
    cantidad                          int4        NOT NULL,
    pedidos_compras_componentes_id    char(36)    NOT NULL,
    componente_id                     char(36)    NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: productos_terminados 
--

CREATE TABLE productos_terminados(
    id              char(36)        NOT NULL,
    precio          int4            NOT NULL,
    descripcion     varchar(250)    NOT NULL,
    stock_minimo    int4            NOT NULL,
    nombre          char(36)        NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: productos_terminados_detalles 
--

CREATE TABLE productos_terminados_detalles(
    id                       char(36)    NOT NULL,
    cantidad                 int4        NOT NULL,
    componente_id            char(36)    NOT NULL,
    producto_terminado_id    char(36)    NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: solicitudes_componentes 
--

CREATE TABLE solicitudes_componentes(
    id            char(36)    NOT NULL,
    numero        int4        NOT NULL,
    estado_id     char(36)    NOT NULL,
    usuario_id    char(36)    NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: solicitudes_componentes_detalles 
--

CREATE TABLE solicitudes_componentes_detalles(
    id                          char(36)    NOT NULL,
    cantidad                    int4        NOT NULL,
    componente_id               char(36)    NOT NULL,
    solicitud_componentes_id    char(36)    NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: solicitudes_transferencias_componentes 
--

CREATE TABLE solicitudes_transferencias_componentes(
    id                             char(36)    NOT NULL,
    numero                         int4        NOT NULL,
    estado_id                      char(36)    NOT NULL,
    usuario_id                     char(36)    NOT NULL,
    orden_produccion_detalle_id    char(36),
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: solicitudes_transferencias_componentes_detalles 
--

CREATE TABLE solicitudes_transferencias_componentes_detalles(
    id                                        char(36)    NOT NULL,
    cantidad                                  int4        NOT NULL,
    solicitud_transferencia_componentes_id    char(36)    NOT NULL,
    componente_id                             char(36)    NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: solicitudes_transferencias_productos 
--

CREATE TABLE solicitudes_transferencias_productos(
    id                     char(36)    NOT NULL,
    numero                 int4        NOT NULL,
    estado_id              char(36)    NOT NULL,
    usuario_id             char(36)    NOT NULL,
    orden_produccion_id    char(36)    NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: solicitudes_transferencias_productos_detalles 
--

CREATE TABLE solicitudes_transferencias_productos_detalles(
    id                                         char(36)    NOT NULL,
    cantidad                                   int4        NOT NULL,
    solicitudes_transferencias_productos_id    char(36)    NOT NULL,
    producto_terminado_id                      char(36)    NOT NULL,
    orden_produccion_detalle_id                char(36)    NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: stock_materias_primas 
--

CREATE TABLE stock_materias_primas(
    id                 char(36)    NOT NULL,
    componente_id      char(36)    NOT NULL,
    cantidad           int4        NOT NULL,
    precio_unitario    int4        NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: stock_producciones 
--

CREATE TABLE stock_producciones(
    id                            char(36)    NOT NULL,
    cantidad_componente           int4,
    cantidad_producto             int4,
    componente_id                 char(36),
    producto_terminado_id         char(36),
    precio_unitario_producto      int4,
    precio_unitario_componente    int4,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: stock_productos_terminados 
--

CREATE TABLE stock_productos_terminados(
    id                            char(36)    NOT NULL,
    precio_unitario_producto      int4,
    precio_unitario_componente    int4,
    cantidad_producto             int4,
    cantidad_componente           int4,
    producto_terminado_id         char(36),
    componente_id                 char(36),
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: transacciones_estados 
--

CREATE TABLE transacciones_estados(
    id        char(36)    NOT NULL,
    nombre    char(36)    NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: users 
--

CREATE TABLE users(
    id                        char(36)     NOT NULL,
    sign_in_count             int4         DEFAULT 0,
    encrypted_password        text         NOT NULL,
    reset_password_token      text,
    reset_password_sent_at    timestamp,
    remember_created_at       timestamp,
    current_sign_in_at        timestamp,
    last_sign_in_at           timestamp,
    current_sign_in_ip        text,
    last_sign_in_ip           text,
    email                     char(36)     NOT NULL,
    acl_role_id               char(36)     NOT NULL,
    created_at timestamp         NOT NULL,
    updated_at timestamp         NOT NULL,
    deleted_at timestamp
)
;




-- 
-- TABLE: app_configs 
--

ALTER TABLE app_configs ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: asientos 
--

ALTER TABLE asientos ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: asientos_detalles 
--

ALTER TABLE asientos_detalles ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: balances_generales 
--

ALTER TABLE balances_generales ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: balances_generales_detalles 
--

ALTER TABLE balances_generales_detalles ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: categorias 
--

ALTER TABLE categorias ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: componentes 
--

ALTER TABLE componentes ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: cuentas_contables 
--

ALTER TABLE cuentas_contables ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: devoluciones_componentes 
--

ALTER TABLE devoluciones_componentes ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: devoluciones_componentes_detalles 
--

ALTER TABLE devoluciones_componentes_detalles ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: devoluciones_productos 
--

ALTER TABLE devoluciones_productos ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: devoluciones_productos_detalles 
--

ALTER TABLE devoluciones_productos_detalles ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: ejercicios_contables 
--

ALTER TABLE ejercicios_contables ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: lca_acciones 
--

ALTER TABLE lca_acciones ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: lca_entidades 
--

ALTER TABLE lca_entidades ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: lca_permisos 
--

ALTER TABLE lca_permisos ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: lca_roles 
--

ALTER TABLE lca_roles ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: libros_mayor 
--

ALTER TABLE libros_mayor ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: marcas 
--

ALTER TABLE marcas ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: mayor_registros 
--

ALTER TABLE mayor_registros ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: mayor_registros_detalles 
--

ALTER TABLE mayor_registros_detalles ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: ordenes_producciones 
--

ALTER TABLE ordenes_producciones ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: ordenes_producciones_detalles 
--

ALTER TABLE ordenes_producciones_detalles ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: pedidos_compras_componentes 
--

ALTER TABLE pedidos_compras_componentes ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: pedidos_compras_componentes_detalles 
--

ALTER TABLE pedidos_compras_componentes_detalles ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: productos_terminados 
--

ALTER TABLE productos_terminados ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: productos_terminados_detalles 
--

ALTER TABLE productos_terminados_detalles ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: solicitudes_componentes 
--

ALTER TABLE solicitudes_componentes ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: solicitudes_componentes_detalles 
--

ALTER TABLE solicitudes_componentes_detalles ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: solicitudes_transferencias_componentes 
--

ALTER TABLE solicitudes_transferencias_componentes ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: solicitudes_transferencias_componentes_detalles 
--

ALTER TABLE solicitudes_transferencias_componentes_detalles ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: solicitudes_transferencias_productos 
--

ALTER TABLE solicitudes_transferencias_productos ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: solicitudes_transferencias_productos_detalles 
--

ALTER TABLE solicitudes_transferencias_productos_detalles ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: stock_materias_primas 
--

ALTER TABLE stock_materias_primas ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: stock_producciones 
--

ALTER TABLE stock_producciones ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: stock_productos_terminados 
--

ALTER TABLE stock_productos_terminados ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: transacciones_estados 
--

ALTER TABLE transacciones_estados ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: users 
--

ALTER TABLE users ADD 
    PRIMARY KEY (id)
;

-- 
-- TABLE: asientos 
--

ALTER TABLE asientos ADD CONSTRAINT "Refejercicios_contables102" 
    FOREIGN KEY (ejercicio_id)
    REFERENCES ejercicios_contables(id)
;


-- 
-- TABLE: asientos_detalles 
--

ALTER TABLE asientos_detalles ADD CONSTRAINT "Refasientos100" 
    FOREIGN KEY (id_asiento)
    REFERENCES asientos(id)
;

ALTER TABLE asientos_detalles ADD CONSTRAINT "Refcuentas_contables101" 
    FOREIGN KEY (cuenta_id)
    REFERENCES cuentas_contables(id)
;


-- 
-- TABLE: balances_generales 
--

ALTER TABLE balances_generales ADD CONSTRAINT "Refejercicios_contables111" 
    FOREIGN KEY (ejercicio_id)
    REFERENCES ejercicios_contables(id)
;


-- 
-- TABLE: balances_generales_detalles 
--

ALTER TABLE balances_generales_detalles ADD CONSTRAINT "Refbalances_generales112" 
    FOREIGN KEY (balance_id)
    REFERENCES balances_generales(id)
;

ALTER TABLE balances_generales_detalles ADD CONSTRAINT "Refmayor_registros118" 
    FOREIGN KEY (mayor_id)
    REFERENCES mayor_registros(id)
;


-- 
-- TABLE: componentes 
--

ALTER TABLE componentes ADD CONSTRAINT "Refmarcas92" 
    FOREIGN KEY (marca_id)
    REFERENCES marcas(id)
;

ALTER TABLE componentes ADD CONSTRAINT "Refcategorias11" 
    FOREIGN KEY (categoria_id)
    REFERENCES categorias(id)
;


-- 
-- TABLE: devoluciones_componentes 
--

ALTER TABLE devoluciones_componentes ADD CONSTRAINT "Refusers33" 
    FOREIGN KEY (usuario_id)
    REFERENCES users(id)
;

ALTER TABLE devoluciones_componentes ADD CONSTRAINT "Reftransacciones_estados34" 
    FOREIGN KEY (estado_id)
    REFERENCES transacciones_estados(id)
;


-- 
-- TABLE: devoluciones_componentes_detalles 
--

ALTER TABLE devoluciones_componentes_detalles ADD CONSTRAINT "Refdevoluciones_componentes35" 
    FOREIGN KEY (devoluciones_componentes_id)
    REFERENCES devoluciones_componentes(id)
;

ALTER TABLE devoluciones_componentes_detalles ADD CONSTRAINT "Refcomponentes36" 
    FOREIGN KEY (componente_id)
    REFERENCES componentes(id)
;


-- 
-- TABLE: devoluciones_productos 
--

ALTER TABLE devoluciones_productos ADD CONSTRAINT "Refusers38" 
    FOREIGN KEY (usuario_id)
    REFERENCES users(id)
;

ALTER TABLE devoluciones_productos ADD CONSTRAINT "Reftransacciones_estados39" 
    FOREIGN KEY (estado_id)
    REFERENCES transacciones_estados(id)
;


-- 
-- TABLE: devoluciones_productos_detalles 
--

ALTER TABLE devoluciones_productos_detalles ADD CONSTRAINT "Refdevoluciones_productos40" 
    FOREIGN KEY (devoluciones_productos_id)
    REFERENCES devoluciones_productos(id)
;

ALTER TABLE devoluciones_productos_detalles ADD CONSTRAINT "Refproductos_terminados41" 
    FOREIGN KEY (producto_id)
    REFERENCES productos_terminados(id)
;


-- 
-- TABLE: lca_acciones 
--

ALTER TABLE lca_acciones ADD CONSTRAINT "Reflca_entidades91" 
    FOREIGN KEY (entidad_id)
    REFERENCES lca_entidades(id)
;


-- 
-- TABLE: lca_permisos 
--

ALTER TABLE lca_permisos ADD CONSTRAINT "Reflca_roles88" 
    FOREIGN KEY (rol_id)
    REFERENCES lca_roles(id)
;

ALTER TABLE lca_permisos ADD CONSTRAINT "Reflca_entidades89" 
    FOREIGN KEY (entidad_id)
    REFERENCES lca_entidades(id)
;

ALTER TABLE lca_permisos ADD CONSTRAINT "Reflca_acciones90" 
    FOREIGN KEY (accion_id)
    REFERENCES lca_acciones(id)
;


-- 
-- TABLE: libros_mayor 
--

ALTER TABLE libros_mayor ADD CONSTRAINT "Refejercicios_contables114" 
    FOREIGN KEY (ejercicio_id)
    REFERENCES ejercicios_contables(id)
;


-- 
-- TABLE: mayor_registros 
--

ALTER TABLE mayor_registros ADD CONSTRAINT "Refcuentas_contables106" 
    FOREIGN KEY (cuenta_id)
    REFERENCES cuentas_contables(id)
;

ALTER TABLE mayor_registros ADD CONSTRAINT "Reflibros_mayor116" 
    FOREIGN KEY (lirbo_mayor_id)
    REFERENCES libros_mayor(id)
;


-- 
-- TABLE: mayor_registros_detalles 
--

ALTER TABLE mayor_registros_detalles ADD CONSTRAINT "Refasientos_detalles103" 
    FOREIGN KEY (asiento_detalle_id)
    REFERENCES asientos_detalles(id)
;

ALTER TABLE mayor_registros_detalles ADD CONSTRAINT "Refmayor_registros105" 
    FOREIGN KEY (libro_mayor_id)
    REFERENCES mayor_registros(id)
;


-- 
-- TABLE: ordenes_producciones 
--

ALTER TABLE ordenes_producciones ADD CONSTRAINT "Refusers31" 
    FOREIGN KEY (usuario_id)
    REFERENCES users(id)
;

ALTER TABLE ordenes_producciones ADD CONSTRAINT "Reftransacciones_estados19" 
    FOREIGN KEY (estado_id)
    REFERENCES transacciones_estados(id)
;


-- 
-- TABLE: ordenes_producciones_detalles 
--

ALTER TABLE ordenes_producciones_detalles ADD CONSTRAINT "Refproductos_terminados17" 
    FOREIGN KEY (producto_terminado_id)
    REFERENCES productos_terminados(id)
;

ALTER TABLE ordenes_producciones_detalles ADD CONSTRAINT "Refordenes_producciones18" 
    FOREIGN KEY (orden_produccion_id)
    REFERENCES ordenes_producciones(id)
;


-- 
-- TABLE: pedidos_compras_componentes 
--

ALTER TABLE pedidos_compras_componentes ADD CONSTRAINT "Reftransacciones_estados42" 
    FOREIGN KEY (estado_id)
    REFERENCES transacciones_estados(id)
;

ALTER TABLE pedidos_compras_componentes ADD CONSTRAINT "Refusers43" 
    FOREIGN KEY (usuario_id)
    REFERENCES users(id)
;


-- 
-- TABLE: pedidos_compras_componentes_detalles 
--

ALTER TABLE pedidos_compras_componentes_detalles ADD CONSTRAINT "Refpedidos_compras_componentes44" 
    FOREIGN KEY (pedidos_compras_componentes_id)
    REFERENCES pedidos_compras_componentes(id)
;

ALTER TABLE pedidos_compras_componentes_detalles ADD CONSTRAINT "Refcomponentes98" 
    FOREIGN KEY (componente_id)
    REFERENCES componentes(id)
;


-- 
-- TABLE: productos_terminados_detalles 
--

ALTER TABLE productos_terminados_detalles ADD CONSTRAINT "Refcomponentes8" 
    FOREIGN KEY (componente_id)
    REFERENCES componentes(id)
;

ALTER TABLE productos_terminados_detalles ADD CONSTRAINT "Refproductos_terminados9" 
    FOREIGN KEY (producto_terminado_id)
    REFERENCES productos_terminados(id)
;


-- 
-- TABLE: solicitudes_componentes 
--

ALTER TABLE solicitudes_componentes ADD CONSTRAINT "Refusers32" 
    FOREIGN KEY (usuario_id)
    REFERENCES users(id)
;

ALTER TABLE solicitudes_componentes ADD CONSTRAINT "Reftransacciones_estados15" 
    FOREIGN KEY (estado_id)
    REFERENCES transacciones_estados(id)
;


-- 
-- TABLE: solicitudes_componentes_detalles 
--

ALTER TABLE solicitudes_componentes_detalles ADD CONSTRAINT "Refcomponentes14" 
    FOREIGN KEY (componente_id)
    REFERENCES componentes(id)
;

ALTER TABLE solicitudes_componentes_detalles ADD CONSTRAINT "Refsolicitudes_componentes16" 
    FOREIGN KEY (solicitud_componentes_id)
    REFERENCES solicitudes_componentes(id)
;


-- 
-- TABLE: solicitudes_transferencias_componentes 
--

ALTER TABLE solicitudes_transferencias_componentes ADD CONSTRAINT "Refordenes_producciones_detalles99" 
    FOREIGN KEY (orden_produccion_detalle_id)
    REFERENCES ordenes_producciones_detalles(id)
;

ALTER TABLE solicitudes_transferencias_componentes ADD CONSTRAINT "Reftransacciones_estados26" 
    FOREIGN KEY (estado_id)
    REFERENCES transacciones_estados(id)
;

ALTER TABLE solicitudes_transferencias_componentes ADD CONSTRAINT "Refusers29" 
    FOREIGN KEY (usuario_id)
    REFERENCES users(id)
;


-- 
-- TABLE: solicitudes_transferencias_componentes_detalles 
--

ALTER TABLE solicitudes_transferencias_componentes_detalles ADD CONSTRAINT "Refsolicitudes_transferencias_componentes27" 
    FOREIGN KEY (solicitud_transferencia_componentes_id)
    REFERENCES solicitudes_transferencias_componentes(id)
;

ALTER TABLE solicitudes_transferencias_componentes_detalles ADD CONSTRAINT "Refcomponentes28" 
    FOREIGN KEY (componente_id)
    REFERENCES componentes(id)
;


-- 
-- TABLE: solicitudes_transferencias_productos 
--

ALTER TABLE solicitudes_transferencias_productos ADD CONSTRAINT "Refusers30" 
    FOREIGN KEY (usuario_id)
    REFERENCES users(id)
;

ALTER TABLE solicitudes_transferencias_productos ADD CONSTRAINT "Refordenes_producciones46" 
    FOREIGN KEY (orden_produccion_id)
    REFERENCES ordenes_producciones(id)
;

ALTER TABLE solicitudes_transferencias_productos ADD CONSTRAINT "Reftransacciones_estados21" 
    FOREIGN KEY (estado_id)
    REFERENCES transacciones_estados(id)
;


-- 
-- TABLE: solicitudes_transferencias_productos_detalles 
--

ALTER TABLE solicitudes_transferencias_productos_detalles ADD CONSTRAINT "Refordenes_producciones_detalles93" 
    FOREIGN KEY (orden_produccion_detalle_id)
    REFERENCES ordenes_producciones_detalles(id)
;

ALTER TABLE solicitudes_transferencias_productos_detalles ADD CONSTRAINT "Refsolicitudes_transferencias_productos22" 
    FOREIGN KEY (solicitudes_transferencias_productos_id)
    REFERENCES solicitudes_transferencias_productos(id)
;

ALTER TABLE solicitudes_transferencias_productos_detalles ADD CONSTRAINT "Refproductos_terminados23" 
    FOREIGN KEY (producto_terminado_id)
    REFERENCES productos_terminados(id)
;


-- 
-- TABLE: stock_materias_primas 
--

ALTER TABLE stock_materias_primas ADD CONSTRAINT "Refcomponentes4" 
    FOREIGN KEY (componente_id)
    REFERENCES componentes(id)
;


-- 
-- TABLE: stock_producciones 
--

ALTER TABLE stock_producciones ADD CONSTRAINT "Refcomponentes5" 
    FOREIGN KEY (componente_id)
    REFERENCES componentes(id)
;

ALTER TABLE stock_producciones ADD CONSTRAINT "Refproductos_terminados7" 
    FOREIGN KEY (producto_terminado_id)
    REFERENCES productos_terminados(id)
;


-- 
-- TABLE: stock_productos_terminados 
--

ALTER TABLE stock_productos_terminados ADD CONSTRAINT "Refproductos_terminados94" 
    FOREIGN KEY (producto_terminado_id)
    REFERENCES productos_terminados(id)
;

ALTER TABLE stock_productos_terminados ADD CONSTRAINT "Refcomponentes95" 
    FOREIGN KEY (componente_id)
    REFERENCES componentes(id)
;


-- 
-- TABLE: users 
--

ALTER TABLE users ADD CONSTRAINT "Reflca_roles96" 
    FOREIGN KEY (acl_role_id)
    REFERENCES lca_roles(id)
;


