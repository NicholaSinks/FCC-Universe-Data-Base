--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    diameter_per_1000_lightyr integer,
    type text,
    distance_per_1m_lightyr numeric(5,2)
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_km numeric(6,2),
    planet_id integer,
    contains_water boolean
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
    name character varying(30) NOT NULL,
    radius_relative_earth numeric(4,2),
    star_id integer,
    has_moon boolean
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    is_active boolean,
    agency character varying(30),
    planet_id integer,
    name character varying(30) NOT NULL,
    launch_year integer
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text,
    distance_lightyrs integer,
    galaxy_id integer,
    has_planets boolean
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 170, 'Barred Spiral', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 152, 'Spiral', 2.50);
INSERT INTO public.galaxy VALUES (3, 'Centaurus A', 60, 'Lenticular', 13.00);
INSERT INTO public.galaxy VALUES (4, 'NGC 4622', NULL, 'Unbarred Spiral', 200.00);
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 70, 'spiral galaxy', 17.30);
INSERT INTO public.galaxy VALUES (6, 'Messier 81', 90, 'spiral galaxy', 12.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3476.28, 3, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 22.16, 4, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 12.54, 4, NULL);
INSERT INTO public.moon VALUES (4, 'Metis', 43.00, 5, NULL);
INSERT INTO public.moon VALUES (5, 'Adrastea', 16.40, 5, NULL);
INSERT INTO public.moon VALUES (6, 'Amalthea', 167.00, 5, NULL);
INSERT INTO public.moon VALUES (7, 'Thebe', 98.60, 5, NULL);
INSERT INTO public.moon VALUES (8, 'Io', 3643.20, 5, NULL);
INSERT INTO public.moon VALUES (9, 'Europa', 3121.60, 5, NULL);
INSERT INTO public.moon VALUES (10, 'Ganymede', 5268.20, 5, NULL);
INSERT INTO public.moon VALUES (11, 'Callisto', 4820.60, 5, NULL);
INSERT INTO public.moon VALUES (12, 'Themisto', 9.00, 5, NULL);
INSERT INTO public.moon VALUES (13, 'Leda', 21.50, 5, NULL);
INSERT INTO public.moon VALUES (14, 'Ersa', 3.00, 5, NULL);
INSERT INTO public.moon VALUES (15, 'Pan', 27.40, 6, NULL);
INSERT INTO public.moon VALUES (16, 'Daphnis', 7.80, 6, NULL);
INSERT INTO public.moon VALUES (17, 'Atlas', 29.80, 6, NULL);
INSERT INTO public.moon VALUES (18, 'Prometheus', 85.60, 6, NULL);
INSERT INTO public.moon VALUES (19, 'Pandora', 80.00, 6, NULL);
INSERT INTO public.moon VALUES (20, 'Epimetheus', 117.20, 6, NULL);
INSERT INTO public.moon VALUES (21, 'Janus', 178.00, 6, NULL);
INSERT INTO public.moon VALUES (22, 'Aegaeon', 0.66, 6, NULL);
INSERT INTO public.moon VALUES (23, 'Mimas', 386.40, 6, NULL);
INSERT INTO public.moon VALUES (24, 'Methone', 2.90, 6, NULL);
INSERT INTO public.moon VALUES (25, 'Cordelia', 40.00, 7, NULL);
INSERT INTO public.moon VALUES (26, 'Ophelia', 43.00, 7, NULL);
INSERT INTO public.moon VALUES (27, 'Bianca', 51.00, 7, NULL);
INSERT INTO public.moon VALUES (28, 'Cressida', 80.00, 7, NULL);
INSERT INTO public.moon VALUES (29, 'Desdemona', 64.00, 7, NULL);
INSERT INTO public.moon VALUES (30, 'Juliet', 94.00, 7, NULL);
INSERT INTO public.moon VALUES (31, 'Portia', 135.00, 7, NULL);
INSERT INTO public.moon VALUES (32, 'Rosalind', 72.00, 7, NULL);
INSERT INTO public.moon VALUES (33, 'Cupid', 18.00, 7, NULL);
INSERT INTO public.moon VALUES (34, 'Belinda', 90.00, 7, NULL);
INSERT INTO public.moon VALUES (35, 'Naiad', 60.40, 8, NULL);
INSERT INTO public.moon VALUES (36, 'Thalassa', 81.40, 8, NULL);
INSERT INTO public.moon VALUES (37, 'Despina', 156.00, 8, NULL);
INSERT INTO public.moon VALUES (38, 'Galatea', 174.80, 8, NULL);
INSERT INTO public.moon VALUES (39, 'Larissa', 194.00, 8, NULL);
INSERT INTO public.moon VALUES (40, 'Hippocamp', 34.80, 8, NULL);
INSERT INTO public.moon VALUES (41, 'Proteus', 420.00, 8, NULL);
INSERT INTO public.moon VALUES (42, 'Triton', 2705.20, 8, NULL);
INSERT INTO public.moon VALUES (43, 'Nereid', 357.00, 8, NULL);
INSERT INTO public.moon VALUES (44, 'Halimede', 62.00, 8, NULL);
INSERT INTO public.moon VALUES (45, 'Charon', 1212.00, 9, NULL);
INSERT INTO public.moon VALUES (46, 'Styx', NULL, 9, NULL);
INSERT INTO public.moon VALUES (47, 'Nix', NULL, 9, NULL);
INSERT INTO public.moon VALUES (48, 'Kerberos', NULL, 9, NULL);
INSERT INTO public.moon VALUES (49, 'Hydra', NULL, 9, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, 'Pluto', 0.19, 1, NULL);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1b', 1.12, 2, NULL);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1c', 1.10, 2, NULL);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 0.77, 2, NULL);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1e', 0.92, 2, NULL);
INSERT INTO public.planet VALUES (14, 'TRAPPIST-1f', 1.05, 2, NULL);
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1g', 1.13, 2, NULL);
INSERT INTO public.planet VALUES (16, 'TRAPPIST-1h', 0.78, 2, NULL);
INSERT INTO public.planet VALUES (17, 'KEPLER-90b', 1.31, 3, NULL);
INSERT INTO public.planet VALUES (18, 'KEPLER-90c', 1.18, 3, NULL);
INSERT INTO public.planet VALUES (19, 'KEPLER-90d', 2.88, 3, NULL);
INSERT INTO public.planet VALUES (20, 'KEPLER-90e', 2.67, 3, NULL);
INSERT INTO public.planet VALUES (21, 'KEPLER-90f', 2.89, 3, NULL);
INSERT INTO public.planet VALUES (22, 'KEPLER-90g', 8.13, 3, NULL);
INSERT INTO public.planet VALUES (23, 'KEPLER-90h', 11.32, 3, NULL);
INSERT INTO public.planet VALUES (1, 'Mercury', 0.33, 1, false);
INSERT INTO public.planet VALUES (2, 'Venus', 0.95, 1, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1.00, 1, true);
INSERT INTO public.planet VALUES (4, 'Mars', 0.50, 1, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 11.20, 1, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 9.50, 1, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 3.92, 1, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 3.83, 1, true);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, true, 'NASA', 3, 'Aura', 2004);
INSERT INTO public.satellite VALUES (3, true, 'MBRSC', 3, 'DubaiSat-1 and 2', 2009);
INSERT INTO public.satellite VALUES (2, true, 'CNSA', 3, 'CBERS-4', 2014);
INSERT INTO public.satellite VALUES (4, true, 'NSPO', 3, 'Formosat-5', 2017);
INSERT INTO public.satellite VALUES (5, true, 'NASA Roscosmos JAXA ESA CSA', 3, 'ISS', 1998);
INSERT INTO public.satellite VALUES (6, true, 'NASA and USGS', 3, 'Landsat-9', 2021);
INSERT INTO public.satellite VALUES (7, false, 'NASA', 1, 'MESSENGER', 2004);
INSERT INTO public.satellite VALUES (9, true, 'JAXA', 2, 'Akatsuki', 2010);
INSERT INTO public.satellite VALUES (10, false, 'Lavochkin', 4, 'Mars 2', 1971);
INSERT INTO public.satellite VALUES (11, false, 'Lavochkin', 4, 'Mars 3', 1971);
INSERT INTO public.satellite VALUES (12, false, 'NASA', 4, 'Viking 1', 1975);
INSERT INTO public.satellite VALUES (13, false, 'NASA', 4, 'Viking 2', 1976);
INSERT INTO public.satellite VALUES (14, true, 'NASA', 4, '2001 Mars Odyssey', 2001);
INSERT INTO public.satellite VALUES (15, true, 'ESA', 4, 'Mars Express', 2003);
INSERT INTO public.satellite VALUES (16, true, 'USESA', 4, 'Emirates Mars Mission', 2021);
INSERT INTO public.satellite VALUES (17, true, 'CNSA', 4, 'Tianwen 1', 2021);
INSERT INTO public.satellite VALUES (18, true, 'NASA', 5, 'JUNO', 2011);
INSERT INTO public.satellite VALUES (20, false, 'NASA / JPL ESA / ASI', 6, 'Cassini–Huygens', 2004);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow Dwarf Star', NULL, 1, true);
INSERT INTO public.star VALUES (3, 'Kepler-90', 'F-type', 2790, 1, true);
INSERT INTO public.star VALUES (2, 'TRAPPIST-1', 'Cool Red Dwarf', 40, 1, true);
INSERT INTO public.star VALUES (4, 'α Centauri C', 'Red dwarf', 4, 1, true);
INSERT INTO public.star VALUES (5, 'Barnards Star', 'Small Red Dwarf', 6, 1, false);
INSERT INTO public.star VALUES (6, 'Wolf 359', 'Red Dwarf', 8, 1, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 49, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 23, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: satellite satellite_satellite_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_satellite_id_key UNIQUE (satellite_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: satellite satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

