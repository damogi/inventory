--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: inventory; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE inventory WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';


ALTER DATABASE inventory OWNER TO postgres;

\connect inventory

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE inventory (
    user_id integer NOT NULL,
    item_id integer NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE inventory OWNER TO postgres;

--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE items (
    item_id integer NOT NULL,
    name character varying(2044) NOT NULL,
    type character varying(2044) NOT NULL,
    cost integer NOT NULL
);


ALTER TABLE items OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "user" (
    user_id integer NOT NULL,
    gold integer NOT NULL
);


ALTER TABLE "user" OWNER TO postgres;

--
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO inventory (user_id, item_id, amount) VALUES (1, 2, 1);
INSERT INTO inventory (user_id, item_id, amount) VALUES (1, 3, 5);
INSERT INTO inventory (user_id, item_id, amount) VALUES (2, 2, 1);
INSERT INTO inventory (user_id, item_id, amount) VALUES (2, 4, 1);
INSERT INTO inventory (user_id, item_id, amount) VALUES (3, 2, 1);
INSERT INTO inventory (user_id, item_id, amount) VALUES (3, 3, 3);
INSERT INTO inventory (user_id, item_id, amount) VALUES (1, 1, 5);


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO items (item_id, name, type, cost) VALUES (1, 'escudo dragon', 'escudo', 10);
INSERT INTO items (item_id, name, type, cost) VALUES (2, 'filo infinito', 'espada', 15);
INSERT INTO items (item_id, name, type, cost) VALUES (3, 'vida', 'pocion', 3);
INSERT INTO items (item_id, name, type, cost) VALUES (4, 'manto solar', 'capa', 7);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "user" (user_id, gold) VALUES (1, 500);
INSERT INTO "user" (user_id, gold) VALUES (2, 600);
INSERT INTO "user" (user_id, gold) VALUES (3, 1000);


--
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (user_id, item_id);


--
-- Name: items items_item_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_item_id_key UNIQUE (item_id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (item_id);


--
-- Name: user unique_user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT unique_user_id UNIQUE (user_id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- Name: index_amount; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_amount ON inventory USING btree (amount);


--
-- Name: index_gold; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_gold ON "user" USING btree (gold);


--
-- Name: index_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_item_id ON items USING btree (item_id);


--
-- Name: index_item_id1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_item_id1 ON inventory USING btree (item_id);


--
-- Name: index_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_name ON items USING btree (name);


--
-- Name: index_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_type ON items USING btree (type);


--
-- Name: index_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_id ON inventory USING btree (user_id);


--
-- Name: inventory lnk_items_inventory; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inventory
    ADD CONSTRAINT lnk_items_inventory FOREIGN KEY (item_id) REFERENCES items(item_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: inventory lnk_user_inventory; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inventory
    ADD CONSTRAINT lnk_user_inventory FOREIGN KEY (user_id) REFERENCES "user"(user_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

