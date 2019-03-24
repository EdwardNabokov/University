/*==============================================================*/
/* Database name:  SALE                                         */
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     13.02.2014 19:12:34                          */
/*==============================================================*/


drop table INVOICE;
drop table SALES;
drop table STORE;

/*==============================================================*/
/* Database: SALE                                               */
/*==============================================================*/
create database SALE;



/*==============================================================*/
/* Table: INVOICE                                               */
/*==============================================================*/
create table INVOICE  (
   ID_STUFF             varchar(128)                   not null,
   STAFF_NAME           varchar(128),
   E_MAIL               varchar(128),
   INVOICE              varchar(128),
   SUPPLIER             varchar(128),
   PRODUCT              varchar(128),
   QUANTITY             varchar(128),
   PRICE                varchar(128),
   INVOICE_DATE         varchar(128)
);

/*==============================================================*/
/* Table: SALES                                                 */
/*==============================================================*/
create table SALES  (
   ID_STUFF             varchar(128)                   not null,
   STAFF_NAME           varchar(128),
   PRODUCT              varchar(128),
   SOLD_IN_JANUARY_2013 varchar(128),
   SOLD_IN_FEBRUARY_2013 varchar(128),
   SOLD_IN_MARCH_2013   varchar(128),
   SOLD_IN_APRIL_2013   varchar(128),
   SOLD_IN_MAY_2013     varchar(128),
   SOLD_IN_JUNE_2013    varchar(128),
   SOLD_IN_JULY_2013    varchar(128),
   SOLD_IN_AUGUST_2013  varchar(128),
   SOLD_IN_SEPTEMBER_2013 varchar(128),
   SOLD_IN_OCTOBER_2013 varchar(128),
   SOLD_IN_NOVEMBER_2013 varchar(128),
   SOLD_IN_DECEMBER_2013 varchar(128)
);


/*==============================================================*/
/* Table: STORE                                                 */
/*==============================================================*/
create table STORE  (
   STUFF_NAME           varchar(124)                   not null,
   SUPPLIER             varchar(124),
   SHELF                varchar(124),
   PRODUCT              varchar(124),
   QUANTITY             varchar(124),
   OPER_TYPE            varchar(124),
   STORE_DATE           varchar(124)
);
