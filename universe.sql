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
    name character varying(90) NOT NULL,
    constellation character varying(90),
    apparent_magnitude numeric(5,2),
    discovered_at date,
    galaxy_type_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxies_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxies_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxies_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(120) NOT NULL,
    shape text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(90) NOT NULL,
    has_own_moons boolean NOT NULL,
    planet_id integer NOT NULL,
    discovery_year integer
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
    name character varying(120) NOT NULL,
    has_life boolean NOT NULL,
    distance_from_sun_in_millions_km integer,
    star_id integer NOT NULL,
    planet_type_id integer NOT NULL
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(120) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(120),
    apparent_magnitude numeric(5,2),
    distance_in_light_years integer,
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxies_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_types_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_types_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Comet Galaxy', 'Sculptor', 18.70, '2007-03-02', 1);
INSERT INTO public.galaxy VALUES (2, 'ESO 97-G13, Circinus Galaxy', 'Circinus', 11.00, '1975-01-01', 1);
INSERT INTO public.galaxy VALUES (3, 'ESO 510-G13', 'Hydra', 13.40, NULL, 1);
INSERT INTO public.galaxy VALUES (4, 'IC 342', 'Camelopardalis', 9.10, NULL, 1);
INSERT INTO public.galaxy VALUES (5, 'Andromeda', 'Andromeda', 4.36, '1924-12-30', 1);
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 'Triangulum', 6.30, '1764-08-26', 1);
INSERT INTO public.galaxy VALUES (7, 'Whirpool Galaxy', 'Canes Venatici', 9.00, '1773-10-13', 1);
INSERT INTO public.galaxy VALUES (8, 'M58', 'Virgo', 10.50, '1779-04-15', 1);
INSERT INTO public.galaxy VALUES (9, 'NGC 1', 'Pegasus', 13.65, NULL, 1);
INSERT INTO public.galaxy VALUES (10, 'Milky Way', 'Saggitarius', NULL, NULL, 1);
INSERT INTO public.galaxy VALUES (11, 'A2261-BCG', 'Hercules', 12.00, NULL, 2);
INSERT INTO public.galaxy VALUES (12, 'ESO 146-5', 'Indus', NULL, NULL, 2);
INSERT INTO public.galaxy VALUES (13, 'Holmberg 15A', 'Cetus', 14.70, '1937-01-01', 2);
INSERT INTO public.galaxy VALUES (14, 'IC 2006', 'Eridanus', 12.39, '1897-10-03', 2);
INSERT INTO public.galaxy VALUES (15, 'Maffei 1', 'Cassiopeia', 11.40, NULL, 2);
INSERT INTO public.galaxy VALUES (16, 'NeVe 1', 'Ophiuchus', NULL, NULL, 2);
INSERT INTO public.galaxy VALUES (17, 'NGC 777', 'Triangulum', 12.00, '1784-09-12', 2);
INSERT INTO public.galaxy VALUES (18, 'Draco Dwarf', 'Draco', 10.90, NULL, 3);
INSERT INTO public.galaxy VALUES (19, 'Baby Boom Galaxy', 'Sextans', NULL, NULL, 3);
INSERT INTO public.galaxy VALUES (20, 'Sombrero Galaxy', 'Virgo', 21.80, '1781-05-11', 3);
INSERT INTO public.galaxy VALUES (21, 'Aquarius Dwarf', 'Aquarius', 14.00, NULL, 4);
INSERT INTO public.galaxy VALUES (22, 'Arp 87', 'Leo', 14.10, '1785-04-10', 4);
INSERT INTO public.galaxy VALUES (23, 'IC 10', 'Cassiopeia', 10.40, NULL, 4);
INSERT INTO public.galaxy VALUES (24, 'NGC 7836', 'Andromeda', 14.40, '1885-09-20', 4);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'spiral', 'giant pinwheels');
INSERT INTO public.galaxy_type VALUES (2, 'elliptical', 'ellipses');
INSERT INTO public.galaxy_type VALUES (3, 'peculiar', 'compact areas in the center of galaxy ');
INSERT INTO public.galaxy_type VALUES (4, 'irregular', 'irregular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (5, 'Io', false, 36, NULL);
INSERT INTO public.moon VALUES (14, 'Metis', false, 36, NULL);
INSERT INTO public.moon VALUES (21, 'Tethys', false, 37, NULL);
INSERT INTO public.moon VALUES (23, 'RRhea', false, 37, NULL);
INSERT INTO public.moon VALUES (2, 'Moon', false, 34, 1877);
INSERT INTO public.moon VALUES (3, 'Phobos', false, 35, 1877);
INSERT INTO public.moon VALUES (4, 'Deimos', false, 35, 1610);
INSERT INTO public.moon VALUES (6, 'Europa', false, 36, 1610);
INSERT INTO public.moon VALUES (7, 'Ganymede', false, 36, 1610);
INSERT INTO public.moon VALUES (8, 'Callisto', true, 36, 1610);
INSERT INTO public.moon VALUES (9, 'Himalia', false, 36, 1904);
INSERT INTO public.moon VALUES (10, 'Elara', false, 36, 1905);
INSERT INTO public.moon VALUES (11, 'Carme', false, 36, 1938);
INSERT INTO public.moon VALUES (12, 'Ananke', false, 36, 1951);
INSERT INTO public.moon VALUES (13, 'Leda', false, 36, 1974);
INSERT INTO public.moon VALUES (15, 'Kalyke', false, 36, 2000);
INSERT INTO public.moon VALUES (16, 'Iocaste', false, 36, 2000);
INSERT INTO public.moon VALUES (17, 'Kale', false, 36, 2001);
INSERT INTO public.moon VALUES (18, 'Titan', true, 37, 1655);
INSERT INTO public.moon VALUES (19, 'Iapetus', true, 37, 1671);
INSERT INTO public.moon VALUES (20, 'Mimas', false, 37, 1789);
INSERT INTO public.moon VALUES (22, 'Dione', false, 37, 1684);
INSERT INTO public.moon VALUES (24, 'Phoebe', false, 37, 1899);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 58, 8, 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 108, 8, 1);
INSERT INTO public.planet VALUES (34, 'Earth', true, 150, 8, 1);
INSERT INTO public.planet VALUES (35, 'Mars', false, 228, 8, 1);
INSERT INTO public.planet VALUES (36, 'Jupiter', false, 778, 8, 4);
INSERT INTO public.planet VALUES (37, 'Saturn', false, 1400, 8, 4);
INSERT INTO public.planet VALUES (39, 'Neptune', false, 4500, 8, 2);
INSERT INTO public.planet VALUES (38, 'Uranus', false, 2900, 8, 2);
INSERT INTO public.planet VALUES (40, 'Erida', false, 68, 8, 1);
INSERT INTO public.planet VALUES (41, 'Pluton', false, 40, 8, 1);
INSERT INTO public.planet VALUES (42, 'Haumea', false, 43, 8, 1);
INSERT INTO public.planet VALUES (43, 'Makemake', false, 45, 8, 1);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'terrestrial', 'Earth-sized or smaller, mostly made of rock and metal. Some could possess oceans and atmospheres and perhaps other signs of habitability');
INSERT INTO public.planet_type VALUES (2, 'Neptune-like', 'Similar in size to our own Neptune and Uranus, with hydrogen or helium-dominated atmospheres. "Mini-Neptunes", not found in our Solar system, are smaller than Neptune but larger than Earth');
INSERT INTO public.planet_type VALUES (3, 'super-Earth', 'Typically "terrestrial", or rocky, and more massive than Earth but lighter than Neptune. They maight or might not have atmospheres');
INSERT INTO public.planet_type VALUES (4, 'gas giants', 'The size of Saturn or Jupiter, or much larger. They include "hot Jupiters" - scorching planets in close orbits around their stars');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', -1.44, 9, 10);
INSERT INTO public.star VALUES (2, 'Canopus', -0.62, 313, 10);
INSERT INTO public.star VALUES (3, 'Arcturus', -0.05, 37, 10);
INSERT INTO public.star VALUES (4, 'Rigil Kentaurus', -0.01, 4, 10);
INSERT INTO public.star VALUES (5, 'Vega', 0.03, 25, 10);
INSERT INTO public.star VALUES (6, 'Capella', 0.08, 42, 10);
INSERT INTO public.star VALUES (7, 'HD 16028', -0.86, 676, 5);
INSERT INTO public.star VALUES (8, 'Sun', -26.74, 0, 10);


--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxies_galaxy_id_seq', 24, true);


--
-- Name: galaxy_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 43, true);


--
-- Name: planet_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxies_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_designation_key UNIQUE (name);


--
-- Name: galaxy galaxies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_name_uq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_uq UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_name_uq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_uq UNIQUE (name);


--
-- Name: galaxy_type galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_uq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_uq UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: star name_uq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_uq UNIQUE (name);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_name_uq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_uq UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_name_uq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_uq UNIQUE (name);


--
-- Name: planet_type planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_type planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxies_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_fk FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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


