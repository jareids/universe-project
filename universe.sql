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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_id integer,
    solar_masses_1k integer,
    supermassive boolean NOT NULL
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    type text,
    size_in_1000ly integer,
    billions_of_stars integer
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
    name character varying(20) NOT NULL,
    planet_id integer,
    atmosphere boolean,
    gravity numeric(5,3)
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
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    gravity numeric(5,2),
    earth_masses numeric(5,2),
    atmosphere boolean,
    metal_rich boolean,
    habitable boolean,
    surface_pressure numeric(8,2)
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
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    class text,
    solar_masses integer,
    main_sequence boolean NOT NULL
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagitarius A', 1, 4310, true);
INSERT INTO public.black_hole VALUES (2, 'HLX-1', 2, 100, false);
INSERT INTO public.black_hole VALUES (3, 'Virgo', 4, 6500000, true);
INSERT INTO public.black_hole VALUES (4, 'Cyg-X', 5, NULL, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100, 200);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 110, 1000);
INSERT INTO public.galaxy VALUES (3, 'Canis Major Dwarf', 'Irregular', 2, 1);
INSERT INTO public.galaxy VALUES (4, 'M87', 'Elliptical', 132, 1200);
INSERT INTO public.galaxy VALUES (5, 'Cygnus', 'Radio', 500, NULL);
INSERT INTO public.galaxy VALUES (6, 'Maffei 1', 'Elliptical', 75, 550);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, false, 0.170);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 0.001);
INSERT INTO public.moon VALUES (3, 'Io', 5, true, 0.180);
INSERT INTO public.moon VALUES (4, 'Europa', 5, false, 0.130);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, false, 0.150);
INSERT INTO public.moon VALUES (6, 'Callisto', 5, false, 0.130);
INSERT INTO public.moon VALUES (7, 'Enceladus', 6, false, 0.010);
INSERT INTO public.moon VALUES (8, 'Tethys', 6, false, 0.010);
INSERT INTO public.moon VALUES (9, 'Dione', 6, false, 0.020);
INSERT INTO public.moon VALUES (10, 'Rhea', 6, false, 0.030);
INSERT INTO public.moon VALUES (11, 'Titan', 6, true, 0.130);
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, false, 0.020);
INSERT INTO public.moon VALUES (13, 'Ariel', 7, false, 0.030);
INSERT INTO public.moon VALUES (14, 'Umbriel', 7, false, 0.020);
INSERT INTO public.moon VALUES (15, 'Titania', 7, false, 0.040);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, false, 0.040);
INSERT INTO public.moon VALUES (17, 'Triton', 8, false, 0.080);
INSERT INTO public.moon VALUES (18, 'Charon', 9, false, 0.030);
INSERT INTO public.moon VALUES (19, 'Gilly', 11, false, 0.005);
INSERT INTO public.moon VALUES (20, 'Mun', 12, false, 0.166);
INSERT INTO public.moon VALUES (21, 'Minmus', 12, false, 0.050);
INSERT INTO public.moon VALUES (22, 'Ike', 13, false, 0.112);
INSERT INTO public.moon VALUES (23, 'Laythe', 15, true, 0.800);
INSERT INTO public.moon VALUES (24, 'Vall', 15, false, 0.235);
INSERT INTO public.moon VALUES (25, 'Tylo', 15, false, 0.800);
INSERT INTO public.moon VALUES (26, 'Bop', 15, false, 0.060);
INSERT INTO public.moon VALUES (27, 'Pol', 15, false, 0.380);
INSERT INTO public.moon VALUES (28, 'Attlerock', 19, false, 0.001);
INSERT INTO public.moon VALUES (29, 'Hollows Lantern', 20, false, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1.00, 1.00, true, true, true, 1.00);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, 0.38, 0.05, false, true, false, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 0.91, 0.81, true, true, false, 93.19);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.38, 0.11, true, true, false, 0.01);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 2.53, 317.80, false, false, false, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 1.11, 95.16, false, false, false, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 0.91, 14.54, false, false, false, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 1.14, 17.15, false, false, false, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 0.07, 0.00, true, false, false, 0.07);
INSERT INTO public.planet VALUES (10, 'Moho', 2, 0.27, 0.05, false, true, false, NULL);
INSERT INTO public.planet VALUES (11, 'Eve', 2, 1.70, 2.20, true, true, false, 5.00);
INSERT INTO public.planet VALUES (12, 'Kerbin', 2, 1.00, 1.00, true, true, true, 1.00);
INSERT INTO public.planet VALUES (13, 'Duna', 2, 0.30, 1.10, true, true, false, 0.06);
INSERT INTO public.planet VALUES (14, 'Dres', 2, 0.11, 0.05, false, false, false, NULL);
INSERT INTO public.planet VALUES (15, 'Jool', 2, 0.80, 3.43, true, false, false, 15.00);
INSERT INTO public.planet VALUES (16, 'Eeloo', 2, 0.17, 0.07, false, false, false, NULL);
INSERT INTO public.planet VALUES (17, 'Ember Twin', 3, 0.01, 0.00, false, true, false, NULL);
INSERT INTO public.planet VALUES (18, 'Ash Twin', 3, 0.01, 0.00, false, false, false, NULL);
INSERT INTO public.planet VALUES (19, 'Timber Hearth', 3, 0.10, 0.05, true, true, true, 0.10);
INSERT INTO public.planet VALUES (20, 'Brittle Hollow', 3, 0.07, 0.04, false, true, false, NULL);
INSERT INTO public.planet VALUES (21, 'Giants Deep', 3, 0.80, 0.33, true, false, true, 0.35);
INSERT INTO public.planet VALUES (22, 'Dark Bramble', 3, NULL, 0.00, false, false, true, NULL);
INSERT INTO public.planet VALUES (23, 'Interloper', 3, 0.00, 0.00, false, true, false, NULL);
INSERT INTO public.planet VALUES (24, 'BG1', 4, 1.44, 1.89, true, true, false, 2.77);
INSERT INTO public.planet VALUES (25, 'BG2', 4, 1.12, 0.34, false, true, false, NULL);
INSERT INTO public.planet VALUES (26, 'BG3', 4, 1.00, 0.25, false, true, false, NULL);
INSERT INTO public.planet VALUES (27, 'BG4', 4, 1.36, 1.74, true, true, false, 1015.70);
INSERT INTO public.planet VALUES (28, 'Waypoint', 7, 2.76, 351.40, false, false, false, NULL);
INSERT INTO public.planet VALUES (29, 'Lucifer', 7, 0.35, 0.05, false, true, false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 'G-5', 1, true);
INSERT INTO public.star VALUES (2, 'Kerbol', 1, 'G-5', 1, true);
INSERT INTO public.star VALUES (3, 'Sun', 1, 'K', NULL, true);
INSERT INTO public.star VALUES (4, 'Betelguese', 1, 'M1-2', 12, true);
INSERT INTO public.star VALUES (5, 'VY Canis Majoris', 1, 'M-5', 35, true);
INSERT INTO public.star VALUES (6, 'VY Canis B', 1, 'Y', NULL, false);
INSERT INTO public.star VALUES (7, 'Sirus', 1, 'A', 3, true);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 29, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 29, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

