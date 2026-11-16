CREATE TABLE "aboniment" (
  "kod_chitatelya" int4 NOT NULL,
  "kod_knigi" int4 NOT NULL,
  "data_vydachi" date NOT NULL,
  "srok" int4 NOT NULL,
  "otmetka_o_vozvrate" bool NOT NULL,
  PRIMARY KEY ("kod_chitatelya", "kod_knigi")
);

INSERT INTO "aboniment" ("kod_chitatelya", "kod_knigi", "data_vydachi", "srok", "otmetka_o_vozvrate") VALUES
  ('1', '101', '2026-09-01', '14', 'false'),
  ('1', '102', '2026-09-05', '14', 'true'),
  ('2', '103', '2026-09-10', '21', 'false'),
  ('3', '104', '2026-09-12', '14', 'true'),
  ('4', '105', '2026-09-15', '30', 'false'),
  ('6', '106', '2026-09-18', '14', 'true'),
  ('6', '107', '2026-09-20', '14', 'false'),
  ('8', '108', '2026-09-22', '21', 'true');

CREATE TABLE "chitateli" (
  "kod_chitatelya" int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
  "familiya" varchar(50) NOT NULL,
  "imya" varchar(50) NOT NULL,
  "otchestvo" varchar(50),
  "data_rozhdeniya" date,
  "pasportnye_dannye" varchar(20),
  "adres" varchar(150),
  "kontaktniy_telefon" varchar(20),
  PRIMARY KEY ("kod_chitatelya")
);

INSERT INTO "chitateli" ("kod_chitatelya", "familiya", "imya", "otchestvo", "data_rozhdeniya", "pasportnye_dannye", "adres", "kontaktniy_telefon") OVERRIDING SYSTEM VALUE VALUES
  ('1', 'Андреев', 'Иван', 'Петрович', '1990-03-15', '4500111111', 'Москва, Шипиловская улица, 10', '89000000001'),
  ('2', 'Борисов', 'Пётр', 'Иванович', '1990-07-20', '4500222222', 'Москва, Шипиловская улица, 15', '89000000002'),
  ('3', 'Васильев', 'Сергей', 'Олегович', '1990-11-05', '4500333333', 'Москва, Шипиловская улица, 20', '89000000003'),
  ('4', 'Громов', 'Алексей', 'Игоревич', '1990-02-10', '4500444444', 'Москва, Домодедовская улица, 5', NULL),
  ('5', 'Алексеев', 'Дмитрий', 'Сергеевич', '1995-04-12', '', 'Москва, Шипиловская улица, 25', '89000000005'),
  ('6', 'Белов', 'Максим', 'Андреевич', '1992-06-18', '4500666666', 'Москва, Борисовская улица, 8', NULL),
  ('7', 'Волков', 'Никита', 'Денисович', '1998-09-22', '4500777777', 'Москва, Домодедовская улица, 12', '89000000007'),
  ('8', 'Гусев', 'Егор', 'Максимович', '1991-12-01', '4500888888', 'Москва, Каширское шоссе, 3', '89000000008'),
  ('9', 'Абрамов', 'Артём', 'Владимирович', '1990-08-14', '4500999999', 'Москва, Шипиловская улица, 30', '89000000009'),
  ('34', 'Данилов', 'Олег', 'Павлович', '1993-04-02', NULL, 'Москва, Борисовский проезд, 10', NULL);

SELECT setval(pg_get_serial_sequence('"chitateli"', 'kod_chitatelya'), coalesce(max("kod_chitatelya"), 0) + 1, false) FROM "chitateli";

