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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying,
    origin character varying,
    meaning text NOT NULL,
    star_id integer NOT NULL,
    year_discovered integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_ids_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_ids_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_ids_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_ids_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_ids_seq OWNED BY public.constellation.star_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying,
    constellation_id integer NOT NULL,
    meaning_or_appearance text NOT NULL,
    is_visible_to_naked_eyes boolean
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
    name character varying,
    orbital_period character varying,
    year_discovered integer NOT NULL,
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
    name character varying,
    orbital_period_in_days numeric,
    has_moon boolean NOT NULL,
    star_id integer NOT NULL,
    mean_surface_temperature character varying
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
    name character varying,
    approval_date date,
    designation character varying NOT NULL,
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
-- Name: constellation star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN star_id SET DEFAULT nextval('public.constellation_constellation_ids_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 'claudius ptolemy', 'The chained maiden or princess', 6, 1784);
INSERT INTO public.constellation VALUES (2, 'Centaurus', 'claudius ptolemy', 'centaur or ocassionally hippocentaur', 3, 1826);
INSERT INTO public.constellation VALUES (3, 'Canes vanatici', 'johannes hevelius', 'hunting dogs', 8, 1845);
INSERT INTO public.constellation VALUES (4, 'Pavo', '1603 uranometria created by keyser and de houtman', 'peacock', 1, 1603);
INSERT INTO public.constellation VALUES (5, 'Ursa major', 'claudius ptolemy', 'great bear', 7, 200);
INSERT INTO public.constellation VALUES (6, 'Coma berenices', '1536 caspar voper split from leo', 'berenices hair', 9, 2006);
INSERT INTO public.constellation VALUES (7, 'Sagittarius', 'claudius ptolemy', 'archer', 5, 1764);
INSERT INTO public.constellation VALUES (8, 'Tucana', '1603 uranometria created by keyser and de houtman', 'toucan', 4, 1598);
INSERT INTO public.constellation VALUES (9, 'Triangulum', 'claudius ptolemy', 'triangle', 2, 1764);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 7, 'is the galaxy containing the sun and its solar system including the Earth', true);
INSERT INTO public.galaxy VALUES (2, 'Small magellanic cloud', 8, 'visible from the Southern hemisphere', true);
INSERT INTO public.galaxy VALUES (3, 'Andromeda galaxy', 1, 'once called the Great Andromeda Nebula and is situated in the Andromeda constellation', true);
INSERT INTO public.galaxy VALUES (4, 'Triangulum galaxy', 9, 'is a spiral galaxy whose visibility is strongly affected by small amounts of light pollution', true);
INSERT INTO public.galaxy VALUES (5, 'Sunflower galaxy', 3, 'similar in appearance to a sunflower', false);
INSERT INTO public.galaxy VALUES (6, 'Malin 1', 6, 'discovered and named by David Malin', false);
INSERT INTO public.galaxy VALUES (7, 'Medusa merger', 5, 'looks like the snakes the Gordon Medusa had on her head from the Greek mythology', false);
INSERT INTO public.galaxy VALUES (8, 'Centaurus A', 2, 'has been spotted with naked eye by Stephen James', true);
INSERT INTO public.galaxy VALUES (9, 'Whirlpool galaxy', 3, 'similar in appearance to a whirlpool', false);
INSERT INTO public.galaxy VALUES (10, 'Condor galaxy', 4, 'named after a condor which is one of the largest flying vulture birds', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The moon', '27.4 days', 1609, 1);
INSERT INTO public.moon VALUES (3, 'Phobos', '7hours, 39minutes', 1877, 4);
INSERT INTO public.moon VALUES (4, 'Adrastea', '7hours, 9minutes', 1979, 3);
INSERT INTO public.moon VALUES (5, 'Thyone', '640 days', 2001, 3);
INSERT INTO public.moon VALUES (6, 'Europa', '3days, 13hours', 1610, 3);
INSERT INTO public.moon VALUES (7, 'Calypso', '1day, 21hours, 18minutes', 1980, 7);
INSERT INTO public.moon VALUES (8, 'Dione', '2days, 17hours, 41minutes', 1684, 7);
INSERT INTO public.moon VALUES (9, 'Mimas', '22 hours, 36minutes', 1789, 7);
INSERT INTO public.moon VALUES (10, 'Caliban', '1year, 215days', 1997, 8);
INSERT INTO public.moon VALUES (11, 'Portia', '12hours, 19minutes', 1986, 8);
INSERT INTO public.moon VALUES (12, 'Puck', '18hours, 17minutes', 1985, 8);
INSERT INTO public.moon VALUES (13, 'Despina', '8hours, 2minutes', 1989, 6);
INSERT INTO public.moon VALUES (14, 'Neso', '26years, 244days', 2002, 6);
INSERT INTO public.moon VALUES (15, 'Proteus', '26hours, 56minutes', 1989, 6);
INSERT INTO public.moon VALUES (16, 'Charon', '6.4 days', 1978, 10);
INSERT INTO public.moon VALUES (17, 'Hydra', '38 days', 2005, 10);
INSERT INTO public.moon VALUES (18, 'Nix', '24days, 21hours', 2005, 10);
INSERT INTO public.moon VALUES (19, 'Styx', '20days, 4hours', 2012, 10);
INSERT INTO public.moon VALUES (20, 'Francisco', '267 days', 2001, 8);
INSERT INTO public.moon VALUES (2, 'Deimos', '1day, 6hours', 1877, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 365.26, true, 3, '288 kelvin');
INSERT INTO public.planet VALUES (2, 'Venus', 224.70, false, 5, '737 kelvin');
INSERT INTO public.planet VALUES (3, 'Jupiter', 4332.55, true, 10, '165 kelvin');
INSERT INTO public.planet VALUES (4, 'Mars', 687, true, 11, '220 kelvin');
INSERT INTO public.planet VALUES (5, 'Mercury', 88, false, 15, '445 kelvin');
INSERT INTO public.planet VALUES (6, 'Neptune', 60188.5, true, 16, '80 kelvin');
INSERT INTO public.planet VALUES (7, 'Saturn', 10760.2, true, 14, '134 kelvin');
INSERT INTO public.planet VALUES (8, 'Uranus', 30697, true, 13, '76 kelvin');
INSERT INTO public.planet VALUES (10, 'Pluto', 90885, true, 12, '53 kelvin');
INSERT INTO public.planet VALUES (11, 'Ceres', 1683, false, 5, '180-240 kelvin');
INSERT INTO public.planet VALUES (12, 'Sedna', 4163920, false, 11, '33.15 kelvin');
INSERT INTO public.planet VALUES (9, 'Eris', 204483.95, true, 10, '42.5 kelvin');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Beta trianguli', NULL, 'HR 622', 1);
INSERT INTO public.star VALUES (3, 'Alpha centauri', NULL, 'HR 5459', 1);
INSERT INTO public.star VALUES (4, 'Alpha tucanae', NULL, 'HR 8502', 1);
INSERT INTO public.star VALUES (8, 'Cor caroli', '2016-07-20', 'HR 4915', 1);
INSERT INTO public.star VALUES (9, 'Beta comae berenices', NULL, 'HR 4983', 1);
INSERT INTO public.star VALUES (10, 'Diphda', '2016-08-21', 'HR 188', 1);
INSERT INTO public.star VALUES (11, 'Aldebaran', '2016-06-30', 'HR 1457', 1);
INSERT INTO public.star VALUES (12, 'Kaus australis', '2016-07-20', 'HR 6879', 1);
INSERT INTO public.star VALUES (13, 'Hamal', '2016-07-20', 'HR 617', 1);
INSERT INTO public.star VALUES (14, 'Deneb algedi', '2017-02-01', 'HR 8322', 1);
INSERT INTO public.star VALUES (15, 'Spica', '2016-06-30', 'HR 5056', 1);
INSERT INTO public.star VALUES (16, 'Sadalsuud', '2016-08-21', 'HR 8232', 1);
INSERT INTO public.star VALUES (1, 'Alpha pavonis', '2016-07-20', 'HR 7790', 1);
INSERT INTO public.star VALUES (5, 'Epsilon sagittarii', '2016-07-20', 'HR 6879', 1);
INSERT INTO public.star VALUES (6, 'Alpheratz', '2016-06-30', 'HR 15', 3);
INSERT INTO public.star VALUES (7, 'Alioth', '2016-06-30', 'HR 4905', 1);


--
-- Name: constellation_constellation_ids_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_ids_seq', 2, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: constellation constellation_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_star_id_key UNIQUE (star_id);


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
-- Name: moon moon_orbital_period_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_orbital_period_key UNIQUE (orbital_period);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_mean_surface_temperature_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_mean_surface_temperature_key UNIQUE (mean_surface_temperature);


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
