/*==============================================================*/
/* Database name:  SALE                                         */
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     12.03.2018 13:21:21                          */
/*==============================================================*/

--
-- alter table INVOICE
--    drop constraint FK_INVOICE_REFERENCE_PAYMENT_;
--
-- alter table INVOICE
--    drop constraint FK_INVOICE_REFERENCE_INVOICE_;
--
-- alter table INVOICE_DETAIL
--    drop constraint FK_INVOICE__REFERENCE_PRODUCT;
--
-- alter table PRODUCT
--    drop constraint FK_PRODUCT_REFERENCE_PRODUCT_;
--
-- alter table PRODUCT
--    drop constraint FK_PRODUCT_REFERENCE_SUPPLIER;
--
-- alter table STORE
--    drop constraint FK_STORE_REFERENCE_TYPE_OPE;
--
-- alter table STUFF
--    drop constraint FK_STUFF_REFERENCE_POSITION;
--
-- drop table INVOICE cascade constraints;
--
-- drop index "id_product_ind";
--
-- drop table INVOICE_DETAIL cascade constraints;
--
-- drop table PAYMENT_TYPE cascade constraints;
--
-- drop table POSITION cascade constraints;
--
-- drop index "id_supplier_ind";
--
-- drop index "id_product_type_ind";
--
-- drop table PRODUCT cascade constraints;
--
-- drop table PRODUCT_TYPE cascade constraints;
--
-- drop table STORE cascade constraints;
--
-- drop table STUFF cascade constraints;
--
-- drop table SUPPLIER cascade constraints;
--
-- drop table TYPE_OPER cascade constraints;
--
-- drop table UNIT cascade constraints;

/*==============================================================*/
/* Database: SALE                                               */
/*==============================================================*/
create database MYSALE;

/*==============================================================*/
/* Table: INVOICE                                               */
/*==============================================================*/
create table INVOICE
(
   "id_invoice"         NUMBER               not null
    constraint CKC_ID_INVOICE_INVOICE check ("id_invoice" >= 1),
   "id_paiment_type"    NUMBER               not null,
   "purchase_time"      timestamp                 not null,
   "id_invoice_detail"  NUMBER               not null,
   constraint PK_INVOICE primary key ("id_invoice")
);


/*==============================================================*/
/* Table: INVOICE_DETAIL                                        */
/*==============================================================*/
create table INVOICE_DETAIL
(
   "id_invoice"         NUMBER               not null
      constraint CKC_ID_INVOICE_INVOICE_ check ("id_invoice" >= 1),
   "id_product"         NUMBER               not null,
   "quantity"           NUMBER               not null
      constraint CKC_QUANTITY_INVOICE_ check ("quantity" between 1 and 25),
   "description"        VARCHAR2(500),
   constraint PK_INVOICE_DETAIL primary key ("id_invoice")
);

/*==============================================================*/
/* Index: "id_product_ind"                                      */
/*==============================================================*/
create index "id_product_ind" on INVOICE_DETAIL (
   "id_product" ASC
);
drop index "id_product_ind"

/*==============================================================*/
/* Table: PAYMENT_TYPE                                          */
/*==============================================================*/
create table PAYMENT_TYPE
(
   "id_type"            NUMBER               not null
      constraint CKC_ID_TYPE_PAYMENT_ check ("id_type" >= 1),
   "payment_type_name"  varchar2(128)        not null,
   "description"        varchar2(256),
   constraint PK_PAYMENT_TYPE primary key ("id_type")
);


/*==============================================================*/
/* Table: CLIENT                                              */
/*==============================================================*/
create table CLIENT
(
   "id_client"          NUMBER               not null,
   "name"               VARCHAR2(128)        not null,
   "surname"            VARCHAR(128)         not null,
   "phone"              VARCHAR2(13)         not null,
   "address"            VARCHAR2(128)        not null,
   constraint PK_CLIENT primary key ("id_client")
);
alter table invoice
add "id_client" number constraint fk_client_in_invoice references CLIENT ("id_client")

/*==============================================================*/
/* Table: POSITION                                              */
/*==============================================================*/
create table POSITION
(
   "id_position"        NUMBER               not null
      constraint CKC_ID_POSITION_POSITION check ("id_position" >= 1),
   "position_name"      varchar2(128)        not null,
   "salary"             NUMBER               not null
      constraint CKC_SALARY_POSITION check ("salary" >= 1),
   "description"        VARCHAR2(1024),
   constraint PK_POSITION primary key ("id_position")
);


/*==============================================================*/
/* Table: PRODUCT                                               */
/*==============================================================*/
create table PRODUCT
(
   "id_product"         NUMBER               not null
      constraint CKC_ID_PRODUCT_PRODUCT check ("id_product" >= 1),
   "product_name"       varchar2(128)        not null,
   "description"        varchar2(128),
   "price"              NUMBER               not null,
   "id_product_type"    NUMBER               not null,
   "id_supplier"        NUMBER               not null,
   constraint PK_PRODUCT primary key ("id_product")
);


