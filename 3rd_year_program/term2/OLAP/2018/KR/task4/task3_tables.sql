drop table PAYMENT_TYPE;
drop table POSITION;
drop table STUFF;
drop table INVOICE;
drop table PRODUCT_TYPE;
drop table SUPPLIER;
drop table UNIT;
drop table PRODUCT;
drop table INVOICE_DETAIL;
drop table TYPE_OPER;
drop table STORE;

drop index FK_STUFF;
drop index FK_TYPE;

create table PAYMENT_TYPE
(
  id_type           NUMBER not null PRIMARY KEY,
  payment_type_name VARCHAR2(128),
  description       VARCHAR2(256)
);

create table POSITION
(
  id_position   NUMBER not null PRIMARY KEY,
  position_name VARCHAR2(128) not null,
  salary        NUMBER,
  description   VARCHAR2(1024)
);

create table STUFF
(
  id_stuff    NUMBER not null PRIMARY KEY,
  id_position NUMBER not null REFERENCES POSITION(id_position),
  name        VARCHAR2(64),
  surname     VARCHAR2(64),
  phone       VARCHAR2(64),
  address     VARCHAR2(256),
  email       VARCHAR2(64)
);

create table INVOICE
(
  id_invoice    NUMBER not null PRIMARY KEY,
  id_type       NUMBER not null REFERENCES PAYMENT_TYPE(id_type),
  id_stuff      NUMBER not null REFERENCES STUFF(id_stuff),
  purchase_time DATE
);

create table PRODUCT_TYPE
(
  id_product_type   NUMBER not null PRIMARY KEY,
  product_type_name VARCHAR2(128)
);

create table SUPPLIER
(
  id_supplier   NUMBER not null PRIMARY KEY,
  supplier_name VARCHAR2(128),
  supplier_info VARCHAR2(1024)
);

create table UNIT
(
  id_unit     NUMBER not null PRIMARY KEY,
  unit_name   VARCHAR2(128),
  description VARCHAR2(512)
);

create table PRODUCT
(
  id_product      NUMBER not null PRIMARY KEY,
  id_product_type NUMBER not null REFERENCES PRODUCT_TYPE(id_product_type),
  id_supplier     NUMBER not null REFERENCES SUPPLIER(id_supplier),
  id_unit         NUMBER not null REFERENCES UNIT(id_unit),
  product_name    VARCHAR2(128) not null,
  description     VARCHAR2(128),
  price           INTEGER
);

create table INVOICE_DETAIL
(
  id_invoice  NUMBER not null PRIMARY KEY,
  id_product  NUMBER not null REFERENCES PRODUCT(id_product),
  quantity    NUMBER(10,2) not null,
  description VARCHAR2(500)
);

create table TYPE_OPER
(
  id_oper_type INTEGER not null PRIMARY KEY,
  name_oper    VARCHAR2(3) not null,
  description  VARCHAR2(100)
);

create table STORE
(
  id_store     NUMBER not null PRIMARY KEY,
  id_product   NUMBER not null REFERENCES PRODUCT(id_product),
  shelf        VARCHAR2(10) not null,
  date_oper    DATE not null,
  id_oper_type INTEGER not null REFERENCES TYPE_OPER(id_oper_type),
  quantity     NUMBER not null
);

create index FK_STUFF on INVOICE (ID_STUFF)
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

create index FK_TYPE on INVOICE (ID_TYPE)
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

