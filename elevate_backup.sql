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

--
-- Name: vector; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS vector WITH SCHEMA public;


--
-- Name: EXTENSION vector; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION vector IS 'vector data type and ivfflat and hnsw access methods';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: action_text_rich_texts; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.action_text_rich_texts (
    id bigint NOT NULL,
    name character varying NOT NULL,
    body text,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.action_text_rich_texts OWNER TO lewagoncourse;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.action_text_rich_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.action_text_rich_texts_id_seq OWNER TO lewagoncourse;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNED BY public.action_text_rich_texts.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO lewagoncourse;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO lewagoncourse;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO lewagoncourse;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO lewagoncourse;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO lewagoncourse;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_variant_records_id_seq OWNER TO lewagoncourse;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: appointments; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.appointments (
    id bigint NOT NULL,
    date date,
    status character varying,
    details text,
    doctor_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    paid boolean,
    "time" time without time zone
);


ALTER TABLE public.appointments OWNER TO lewagoncourse;

--
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_id_seq OWNER TO lewagoncourse;

--
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO lewagoncourse;

--
-- Name: doctors; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.doctors (
    id bigint NOT NULL,
    license character varying,
    user_id bigint NOT NULL,
    specialty character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    address character varying,
    latitude double precision,
    longitude double precision
);


ALTER TABLE public.doctors OWNER TO lewagoncourse;

--
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.doctors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctors_id_seq OWNER TO lewagoncourse;

--
-- Name: doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.doctors_id_seq OWNED BY public.doctors.id;


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
-- Name: question_answers; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.question_answers (
    id bigint NOT NULL,
    question character varying,
    answer character varying,
    user_id bigint NOT NULL,
    post_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.question_answers OWNER TO lewagoncourse;

--
-- Name: question_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.question_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_answers_id_seq OWNER TO lewagoncourse;

--
-- Name: question_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.question_answers_id_seq OWNED BY public.question_answers.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.questions (
    id bigint NOT NULL,
    user_question text,
    ai_answer text,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.questions OWNER TO lewagoncourse;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO lewagoncourse;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    rating integer,
    content text,
    user_id bigint NOT NULL,
    post_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.reviews OWNER TO lewagoncourse;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO lewagoncourse;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO lewagoncourse;

--
-- Name: solid_cable_messages; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.solid_cable_messages (
    id bigint NOT NULL,
    channel text,
    payload text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_cable_messages OWNER TO lewagoncourse;

--
-- Name: solid_cable_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.solid_cable_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_cable_messages_id_seq OWNER TO lewagoncourse;

--
-- Name: solid_cable_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.solid_cable_messages_id_seq OWNED BY public.solid_cable_messages.id;


--
-- Name: solid_cache_entries; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.solid_cache_entries (
    id bigint NOT NULL,
    key bytea NOT NULL,
    value bytea NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    key_hash bigint NOT NULL,
    byte_size integer NOT NULL
);


ALTER TABLE public.solid_cache_entries OWNER TO lewagoncourse;

--
-- Name: solid_cache_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.solid_cache_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_cache_entries_id_seq OWNER TO lewagoncourse;

--
-- Name: solid_cache_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.solid_cache_entries_id_seq OWNED BY public.solid_cache_entries.id;


--
-- Name: solid_queue_blocked_executions; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.solid_queue_blocked_executions (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    queue_name character varying NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    concurrency_key character varying NOT NULL,
    expires_at timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_blocked_executions OWNER TO lewagoncourse;

--
-- Name: solid_queue_blocked_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.solid_queue_blocked_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_blocked_executions_id_seq OWNER TO lewagoncourse;

--
-- Name: solid_queue_blocked_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.solid_queue_blocked_executions_id_seq OWNED BY public.solid_queue_blocked_executions.id;


--
-- Name: solid_queue_claimed_executions; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.solid_queue_claimed_executions (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    process_id bigint,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_claimed_executions OWNER TO lewagoncourse;

--
-- Name: solid_queue_claimed_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.solid_queue_claimed_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_claimed_executions_id_seq OWNER TO lewagoncourse;

--
-- Name: solid_queue_claimed_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.solid_queue_claimed_executions_id_seq OWNED BY public.solid_queue_claimed_executions.id;


--
-- Name: solid_queue_failed_executions; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.solid_queue_failed_executions (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    error text,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_failed_executions OWNER TO lewagoncourse;

--
-- Name: solid_queue_failed_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.solid_queue_failed_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_failed_executions_id_seq OWNER TO lewagoncourse;

--
-- Name: solid_queue_failed_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.solid_queue_failed_executions_id_seq OWNED BY public.solid_queue_failed_executions.id;


--
-- Name: solid_queue_jobs; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.solid_queue_jobs (
    id bigint NOT NULL,
    queue_name character varying NOT NULL,
    class_name character varying NOT NULL,
    arguments text,
    priority integer DEFAULT 0 NOT NULL,
    active_job_id character varying,
    scheduled_at timestamp(6) without time zone,
    finished_at timestamp(6) without time zone,
    concurrency_key character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_jobs OWNER TO lewagoncourse;

--
-- Name: solid_queue_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.solid_queue_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_jobs_id_seq OWNER TO lewagoncourse;

--
-- Name: solid_queue_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.solid_queue_jobs_id_seq OWNED BY public.solid_queue_jobs.id;


--
-- Name: solid_queue_pauses; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.solid_queue_pauses (
    id bigint NOT NULL,
    queue_name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_pauses OWNER TO lewagoncourse;

--
-- Name: solid_queue_pauses_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.solid_queue_pauses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_pauses_id_seq OWNER TO lewagoncourse;

--
-- Name: solid_queue_pauses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.solid_queue_pauses_id_seq OWNED BY public.solid_queue_pauses.id;


--
-- Name: solid_queue_processes; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.solid_queue_processes (
    id bigint NOT NULL,
    kind character varying NOT NULL,
    last_heartbeat_at timestamp(6) without time zone NOT NULL,
    supervisor_id bigint,
    pid integer NOT NULL,
    hostname character varying,
    metadata text,
    created_at timestamp(6) without time zone NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.solid_queue_processes OWNER TO lewagoncourse;

--
-- Name: solid_queue_processes_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.solid_queue_processes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_processes_id_seq OWNER TO lewagoncourse;

--
-- Name: solid_queue_processes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.solid_queue_processes_id_seq OWNED BY public.solid_queue_processes.id;


--
-- Name: solid_queue_ready_executions; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.solid_queue_ready_executions (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    queue_name character varying NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_ready_executions OWNER TO lewagoncourse;

--
-- Name: solid_queue_ready_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.solid_queue_ready_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_ready_executions_id_seq OWNER TO lewagoncourse;

--
-- Name: solid_queue_ready_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.solid_queue_ready_executions_id_seq OWNED BY public.solid_queue_ready_executions.id;


--
-- Name: solid_queue_recurring_executions; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.solid_queue_recurring_executions (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    task_key character varying NOT NULL,
    run_at timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_recurring_executions OWNER TO lewagoncourse;

--
-- Name: solid_queue_recurring_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.solid_queue_recurring_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_recurring_executions_id_seq OWNER TO lewagoncourse;

--
-- Name: solid_queue_recurring_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.solid_queue_recurring_executions_id_seq OWNED BY public.solid_queue_recurring_executions.id;


--
-- Name: solid_queue_recurring_tasks; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.solid_queue_recurring_tasks (
    id bigint NOT NULL,
    key character varying NOT NULL,
    schedule character varying NOT NULL,
    command character varying(2048),
    class_name character varying,
    arguments text,
    queue_name character varying,
    priority integer DEFAULT 0,
    static boolean DEFAULT true NOT NULL,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_recurring_tasks OWNER TO lewagoncourse;

--
-- Name: solid_queue_recurring_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.solid_queue_recurring_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_recurring_tasks_id_seq OWNER TO lewagoncourse;

--
-- Name: solid_queue_recurring_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.solid_queue_recurring_tasks_id_seq OWNED BY public.solid_queue_recurring_tasks.id;


--
-- Name: solid_queue_scheduled_executions; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.solid_queue_scheduled_executions (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    queue_name character varying NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    scheduled_at timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_scheduled_executions OWNER TO lewagoncourse;

--
-- Name: solid_queue_scheduled_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.solid_queue_scheduled_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_scheduled_executions_id_seq OWNER TO lewagoncourse;

--
-- Name: solid_queue_scheduled_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.solid_queue_scheduled_executions_id_seq OWNED BY public.solid_queue_scheduled_executions.id;


--
-- Name: solid_queue_semaphores; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.solid_queue_semaphores (
    id bigint NOT NULL,
    key character varying NOT NULL,
    value integer DEFAULT 1 NOT NULL,
    expires_at timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_semaphores OWNER TO lewagoncourse;

--
-- Name: solid_queue_semaphores_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.solid_queue_semaphores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_semaphores_id_seq OWNER TO lewagoncourse;

--
-- Name: solid_queue_semaphores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.solid_queue_semaphores_id_seq OWNED BY public.solid_queue_semaphores.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: lewagoncourse
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    name character varying,
    last_name character varying,
    role character varying
);


ALTER TABLE public.users OWNER TO lewagoncourse;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: lewagoncourse
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO lewagoncourse;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lewagoncourse
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: action_text_rich_texts id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.action_text_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.action_text_rich_texts_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- Name: doctors id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.doctors ALTER COLUMN id SET DEFAULT nextval('public.doctors_id_seq'::regclass);


--
-- Name: question_answers id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.question_answers ALTER COLUMN id SET DEFAULT nextval('public.question_answers_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: solid_cable_messages id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_cable_messages ALTER COLUMN id SET DEFAULT nextval('public.solid_cable_messages_id_seq'::regclass);


--
-- Name: solid_cache_entries id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_cache_entries ALTER COLUMN id SET DEFAULT nextval('public.solid_cache_entries_id_seq'::regclass);


--
-- Name: solid_queue_blocked_executions id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_blocked_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_blocked_executions_id_seq'::regclass);


--
-- Name: solid_queue_claimed_executions id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_claimed_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_claimed_executions_id_seq'::regclass);


--
-- Name: solid_queue_failed_executions id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_failed_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_failed_executions_id_seq'::regclass);


--
-- Name: solid_queue_jobs id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_jobs ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_jobs_id_seq'::regclass);


--
-- Name: solid_queue_pauses id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_pauses ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_pauses_id_seq'::regclass);


--
-- Name: solid_queue_processes id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_processes ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_processes_id_seq'::regclass);


--
-- Name: solid_queue_ready_executions id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_ready_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_ready_executions_id_seq'::regclass);


--
-- Name: solid_queue_recurring_executions id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_recurring_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_recurring_executions_id_seq'::regclass);


--
-- Name: solid_queue_recurring_tasks id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_recurring_tasks ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_recurring_tasks_id_seq'::regclass);


--
-- Name: solid_queue_scheduled_executions id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_scheduled_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_scheduled_executions_id_seq'::regclass);


--
-- Name: solid_queue_semaphores id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_semaphores ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_semaphores_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: action_text_rich_texts; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
1	photo	User	1	1	2025-01-04 21:28:52.555082
2	photo	User	3	2	2025-01-05 09:19:58.577398
3	avatar	User	5	3	2025-01-05 15:10:01.512129
4	avatar	User	6	4	2025-01-05 15:16:19.08394
5	avatar	User	7	5	2025-01-05 15:24:40.723467
6	avatar	User	9	6	2025-01-05 15:28:38.727643
7	photo	User	9	7	2025-01-05 15:30:13.905643
8	avatar	User	10	8	2025-01-05 15:43:51.216469
9	avatar	User	13	9	2025-01-05 16:36:03.088521
12	photo	User	13	12	2025-01-05 16:42:26.935659
13	avatar	User	14	13	2025-01-05 16:46:38.856437
14	avatar	User	15	14	2025-01-05 17:09:42.742102
15	avatar	User	16	15	2025-01-05 17:12:54.087074
16	photos	Post	23	16	2025-01-05 17:13:13.728464
17	avatar	User	17	17	2025-01-05 17:14:03.353715
18	avatar	User	18	18	2025-01-05 17:18:52.82463
19	avatar	User	19	19	2025-01-05 17:23:22.207603
20	photos	Post	24	20	2025-01-05 17:37:43.357266
21	avatar	User	20	21	2025-01-05 17:38:34.966357
22	photo	User	22	22	2025-01-05 18:08:25.309268
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
1	9mczewj14ryda8sdzvpgot3g3ko5	IMG_1791.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	525820	22U+UYuV5gNJ2bdVc7umhg==	2025-01-04 21:28:52.551148
2	53g8uj5k54848xduqxpaudghqqje	user.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	163975	tHDs4EMt7J6t+f4kYYsZMQ==	2025-01-05 09:19:58.574571
3	pgi6onptlw9umk3m2kaqci0p6coz	couple-1822585_1280.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	222798	Mw5Xv6D51XV/I25hk93udQ==	2025-01-05 15:10:01.509182
4	40zd7sh4zuwcxruu27urx9q2f60t	Bloqueos-sexualidad-720x400.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	26726	QtVkBoeiRsRkuJ2DxPlC7A==	2025-01-05 15:16:19.081439
5	6uyzquyvaomnvrbooo1x0c1yxp4w	couple-1822585_1280.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	222798	Mw5Xv6D51XV/I25hk93udQ==	2025-01-05 15:24:40.72077
6	5gd81vf31rfiww87c0wd8975wrgd	assist-4582129_1280.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	140125	4ptwFz0uj+9E+4xPXLIpNA==	2025-01-05 15:28:38.724913
7	3a35xtvh245qgvja0qt35od97zri	couple-1822585_1280.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	222798	Mw5Xv6D51XV/I25hk93udQ==	2025-01-05 15:30:13.903791
8	7w0zglaeqgmgu9pn8jw79c5ed9wg	assist-4582129_1280.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	140125	4ptwFz0uj+9E+4xPXLIpNA==	2025-01-05 15:43:51.213656
9	tqgfownkaoxvoexiq8079jml4x8l	joy-7853671_1280.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	179895	KWE4oMhE8cm5jZoUxrT9tg==	2025-01-05 16:36:03.085551
20	wy87bmsf6ut0137chls9tfjzjdp7	sunset-3392348_1280.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	129781	LDmJW3IYq0G0bSXnU/UX+Q==	2025-01-05 17:37:43.353509
12	h07lgb7mxy314ozxdpljuttxw5f5	bruce-mars-S8ffHr_dxHo-unsplash.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	2058279	5JscbhRW9NTOZ4/K7QOl6w==	2025-01-05 16:42:26.932288
13	pc7c9f80mpce8ps5is2cf8zidoe0	Doctor.jpeg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	81507	nxqzi+Kfn29rTp/shWp0Fg==	2025-01-05 16:46:38.853771
14	el34gmz2abkzsibbnoeoksma16f5	bruce-mars-S8ffHr_dxHo-unsplash.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	2058279	5JscbhRW9NTOZ4/K7QOl6w==	2025-01-05 17:09:42.736528
15	0p87ync68mllg2d7po9fc0oybdvw	sunset-3392348_1280.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	129781	LDmJW3IYq0G0bSXnU/UX+Q==	2025-01-05 17:12:54.084161
16	11fi9guzigrtqx9z2saalznsc8t8	pregnant-2568594_1280.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	264251	uvQM3DSTHgOhFznsOzdEmg==	2025-01-05 17:13:13.726221
17	sm7upe8n35bmltbw6o3cvvk1dp4g	adolescentes.png	image/png	{"identified":true,"analyzed":true}	cloudinary	1105568	4iNDqhvkhTzQED+wmGDjtA==	2025-01-05 17:14:03.351236
18	c5hz2pqq5tv9zp53wl0zomqrqojv	psychology-2647941_1280.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	105938	BEzSw+kDnBz1bZ79VVA1rg==	2025-01-05 17:18:52.822263
19	81piilfkdh65lemsqb32hl4k1uk6	assist-4582129_1280.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	140125	4ptwFz0uj+9E+4xPXLIpNA==	2025-01-05 17:23:22.205181
21	tx85aiv97can84u09pmfj8ssdzxj	Doctor.jpeg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	81507	nxqzi+Kfn29rTp/shWp0Fg==	2025-01-05 17:38:34.960024
22	sn5sr35tevqe68qc781jcw1ybajj	psychology-2647941_1280.jpg	image/jpeg	{"identified":true,"analyzed":true}	cloudinary	105938	BEzSw+kDnBz1bZ79VVA1rg==	2025-01-05 18:08:25.306564
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.appointments (id, date, status, details, doctor_id, user_id, created_at, updated_at, paid, "time") FROM stdin;
46	2025-01-18	Cancelado		1	3	2025-01-05 12:55:32.78189	2025-01-05 12:55:39.385571	f	08:00:00
47	2025-01-10	Cancelado		1	3	2025-01-05 12:57:24.52402	2025-01-05 12:57:38.618191	f	08:00:00
48	2025-01-31	Cancelado		1	3	2025-01-05 12:59:00.955471	2025-01-05 13:04:30.353777	t	08:00:00
50	2025-01-16	Cancelado		1	3	2025-01-05 13:46:55.402227	2025-01-05 13:47:20.302878	f	08:00:00
51	2025-01-08	Cancelado		1	3	2025-01-05 13:47:29.698965	2025-01-05 13:47:54.777485	f	08:00:00
49	2025-01-22	Cancelado		1	3	2025-01-05 13:46:44.766712	2025-01-05 14:29:21.212122	t	14:00:00
53	2025-01-23	Cancelado		1	3	2025-01-05 14:40:08.688408	2025-01-05 14:41:07.520873	t	10:00:00
52	2025-01-10	Cancelado		1	3	2025-01-05 14:39:56.01711	2025-01-05 14:41:10.192379	f	19:00:00
54	2025-01-09	Pendiente		1	10	2025-01-05 15:54:41.11145	2025-01-05 15:54:41.11145	f	10:00:00
55	2025-01-15	Pendiente		1	10	2025-01-05 15:55:10.047675	2025-01-05 15:55:10.047675	f	08:00:00
56	2025-01-22	Pendiente		1	10	2025-01-05 15:55:36.249989	2025-01-05 15:55:36.249989	f	08:00:00
57	2025-01-10	Pendiente		1	10	2025-01-05 15:56:11.45904	2025-01-05 15:56:11.45904	f	08:00:00
58	2025-01-18	Pendiente		2	10	2025-01-05 15:56:54.181632	2025-01-05 15:56:54.181632	f	08:00:00
59	2025-01-06	Pendiente	Detalles de prueba	1	10	2025-01-05 16:07:51.726156	2025-01-05 16:07:51.726156	f	10:00:00
60	2025-01-17	Pendiente		1	10	2025-01-05 16:25:04.682271	2025-01-05 16:25:04.682271	f	08:00:00
61	2025-01-14	Pendiente		1	10	2025-01-05 16:29:09.103783	2025-01-05 16:29:09.103783	f	09:00:00
62	2025-01-09	Confirmado		1	12	2025-01-05 16:34:52.05595	2025-01-05 16:35:14.361152	t	08:00:00
63	2025-01-18	Pendiente		1	13	2025-01-05 16:37:41.128925	2025-01-05 16:37:41.128925	f	11:00:00
64	2025-01-09	Pendiente		1	16	2025-01-05 17:13:31.236546	2025-01-05 17:13:31.236546	f	08:00:00
65	2025-01-23	Cancelado		1	17	2025-01-05 17:14:18.648011	2025-01-05 17:20:39.459399	f	08:00:00
66	2025-01-24	Pendiente		1	17	2025-01-05 17:22:48.559143	2025-01-05 17:22:48.559143	f	08:00:00
67	2025-01-22	Pendiente		1	19	2025-01-05 17:23:59.979393	2025-01-05 17:23:59.979393	f	11:00:00
68	2025-01-17	Pendiente		5	20	2025-01-05 17:38:51.426307	2025-01-05 17:38:51.426307	f	08:00:00
69	2025-01-09	Cancelado		6	22	2025-01-05 18:10:05.674546	2025-01-05 19:02:17.574133	f	16:00:00
71	2025-01-22	Cancelado		1	23	2025-01-05 19:37:12.568245	2025-01-05 19:39:47.722792	t	13:00:00
72	2025-01-15	Cancelado		1	22	2025-01-05 19:40:10.536569	2025-01-05 19:40:12.156174	f	08:00:00
73	2025-01-10	Confirmado		2	22	2025-01-05 19:47:45.488478	2025-01-05 19:48:21.166	t	08:00:00
74	2025-01-16	Cancelado		1	22	2025-01-05 19:50:11.507147	2025-01-05 19:56:56.375834	f	08:00:00
75	2025-01-15	Pendiente		1	22	2025-01-05 19:57:34.187184	2025-01-05 19:57:34.187184	f	08:00:00
42	2025-01-14	Cancelado		1	3	2025-01-05 12:35:54.933403	2025-01-05 12:36:01.645893	f	08:00:00
44	2025-01-17	Cancelado		1	3	2025-01-05 12:52:57.230132	2025-01-05 12:52:59.814685	f	08:00:00
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-12-28 16:35:47.051917	2024-12-28 16:35:47.05192
schema_sha1	8406dc40adbfc28a16ce97f83827ac0d1fdd6975	2024-12-28 16:35:47.056442	2024-12-28 16:35:47.056444
\.


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.doctors (id, license, user_id, specialty, created_at, updated_at, address, latitude, longitude) FROM stdin;
1	LIC152643	1	Psicólogo	2024-12-28 16:35:49.187038	2024-12-28 16:35:49.187038	Av. de las Américas 1049, La Victoria 15034, Perú	-12.076164	-77.016177
3	\N	16	\N	2025-01-05 17:12:54.068323	2025-01-05 17:12:54.068323	\N	\N	\N
2	LIC1529	2	Psicologo	2024-12-28 16:35:49.407279	2025-01-05 17:18:23.857544	Av. Carlos Izaguirre 126, Independencia 15311, Perú	-11.988351	-77.058408
4	LIC4341	18	sexologo	2025-01-05 17:18:52.814955	2025-01-05 17:19:12.124212	\N	\N	\N
5	LIC15404	19	Psicologo	2025-01-05 17:23:22.195173	2025-01-05 17:23:42.723043	\N	\N	\N
6	LIC154044	21	Psicologo	2025-01-05 18:07:38.664693	2025-01-05 18:08:45.88686	\N	\N	\N
\.


--
-- Data for Name: question_answers; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.question_answers (id, question, answer, user_id, post_id, created_at, updated_at) FROM stdin;
1	¿Pregunta sobre el post Beneficios de la meditación diaria?	Respuesta a la pregunta.	3	3	2024-12-28 16:36:04.623455	2024-12-28 16:36:04.623455
2	¿Pregunta sobre el post Mitos comunes sobre la sexualidad?	Respuesta a la pregunta.	4	13	2024-12-28 16:36:04.635323	2024-12-28 16:36:04.635323
3	¿Pregunta sobre el post El impacto de las redes sociales en la salud mental?	Respuesta a la pregunta.	3	7	2024-12-28 16:36:04.646406	2024-12-28 16:36:04.646406
4	¿Pregunta sobre el post La importancia del consentimiento?	Respuesta a la pregunta.	3	18	2024-12-28 16:36:04.65621	2024-12-28 16:36:04.65621
5	Podría agendar una cita la proxima semana?	\N	3	12	2025-01-04 16:59:11.731004	2025-01-04 16:59:11.731004
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.questions (id, user_question, ai_answer, user_id, created_at, updated_at) FROM stdin;
1	hola	¡Hola! ¿En qué puedo ayudarte hoy? Si tienes preguntas sobre salud sexual, salud mental o cómo manejar la ansiedad, estaré encantado de proporcionarte información y consejos.	3	2025-01-04 18:20:02.708758	2025-01-04 18:20:05.172632
2	hola	¡Hola! ¿En qué puedo ayudarte hoy? Si tienes preguntas sobre salud sexual o salud mental, no dudes en preguntar.	22	2025-01-05 20:00:45.774861	2025-01-05 20:00:48.290842
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.reviews (id, rating, content, user_id, post_id, created_at, updated_at) FROM stdin;
1	5	miuy bueno	3	12	2025-01-04 16:59:08.204582	2025-01-04 16:59:08.204582
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.schema_migrations (version) FROM stdin;
20241219211062
20241219211061
20241219211060
20241219211059
20241216200933
20241216161140
20241213202506
20241213195142
20241213181604
20241213180226
20241213180225
20241210200005
20241209215725
20241209215723
20241209215720
20241209215718
20241209215715
20241209215713
20241209215303
20250104141052
20250105115245
\.


--
-- Data for Name: solid_cable_messages; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.solid_cable_messages (id, channel, payload, created_at, updated_at) FROM stdin;
1	question_1	"\\u003cturbo-stream action=\\"update\\" target=\\"question_1\\"\\u003e\\u003ctemplate\\u003e\\u003cdiv id=\\"question_1\\" class=\\"question\\"\\u003e\\n  \\u003cturbo-cable-stream-source channel=\\"Turbo::StreamsChannel\\" signed-stream-name=\\"InF1ZXN0aW9uXzEi--e79b956f2f14e57eff62ee6665e4f9c0f570c576b68fb71d91b7f2d19adff0d5\\"\\u003e\\u003c/turbo-cable-stream-source\\u003e\\n\\n  \\u003cp class=\\"user-question\\"\\u003ehola\\u003c/p\\u003e\\n  \\u003cp class=\\"ai-answer\\"\\u003e¡Hola! ¿En qué puedo ayudarte hoy? Si tienes preguntas sobre salud sexual, salud mental o cómo manejar la ansiedad, estaré encantado de proporcionarte información y consejos.\\u003c/p\\u003e\\n\\u003c/div\\u003e\\n\\u003c/template\\u003e\\u003c/turbo-stream\\u003e"	2025-01-04 18:20:05.259927	2025-01-04 18:20:05.259927
2	question_2	"\\u003cturbo-stream action=\\"update\\" target=\\"question_2\\"\\u003e\\u003ctemplate\\u003e\\u003cdiv id=\\"question_2\\" class=\\"question\\"\\u003e\\n  \\u003cturbo-cable-stream-source channel=\\"Turbo::StreamsChannel\\" signed-stream-name=\\"InF1ZXN0aW9uXzIi--0811b3e3ef5630778d63660629c3dfdc0302134975e6d038c527a3a54e7fc2ff\\"\\u003e\\u003c/turbo-cable-stream-source\\u003e\\n\\n  \\u003cp class=\\"user-question\\"\\u003ehola\\u003c/p\\u003e\\n  \\u003cp class=\\"ai-answer\\"\\u003e¡Hola! ¿En qué puedo ayudarte hoy? Si tienes preguntas sobre salud sexual o salud mental, no dudes en preguntar.\\u003c/p\\u003e\\n\\u003c/div\\u003e\\n\\u003c/template\\u003e\\u003c/turbo-stream\\u003e"	2025-01-05 20:00:48.399303	2025-01-05 20:00:48.399303
\.


--
-- Data for Name: solid_cache_entries; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.solid_cache_entries (id, key, value, created_at, key_hash, byte_size) FROM stdin;
\.


--
-- Data for Name: solid_queue_blocked_executions; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.solid_queue_blocked_executions (id, job_id, queue_name, priority, concurrency_key, expires_at, created_at) FROM stdin;
\.


--
-- Data for Name: solid_queue_claimed_executions; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.solid_queue_claimed_executions (id, job_id, process_id, created_at) FROM stdin;
\.


--
-- Data for Name: solid_queue_failed_executions; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.solid_queue_failed_executions (id, job_id, error, created_at) FROM stdin;
\.


--
-- Data for Name: solid_queue_jobs; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.solid_queue_jobs (id, queue_name, class_name, arguments, priority, active_job_id, scheduled_at, finished_at, concurrency_key, created_at, updated_at) FROM stdin;
1	default	ChatbotJob	{"job_class":"ChatbotJob","job_id":"008f6eff-bc27-4363-80a5-6926e76e4dd9","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/Question/1"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-04T18:20:02.758607000Z","scheduled_at":"2025-01-04T18:20:02.757467000Z"}	0	008f6eff-bc27-4363-80a5-6926e76e4dd9	2025-01-04 18:20:02.757467	2025-01-04 18:20:05.265931	\N	2025-01-04 18:20:02.771298	2025-01-04 18:20:05.265931
2	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"3719544e-d112-4773-a1eb-6ec1fb4d0f25","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/1"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-04T21:28:54.523456000Z","scheduled_at":"2025-01-04T21:28:54.522157000Z"}	0	3719544e-d112-4773-a1eb-6ec1fb4d0f25	2025-01-04 21:28:54.522157	2025-01-04 21:28:55.072176	\N	2025-01-04 21:28:54.53728	2025-01-04 21:28:55.072176
3	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"a97ca889-9e0b-40d4-8629-efa2cb17cc15","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/2"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T09:20:00.315385000Z","scheduled_at":"2025-01-05T09:20:00.314170000Z"}	0	a97ca889-9e0b-40d4-8629-efa2cb17cc15	2025-01-05 09:20:00.31417	2025-01-05 09:20:00.635373	\N	2025-01-05 09:20:00.326773	2025-01-05 09:20:00.635373
4	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"ed148db1-f1e5-4f8c-a493-98494ca524bb","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/3"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T15:10:04.685231000Z","scheduled_at":"2025-01-05T15:10:04.684112000Z"}	0	ed148db1-f1e5-4f8c-a493-98494ca524bb	2025-01-05 15:10:04.684112	2025-01-05 15:10:05.200564	\N	2025-01-05 15:10:04.696666	2025-01-05 15:10:05.200564
5	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"dc61e3d1-1dc3-4a68-ad7a-09859d32cc0d","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/4"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T15:16:20.307359000Z","scheduled_at":"2025-01-05T15:16:20.307204000Z"}	0	dc61e3d1-1dc3-4a68-ad7a-09859d32cc0d	2025-01-05 15:16:20.307204	2025-01-05 15:16:20.54532	\N	2025-01-05 15:16:20.314662	2025-01-05 15:16:20.54532
6	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"ffb7bd97-d06a-448b-9537-2be7f504cda5","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/5"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T15:24:42.471854000Z","scheduled_at":"2025-01-05T15:24:42.470526000Z"}	0	ffb7bd97-d06a-448b-9537-2be7f504cda5	2025-01-05 15:24:42.470526	2025-01-05 15:24:42.967918	\N	2025-01-05 15:24:42.483797	2025-01-05 15:24:42.967918
7	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"da195c9b-3ba3-42e4-81b0-b82caf6ababb","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/6"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T15:28:40.440568000Z","scheduled_at":"2025-01-05T15:28:40.439502000Z"}	0	da195c9b-3ba3-42e4-81b0-b82caf6ababb	2025-01-05 15:28:40.439502	2025-01-05 15:28:40.787812	\N	2025-01-05 15:28:40.452364	2025-01-05 15:28:40.787812
8	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"5982593a-0029-457a-acd6-54f7e74d6246","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/7"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T15:30:16.246475000Z","scheduled_at":"2025-01-05T15:30:16.246313000Z"}	0	5982593a-0029-457a-acd6-54f7e74d6246	2025-01-05 15:30:16.246313	2025-01-05 15:30:16.376934	\N	2025-01-05 15:30:16.246816	2025-01-05 15:30:16.376934
9	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"119a8832-9fb7-48e3-825b-0b34a172e747","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/8"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T15:43:52.596643000Z","scheduled_at":"2025-01-05T15:43:52.595466000Z"}	0	119a8832-9fb7-48e3-825b-0b34a172e747	2025-01-05 15:43:52.595466	2025-01-05 15:43:53.013865	\N	2025-01-05 15:43:52.608627	2025-01-05 15:43:53.013865
10	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"e6bdf4ec-1ecc-4a60-9923-1f7b32351ee1","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/9"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T16:36:06.180578000Z","scheduled_at":"2025-01-05T16:36:06.179003000Z"}	0	e6bdf4ec-1ecc-4a60-9923-1f7b32351ee1	2025-01-05 16:36:06.179003	2025-01-05 16:36:06.676652	\N	2025-01-05 16:36:06.193088	2025-01-05 16:36:06.676652
11	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"1aee9ae0-4a79-4278-a3e6-8cc2dab9bd2d","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/10"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T16:39:29.841377000Z","scheduled_at":"2025-01-05T16:39:29.841223000Z"}	0	1aee9ae0-4a79-4278-a3e6-8cc2dab9bd2d	2025-01-05 16:39:29.841223	2025-01-05 16:39:30.056895	\N	2025-01-05 16:39:29.849255	2025-01-05 16:39:30.056895
13	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"0150194e-3c64-46b3-bda0-64bb725fc7d5","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/11"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T16:39:43.464658000Z","scheduled_at":"2025-01-05T16:39:43.464575000Z"}	0	0150194e-3c64-46b3-bda0-64bb725fc7d5	2025-01-05 16:39:43.464575	2025-01-05 16:39:43.636096	\N	2025-01-05 16:39:43.464881	2025-01-05 16:39:43.636096
12	default	ActiveStorage::PurgeJob	{"job_class":"ActiveStorage::PurgeJob","job_id":"a5639a5b-47e4-463e-bd78-32267b0c11c2","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/10"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T16:39:43.449611000Z","scheduled_at":"2025-01-05T16:39:43.449448000Z"}	0	a5639a5b-47e4-463e-bd78-32267b0c11c2	2025-01-05 16:39:43.449448	2025-01-05 16:39:44.366647	\N	2025-01-05 16:39:43.449893	2025-01-05 16:39:44.366647
15	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"5ba1342d-1041-48c9-921d-dab8be6d78ed","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/12"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T16:42:29.486603000Z","scheduled_at":"2025-01-05T16:42:29.486499000Z"}	0	5ba1342d-1041-48c9-921d-dab8be6d78ed	2025-01-05 16:42:29.486499	2025-01-05 16:42:29.636354	\N	2025-01-05 16:42:29.486825	2025-01-05 16:42:29.636354
14	default	ActiveStorage::PurgeJob	{"job_class":"ActiveStorage::PurgeJob","job_id":"9d14e45f-1ad6-4076-a1ce-c7e528f5db7a","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/11"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T16:42:29.449719000Z","scheduled_at":"2025-01-05T16:42:29.449562000Z"}	0	9d14e45f-1ad6-4076-a1ce-c7e528f5db7a	2025-01-05 16:42:29.449562	2025-01-05 16:42:30.454961	\N	2025-01-05 16:42:29.459031	2025-01-05 16:42:30.454961
16	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"225faca9-d1b7-47c7-8b5b-d4a430f5fb69","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/13"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T16:46:40.424725000Z","scheduled_at":"2025-01-05T16:46:40.424564000Z"}	0	225faca9-d1b7-47c7-8b5b-d4a430f5fb69	2025-01-05 16:46:40.424564	2025-01-05 16:46:40.82575	\N	2025-01-05 16:46:40.432208	2025-01-05 16:46:40.82575
17	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"7dd78a6b-41a4-4297-8219-1e87c85dac26","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/14"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T17:09:45.153934000Z","scheduled_at":"2025-01-05T17:09:45.153233000Z"}	0	7dd78a6b-41a4-4297-8219-1e87c85dac26	2025-01-05 17:09:45.153233	2025-01-05 17:09:45.523435	\N	2025-01-05 17:09:45.167517	2025-01-05 17:09:45.523435
18	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"6442fed8-6898-41d5-88c4-b527d92183d6","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/15"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T17:12:55.497282000Z","scheduled_at":"2025-01-05T17:12:55.497104000Z"}	0	6442fed8-6898-41d5-88c4-b527d92183d6	2025-01-05 17:12:55.497104	2025-01-05 17:12:55.869167	\N	2025-01-05 17:12:55.510864	2025-01-05 17:12:55.869167
19	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"8da5eff8-8529-43c6-b4c9-1392b3a8fb6f","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/16"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T17:13:15.349308000Z","scheduled_at":"2025-01-05T17:13:15.349158000Z"}	0	8da5eff8-8529-43c6-b4c9-1392b3a8fb6f	2025-01-05 17:13:15.349158	2025-01-05 17:13:15.456202	\N	2025-01-05 17:13:15.349634	2025-01-05 17:13:15.456202
20	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"72e6940c-d40e-4304-ad45-46844106fff9","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/17"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T17:14:05.188723000Z","scheduled_at":"2025-01-05T17:14:05.188572000Z"}	0	72e6940c-d40e-4304-ad45-46844106fff9	2025-01-05 17:14:05.188572	2025-01-05 17:14:05.305736	\N	2025-01-05 17:14:05.189062	2025-01-05 17:14:05.305736
21	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"2e869bdc-a1a0-48b0-97ac-75612e1c2897","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/18"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T17:18:54.324362000Z","scheduled_at":"2025-01-05T17:18:54.324202000Z"}	0	2e869bdc-a1a0-48b0-97ac-75612e1c2897	2025-01-05 17:18:54.324202	2025-01-05 17:18:54.75198	\N	2025-01-05 17:18:54.338083	2025-01-05 17:18:54.75198
22	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"1ba508f8-eed0-41a8-bc1d-af4eae3f07d8","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/19"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T17:23:23.799665000Z","scheduled_at":"2025-01-05T17:23:23.799416000Z"}	0	1ba508f8-eed0-41a8-bc1d-af4eae3f07d8	2025-01-05 17:23:23.799416	2025-01-05 17:23:23.922224	\N	2025-01-05 17:23:23.800084	2025-01-05 17:23:23.922224
23	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"cfdadfc9-9856-4c41-9322-79392a797a81","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/20"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T17:37:45.009524000Z","scheduled_at":"2025-01-05T17:37:45.009325000Z"}	0	cfdadfc9-9856-4c41-9322-79392a797a81	2025-01-05 17:37:45.009325	2025-01-05 17:37:45.334139	\N	2025-01-05 17:37:45.017895	2025-01-05 17:37:45.334139
24	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"d2fb559b-52d6-4212-844c-af29233f583e","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/21"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T17:38:36.352142000Z","scheduled_at":"2025-01-05T17:38:36.351988000Z"}	0	d2fb559b-52d6-4212-844c-af29233f583e	2025-01-05 17:38:36.351988	2025-01-05 17:38:36.553195	\N	2025-01-05 17:38:36.35243	2025-01-05 17:38:36.553195
25	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"71801003-d9ce-4dba-87a8-5337e11686eb","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/22"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T18:08:27.090888000Z","scheduled_at":"2025-01-05T18:08:27.090713000Z"}	0	71801003-d9ce-4dba-87a8-5337e11686eb	2025-01-05 18:08:27.090713	2025-01-05 18:08:27.487373	\N	2025-01-05 18:08:27.098979	2025-01-05 18:08:27.487373
26	default	ActiveStorage::AnalyzeJob	{"job_class":"ActiveStorage::AnalyzeJob","job_id":"f241a17d-3bc1-4994-90ef-a7548e0e42ef","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/23"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T18:09:26.065500000Z","scheduled_at":"2025-01-05T18:09:26.065355000Z"}	0	f241a17d-3bc1-4994-90ef-a7548e0e42ef	2025-01-05 18:09:26.065355	2025-01-05 18:09:26.262776	\N	2025-01-05 18:09:26.065815	2025-01-05 18:09:26.262776
27	default	ActiveStorage::PurgeJob	{"job_class":"ActiveStorage::PurgeJob","job_id":"efa1cc01-7070-4bdb-b23c-275813170395","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/ActiveStorage::Blob/23"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T18:22:05.157950000Z","scheduled_at":"2025-01-05T18:22:05.157789000Z"}	0	efa1cc01-7070-4bdb-b23c-275813170395	2025-01-05 18:22:05.157789	2025-01-05 18:22:06.203129	\N	2025-01-05 18:22:05.168927	2025-01-05 18:22:06.203129
28	default	ChatbotJob	{"job_class":"ChatbotJob","job_id":"3b137886-56ed-4770-9a04-61cea15eb465","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[{"_aj_globalid":"gid://elevate/Question/2"}],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2025-01-05T20:00:45.810972000Z","scheduled_at":"2025-01-05T20:00:45.809568000Z"}	0	3b137886-56ed-4770-9a04-61cea15eb465	2025-01-05 20:00:45.809568	2025-01-05 20:00:48.403887	\N	2025-01-05 20:00:45.830864	2025-01-05 20:00:48.403887
\.


--
-- Data for Name: solid_queue_pauses; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.solid_queue_pauses (id, queue_name, created_at) FROM stdin;
\.


--
-- Data for Name: solid_queue_processes; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.solid_queue_processes (id, kind, last_heartbeat_at, supervisor_id, pid, hostname, metadata, created_at, name) FROM stdin;
\.


--
-- Data for Name: solid_queue_ready_executions; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.solid_queue_ready_executions (id, job_id, queue_name, priority, created_at) FROM stdin;
\.


--
-- Data for Name: solid_queue_recurring_executions; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.solid_queue_recurring_executions (id, job_id, task_key, run_at, created_at) FROM stdin;
\.


--
-- Data for Name: solid_queue_recurring_tasks; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.solid_queue_recurring_tasks (id, key, schedule, command, class_name, arguments, queue_name, priority, static, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: solid_queue_scheduled_executions; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.solid_queue_scheduled_executions (id, job_id, queue_name, priority, scheduled_at, created_at) FROM stdin;
\.


--
-- Data for Name: solid_queue_semaphores; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.solid_queue_semaphores (id, key, value, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: lewagoncourse
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, name, last_name, role) FROM stdin;
2	doctors@gmail.com	$2a$12$jTBA67Kj0iNFsoaMZTY28uN8nm2AmDLu91dyIj1cEM00yj6lGAN2C	\N	\N	\N	2024-12-28 16:35:48.208332	2024-12-28 16:35:48.208332	Laura	Martinez	doctor
4	user2@gmail.com	$2a$12$XrXvrIeJCT5z.KmrE5VG.uDSpqjE.rDinSQVBZiM4PMTwB51EKAnK	\N	\N	\N	2024-12-28 16:35:48.826016	2024-12-28 16:35:48.826016	Ana	Diaz	patient
1	doctorm@gmail.com	$2a$12$6GqDUDd/LWhTqqjQGy/ayepokOjJeMOENrb8DqsxmMbgfgOl857ki	\N	\N	\N	2024-12-28 16:35:47.898243	2025-01-04 21:28:55.038637	Juan	Perez	doctor
3	user1@gmail.com	$2a$12$txMO7NjjK6yd5ePgynQXIeD/6gsQHd6v0Q/SVQ2zOPghGJYGHgL6y	\N	\N	\N	2024-12-28 16:35:48.516414	2025-01-05 09:20:00.628893	Carlos	Gomez	patient
17	luer@gmail.com	$2a$12$TjfyY1c0qJu0ing5Bl/lN.Is6ujWkWH6wh/0lb8/RQsxPWdWVAtAi	\N	\N	\N	2025-01-05 17:14:03.340724	2025-01-05 17:14:05.302017	Juan	luer	patient
5	ana1@gmail.com	$2a$12$LSXT1PK6UsTuFU7yifJI7uByeEAnJogarDMdIOLwefG/t1dE2DOTS	\N	\N	\N	2025-01-05 15:10:01.477687	2025-01-05 15:10:05.192848	\N	\N	patient
6	user4@gmail.com	$2a$12$G8Tvv7zB2meMoqt5qvBjdud3YQyq/EMwt3dGWxvTl79YZPvu.zPwi	\N	\N	\N	2025-01-05 15:16:19.067872	2025-01-05 15:16:20.537313	\N	\N	patient
7	userl@gmail.com	$2a$12$gwg0ue6OGUNUvIYd25bwfeE4XDhS6p/tQuHcYm7grFlTgdFrm20n2	\N	\N	\N	2025-01-05 15:24:40.694302	2025-01-05 15:24:42.960712	javier	ponzo	patient
8	jadvia@gmail.com	$2a$12$BZF6nDjm69cpzqzqQ6xox.5rcE4UJzIc06673zmU8vQB0HdAygtQC	\N	\N	\N	2025-01-05 15:25:35.178655	2025-01-05 15:25:35.178655	Carlos	goez	patient
18	peress@gmail.com	$2a$12$gd94gnoH9wk/vODsxdVPG.UzdwJLDWOmRMMLRGYQfHWuwwOLtQqyS	\N	\N	\N	2025-01-05 17:18:52.811339	2025-01-05 17:18:54.747784	Juan	Peressss	doctor
9	remi@gmail.com	$2a$12$bjswiTzdmbu3JJ67HJNmEez0/ZNSDx2PPUp8OFHSZP0kzi5Gu5LgG	\N	\N	\N	2025-01-05 15:28:38.699324	2025-01-05 15:30:16.37208	luke	remi	\N
19	loef@gmail.com	$2a$12$M3nui8YI5.5fhKKkkJefJOB3J7BIRN0b7qtPER1OmwtaCh7mYUbTi	\N	\N	\N	2025-01-05 17:23:22.191299	2025-01-05 17:23:23.916935	user	loef	doctor
10	asdfasd@gmail.com	$2a$12$7bgPDR3AjN4WZ5eOFuV.GOoiXKlGumW583QmvC5adDS.UnBvp33ga	\N	\N	\N	2025-01-05 15:43:51.189251	2025-01-05 15:43:52.965395	javier	losd	\N
11	jvav@gmail.com	$2a$12$vXkVhlRvAF1pGwA8LrBf2utEUmJY9iFP87hlS4h4aSYK/n5kjDFFe	\N	\N	\N	2025-01-05 16:29:37.201193	2025-01-05 16:29:37.201193	lsadf	jvav	\N
12	javie@gmail.com	$2a$12$lGUEqvjDKmv/wyj2NJw8n.8AGC/y6HzyM3FNLRkq0XeynmmGnBgXK	\N	\N	\N	2025-01-05 16:34:41.942992	2025-01-05 16:34:41.942992	Juan	ponz	patient
20	user10@gmail.com	$2a$12$/JZKWFe.Z4YfgHtTMFznoONIWLjCLZRhjgjc0evyy0PDB6pbZpi3a	\N	\N	\N	2025-01-05 17:38:34.929543	2025-01-05 17:38:36.548208	user10	neee	patient
21	lopez@gmail.com	$2a$12$LalISa4C1nntr7AJzVMV7O8dK8XYDZiF/ose/ByTGVuO7D.1M3iAW	\N	\N	\N	2025-01-05 18:07:38.638504	2025-01-05 18:07:38.638504	Carlos	lopez	doctor
22	laura@gmail.com	$2a$12$ppC1LS3TregzpKyjtHvLH.TtM3kUSOShV8C841XdJNvafL2V7cQxW	\N	\N	\N	2025-01-05 18:08:07.821939	2025-01-05 18:08:27.48337	Laura	ser	patient
13	norel@gmail.com	$2a$12$4iqISN6NI491YtHrHRaxbOBRsA6f4AwNdIRg/Q7CmgS9zlfdZVO2e	\N	\N	\N	2025-01-05 16:36:03.060464	2025-01-05 16:42:29.631454	luke	norel	patient
23	new@gmail.com	$2a$12$HeuCWgJ/d06jHBzo60yOiOGfM.k0C42sQ1VWPxzT53aLo4svblMki	\N	\N	\N	2025-01-05 19:36:28.857668	2025-01-05 19:36:28.857668	new	new	patient
14	luecar@gmail.com	$2a$12$Ee0u7G2eAKgEBHgX/Zt8Gu0J/b.IXuJ1NStMU2FrhxP1buFUPzz7G	\N	\N	\N	2025-01-05 16:46:38.845683	2025-01-05 16:46:40.820669	Carlos	lue	doctor
15	doctorss@gmail.com	$2a$12$b1oncgseaLC5JbfAjcZxoe3zuj.YKVFWq/BSxcd5j/XwL5fLZ9fp.	\N	\N	\N	2025-01-05 17:09:42.727639	2025-01-05 17:09:45.518848	Juan	luke	doctor
16	luke@gmail.com	$2a$12$V1CNEtbqoemX4wq.SsVFe.hI4.PV7SB7jLmJGpWkwQJIh0x8uUioS	\N	\N	\N	2025-01-05 17:12:54.046446	2025-01-05 17:12:55.864778	doctor	luke	doctor
\.


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.action_text_rich_texts_id_seq', 1, false);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 23, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 23, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.appointments_id_seq', 75, true);


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.doctors_id_seq', 6, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.posts_id_seq', 25, true);


--
-- Name: question_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.question_answers_id_seq', 6, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.questions_id_seq', 2, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.reviews_id_seq', 2, true);


--
-- Name: solid_cable_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.solid_cable_messages_id_seq', 2, true);


--
-- Name: solid_cache_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.solid_cache_entries_id_seq', 1, false);


--
-- Name: solid_queue_blocked_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.solid_queue_blocked_executions_id_seq', 1, false);


--
-- Name: solid_queue_claimed_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.solid_queue_claimed_executions_id_seq', 28, true);


--
-- Name: solid_queue_failed_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.solid_queue_failed_executions_id_seq', 1, false);


--
-- Name: solid_queue_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.solid_queue_jobs_id_seq', 28, true);


--
-- Name: solid_queue_pauses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.solid_queue_pauses_id_seq', 1, false);


--
-- Name: solid_queue_processes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.solid_queue_processes_id_seq', 126, true);


--
-- Name: solid_queue_ready_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.solid_queue_ready_executions_id_seq', 28, true);


--
-- Name: solid_queue_recurring_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.solid_queue_recurring_executions_id_seq', 1, false);


--
-- Name: solid_queue_recurring_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.solid_queue_recurring_tasks_id_seq', 1, false);


--
-- Name: solid_queue_scheduled_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.solid_queue_scheduled_executions_id_seq', 1, false);


--
-- Name: solid_queue_semaphores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.solid_queue_semaphores_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lewagoncourse
--

SELECT pg_catalog.setval('public.users_id_seq', 23, true);


--
-- Name: action_text_rich_texts action_text_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.action_text_rich_texts
    ADD CONSTRAINT action_text_rich_texts_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: question_answers question_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.question_answers
    ADD CONSTRAINT question_answers_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: solid_cable_messages solid_cable_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_cable_messages
    ADD CONSTRAINT solid_cable_messages_pkey PRIMARY KEY (id);


--
-- Name: solid_cache_entries solid_cache_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_cache_entries
    ADD CONSTRAINT solid_cache_entries_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_blocked_executions solid_queue_blocked_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_blocked_executions
    ADD CONSTRAINT solid_queue_blocked_executions_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_claimed_executions solid_queue_claimed_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_claimed_executions
    ADD CONSTRAINT solid_queue_claimed_executions_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_failed_executions solid_queue_failed_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_failed_executions
    ADD CONSTRAINT solid_queue_failed_executions_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_jobs solid_queue_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_jobs
    ADD CONSTRAINT solid_queue_jobs_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_pauses solid_queue_pauses_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_pauses
    ADD CONSTRAINT solid_queue_pauses_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_processes solid_queue_processes_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_processes
    ADD CONSTRAINT solid_queue_processes_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_ready_executions solid_queue_ready_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_ready_executions
    ADD CONSTRAINT solid_queue_ready_executions_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_recurring_executions solid_queue_recurring_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_recurring_executions
    ADD CONSTRAINT solid_queue_recurring_executions_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_recurring_tasks solid_queue_recurring_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_recurring_tasks
    ADD CONSTRAINT solid_queue_recurring_tasks_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_scheduled_executions solid_queue_scheduled_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_scheduled_executions
    ADD CONSTRAINT solid_queue_scheduled_executions_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_semaphores solid_queue_semaphores_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.solid_queue_semaphores
    ADD CONSTRAINT solid_queue_semaphores_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_action_text_rich_texts_uniqueness; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE UNIQUE INDEX index_action_text_rich_texts_uniqueness ON public.action_text_rich_texts USING btree (record_type, record_id, name);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_appointments_on_doctor_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_appointments_on_doctor_id ON public.appointments USING btree (doctor_id);


--
-- Name: index_appointments_on_user_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_appointments_on_user_id ON public.appointments USING btree (user_id);


--
-- Name: index_doctors_on_user_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_doctors_on_user_id ON public.doctors USING btree (user_id);


--
-- Name: index_question_answers_on_post_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_question_answers_on_post_id ON public.question_answers USING btree (post_id);


--
-- Name: index_question_answers_on_user_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_question_answers_on_user_id ON public.question_answers USING btree (user_id);


--
-- Name: index_questions_on_user_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_questions_on_user_id ON public.questions USING btree (user_id);


--
-- Name: index_reviews_on_post_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_reviews_on_post_id ON public.reviews USING btree (post_id);


--
-- Name: index_reviews_on_user_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_reviews_on_user_id ON public.reviews USING btree (user_id);


--
-- Name: index_solid_cable_messages_on_channel; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_cable_messages_on_channel ON public.solid_cable_messages USING btree (channel);


--
-- Name: index_solid_cable_messages_on_created_at; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_cable_messages_on_created_at ON public.solid_cable_messages USING btree (created_at);


--
-- Name: index_solid_cache_entries_on_byte_size; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_cache_entries_on_byte_size ON public.solid_cache_entries USING btree (byte_size);


--
-- Name: index_solid_cache_entries_on_key_hash; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE UNIQUE INDEX index_solid_cache_entries_on_key_hash ON public.solid_cache_entries USING btree (key_hash);


--
-- Name: index_solid_cache_entries_on_key_hash_and_byte_size; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_cache_entries_on_key_hash_and_byte_size ON public.solid_cache_entries USING btree (key_hash, byte_size);


--
-- Name: index_solid_queue_blocked_executions_for_maintenance; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_queue_blocked_executions_for_maintenance ON public.solid_queue_blocked_executions USING btree (expires_at, concurrency_key);


--
-- Name: index_solid_queue_blocked_executions_for_release; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_queue_blocked_executions_for_release ON public.solid_queue_blocked_executions USING btree (concurrency_key, priority, job_id);


--
-- Name: index_solid_queue_blocked_executions_on_job_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE UNIQUE INDEX index_solid_queue_blocked_executions_on_job_id ON public.solid_queue_blocked_executions USING btree (job_id);


--
-- Name: index_solid_queue_claimed_executions_on_job_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE UNIQUE INDEX index_solid_queue_claimed_executions_on_job_id ON public.solid_queue_claimed_executions USING btree (job_id);


--
-- Name: index_solid_queue_claimed_executions_on_process_id_and_job_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_queue_claimed_executions_on_process_id_and_job_id ON public.solid_queue_claimed_executions USING btree (process_id, job_id);


--
-- Name: index_solid_queue_dispatch_all; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_queue_dispatch_all ON public.solid_queue_scheduled_executions USING btree (scheduled_at, priority, job_id);


--
-- Name: index_solid_queue_failed_executions_on_job_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE UNIQUE INDEX index_solid_queue_failed_executions_on_job_id ON public.solid_queue_failed_executions USING btree (job_id);


--
-- Name: index_solid_queue_jobs_for_alerting; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_queue_jobs_for_alerting ON public.solid_queue_jobs USING btree (scheduled_at, finished_at);


--
-- Name: index_solid_queue_jobs_for_filtering; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_queue_jobs_for_filtering ON public.solid_queue_jobs USING btree (queue_name, finished_at);


--
-- Name: index_solid_queue_jobs_on_active_job_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_queue_jobs_on_active_job_id ON public.solid_queue_jobs USING btree (active_job_id);


--
-- Name: index_solid_queue_jobs_on_class_name; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_queue_jobs_on_class_name ON public.solid_queue_jobs USING btree (class_name);


--
-- Name: index_solid_queue_jobs_on_finished_at; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_queue_jobs_on_finished_at ON public.solid_queue_jobs USING btree (finished_at);


--
-- Name: index_solid_queue_pauses_on_queue_name; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE UNIQUE INDEX index_solid_queue_pauses_on_queue_name ON public.solid_queue_pauses USING btree (queue_name);


--
-- Name: index_solid_queue_poll_all; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_queue_poll_all ON public.solid_queue_ready_executions USING btree (priority, job_id);


--
-- Name: index_solid_queue_poll_by_queue; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_queue_poll_by_queue ON public.solid_queue_ready_executions USING btree (queue_name, priority, job_id);


--
-- Name: index_solid_queue_processes_on_last_heartbeat_at; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_queue_processes_on_last_heartbeat_at ON public.solid_queue_processes USING btree (last_heartbeat_at);


--
-- Name: index_solid_queue_processes_on_name_and_supervisor_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE UNIQUE INDEX index_solid_queue_processes_on_name_and_supervisor_id ON public.solid_queue_processes USING btree (name, supervisor_id);


--
-- Name: index_solid_queue_processes_on_supervisor_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_queue_processes_on_supervisor_id ON public.solid_queue_processes USING btree (supervisor_id);


--
-- Name: index_solid_queue_ready_executions_on_job_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE UNIQUE INDEX index_solid_queue_ready_executions_on_job_id ON public.solid_queue_ready_executions USING btree (job_id);


--
-- Name: index_solid_queue_recurring_executions_on_job_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE UNIQUE INDEX index_solid_queue_recurring_executions_on_job_id ON public.solid_queue_recurring_executions USING btree (job_id);


--
-- Name: index_solid_queue_recurring_executions_on_task_key_and_run_at; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE UNIQUE INDEX index_solid_queue_recurring_executions_on_task_key_and_run_at ON public.solid_queue_recurring_executions USING btree (task_key, run_at);


--
-- Name: index_solid_queue_recurring_tasks_on_key; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE UNIQUE INDEX index_solid_queue_recurring_tasks_on_key ON public.solid_queue_recurring_tasks USING btree (key);


--
-- Name: index_solid_queue_recurring_tasks_on_static; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_queue_recurring_tasks_on_static ON public.solid_queue_recurring_tasks USING btree (static);


--
-- Name: index_solid_queue_scheduled_executions_on_job_id; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE UNIQUE INDEX index_solid_queue_scheduled_executions_on_job_id ON public.solid_queue_scheduled_executions USING btree (job_id);


--
-- Name: index_solid_queue_semaphores_on_expires_at; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_queue_semaphores_on_expires_at ON public.solid_queue_semaphores USING btree (expires_at);


--
-- Name: index_solid_queue_semaphores_on_key; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE UNIQUE INDEX index_solid_queue_semaphores_on_key ON public.solid_queue_semaphores USING btree (key);


--
-- Name: index_solid_queue_semaphores_on_key_and_value; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE INDEX index_solid_queue_semaphores_on_key_and_value ON public.solid_queue_semaphores USING btree (key, value);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: lewagoncourse
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: questions fk_rails_047ab75908; Type: FK CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT fk_rails_047ab75908 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: question_answers fk_rails_3e5f1d6a34; Type: FK CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.question_answers
    ADD CONSTRAINT fk_rails_3e5f1d6a34 FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: reviews fk_rails_74a66bd6c5; Type: FK CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_74a66bd6c5 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: doctors fk_rails_899b01ef33; Type: FK CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT fk_rails_899b01ef33 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: appointments fk_rails_8db8e1e8a5; Type: FK CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fk_rails_8db8e1e8a5 FOREIGN KEY (doctor_id) REFERENCES public.doctors(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: appointments fk_rails_9e31213785; Type: FK CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fk_rails_9e31213785 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: reviews fk_rails_a4cffdde38; Type: FK CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_a4cffdde38 FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: question_answers fk_rails_ee3b96d53c; Type: FK CONSTRAINT; Schema: public; Owner: lewagoncourse
--

ALTER TABLE ONLY public.question_answers
    ADD CONSTRAINT fk_rails_ee3b96d53c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

