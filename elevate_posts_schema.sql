--
-- PostgreSQL database dump
--

-- Dumped from database version 15.10 (Homebrew)
-- Dumped by pg_dump version 15.10 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: posts; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    title character varying,
    category character varying,
    doctor_id bigint NOT NULL,
    content text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    embedding public.vector(1536)
);


ALTER TABLE public.posts OWNER TO lewagoncourse;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO lewagoncourse;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: index_posts_on_doctor_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_posts_on_doctor_id ON public.posts USING btree (doctor_id);


--
-- Name: posts fk_rails_04bc9165f8; Type: FK CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT fk_rails_04bc9165f8 FOREIGN KEY (doctor_id) REFERENCES public.doctors(id);


--
-- PostgreSQL database dump complete
--

