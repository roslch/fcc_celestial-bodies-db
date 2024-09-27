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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km numeric(5,2),
    inclination_in_grades numeric(4,2),
    discoverer text,
    asteroid_class character varying(1)
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation character varying(30),
    size_in_kpc numeric(4,2),
    no_stars_in_bil integer,
    galaxy_type character varying(30)
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
    name character varying(30),
    diameter_in_km numeric(6,2),
    orbital_rad_in_km integer,
    orbit_days numeric(5,3),
    contains_water boolean,
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
    name character varying(30),
    orbit_days numeric(8,2),
    gravity_in_ms2 numeric(5,2),
    mean_temp_in_c numeric(6,2),
    contains_water boolean,
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
    name character varying(30),
    star_type character varying(30),
    age_in_bil_years numeric(4,2),
    surf_temp_in_k integer,
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939.40, 10.60, 'Piazzi, G.', 'G');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525.40, 7.14, 'Olbers, H. W.', 'V');
INSERT INTO public.asteroid VALUES (3, 'Hygiea', 433.00, 5.10, 'de Gasparis, A.', 'C');
INSERT INTO public.asteroid VALUES (4, 'Cybele', 263.00, 3.56, 'Tempel, E. W.', 'C');
INSERT INTO public.asteroid VALUES (5, 'Psyche', 223.00, 3.10, 'de Gasparis, A.', 'M');
INSERT INTO public.asteroid VALUES (6, 'Thisbe', 218.00, 5.22, 'Peters, C. H. F.', 'B');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 26.80, 400, 'Barred Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda', 46.56, 1000, 'Barred Spiral');
INSERT INTO public.galaxy VALUES (3, 'Cartwheel', 'Sculptor', 44.23, 500, 'Lenticular Ring');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Dorado/Mensa', 9.86, 20, 'Magellanic Spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Virgo', 32.32, 100, 'Unclear');
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'Triangulum', 18.74, 40, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 3474.20, 384399, 27.322, false, 3);
INSERT INTO public.moon VALUES (2, 'Deimos', 12.40, 23460, 1.262, false, 4);
INSERT INTO public.moon VALUES (3, 'Io', 3660.00, 421700, 1.769, false, 5);
INSERT INTO public.moon VALUES (4, 'Europa', 3121.00, 671034, 3.551, true, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5262.00, 1070412, 7.155, true, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 4820.00, 1882709, 16.689, false, 5);
INSERT INTO public.moon VALUES (7, 'Enceladus', 504.20, 237950, 1.370, true, 6);
INSERT INTO public.moon VALUES (8, 'Tethys', 1062.00, 294619, 1.888, true, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 1527.00, 527108, 4.518, true, 6);
INSERT INTO public.moon VALUES (10, 'Titan', 5151.00, 1221930, 15.945, true, 6);
INSERT INTO public.moon VALUES (11, 'Hyperion', 270.00, 1481100, 21.277, true, 6);
INSERT INTO public.moon VALUES (12, 'Miranda', 471.60, 129390, 1.413, true, 7);
INSERT INTO public.moon VALUES (13, 'Umbriel', 1169.00, 266300, 4.144, true, 7);
INSERT INTO public.moon VALUES (14, 'Titania', 1577.00, 435910, 8.706, true, 7);
INSERT INTO public.moon VALUES (15, 'Oberon', 1523.00, 583520, 13.463, true, 7);
INSERT INTO public.moon VALUES (16, 'Despina', 150.00, 52526, 0.335, true, 8);
INSERT INTO public.moon VALUES (17, 'Galatea', 176.00, 61953, 0.429, true, 8);
INSERT INTO public.moon VALUES (18, 'Larissa', 194.00, 73548, 0.555, true, 8);
INSERT INTO public.moon VALUES (19, 'Proteus', 420.00, 117646, 1.122, true, 8);
INSERT INTO public.moon VALUES (20, 'Triton', 2705.00, 354759, 5.877, false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 88.00, 3.70, 167.00, false, 3);
INSERT INTO public.planet VALUES (2, 'Venus', 225.00, 8.90, 464.00, true, 3);
INSERT INTO public.planet VALUES (3, 'Earth', 365.00, 9.80, 15.00, true, 3);
INSERT INTO public.planet VALUES (4, 'Mars', 687.00, 3.70, -65.00, true, 3);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4333.00, 23.10, -110.00, false, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', 10759.00, 9.00, -140.00, false, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 30687.00, 8.70, -195.00, false, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 60190.00, 11.00, -200.00, false, 3);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 129.90, 11.46, -85.00, true, 4);
INSERT INTO public.planet VALUES (10, 'Kepler-186b', 3.90, 10.58, 393.00, NULL, 4);
INSERT INTO public.planet VALUES (11, 'Kepler-186c', 7.30, 13.82, 191.45, NULL, 4);
INSERT INTO public.planet VALUES (12, 'Kepler-186e', 22.40, 14.01, 50.00, NULL, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Sun', 'Yellow Dwarf', 4.60, 5772, 1);
INSERT INTO public.star VALUES (4, 'Kepler-186', 'Red Dwarf', 4.00, 3755, 1);
INSERT INTO public.star VALUES (5, 'Alpheratz', 'Blue Subgiant', 60.00, 11900, 2);
INSERT INTO public.star VALUES (6, 'S Doradus', 'Blue Supergiant', 0.58, 14000, 4);
INSERT INTO public.star VALUES (7, 'Polaris', 'Yellow Supergiant', 45.00, 7200, 1);
INSERT INTO public.star VALUES (8, 'Betelgeuse', 'Red Supergiant', 8.00, 3500, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

