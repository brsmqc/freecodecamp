--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    discovery_year integer,
    width_in_parsecs numeric(10,0),
    estimated_stars integer,
    confirmed_life boolean,
    has_black_hole boolean,
    category integer,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    diameter_in_km numeric(6,0),
    age_in_millions_of_years integer,
    distance_from_planet integer,
    is_geologically_active boolean,
    orbit_is_deteriorating boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    diameter_in_km numeric(10,0),
    age_in_millions_of_years integer,
    has_life boolean,
    distance_from_earth_in_ly integer,
    has_been_visited boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    category text NOT NULL,
    distance_from_earth_in_ly integer,
    has_planets boolean,
    age_in_billions_of_years numeric(10,0),
    is_part_of_binary_system boolean,
    estimated_planets integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13610, 32408, 300, true, true, 1, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 964, 46560, 10000, false, true, 1, NULL);
INSERT INTO public.galaxy VALUES (6, 'Fireworks', 1798, 26770, NULL, false, NULL, 1, NULL);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 1781, 15000, NULL, false, true, 2, NULL);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 1826, 18396, 1, false, true, 2, NULL);
INSERT INTO public.galaxy VALUES (4, 'Canis Major Dwarf', 2003, NULL, 1, false, false, 3, NULL);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', NULL);
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', NULL);
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'precious', 4635, 2, 120, false, false, 1);
INSERT INTO public.moon VALUES (2, 'sat 1', NULL, 5426, 27, 140, false, true, 10);
INSERT INTO public.moon VALUES (3, 'sat 2', NULL, 5937, 29, 54, false, true, 5);
INSERT INTO public.moon VALUES (4, 'sat 3', NULL, 8265, 29, 37, true, false, 8);
INSERT INTO public.moon VALUES (5, 'sat 4', NULL, 2665, 9, 90, false, false, 5);
INSERT INTO public.moon VALUES (6, 'sat 5', NULL, 2366, 11, 120, false, true, 10);
INSERT INTO public.moon VALUES (7, 'sat 6', NULL, 7202, 2, 123, true, false, 4);
INSERT INTO public.moon VALUES (8, 'sat 7', NULL, 4807, 5, 132, true, false, 8);
INSERT INTO public.moon VALUES (9, 'sat 8', NULL, 5334, 22, 36, false, true, 12);
INSERT INTO public.moon VALUES (10, 'sat 9', NULL, 484, 4, 44, false, false, 8);
INSERT INTO public.moon VALUES (11, 'sat 10', NULL, 2865, 16, 32, false, false, 8);
INSERT INTO public.moon VALUES (12, 'sat 11', NULL, 8924, 20, 70, true, false, 7);
INSERT INTO public.moon VALUES (13, 'sat 12', NULL, 1162, 23, 91, false, false, 10);
INSERT INTO public.moon VALUES (14, 'sat 13', NULL, 8539, 7, 124, false, true, 11);
INSERT INTO public.moon VALUES (15, 'sat 14', NULL, 2782, 15, 86, false, true, 10);
INSERT INTO public.moon VALUES (16, 'sat 15', NULL, 6112, 29, 66, true, false, 12);
INSERT INTO public.moon VALUES (17, 'sat 16', NULL, 7011, 18, 16, false, true, 7);
INSERT INTO public.moon VALUES (18, 'sat 17', NULL, 7247, 22, 88, false, false, 12);
INSERT INTO public.moon VALUES (19, 'sat 18', NULL, 4309, 16, 60, true, false, 6);
INSERT INTO public.moon VALUES (20, 'sat 19', NULL, 243, 5, 170, false, false, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'ours', 54000, 15, true, 0, true, 1);
INSERT INTO public.planet VALUES (2, 'Saturn', 'ours', 150000, 15, false, 0, true, 1);
INSERT INTO public.planet VALUES (3, 'Pluto', 'ours', 5000, 12, false, 0, true, 1);
INSERT INTO public.planet VALUES (4, 'Alpha Centari', 'distant', 59000, 25, false, 200, false, 2);
INSERT INTO public.planet VALUES (5, 'Omicron Persei 8', 'blorg', 2000000, 85, true, 5000, false, 5);
INSERT INTO public.planet VALUES (6, 'Cleopatra', 'royal', 25000, 19, false, 1500, false, 4);
INSERT INTO public.planet VALUES (7, 'Marc', 'royal', 30000, 21, false, 1600, false, 4);
INSERT INTO public.planet VALUES (8, 'Quantin', 'strange', 18000, 110, true, 8000, true, 6);
INSERT INTO public.planet VALUES (9, 'Meglio', 'clear', 200000, 8, false, 387, false, 5);
INSERT INTO public.planet VALUES (10, 'Botano', 'flowery', 180000, 46, true, 409, true, 5);
INSERT INTO public.planet VALUES (11, 'Inclidio', 'harsh', 20000, 37, false, 1600, false, 4);
INSERT INTO public.planet VALUES (12, 'Groolido', 'grainy', 15000, 200, true, 9000, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 0, true, 5, false, 9, 1);
INSERT INTO public.star VALUES (2, 'Polaris', 'A10', 100000, true, 9, true, 3, 2);
INSERT INTO public.star VALUES (3, 'Cantroupi', 'L10a', 100, false, 2, false, NULL, 1);
INSERT INTO public.star VALUES (4, 'Vega', 'A0Va', 280820, true, 5, true, 7, 6);
INSERT INTO public.star VALUES (5, 'Rondino', 'F0II', 2500000, true, 4, false, 2, 5);
INSERT INTO public.star VALUES (6, 'Sworga', 'B9', 458100, true, 10, true, 15, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star galaxy_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

