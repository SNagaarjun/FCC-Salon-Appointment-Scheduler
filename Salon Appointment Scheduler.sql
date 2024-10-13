camper: /project$ psql --username=freecodecamp --dbname=postgres
psql (12.17 (Ubuntu 12.17-1.pgdg22.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

postgres=>  \c salon
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "salon" as user "freecodecamp".
salon=> CREATE TABLE appointments (appointment_id SERIAL NOT NULL,customer_id INTEGER NOT NULL,service_id INTEGER NOT NULL,time VARCHAR(50) NOT NULL);
ERROR:  relation "appointments" already exists
salon=> CREATE TABLE customers (customer_id SERIAL NOT NULL,name VARCHAR(50) NOT NULL,phone VARCHAR(50) UNIQUE NOT NULL);
CREATE TABLE
salon=> CREATE TABLE services (service_id SERIAL NOT NULL,name VARCHAR(50) NOT NULL);
CREATE TABLE
salon=> INSERT INTO services VALUES
salon->  (1, 'cut'  ), (2, 'color'), (3, 'perm' ), 
salon->  NSERT INTO services VALUES(1, 'cut'  ), (2, 'color'), (3, 'perm' ),  (4, 'style'), (5, 'trim');(4, 'style'), (5, 'trim');
ERROR:  syntax error at or near "NSERT"
LINE 3:  NSERT INTO services VALUES(1, 'cut'  ), (2, 'color'), (3, '...
         ^
ERROR:  syntax error at or near "4"
LINE 1: (4, 'style'), (5, 'trim');
         ^
salon=> INSERT INTO services VALUES(1, 'cut'  ), (2, 'color'), (3, 'perm' ),  (4, 'style'), (5, 'trim');
INSERT 0 5
salon=>  ALTER TABLE appointments ADD PRIMARY KEY (appointment_id);
ALTER TABLE
salon=>  ALTER TABLE services     ADD PRIMARY KEY (service_id);
ALTER TABLE
salon=> ALTER TABLE customers    ADD PRIMARY KEY (customer_id);
ALTER TABLE
salon=> ALTER TABLE appointments ADD FOREIGN KEY (customer_id) REFERENCES customers (customer_id);
ALTER TABLE
salon=> ALTER TABLE appointments ADD FOREIGN KEY (service_id)  REFERENCES services  (service_id);
ALTER TABLE
salon=> pg_dump -cC --inserts -U freecodecamp salon > salon.sql
salon-> \q
camper: /project$ 
