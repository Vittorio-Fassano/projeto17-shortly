--
-- PostgreSQL database dump
--

-- Dumped from database version 12.13
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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


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

COPY public.sessions (id, token, "userId", "createdAt") FROM stdin;
1	6dc8cd14-4e47-4fcb-9053-d9bb2757d52f	1	2022-12-21 16:53:39.898427+00
2	40c9aefa-daef-4b78-aea7-4ab39e44b820	2	2022-12-21 17:02:04.580551+00
3	b6e72bc2-1f95-4218-a530-9b802b485a49	3	2022-12-21 17:07:04.542986+00
4	a774d197-5f2b-46b3-8d55-8152244571c8	3	2022-12-21 17:51:04.291333+00
5	d0440dc5-44c8-49c3-83dd-b2cccd4cce15	4	2022-12-21 17:56:23.956391+00
6	6690af45-6fde-4f6a-bee7-ac2e6179691c	5	2022-12-21 17:57:34.895586+00
7	d8675739-95e9-4f0c-aab4-d4876537f31c	6	2022-12-21 18:00:15.560666+00
8	362862b7-7c04-40f4-9f27-d6920143c90b	7	2022-12-21 18:03:38.384162+00
9	11ffc8d6-0754-484f-adeb-603f32e4e62c	8	2022-12-21 18:05:08.802882+00
10	ee6c5715-7e29-4963-9bac-efab10228cb5	2	2022-12-21 18:09:04.094991+00
11	fc25d86b-eaa4-4779-983a-ec76c4c73d59	2	2022-12-21 18:11:14.530124+00
\.


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.urls (id, url, "shortUrl", views, "userId", "createdAt") FROM stdin;
20	https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif	eZvF2AYfsxCyCMH0HGD2_	0	6	2022-12-21 18:00:45.301702+00
3	https://media.tenor.com/Z7RFLTS2J9cAAAAM/leonardo-dicaprio-rick-dalton.gif	YsnMPLuihROGqE-N-ZC_x	6	2	2022-12-21 17:03:30.057618+00
6	https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif	SFAqfgH2TUIVQhfffwuZf	0	3	2022-12-21 17:07:31.358112+00
8	https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif	V6GlhZKsn5o8Xt87G7E2O	0	3	2022-12-21 17:07:34.047522+00
19	https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif	qr5ZqGh7AQxC7CR8EFY_L	11	6	2022-12-21 18:00:32.743596+00
5	https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif	fd_4G4hd-IcrD2NWrvM9N	3	3	2022-12-21 17:07:29.039678+00
21	https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif	CPMjfPtXsqBcXz1kk4phQ	0	7	2022-12-21 18:04:53.581571+00
22	https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif	SNUORhDYWV6eW3t1wUWvL	0	8	2022-12-21 18:05:23.568823+00
9	https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif	LiCGgMcJ0ZrAlAApdrT3g	0	3	2022-12-21 17:53:28.657076+00
7	https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif	TQfdwA33z8qQX6MMkjLP3	4	3	2022-12-21 17:07:32.839306+00
24	https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif	JwvTTQ79AGHoOibNxgY5i	0	8	2022-12-21 18:11:04.234535+00
23	https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif	zU7JkItIJXnkxftmnDgG-	2	8	2022-12-21 18:05:24.695635+00
1	https://media.tenor.com/Cl6kbnQN9N8AAAAM/mad-leonardo-dicaprio.gif	_kjR9jWQQnBaNrzhXy0-a	8	1	2022-12-21 16:54:11.859015+00
25	https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif	SkfatxEk9iIfeC_6sI-gb	5	2	2022-12-21 18:11:22.303379+00
2	https://media.tenor.com/f0Iadz9DxGoAAAAM/wolf-of-wallstreet-jordan-make-it-rain.gif	ZXz53xPvolzucA0jM91tx	7	2	2022-12-21 17:03:01.621406+00
12	https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif	qfDF9jaixx8FHyBc0hwio	1	5	2022-12-21 17:57:45.927063+00
11	https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif	uVK9-gwx4Tn6dX1_ZMwVs	1	4	2022-12-21 17:56:59.56658+00
10	https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif	E9gAqZIEXXqfmTK2uqjB4	2	4	2022-12-21 17:56:40.6051+00
15	https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif	-NE_QT26eKuYt7JAXOdGW	0	6	2022-12-21 18:00:28.819441+00
16	https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif	08HIkMAw06_-e7kL6Jb3n	0	6	2022-12-21 18:00:30.073783+00
17	https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif	jfaagzMtRNK1C930qbx0c	0	6	2022-12-21 18:00:31.0563+00
18	https://media.tenor.com/F6cuC0Gbk7sAAAAM/django-leonardo-dicaprio.gif	f3wBtFPzWqCTDowd6KhvU	0	6	2022-12-21 18:00:31.9082+00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, name, email, password, "confirmPassword", "createdAt") FROM stdin;
1	nino	nino@flu.com	$2b$10$yZNZWY3gM0aCB.w/TF20t.XcoaiuVnNHR4ioALEGxWhE8tO36bx8a	$2b$10$yZNZWY3gM0aCB.w/TF20t.XcoaiuVnNHR4ioALEGxWhE8tO36bx8a	2022-12-21 16:53:37.164446+00
2	cano	cano@flu.com	$2b$10$NpnV67K6JlnZqAhQmwbtreL6Z.41XquKscQQomeyJB.bNcQ0iL4JO	$2b$10$NpnV67K6JlnZqAhQmwbtreL6Z.41XquKscQQomeyJB.bNcQ0iL4JO	2022-12-21 17:01:57.206436+00
3	ganso	ganso@flu.com	$2b$10$wGhWplWxKe79f..CC82Pz.sREn91JPx4UUqRA630LMmZ.o8YnyKfy	$2b$10$wGhWplWxKe79f..CC82Pz.sREn91JPx4UUqRA630LMmZ.o8YnyKfy	2022-12-21 17:06:57.383401+00
4	marcao	marcao@flu.com	$2b$10$vNxlzRJzZeA.1St5Kyb68O18lgSLptfG408hr397pNfMQARcZcHY.	$2b$10$vNxlzRJzZeA.1St5Kyb68O18lgSLptfG408hr397pNfMQARcZcHY.	2022-12-21 17:51:24.869035+00
5	vitt	vitt@flu.com	$2b$10$vER0t0gHJF8qcs4eFv7r3eGygDofWWIC/xm8LKptatLLKdfTpU0nK	$2b$10$vER0t0gHJF8qcs4eFv7r3eGygDofWWIC/xm8LKptatLLKdfTpU0nK	2022-12-21 17:57:27.777396+00
6	val	val@flu.com	$2b$10$m2Mj8MgpqFriGFpg.GIyDeledsbYZdVmNPr.Y3t3mQV9SetiQXkgO	$2b$10$m2Mj8MgpqFriGFpg.GIyDeledsbYZdVmNPr.Y3t3mQV9SetiQXkgO	2022-12-21 18:00:05.563997+00
7	mat	mat@flu.com	$2b$10$Z5e1gNiwFReEtXvY7PhUaOFi9RUa0bZj3qzk0FovWQ8/.j4VFZbyu	$2b$10$Z5e1gNiwFReEtXvY7PhUaOFi9RUa0bZj3qzk0FovWQ8/.j4VFZbyu	2022-12-21 18:03:32.175785+00
8	mat	matu@flu.com	$2b$10$BZrslMDNzLPN6B8JUE7MZOCUxUIiu7U5KHDCGjE/K1bCd/Z3XhEU6	$2b$10$BZrslMDNzLPN6B8JUE7MZOCUxUIiu7U5KHDCGjE/K1bCd/Z3XhEU6	2022-12-21 18:03:50.957442+00
\.


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 11, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 25, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


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
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO vitt;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