/*==============================================================*/
/* Index: "id_product_type_ind"                                 */
/*==============================================================*/
create index "id_product_type_ind" on PRODUCT (
   "id_product_type" ASC
);
drop index "id_product_type_ind"

/*==============================================================*/
/* Index: "id_supplier_ind"                                     */
/*==============================================================*/
create index "id_supplier_ind" on PRODUCT (
   "id_supplier" ASC
);
drop index "id_supplier_ind"

/*==============================================================*/
/* Table: PRODUCT_TYPE                                          */
/*==============================================================*/
create table PRODUCT_TYPE
(
   "id_product_type"    NUMBER               not null
      constraint CKC_ID_PRODUCT_TYPE_PRODUCT_ check ("id_product_type" >= 1),
   "product_type_name"  varchar2(128)        not null,
   constraint PK_PRODUCT_TYPE primary key ("id_product_type")
);


/*==============================================================*/
/* Table: STORE                                                 */
/*==============================================================*/
create table STORE
(
   "id_store"           NUMBER               not null
      constraint CKC_ID_STORE_STORE check ("id_store" >= 1),
   "shelf"              NUMBER               not null,
   "date_oper"          DATE                 not null,
   "quantity"           NUMBER               not null,
   "id_oper_type"       NUMBER               not null,
   "id_product"         NUMBER               not null
);


alter table STORE
   add constraint FK_STORE_REFERENCE_PRODUCT foreign key ("id_product")
      references PRODUCT ("id_product");

alter table STORE
   add constraint FK_STORE_REFERENCE_TYPE_OPE foreign key ("id_oper_type")
      references TYPE_OPER ("id_oper_type");

/*==============================================================*/
/* Table: STUFF                                                 */
/*==============================================================*/
create table STUFF
(
   "id_stuff"           NUMBER               not null
      constraint CKC_ID_STUFF_STUFF check ("id_stuff" >= 1),
   "name"               VARCHAR2(64)         not null,
   "surname"            VARCHAR2(64)         not null,
   "phone"              varchar2(64),
   "address"            varchar2(256),
   "id_position"        NUMBER               not null,
   constraint PK_STUFF primary key ("id_stuff")
);

/*==============================================================*/
/* Table: SUPPLIER                                              */
/*==============================================================*/
create table SUPPLIER
(
   "id_supplier"        NUMBER               not null
      constraint CKC_ID_SUPPLIER_SUPPLIER check ("id_supplier" >= 1),
   "supplier_name"      varchar2(128)        not null,
   "supplier_info"      varchar2(1024),
   constraint PK_SUPPLIER primary key ("id_supplier")
);

/*==============================================================*/
/* Table: TYPE_OPER                                             */
/*==============================================================*/
create table TYPE_OPER
(
   "id_oper_type"       INTEGER              not null
      constraint CKC_ID_OPER_TYPE_TYPE_OPE check ("id_oper_type" >= 1),
   "name_oper"          VARCHAR2(128)     not null,
   "description"        VARCHAR(100),
   constraint PK_TYPE_OPER primary key ("id_oper_type")
);


/*==============================================================*/
/* Table: UNIT                                                  */
/*==============================================================*/
create table UNIT
(
   "id_unit"            number               not null
      constraint CKC_ID_UNIT_UNIT check ("id_unit" >= 1),
   "unit_name"          varchar2(128)        not null,
   "description"        varchar2(512),
   constraint PK_UNIT primary key ("id_unit")
);

alter table INVOICE
   add constraint FK_INVOICE_REFERENCE_PAYMENT_ foreign key ("id_paiment_type")
      references PAYMENT_TYPE ("id_type");

alter table INVOICE
   add constraint FK_INVOICE_REFERENCE_INVOICE_ foreign key ("id_invoice_detail")
      references INVOICE_DETAIL ("id_invoice");

alter table INVOICE_DETAIL
   add constraint FK_INVOICE__REFERENCE_PRODUCT foreign key ("id_product")
      references PRODUCT ("id_product");

alter table PRODUCT
   add constraint FK_PRODUCT_REFERENCE_PRODUCT_ foreign key ("id_product_type")
      references PRODUCT_TYPE ("id_product_type");

alter table PRODUCT
   add constraint FK_PRODUCT_REFERENCE_SUPPLIER foreign key ("id_supplier")
      references SUPPLIER ("id_supplier");

alter table STORE
   add constraint FK_STORE_REFERENCE_TYPE_OPE foreign key ("id_oper_type")
      references TYPE_OPER ("id_oper_type");

alter table STUFF
   add constraint FK_STUFF_REFERENCE_POSITION foreign key ("id_position")
      references POSITION ("id_position");
