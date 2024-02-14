mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| centre_formation   |
| hiba               |
| information_schema |
| isgi               |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| test2              |
| world              |
+--------------------+
10 rows in set (0.04 sec)

mysql> create database online_shop;
Query OK, 1 row affected (0.02 sec)

mysql> use online_shop;
Database changed
mysql> create table clients(
    -> id_client int primary key,
    -> nom varchar(13),
    -> prenom varchar(13),
    -> email varchar(50),
    -> adresse varchar(90),
    -> telephone int);
Query OK, 0 rows affected (0.14 sec)

mysql> desc clients;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| id_client | int         | NO   | PRI | NULL    |       |
| nom       | varchar(13) | YES  |     | NULL    |       |
| prenom    | varchar(13) | YES  |     | NULL    |       |
| email     | varchar(50) | YES  |     | NULL    |       |
| adresse   | varchar(90) | YES  |     | NULL    |       |
| telephone | int         | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set (0.02 sec)

mysql> create table produits(
    -> id_produit int primary key,
    -> nom varchar(13),
    -> description varchar(50),
    -> prix double,
    -> stock int);
Query OK, 0 rows affected (0.05 sec)

mysql> desc produits;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| id_produit  | int         | NO   | PRI | NULL    |       |
| nom         | varchar(13) | YES  |     | NULL    |       |
| description | varchar(50) | YES  |     | NULL    |       |
| prix        | double      | YES  |     | NULL    |       |
| stock       | int         | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> create table commandes(
    -> id_commande int primary key,
    -> id_client int,
    -> date_commande date,
    -> statut varchar(8),
    -> total int,
    -> foreign key (id_client) references clients(id_client));
Query OK, 0 rows affected (0.10 sec)

mysql> desc commandes;
+---------------+------------+------+-----+---------+-------+
| Field         | Type       | Null | Key | Default | Extra |
+---------------+------------+------+-----+---------+-------+
| id_commande   | int        | NO   | PRI | NULL    |       |
| id_client     | int        | YES  | MUL | NULL    |       |
| date_commande | date       | YES  |     | NULL    |       |
| statut        | varchar(8) | YES  |     | NULL    |       |
| total         | int        | YES  |     | NULL    |       |
+---------------+------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> alter table commandes
    -> add check (statut = 'en cours' or statut = 'livrée' or statut = 'annulée');
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table commandes
    -> alter statut set default 'en cours';
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc commandes;
+---------------+------------+------+-----+----------+-------+
| Field         | Type       | Null | Key | Default  | Extra |
+---------------+------------+------+-----+----------+-------+
| id_commande   | int        | NO   | PRI | NULL     |       |
| id_client     | int        | YES  | MUL | NULL     |       |
| date_commande | date       | YES  |     | NULL     |       |
| statut        | varchar(8) | YES  |     | en cours |       |
| total         | int        | YES  |     | NULL     |       |
+---------------+------------+------+-----+----------+-------+
5 rows in set (0.00 sec)

mysql> exit;
