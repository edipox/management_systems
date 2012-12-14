--
-- ER/Studio 7.5 SQL Code Generation
-- Company :      uni
-- Project :      TO_EXPORT.DM1
-- Author :       Pablo
--
-- Date Created : Friday, December 14, 2012 09:40:17
-- Target DBMS : PostgreSQL 8.0
--

-- 
-- TABLE: app_configs 
--

CREATE TABLE app_configs(
    id       char(36)    NOT NULL,
    valor    char(36)    NOT NULL,
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
    vendible       boolean    DEFAULT false NOT NULL,
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
    componentes_id                    char(36)    NOT NULL,
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
    id                     char(36)    NOT NULL,
    numero                 int4        NOT NULL,
    estado_id              char(36)    NOT NULL,
    usuario_id             char(36)    NOT NULL,
    orden_produccion_id    char(36),
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
    cantidad_producto             interval,
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
    CONSTRAINT "PK86" PRIMARY KEY (id)
;

-- 
-- TABLE: categorias 
--

ALTER TABLE categorias ADD 
    CONSTRAINT "PK9" PRIMARY KEY (id)
;

-- 
-- TABLE: componentes 
--

ALTER TABLE componentes ADD 
    CONSTRAINT "PK2" PRIMARY KEY (id)
;

-- 
-- TABLE: devoluciones_componentes 
--

ALTER TABLE devoluciones_componentes ADD 
    CONSTRAINT "PK22" PRIMARY KEY (id)
;

-- 
-- TABLE: devoluciones_componentes_detalles 
--

ALTER TABLE devoluciones_componentes_detalles ADD 
    CONSTRAINT "PK23" PRIMARY KEY (id)
;

-- 
-- TABLE: devoluciones_productos 
--

ALTER TABLE devoluciones_productos ADD 
    CONSTRAINT "PK22_1" PRIMARY KEY (id)
;

-- 
-- TABLE: devoluciones_productos_detalles 
--

ALTER TABLE devoluciones_productos_detalles ADD 
    CONSTRAINT "PK23_1" PRIMARY KEY (id)
;

-- 
-- TABLE: lca_acciones 
--

ALTER TABLE lca_acciones ADD 
    CONSTRAINT "PK87" PRIMARY KEY (id)
;

-- 
-- TABLE: lca_entidades 
--

ALTER TABLE lca_entidades ADD 
    CONSTRAINT "PK88" PRIMARY KEY (id)
;

-- 
-- TABLE: lca_permisos 
--

ALTER TABLE lca_permisos ADD 
    CONSTRAINT "PK90" PRIMARY KEY (id)
;

-- 
-- TABLE: lca_roles 
--

ALTER TABLE lca_roles ADD 
    CONSTRAINT "PK89" PRIMARY KEY (id)
;

-- 
-- TABLE: marcas 
--

ALTER TABLE marcas ADD 
    CONSTRAINT "PK91" PRIMARY KEY (id)
;

-- 
-- TABLE: ordenes_producciones 
--

ALTER TABLE ordenes_producciones ADD 
    CONSTRAINT "PK15" PRIMARY KEY (id)
;

-- 
-- TABLE: ordenes_producciones_detalles 
--

ALTER TABLE ordenes_producciones_detalles ADD 
    CONSTRAINT "PK11_1" PRIMARY KEY (id)
;

-- 
-- TABLE: pedidos_compras_componentes 
--

ALTER TABLE pedidos_compras_componentes ADD 
    CONSTRAINT "PK26" PRIMARY KEY (id)
;

-- 
-- TABLE: pedidos_compras_componentes_detalles 
--

ALTER TABLE pedidos_compras_componentes_detalles ADD 
    CONSTRAINT "PK29" PRIMARY KEY (id)
;

-- 
-- TABLE: productos_terminados 
--

ALTER TABLE productos_terminados ADD 
    CONSTRAINT "PK4" PRIMARY KEY (id)
;

-- 
-- TABLE: productos_terminados_detalles 
--

ALTER TABLE productos_terminados_detalles ADD 
    CONSTRAINT "PK6" PRIMARY KEY (id)
;

-- 
-- TABLE: solicitudes_componentes 
--

ALTER TABLE solicitudes_componentes ADD 
    CONSTRAINT "PK10" PRIMARY KEY (id)
;

-- 
-- TABLE: solicitudes_componentes_detalles 
--

ALTER TABLE solicitudes_componentes_detalles ADD 
    CONSTRAINT "PK11" PRIMARY KEY (id)
;

-- 
-- TABLE: solicitudes_transferencias_componentes 
--

ALTER TABLE solicitudes_transferencias_componentes ADD 
    CONSTRAINT "PK19" PRIMARY KEY (id)
;

-- 
-- TABLE: solicitudes_transferencias_componentes_detalles 
--

ALTER TABLE solicitudes_transferencias_componentes_detalles ADD 
    CONSTRAINT "PK20" PRIMARY KEY (id)
;

-- 
-- TABLE: solicitudes_transferencias_productos 
--

ALTER TABLE solicitudes_transferencias_productos ADD 
    CONSTRAINT "PK15_1" PRIMARY KEY (id)
;

-- 
-- TABLE: solicitudes_transferencias_productos_detalles 
--

ALTER TABLE solicitudes_transferencias_productos_detalles ADD 
    CONSTRAINT "PK11_1_1" PRIMARY KEY (id)
;

-- 
-- TABLE: stock_materias_primas 
--

ALTER TABLE stock_materias_primas ADD 
    CONSTRAINT "PK1" PRIMARY KEY (id)
;

-- 
-- TABLE: stock_producciones 
--

ALTER TABLE stock_producciones ADD 
    CONSTRAINT "PK3" PRIMARY KEY (id)
;

-- 
-- TABLE: stock_productos_terminados 
--

ALTER TABLE stock_productos_terminados ADD 
    CONSTRAINT "PK7" PRIMARY KEY (id)
;

-- 
-- TABLE: transacciones_estados 
--

ALTER TABLE transacciones_estados ADD 
    CONSTRAINT "PK14" PRIMARY KEY (id)
;

-- 
-- TABLE: users 
--

ALTER TABLE users ADD 
    CONSTRAINT "PK21" PRIMARY KEY (id)
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

ALTER TABLE pedidos_compras_componentes_detalles ADD CONSTRAINT "Refcomponentes45" 
    FOREIGN KEY (componentes_id)
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

ALTER TABLE solicitudes_transferencias_componentes ADD CONSTRAINT "Reftransacciones_estados26" 
    FOREIGN KEY (estado_id)
    REFERENCES transacciones_estados(id)
;

ALTER TABLE solicitudes_transferencias_componentes ADD CONSTRAINT "Refusers29" 
    FOREIGN KEY (usuario_id)
    REFERENCES users(id)
;

ALTER TABLE solicitudes_transferencias_componentes ADD CONSTRAINT "Refordenes_producciones97" 
    FOREIGN KEY (orden_produccion_id)
    REFERENCES ordenes_producciones(id)
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

ALTER TABLE solicitudes_transferencias_productos ADD CONSTRAINT "Reftransacciones_estados21" 
    FOREIGN KEY (estado_id)
    REFERENCES transacciones_estados(id)
;

ALTER TABLE solicitudes_transferencias_productos ADD CONSTRAINT "Refusers30" 
    FOREIGN KEY (usuario_id)
    REFERENCES users(id)
;

ALTER TABLE solicitudes_transferencias_productos ADD CONSTRAINT "Refordenes_producciones46" 
    FOREIGN KEY (orden_produccion_id)
    REFERENCES ordenes_producciones(id)
;


-- 
-- TABLE: solicitudes_transferencias_productos_detalles 
--

ALTER TABLE solicitudes_transferencias_productos_detalles ADD CONSTRAINT "Refsolicitudes_transferencias_productos22" 
    FOREIGN KEY (solicitudes_transferencias_productos_id)
    REFERENCES solicitudes_transferencias_productos(id)
;

ALTER TABLE solicitudes_transferencias_productos_detalles ADD CONSTRAINT "Refproductos_terminados23" 
    FOREIGN KEY (producto_terminado_id)
    REFERENCES productos_terminados(id)
;

ALTER TABLE solicitudes_transferencias_productos_detalles ADD CONSTRAINT "Refordenes_producciones_detalles93" 
    FOREIGN KEY (orden_produccion_detalle_id)
    REFERENCES ordenes_producciones_detalles(id)
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