CREATE TABLE "customers" (
  "id" int4 NOT NULL,
  "name" text NOT NULL,
  "city" text NOT NULL,
  "signed_up" date NOT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "customers" ("id", "name", "city", "signed_up") VALUES
  ('1', 'Аня', 'Москва', '2026-03-14'),
  ('2', 'Борис', 'Санкт-Петербург', '2026-03-20'),
  ('3', 'Вера', 'Москва', '2026-04-02'),
  ('4', 'Глеб', 'Казань', '2026-04-11'),
  ('5', 'Дина', 'Новосибирск', '2026-04-25'),
  ('6', 'Егор', 'Москва', '2026-05-05'),
  ('7', 'Жанна', 'Санкт-Петербург', '2026-05-17'),
  ('8', 'Игорь', 'Казань', '2026-06-01'),
  ('9', 'Лена', 'Новосибирск', '2026-06-09'),
  ('10', 'Марк', 'Москва', '2026-06-21');

CREATE TABLE "orders" (
  "id" int4 NOT NULL,
  "customer_id" int4 NOT NULL,
  "product_id" int4 NOT NULL,
  "qty" int4 NOT NULL,
  "ordered_at" date NOT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "orders" ("id", "customer_id", "product_id", "qty", "ordered_at") VALUES
  ('1', '1', '5', '1', '2026-05-03'),
  ('2', '2', '1', '1', '2026-05-06'),
  ('3', '3', '3', '2', '2026-05-09'),
  ('4', '4', '6', '1', '2026-05-12'),
  ('5', '1', '7', '2', '2026-05-15'),
  ('6', '6', '2', '1', '2026-05-21'),
  ('7', '7', '4', '1', '2026-05-27'),
  ('8', '2', '8', '1', '2026-06-02'),
  ('9', '8', '1', '1', '2026-06-05'),
  ('10', '3', '5', '1', '2026-06-08'),
  ('11', '5', '3', '1', '2026-06-11'),
  ('12', '6', '7', '3', '2026-06-14'),
  ('13', '1', '4', '1', '2026-06-17'),
  ('14', '7', '6', '1', '2026-06-23'),
  ('15', '4', '8', '2', '2026-06-26'),
  ('16', '8', '3', '1', '2026-07-01'),
  ('17', '2', '5', '1', '2026-07-04'),
  ('18', '5', '2', '1', '2026-07-09'),
  ('19', '6', '4', '2', '2026-07-12'),
  ('20', '3', '7', '1', '2026-07-15'),
  ('21', '7', '1', '1', '2026-07-18'),
  ('22', '4', '2', '1', '2026-07-21');

CREATE TABLE "products" (
  "id" int4 NOT NULL,
  "title" text NOT NULL,
  "category" text NOT NULL,
  "price" int4 NOT NULL,
  PRIMARY KEY ("id")
);

INSERT INTO "products" ("id", "title", "category", "price") VALUES
  ('1', 'Клавиатура K3 Pro', 'клавиатуры', '4990'),
  ('2', 'Клавиатура Alu 87', 'клавиатуры', '7990'),
  ('3', 'Мышь M1 Wireless', 'мыши', '2490'),
  ('4', 'Мышь Pro Click', 'мыши', '3990'),
  ('5', 'Монитор 27" IPS', 'мониторы', '18990'),
  ('6', 'Монитор 24" FHD', 'мониторы', '11990'),
  ('7', 'Коврик XL', 'аксессуары', '990'),
  ('8', 'Хаб USB-C 6-в-1', 'аксессуары', '3490');

CREATE TABLE "rezultat_variant3" (
  "kod_chitatelya" int4,
  "familiya" varchar(50),
  "imya" varchar(50),
  "otchestvo" varchar(50),
  "data_rozhdeniya" date,
  "pasportnye_dannye" varchar(20),
  "adres" varchar(150),
  "kontaktniy_telefon" varchar(20)
);

INSERT INTO "rezultat_variant3" ("kod_chitatelya", "familiya", "imya", "otchestvo", "data_rozhdeniya", "pasportnye_dannye", "adres", "kontaktniy_telefon") VALUES
  ('9', 'Абрамов', 'Артём', 'Владимирович', '1990-08-14', '4500999999', 'Москва, Шипиловская улица, 30', '89000000009'),
  ('6', 'Белов', 'Максим', 'Андреевич', '1992-06-18', '4500666666', 'Москва, Борисовская улица, 8', NULL),
  ('4', 'Громов', 'Алексей', 'Игоревич', '1990-02-10', '4500444444', 'Москва, Борисовский проезд', NULL);

ALTER TABLE "aboniment" ADD FOREIGN KEY ("kod_chitatelya") REFERENCES "chitateli" ("kod_chitatelya");

ALTER TABLE "orders" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");
