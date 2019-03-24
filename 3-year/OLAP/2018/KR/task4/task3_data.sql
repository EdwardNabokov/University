-- insert into PAYMENT_TYPE_S (id_type, payment_type_name, description)
-- values (1, '���������� ����������', null);
-- insert into PAYMENT_TYPE_S (id_type, payment_type_name, description)
-- values (2, '������������� ����������', null);
-- commit;
--
-- insert into POSITION_S (id_position, position_name, salary, description)
-- values (1, '���������-�����', 3000, null);
-- insert into POSITION_S (id_position, position_name, salary, description)
-- values (2, '���������', 5000, null);
-- insert into POSITION_S (id_position, position_name, salary, description)
-- values (3, '�������� ������� �������', 7000, null);
-- insert into POSITION_S (id_position, position_name, salary, description)
-- values (4, '�����', 6000, null);
-- insert into POSITION_S (id_position, position_name, salary, description)
-- values (5, '�����', 6000, null);
-- commit;

insert into STUFF_S (id_stuff, id_position, name, surname, phone, address, email)
values (1, 1, 'Aaron', 'Smih', '365-54-87', '����', 'Smih@market.com');
insert into STUFF_S (id_stuff, id_position, name, surname, phone, address, email)
values (2, 1, 'Adam', 'Thomas', '584-98-44', '����', 'Thomas@market.com');
insert into STUFF_S (id_stuff, id_position, name, surname, phone, address, email)
values (3, 1, 'Barry', 'Davies', '063-564-54-54', '����', 'Davies@market.com');
insert into STUFF_S (id_stuff, id_position, name, surname, phone, address, email)
values (4, 1, 'Basil', 'White', '097-347-44-99', '����', 'White@market.com');
insert into STUFF_S (id_stuff, id_position, name, surname, phone, address, email)
values (5, 1, 'Simon', 'Hughes', '050-54-21', '����', 'Hughes@market.com');
insert into STUFF_S (id_stuff, id_position, name, surname, phone, address, email)
values (6, 1, 'Carlton', 'Edwards', '546-21-64', '����', 'Edwards@market.com');
insert into STUFF_S (id_stuff, id_position, name, surname, phone, address, email)
values (7, 2, 'Sebastian', 'Green', '878-54-63', '����', 'Green@market.com');
insert into STUFF_S (id_stuff, id_position, name, surname, phone, address, email)
values (8, 3, 'Scott', 'Wood', '050-879-54-16', '����', 'Wood@market.com');
insert into STUFF_S (id_stuff, id_position, name, surname, phone, address, email)
values (9, 4, 'Galvin', 'Harris', '093-879-23-54', '����', 'Harris@market.com');
insert into STUFF_S (id_stuff, id_position, name, surname, phone, address, email)
values (10, 5, 'Bob', 'Martin', '097-213-54-69', '����', 'Martin@market.com');
insert into STUFF_S (id_stuff, id_position, name, surname, phone, address, email)
values (11, 4, 'Hunter', 'Anderson', '023-878-54-96', '����������', 'Anderson@market.com');
commit;

insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (3, 1, 5, to_date('12-09-2011 13:24:43', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (4, 1, 3, to_date('25-09-2011 08:57:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (5, 1, 5, to_date('01-08-2012 08:51:18', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (6, 2, 6, to_date('11-03-2013 15:41:48', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (7, 1, 1, to_date('16-02-2012 08:18:04', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (8, 1, 3, to_date('17-10-2012 21:40:40', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (9, 2, 5, to_date('24-12-2012 02:36:56', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (10, 2, 5, to_date('09-06-2013 08:45:01', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (11, 1, 3, to_date('27-09-2011 19:18:38', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (12, 2, 4, to_date('21-01-2014 14:06:15', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (13, 2, 2, to_date('01-10-2012 05:20:36', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (14, 2, 3, to_date('20-01-2014 20:42:28', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (15, 1, 2, to_date('11-08-2013 05:16:26', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (16, 1, 3, to_date('10-02-2012 13:18:18', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (17, 2, 5, to_date('07-02-2013 11:27:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (18, 1, 6, to_date('14-01-2012 20:16:22', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (19, 1, 5, to_date('29-10-2012 04:08:29', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (20, 1, 3, to_date('05-10-2012 21:25:57', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (21, 1, 3, to_date('28-05-2013 05:26:35', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (22, 2, 5, to_date('01-12-2013 10:50:08', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (23, 2, 1, to_date('03-11-2013 14:52:01', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (24, 1, 5, to_date('09-04-2013 07:57:24', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (25, 1, 4, to_date('17-07-2013 10:20:27', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (26, 2, 4, to_date('27-11-2011 18:32:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (27, 1, 4, to_date('03-08-2012 10:48:37', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (28, 2, 6, to_date('09-03-2012 01:03:23', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (29, 2, 4, to_date('11-11-2013 04:36:39', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (30, 1, 2, to_date('09-01-2014 15:44:54', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (31, 1, 2, to_date('06-05-2012 07:49:15', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (32, 2, 4, to_date('04-09-2013 08:14:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (33, 1, 2, to_date('22-07-2013 14:35:10', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (34, 1, 3, to_date('16-11-2013 11:03:24', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (35, 1, 6, to_date('23-02-2013 05:31:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (36, 2, 6, to_date('22-10-2012 18:44:39', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (37, 2, 4, to_date('25-01-2013 15:24:26', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (38, 2, 2, to_date('15-04-2013 15:05:48', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (39, 1, 2, to_date('03-12-2013 04:19:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (40, 1, 1, to_date('24-12-2013 09:58:12', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (41, 1, 3, to_date('17-05-2013 03:40:53', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (42, 2, 5, to_date('11-02-2013 12:47:52', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (43, 1, 3, to_date('07-02-2012 07:44:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (44, 1, 2, to_date('04-01-2014 12:02:39', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (45, 2, 2, to_date('04-05-2012 09:15:55', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (46, 2, 2, to_date('09-09-2011 01:36:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (47, 1, 3, to_date('20-01-2013 16:59:33', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (48, 1, 2, to_date('18-10-2012 18:56:28', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (49, 1, 4, to_date('08-12-2012 14:28:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (50, 2, 1, to_date('26-04-2012 12:57:33', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (51, 1, 2, to_date('09-09-2012 02:50:28', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (52, 1, 6, to_date('01-07-2013 23:05:28', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (53, 1, 3, to_date('14-01-2013 06:36:47', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (54, 1, 6, to_date('01-11-2013 21:10:02', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (55, 1, 3, to_date('22-09-2011 06:18:04', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (56, 2, 5, to_date('10-08-2012 18:36:02', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (57, 1, 3, to_date('05-02-2012 11:48:44', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (58, 1, 5, to_date('20-03-2013 01:55:39', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (59, 1, 3, to_date('25-05-2011 23:57:59', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (60, 2, 3, to_date('06-12-2011 01:10:27', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (61, 2, 4, to_date('04-09-2012 09:25:25', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (62, 1, 5, to_date('04-11-2013 07:53:38', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (63, 1, 2, to_date('16-05-2012 01:03:31', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (64, 1, 6, to_date('29-06-2013 13:55:40', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (65, 2, 4, to_date('21-08-2011 19:34:44', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (66, 1, 3, to_date('18-08-2013 01:02:38', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (67, 2, 3, to_date('21-06-2011 07:39:50', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (68, 1, 2, to_date('25-11-2011 06:15:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (69, 2, 4, to_date('16-09-2012 22:54:17', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (70, 1, 2, to_date('09-02-2013 09:00:59', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (71, 2, 3, to_date('13-12-2013 03:13:58', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (72, 2, 2, to_date('20-01-2012 21:15:45', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (73, 1, 5, to_date('03-04-2012 05:11:38', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (74, 1, 6, to_date('23-11-2011 16:14:37', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (75, 2, 2, to_date('08-07-2011 00:13:37', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (76, 2, 4, to_date('22-07-2013 06:06:43', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (77, 1, 3, to_date('28-10-2011 12:19:24', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (78, 2, 5, to_date('18-09-2012 23:39:35', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (79, 2, 6, to_date('26-04-2013 12:53:43', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (80, 1, 4, to_date('21-07-2011 10:57:36', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (81, 1, 2, to_date('20-03-2012 10:24:23', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (82, 2, 5, to_date('09-07-2013 08:47:30', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (83, 2, 2, to_date('28-02-2013 23:51:41', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (84, 2, 4, to_date('18-11-2012 16:35:27', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (85, 2, 5, to_date('17-07-2012 18:21:57', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (86, 2, 5, to_date('08-01-2012 09:26:12', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (87, 2, 3, to_date('21-08-2013 20:55:45', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (88, 1, 3, to_date('10-08-2011 12:11:45', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (89, 2, 4, to_date('23-02-2013 21:36:16', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (90, 1, 5, to_date('31-05-2011 16:34:18', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (91, 2, 4, to_date('20-07-2011 08:40:25', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (92, 1, 2, to_date('21-08-2011 03:48:55', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (93, 2, 4, to_date('16-06-2013 22:39:09', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (94, 1, 2, to_date('15-02-2013 06:37:04', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (95, 2, 3, to_date('14-06-2013 19:52:18', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (96, 1, 5, to_date('10-08-2012 09:27:01', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (97, 1, 4, to_date('06-02-2013 13:51:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (98, 1, 3, to_date('20-10-2013 03:10:14', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (99, 2, 2, to_date('13-12-2011 22:27:04', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (100, 1, 6, to_date('14-12-2011 11:37:45', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (1, 1, 4, to_date('12-02-2012 05:09:10', 'dd-mm-yyyy hh24:mi:ss'));
insert into INVOICE_S (id_invoice, id_type, id_stuff, purchase_time)
values (2, 1, 5, to_date('14-10-2011 21:39:12', 'dd-mm-yyyy hh24:mi:ss'));
commit;

insert into SUPPLIER_S (id_supplier, supplier_name, supplier_info)
values (1, 'ROSHEN', null);
insert into SUPPLIER_S (id_supplier, supplier_name, supplier_info)
values (2, '���', null);
insert into SUPPLIER_S (id_supplier, supplier_name, supplier_info)
values (3, '����-�����', null);
insert into SUPPLIER_S (id_supplier, supplier_name, supplier_info)
values (4, 'Nestle', null);
insert into SUPPLIER_S (id_supplier, supplier_name, supplier_info)
values (5, 'Ferrero', null);
insert into SUPPLIER_S (id_supplier, supplier_name, supplier_info)
values (6, 'Kraft Food', null);
insert into SUPPLIER_S (id_supplier, supplier_name, supplier_info)
values (7, '����������', null);
insert into SUPPLIER_S (id_supplier, supplier_name, supplier_info)
values (8, '�������������', null);
insert into SUPPLIER_S (id_supplier, supplier_name, supplier_info)
values (9, 'Danone', null);
insert into SUPPLIER_S (id_supplier, supplier_name, supplier_info)
values (10, '��������', null);
insert into SUPPLIER_S (id_supplier, supplier_name, supplier_info)
values (11, '��������', null);
insert into SUPPLIER_S (id_supplier, supplier_name, supplier_info)
values (12, '���� ����', null);
insert into SUPPLIER_S (id_supplier, supplier_name, supplier_info)
values (13, 'ѳ����� �������', null);
insert into SUPPLIER_S (id_supplier, supplier_name, supplier_info)
values (14, '������������� ���������', null);
insert into SUPPLIER_S (id_supplier, supplier_name, supplier_info)
values (15, '���', null);
insert into SUPPLIER_S (id_supplier, supplier_name, supplier_info)
values (16, '��������', null);
commit;


insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (1, 1, 1, 6, '������ ������� � �������� �LoungeBar ROSHEN� �������� �������', ' sweet', 5);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (2, 1, 1, 6, '�ROSHEN� ����� � ������ �������� ��������', null, 10);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (3, 1, 1, 6, '������������ ��������� �� ���������� ���������� �������', null, 10);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (5, 1, 2, 1, '"������������ ������" � ��������� �������� �� ����� ��������', null, 65);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (6, 1, 2, 1, '������� ��������', null, 55);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (7, 1, 3, 1, '������� EsfeRo Crema', null, 78);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (8, 1, 4, 4, 'Nescafe Gold', null, 60);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (9, 3, 7, 2, '������', null, 12);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (10, 4, 7, 1, '��� ����������', null, 65);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (11, 3, 7, 2, '�����', null, 12);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (12, 3, 8, 2, '��� ��������', null, 15);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (13, 3, 8, 2, '�������', null, 15);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (14, 5, 12, 1, '������ �������', null, 25);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (15, 5, 12, 1, '������ ����', null, 30);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (16, 3, 10, 2, '������', null, 15);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (17, 6, 13, 1, '������� ����������', null, 100);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (18, 6, 13, 1, '������� �������', null, 120);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (19, 6, 13, 1, '������ ����������', null, 170);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (20, 5, 14, 1, '�����', null, 98);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (21, 5, 14, 1, '��������', null, 95);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (22, 7, 15, 6, '���� �����������', null, 4);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (23, 7, 15, 6, '���� �����������', null, 7);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (24, 7, 16, 6, '���� �����', null, 3);
insert into PRODUCT_S (id_product, id_product_type, id_supplier, id_unit, product_name, description, price)
values (4, 7, 16, 6, '��������', null, 3);
commit;

insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (2, 9, 3, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (3, 15, 10, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (4, 12, 6, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (5, 16, 10, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (6, 16, 2, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (7, 19, 3, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (8, 18, 5, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (9, 16, 3, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (10, 6, 9, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (11, 5, 5, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (12, 9, 8, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (13, 14, 3, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (14, 22, 9, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (15, 16, 5, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (16, 2, 8, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (17, 8, 4, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (18, 7, 4, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (19, 6, 8, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (20, 13, 5, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (21, 1, 2, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (22, 6, 2, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (23, 4, 9, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (24, 4, 5, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (25, 15, 1, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (26, 7, 7, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (27, 11, 3, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (28, 6, 9, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (29, 20, 4, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (30, 22, 4, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (31, 6, 6, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (32, 4, 11, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (33, 5, 10, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (34, 10, 11, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (35, 22, 4, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (36, 18, 8, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (37, 9, 5, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (38, 23, 4, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (39, 5, 6, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (40, 4, 3, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (41, 7, 3, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (42, 9, 2, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (43, 14, 4, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (44, 13, 3, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (45, 14, 3, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (46, 14, 6, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (47, 8, 8, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (48, 9, 3, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (49, 2, 7, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (50, 3, 1, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (51, 3, 10, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (52, 3, 10, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (53, 11, 3, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (54, 22, 7, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (55, 17, 5, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (56, 2, 2, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (57, 12, 4, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (58, 9, 9, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (59, 20, 7, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (60, 4, 8, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (61, 4, 10, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (62, 11, 3, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (63, 22, 2, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (64, 20, 5, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (65, 1, 2, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (66, 8, 4, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (67, 10, 3, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (68, 4, 8, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (69, 11, 4, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (70, 18, 4, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (71, 16, 6, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (72, 7, 1, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (73, 11, 10, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (74, 7, 2, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (75, 8, 6, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (76, 22, 3, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (77, 13, 7, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (78, 5, 1, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (79, 1, 10, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (80, 9, 6, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (81, 7, 3, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (82, 21, 2, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (83, 14, 3, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (84, 20, 10, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (85, 13, 2, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (86, 3, 6, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (87, 5, 5, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (88, 19, 7, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (89, 21, 8, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (90, 8, 3, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (91, 15, 8, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (92, 14, 6, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (93, 15, 6, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (94, 7, 5, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (95, 3, 6, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (96, 5, 8, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (97, 12, 7, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (98, 9, 3, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (99, 17, 2, null);
insert into INVOICE_DETAIL_S (id_invoice, id_product, quantity, description)
values (100, 23, 11, null);
commit;

insert into TYPE_OPER_S (id_oper_type, name_oper, description)
values (1, 'IN', '����������� �� ������.');
insert into TYPE_OPER_S (id_oper_type, name_oper, description)
values (2, 'OUT', null);
commit;

insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (1, 24, '7', to_date('22-05-2012 21:14:02', 'dd-mm-yyyy hh24:mi:ss'), 1, 9);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (2, 17, '15', to_date('16-11-2013 09:54:21', 'dd-mm-yyyy hh24:mi:ss'), 1, 5);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (3, 7, '13', to_date('20-05-2012 01:12:18', 'dd-mm-yyyy hh24:mi:ss'), 2, 1);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (4, 21, '14', to_date('08-08-2013 17:16:10', 'dd-mm-yyyy hh24:mi:ss'), 1, 7);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (5, 15, '1', to_date('14-06-2012 18:34:32', 'dd-mm-yyyy hh24:mi:ss'), 1, 7);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (6, 11, '15', to_date('01-09-2011 16:16:32', 'dd-mm-yyyy hh24:mi:ss'), 2, 8);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (7, 13, '17', to_date('26-11-2013 22:10:58', 'dd-mm-yyyy hh24:mi:ss'), 2, 8);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (8, 13, '9', to_date('20-04-2013 13:11:13', 'dd-mm-yyyy hh24:mi:ss'), 2, 9);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (9, 23, '11', to_date('01-01-2014 14:11:30', 'dd-mm-yyyy hh24:mi:ss'), 2, 4);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (10, 6, '12', to_date('01-08-2013 19:20:29', 'dd-mm-yyyy hh24:mi:ss'), 2, 8);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (11, 21, '7', to_date('28-09-2013 11:20:31', 'dd-mm-yyyy hh24:mi:ss'), 2, 10);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (12, 17, '15', to_date('05-03-2013 10:35:54', 'dd-mm-yyyy hh24:mi:ss'), 1, 5);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (13, 11, '6', to_date('15-05-2013 09:14:03', 'dd-mm-yyyy hh24:mi:ss'), 1, 5);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (14, 24, '4', to_date('18-12-2013 08:15:11', 'dd-mm-yyyy hh24:mi:ss'), 1, 10);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (15, 19, '14', to_date('15-02-2012 08:31:12', 'dd-mm-yyyy hh24:mi:ss'), 1, 4);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (16, 23, '5', to_date('09-08-2013 08:14:07', 'dd-mm-yyyy hh24:mi:ss'), 1, 5);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (17, 6, '12', to_date('16-07-2013 06:52:47', 'dd-mm-yyyy hh24:mi:ss'), 2, 3);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (18, 13, '11', to_date('03-11-2011 16:10:13', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (19, 23, '17', to_date('27-07-2012 07:36:18', 'dd-mm-yyyy hh24:mi:ss'), 1, 3);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (20, 10, '11', to_date('22-07-2013 14:19:40', 'dd-mm-yyyy hh24:mi:ss'), 2, 6);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (21, 5, '7', to_date('30-09-2011 15:17:05', 'dd-mm-yyyy hh24:mi:ss'), 1, 4);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (22, 7, '7', to_date('17-02-2013 18:08:34', 'dd-mm-yyyy hh24:mi:ss'), 2, 3);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (23, 5, '20', to_date('21-07-2011 15:46:42', 'dd-mm-yyyy hh24:mi:ss'), 2, 1);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (24, 17, '16', to_date('12-11-2011 11:01:37', 'dd-mm-yyyy hh24:mi:ss'), 1, 7);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (25, 3, '3', to_date('25-08-2011 00:42:06', 'dd-mm-yyyy hh24:mi:ss'), 2, 3);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (26, 23, '2', to_date('23-05-2013 14:16:33', 'dd-mm-yyyy hh24:mi:ss'), 2, 2);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (27, 12, '9', to_date('01-09-2012 22:28:36', 'dd-mm-yyyy hh24:mi:ss'), 1, 10);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (28, 13, '17', to_date('28-09-2012 21:48:09', 'dd-mm-yyyy hh24:mi:ss'), 2, 10);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (29, 18, '15', to_date('29-11-2011 09:50:10', 'dd-mm-yyyy hh24:mi:ss'), 1, 7);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (30, 24, '11', to_date('05-02-2013 19:44:18', 'dd-mm-yyyy hh24:mi:ss'), 1, 4);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (31, 1, '13', to_date('09-04-2013 08:10:42', 'dd-mm-yyyy hh24:mi:ss'), 2, 3);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (32, 9, '7', to_date('15-08-2011 17:01:05', 'dd-mm-yyyy hh24:mi:ss'), 2, 10);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (33, 9, '16', to_date('19-01-2012 22:30:10', 'dd-mm-yyyy hh24:mi:ss'), 1, 3);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (34, 4, '10', to_date('05-01-2012 11:08:56', 'dd-mm-yyyy hh24:mi:ss'), 1, 1);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (35, 16, '11', to_date('14-08-2012 21:50:13', 'dd-mm-yyyy hh24:mi:ss'), 2, 8);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (36, 19, '3', to_date('05-12-2012 08:03:59', 'dd-mm-yyyy hh24:mi:ss'), 1, 3);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (37, 9, '2', to_date('21-08-2011 17:00:04', 'dd-mm-yyyy hh24:mi:ss'), 2, 8);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (38, 18, '15', to_date('30-05-2013 03:46:16', 'dd-mm-yyyy hh24:mi:ss'), 2, 7);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (39, 12, '4', to_date('02-05-2013 21:13:05', 'dd-mm-yyyy hh24:mi:ss'), 2, 3);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (40, 23, '18', to_date('25-04-2013 18:03:30', 'dd-mm-yyyy hh24:mi:ss'), 2, 7);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (41, 24, '4', to_date('19-08-2011 01:21:17', 'dd-mm-yyyy hh24:mi:ss'), 2, 4);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (42, 20, '9', to_date('13-01-2013 02:08:47', 'dd-mm-yyyy hh24:mi:ss'), 1, 4);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (43, 13, '13', to_date('13-06-2011 08:57:10', 'dd-mm-yyyy hh24:mi:ss'), 2, 9);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (44, 3, '11', to_date('10-10-2012 14:13:29', 'dd-mm-yyyy hh24:mi:ss'), 1, 3);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (45, 21, '19', to_date('15-07-2011 19:21:25', 'dd-mm-yyyy hh24:mi:ss'), 1, 7);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (46, 20, '10', to_date('19-12-2012 09:26:49', 'dd-mm-yyyy hh24:mi:ss'), 1, 7);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (47, 12, '2', to_date('07-06-2012 18:06:56', 'dd-mm-yyyy hh24:mi:ss'), 2, 7);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (48, 16, '18', to_date('26-03-2013 19:05:52', 'dd-mm-yyyy hh24:mi:ss'), 1, 8);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (49, 2, '6', to_date('04-10-2012 06:46:01', 'dd-mm-yyyy hh24:mi:ss'), 2, 4);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (50, 10, '6', to_date('06-12-2011 18:02:35', 'dd-mm-yyyy hh24:mi:ss'), 1, 3);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (51, 4, '15', to_date('30-05-2013 03:46:16', 'dd-mm-yyyy hh24:mi:ss'), 2, 1);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (52, 17, '1', to_date('01-01-2013 00:11:03', 'dd-mm-yyyy hh24:mi:ss'), 2, 6);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (53, 13, '18', to_date('26-10-2012 17:35:00', 'dd-mm-yyyy hh24:mi:ss'), 2, 3);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (54, 6, '6', to_date('07-10-2011 16:57:07', 'dd-mm-yyyy hh24:mi:ss'), 2, 3);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (55, 20, '11', to_date('01-02-2012 09:12:51', 'dd-mm-yyyy hh24:mi:ss'), 2, 2);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (56, 6, '8', to_date('10-08-2013 00:45:12', 'dd-mm-yyyy hh24:mi:ss'), 1, 9);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (57, 2, '13', to_date('03-09-2013 06:33:48', 'dd-mm-yyyy hh24:mi:ss'), 1, 6);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (58, 13, '16', to_date('02-06-2012 08:04:54', 'dd-mm-yyyy hh24:mi:ss'), 1, 7);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (59, 4, '9', to_date('22-06-2013 01:26:21', 'dd-mm-yyyy hh24:mi:ss'), 2, 5);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (60, 8, '10', to_date('26-12-2011 02:39:26', 'dd-mm-yyyy hh24:mi:ss'), 2, 4);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (61, 17, '3', to_date('03-03-2013 10:24:25', 'dd-mm-yyyy hh24:mi:ss'), 2, 8);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (62, 5, '19', to_date('18-05-2012 14:52:32', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (63, 15, '2', to_date('07-01-2014 17:40:12', 'dd-mm-yyyy hh24:mi:ss'), 1, 10);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (64, 3, '9', to_date('28-05-2013 02:01:33', 'dd-mm-yyyy hh24:mi:ss'), 1, 7);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (65, 21, '9', to_date('11-05-2013 08:12:40', 'dd-mm-yyyy hh24:mi:ss'), 1, 2);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (66, 7, '17', to_date('03-07-2013 08:02:53', 'dd-mm-yyyy hh24:mi:ss'), 1, 8);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (67, 13, '2', to_date('16-05-2013 14:11:38', 'dd-mm-yyyy hh24:mi:ss'), 1, 8);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (68, 19, '17', to_date('13-10-2013 16:33:00', 'dd-mm-yyyy hh24:mi:ss'), 1, 6);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (69, 16, '8', to_date('17-04-2012 19:22:57', 'dd-mm-yyyy hh24:mi:ss'), 1, 8);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (70, 3, '11', to_date('04-04-2012 01:19:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 7);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (71, 22, '8', to_date('26-07-2013 00:10:16', 'dd-mm-yyyy hh24:mi:ss'), 2, 5);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (72, 18, '7', to_date('03-08-2013 15:44:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 1);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (73, 24, '10', to_date('17-03-2012 03:07:07', 'dd-mm-yyyy hh24:mi:ss'), 1, 6);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (74, 10, '17', to_date('14-10-2011 02:39:15', 'dd-mm-yyyy hh24:mi:ss'), 1, 1);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (75, 16, '3', to_date('03-05-2012 20:09:05', 'dd-mm-yyyy hh24:mi:ss'), 2, 10);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (76, 15, '11', to_date('24-12-2011 15:20:51', 'dd-mm-yyyy hh24:mi:ss'), 2, 2);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (77, 22, '15', to_date('04-07-2012 14:09:14', 'dd-mm-yyyy hh24:mi:ss'), 1, 8);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (78, 23, '17', to_date('12-06-2012 03:53:04', 'dd-mm-yyyy hh24:mi:ss'), 2, 9);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (79, 19, '16', to_date('09-07-2012 17:15:30', 'dd-mm-yyyy hh24:mi:ss'), 2, 8);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (80, 6, '16', to_date('16-10-2012 05:07:19', 'dd-mm-yyyy hh24:mi:ss'), 1, 9);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (81, 4, '4', to_date('18-12-2011 19:14:29', 'dd-mm-yyyy hh24:mi:ss'), 2, 6);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (82, 22, '20', to_date('22-02-2012 10:58:35', 'dd-mm-yyyy hh24:mi:ss'), 2, 3);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (83, 21, '6', to_date('04-07-2011 07:41:05', 'dd-mm-yyyy hh24:mi:ss'), 2, 5);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (84, 19, '9', to_date('10-09-2012 18:24:29', 'dd-mm-yyyy hh24:mi:ss'), 2, 2);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (85, 8, '12', to_date('03-05-2012 21:03:34', 'dd-mm-yyyy hh24:mi:ss'), 2, 8);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (86, 11, '7', to_date('01-12-2012 07:43:31', 'dd-mm-yyyy hh24:mi:ss'), 1, 3);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (87, 13, '13', to_date('02-08-2011 01:53:09', 'dd-mm-yyyy hh24:mi:ss'), 2, 8);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (88, 11, '14', to_date('24-07-2012 01:06:20', 'dd-mm-yyyy hh24:mi:ss'), 1, 6);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (89, 5, '14', to_date('11-10-2011 08:11:48', 'dd-mm-yyyy hh24:mi:ss'), 2, 6);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (90, 7, '12', to_date('06-06-2011 19:11:55', 'dd-mm-yyyy hh24:mi:ss'), 1, 7);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (91, 10, '3', to_date('16-11-2013 09:28:41', 'dd-mm-yyyy hh24:mi:ss'), 2, 7);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (92, 22, '12', to_date('21-10-2013 14:01:39', 'dd-mm-yyyy hh24:mi:ss'), 1, 9);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (93, 3, '11', to_date('12-02-2013 15:30:28', 'dd-mm-yyyy hh24:mi:ss'), 2, 9);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (94, 16, '14', to_date('09-06-2012 14:30:30', 'dd-mm-yyyy hh24:mi:ss'), 1, 7);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (95, 8, '12', to_date('10-07-2013 03:34:16', 'dd-mm-yyyy hh24:mi:ss'), 2, 7);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (96, 21, '17', to_date('15-07-2013 08:50:07', 'dd-mm-yyyy hh24:mi:ss'), 2, 1);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (97, 4, '14', to_date('30-08-2012 04:22:53', 'dd-mm-yyyy hh24:mi:ss'), 1, 1);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (98, 6, '11', to_date('05-09-2012 05:11:05', 'dd-mm-yyyy hh24:mi:ss'), 2, 9);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (99, 9, '15', to_date('11-12-2013 09:54:21', 'dd-mm-yyyy hh24:mi:ss'), 2, 3);
insert into STORE_S (id_store, id_product, shelf, date_oper, id_oper_type, quantity)
values (100, 2, '8', to_date('11-08-2012 19:46:56', 'dd-mm-yyyy hh24:mi:ss'), 1, 8);
commit;
