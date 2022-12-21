--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    views integer DEFAULT 0,
    "userId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "confirmPassword" text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 'f1b95beb-9692-4cdc-b4ad-bd18f3d18775', 1, '2022-12-21 13:07:23.023632-03');
INSERT INTO public.sessions VALUES (2, 'a29402e7-6ce4-4dfd-b46f-3fdf4977b5b8', 2, '2022-12-21 13:12:07.248807-03');
INSERT INTO public.sessions VALUES (3, 'f61b6334-505c-4779-9999-b9748162f485', 3, '2022-12-21 13:16:43.306916-03');
INSERT INTO public.sessions VALUES (4, '84a90b37-d2ef-40ed-abc8-0dbbc28224f0', 4, '2022-12-21 13:18:56.48135-03');
INSERT INTO public.sessions VALUES (5, '895ac5e8-844b-4095-8b2a-8e44353fd91a', 4, '2022-12-21 13:47:33.367634-03');
INSERT INTO public.sessions VALUES (6, '10ce3967-0c94-46be-9716-ff34a70b7417', 5, '2022-12-21 13:51:04.798328-03');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (3, 'https://media.tenor.com/5T6NigZGKnMAAAAM/leonardo-di-caprio-dance.gif', 'BxBy-KFA0C_X2X__P_wNz', 1, 1, '2022-12-21 13:08:52.11442-03');
INSERT INTO public.urls VALUES (4, 'https://media.tenor.com/Cl6kbnQN9N8AAAAM/mad-leonardo-dicaprio.gif', 'DJFD-cdb7zN748qImEs7S', 3, 1, '2022-12-21 13:09:00.649009-03');
INSERT INTO public.urls VALUES (1, 'https://media.tenor.com/oFvfCORxVFcAAAAM/leonardo-dicaprio.gif', 'ZG44lQK0UMT9k3bu-9q1C', 5, 1, '2022-12-21 13:07:50.587101-03');
INSERT INTO public.urls VALUES (7, 'https://media.tenor.com/f0Iadz9DxGoAAAAM/wolf-of-wallstreet-jordan-make-it-rain.gif', 'ZW0via8J3CuaaT9CNubul', 8, 2, '2022-12-21 13:13:19.110691-03');
INSERT INTO public.urls VALUES (8, 'https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif', 'JopUZtzF12Cc5MdJP-Mkz', 0, 2, '2022-12-21 13:14:30.870509-03');
INSERT INTO public.urls VALUES (9, 'https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif', 'VQrddYZqUT-kBPmvp1mJy', 0, 2, '2022-12-21 13:14:31.392743-03');
INSERT INTO public.urls VALUES (10, 'https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif', 'UbHL02mwDICOfDVz4JmL4', 0, 2, '2022-12-21 13:14:32.197059-03');
INSERT INTO public.urls VALUES (11, 'https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif', '8vpcSHS_5Ujhc9gj_F11l', 0, 2, '2022-12-21 13:14:33.776191-03');
INSERT INTO public.urls VALUES (12, 'https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif', 'Xi-6svTGA5KxMmeBtH7-J', 0, 2, '2022-12-21 13:14:33.956623-03');
INSERT INTO public.urls VALUES (14, 'https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif', 'jyIjkzshuajfSzXf3E-Rd', 0, 2, '2022-12-21 13:14:34.294598-03');
INSERT INTO public.urls VALUES (24, 'https://media.tenor.com/Cl6kbnQN9N8AAAAM/mad-leonardo-dicaprio.gif', '6x49Mozn_N-IJCHYHpqnw', 20, 3, '2022-12-21 13:17:34.352466-03');
INSERT INTO public.urls VALUES (26, 'https://media.tenor.com/Cl6kbnQN9N8AAAAM/mad-leonardo-dicaprio.gif', 'pcGS4t9kwt6CLX2fS_wjz', 0, 4, '2022-12-21 13:20:25.99133-03');
INSERT INTO public.urls VALUES (13, 'https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif', '5kjbTfLUQba0G76_rGGwA', 10, 2, '2022-12-21 13:14:34.133571-03');
INSERT INTO public.urls VALUES (25, 'https://media.tenor.com/Cl6kbnQN9N8AAAAM/mad-leonardo-dicaprio.gif', 'kE_KY56ljzo4sQk9ejvEf', 2, 4, '2022-12-21 13:19:51.736294-03');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'cano', 'cano@flu.com', '$2b$10$DOkxq9G3ABaAnkCe1ZIUG.WFBOZHELhf/w5woX6Wg8LF17R6.hwxK', '$2b$10$DOkxq9G3ABaAnkCe1ZIUG.WFBOZHELhf/w5woX6Wg8LF17R6.hwxK', '2022-12-21 13:07:19.43775-03');
INSERT INTO public.users VALUES (2, 'ganso', 'ganso@flu.com', '$2b$10$jmCmq0BuIqXgg0/jd8sM7OklwxEpjxwolbkvFtdoh5XuvM9WJC5C.', '$2b$10$jmCmq0BuIqXgg0/jd8sM7OklwxEpjxwolbkvFtdoh5XuvM9WJC5C.', '2022-12-21 13:12:00.691884-03');
INSERT INTO public.users VALUES (3, 'diniz', 'diniz@flu.com', '$2b$10$ohDwQVIEfX/MHkut7UsIO.EugLUROfJR8kVcSzgHmLcc8tEATV2Ii', '$2b$10$ohDwQVIEfX/MHkut7UsIO.EugLUROfJR8kVcSzgHmLcc8tEATV2Ii', '2022-12-21 13:16:36.760204-03');
INSERT INTO public.users VALUES (4, 'arias', 'arias@flu.com', '$2b$10$OJfgU9ssRUuhUEwGCILuMu7xJh0l7Mz69Nqw7wnkPj8iyCQucMTV6', '$2b$10$OJfgU9ssRUuhUEwGCILuMu7xJh0l7Mz69Nqw7wnkPj8iyCQucMTV6', '2022-12-21 13:18:50.560771-03');
INSERT INTO public.users VALUES (5, 'nino', 'nino@flu.com', '$2b$10$ckNsjLeXLa9mIbW9/aQPqujjQe9JTsMJ5g6xg7tSnKnQXitxSgMDm', '$2b$10$ckNsjLeXLa9mIbW9/aQPqujjQe9JTsMJ5g6xg7tSnKnQXitxSgMDm', '2022-12-21 13:50:57.91107-03');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 6, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 26, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

