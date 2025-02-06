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
-- Name: asteroid_belt; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid_belt (
    asteroid_belt_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    asteroid_count integer NOT NULL,
    is_dense boolean NOT NULL
);


ALTER TABLE public.asteroid_belt OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_belt_asteroid_belt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_belt_asteroid_belt_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_belt_asteroid_belt_id_seq OWNED BY public.asteroid_belt.asteroid_belt_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    age numeric NOT NULL,
    size_in_light_years integer,
    distance_from_earth integer,
    has_dead_stars boolean,
    has_supermassive_black_hole boolean NOT NULL
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    distance_from_planet integer,
    size integer,
    moon_features text,
    orbit_period_days numeric NOT NULL,
    is_spherical boolean NOT NULL,
    is_asteroid boolean
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    diameter_km integer NOT NULL,
    position_in_solar_system integer,
    planet_description text,
    has_civilization boolean,
    has_life boolean NOT NULL
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    age integer,
    distance_from_earth integer,
    star_type text,
    mass numeric NOT NULL,
    is_main_sequence boolean NOT NULL,
    center_of_solar_system boolean
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
-- Name: asteroid_belt asteroid_belt_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt ALTER COLUMN asteroid_belt_id SET DEFAULT nextval('public.asteroid_belt_asteroid_belt_id_seq'::regclass);


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
-- Data for Name: asteroid_belt; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid_belt VALUES (1, 'Main Belt', 1, 1000000, true);
INSERT INTO public.asteroid_belt VALUES (2, 'Kuiper Belt', 1, 100000, false);
INSERT INTO public.asteroid_belt VALUES (3, 'Oort Cloud', 1, 1000000000, false);
INSERT INTO public.asteroid_belt VALUES (4, 'Asteroid Belt X', 2, 5000, true);
INSERT INTO public.asteroid_belt VALUES (5, 'Asteroid Cluster Y', 3, 12000, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13.6, 100000, 0, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 10, 220000, 2537000, false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest in Local Group', 12, 60000, 3000000, false, false);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical galaxy with a jet', 14, 120000, 53000000, true, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Unusual bright bulge', 9, 50000, 29000000, false, true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Classic spiral structure', 11, 76000, 23000000, true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 384400, 3475, 'Only natural satellite of Earth', 27.3, true, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 9377, 22, 'One of Mars small moons', 0.3, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 23460, 12, 'Mars second small moon', 1.3, false, false);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 1070400, 5262, 'Largest moon of Jupiter', 7.2, true, false);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 1882700, 4820, 'Jupiter’s second-largest moon', 16.7, true, false);
INSERT INTO public.moon VALUES (6, 'Io', 5, 421700, 3643, 'Volcanically active moon of Jupiter', 1.8, true, false);
INSERT INTO public.moon VALUES (7, 'Europa', 5, 670900, 3122, 'Possible subsurface ocean', 3.5, true, false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 1221870, 5150, 'Largest moon of Saturn', 15.9, true, false);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 238000, 504, 'Moon with geysers', 1.4, true, false);
INSERT INTO public.moon VALUES (10, 'Triton', 7, 354759, 2706, 'Neptune’s largest moon', 5.9, true, false);
INSERT INTO public.moon VALUES (11, 'Oberon', 8, 583520, 1523, 'Uranus second-largest moon', 13.5, true, false);
INSERT INTO public.moon VALUES (12, 'Titania', 8, 435910, 1578, 'Largest Uranian moon', 8.7, true, false);
INSERT INTO public.moon VALUES (13, 'Rhea', 6, 527040, 1527, 'Second-largest moon of Saturn', 4.5, true, false);
INSERT INTO public.moon VALUES (14, 'Dione', 6, 377400, 1122, 'Saturn’s icy moon', 2.7, true, false);
INSERT INTO public.moon VALUES (15, 'Iapetus', 6, 3561000, 1468, 'Saturn’s yin-yang moon', 79.3, true, false);
INSERT INTO public.moon VALUES (16, 'Charon', 9, 19571, 1212, 'Pluto’s largest moon', 6.4, true, false);
INSERT INTO public.moon VALUES (17, 'Miranda', 8, 129390, 471, 'Uranus’s smallest round moon', 1.4, true, false);
INSERT INTO public.moon VALUES (18, 'Ariel', 8, 191020, 1158, 'Brightest Uranian moon', 2.5, true, false);
INSERT INTO public.moon VALUES (19, 'Umbriel', 8, 266000, 1169, 'Dark Uranian moon', 4.1, true, false);
INSERT INTO public.moon VALUES (20, 'Nereid', 7, 5513818, 340, 'Distant moon of Neptune', 360.1, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 4879, 1, 'Smallest planet in Solar System', false, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 12104, 2, 'Hottest planet in Solar System', false, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 12742, 3, 'Only known planet with life', true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 6779, 4, 'Red Planet with ice caps', false, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 139820, 5, 'Largest planet in Solar System', false, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 116460, 6, 'Gas giant with prominent rings', false, false);
INSERT INTO public.planet VALUES (7, 'Kepler-22b', 2, 28000, 1, 'Exoplanet in habitable zone', false, true);
INSERT INTO public.planet VALUES (8, 'Gliese 581g', 3, 15000, 1, 'Potentially habitable exoplanet', false, true);
INSERT INTO public.planet VALUES (9, 'HD 209458b', 4, 160000, 1, 'First detected transiting exoplanet', false, false);
INSERT INTO public.planet VALUES (10, '51 Pegasi b', 5, 180000, 1, 'First confirmed exoplanet', false, false);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', 6, 7000, 1, 'One of seven Earth-sized planets', false, true);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 6, 7100, 2, 'Possibly habitable', false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5, 0, 'G-type main-sequence', 1.0, true, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 5, 4, 'Red Dwarf', 0.123, true, false);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 8, 642, 'Red Supergiant', 11.6, false, false);
INSERT INTO public.star VALUES (4, 'Andromeda A', 2, 7, 2537000, 'Giant', 2.3, false, false);
INSERT INTO public.star VALUES (5, 'Sirius', 1, 0, 9, 'A-type main-sequence', 2.02, true, false);
INSERT INTO public.star VALUES (6, 'Vega', 1, 0, 25, 'A-type main-sequence', 2.1, true, false);


--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_belt_asteroid_belt_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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
-- Name: asteroid_belt asteroid_belt_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_name_key UNIQUE (name);


--
-- Name: asteroid_belt asteroid_belt_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_pkey PRIMARY KEY (asteroid_belt_id);


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
-- Name: asteroid_belt asteroid_belt_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

