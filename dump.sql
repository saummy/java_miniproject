--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE jobspot;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:ilGLN62nvaMXeo8+6gRA0w==$7jL6mjmXbnGiRyXQshwXtHbh0d7dhW7Po/DOf7cGcXo=:MWF6orZ7Fa11wWMhFmZ29e88pdx52wSDQE+I3DTeZlc=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "jobspot" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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
-- Name: jobspot; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE jobspot WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE jobspot OWNER TO postgres;

\connect jobspot

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
-- Name: company_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_profiles (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    description character varying(3000) NOT NULL,
    founded character varying(255) NOT NULL,
    head_line character varying(255) NOT NULL,
    headquarters character varying(255) NOT NULL,
    logo character varying(255) NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    website character varying(255) NOT NULL,
    category character varying(255) NOT NULL,
    company_size character varying(255) NOT NULL
);


ALTER TABLE public.company_profiles OWNER TO postgres;

--
-- Name: company_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_profiles_id_seq OWNER TO postgres;

--
-- Name: company_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_profiles_id_seq OWNED BY public.company_profiles.id;


--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO postgres;

--
-- Name: job_applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_applications (
    candidate_id bigint NOT NULL,
    job_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.job_applications OWNER TO postgres;

--
-- Name: job_postings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_postings (
    id bigint NOT NULL,
    category smallint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    description character varying(7000) NOT NULL,
    experience_level smallint NOT NULL,
    location character varying(255) NOT NULL,
    reference_id character varying(255) NOT NULL,
    tenure smallint NOT NULL,
    title character varying(255) NOT NULL,
    type smallint NOT NULL,
    company_id bigint NOT NULL,
    open_till date
);


ALTER TABLE public.job_postings OWNER TO postgres;

--
-- Name: job_postings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_postings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_postings_id_seq OWNER TO postgres;

--
-- Name: job_postings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_postings_id_seq OWNED BY public.job_postings.id;


--
-- Name: job_postings_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_postings_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_postings_seq OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    account_verified boolean,
    company_logo character varying(255),
    email character varying(255),
    is_verified boolean,
    name character varying(255),
    password character varying(255),
    role_id bigint NOT NULL,
    created_at timestamp(6) without time zone,
    company_profile_id bigint,
    profile_completed boolean
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: company_profiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_profiles ALTER COLUMN id SET DEFAULT nextval('public.company_profiles_id_seq'::regclass);


--
-- Name: job_postings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_postings ALTER COLUMN id SET DEFAULT nextval('public.job_postings_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: 17152; Type: BLOB; Schema: -; Owner: postgres
--

SELECT pg_catalog.lo_create('17152');


ALTER LARGE OBJECT 17152 OWNER TO postgres;

--
-- Data for Name: company_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_profiles (id, created_at, description, founded, head_line, headquarters, logo, updated_at, website, category, company_size) FROM stdin;
3	2023-05-05 17:15:46.932072	We’re a diverse collective of thinkers and doers, continually reimagining what’s possible to help us all do what we love in new ways. And the same innovation that goes into our products also applies to our practices — strengthening our commitment to leave the world better than we found it. This is where your work can make a difference in people’s lives. Including your own.\r\n\r\nApple is an equal opportunity employer that is committed to inclusion and diversity	1976	Think Different	Cupertino, California	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683288203/companies/1595530301220_shc8qd.jpg	2023-05-05 17:15:46.932072	https://apple.com	0	5
6	2023-05-05 12:10:31.76	PhonePe is a mobile payments app that allows you to transfer money instantly to anyone, by using just their mobile number. Our goal is to make digital payments so easy, safe & universally accepted that people never feel the need to carry cash or cards again.	2015	India's payment app	Bengaluru East, Karnataka	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683289110/companies/1582141203840_wdec1d.jpg	2023-05-05 12:10:31.76	https://phonepe.com	3	4
7	2023-05-05 12:10:31.76	At Goldman Sachs, we believe progress is everyone’s business. That’s why we commit our people, capital and ideas to help our clients, shareholders and the communities we serve to grow.\nFounded in 1869, Goldman Sachs is a leading global investment banking, securities and investment management firm. Headquartered in New York, we maintain offices in all major financial centers around the world.	1869	Our people are our greatest asset – we say it often and with good reason.	New York, New York\n	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683289038/companies/1595518030728_xclgyf.jpg	2023-05-05 12:10:31.76	https://goldmansachs.com	3	5
8	2023-05-05 18:48:22.002508	Founded in July 2009, Dribbble has grown into a global community where tens of millions of people get inspired and connect with designers around the world. As of January 2020, nearly 10 million Shots, snapshots of designers’ work, have been shared, making Dribbble one of the most prolific and engaged design communities. \r\n\r\nAs a designer-first, fully remote company, Dribbble focuses on creating features and tools that propel designers and their work to the next level. Dribbble is proud to have worked with some of the best design-forward companies like Apple, InVision, and Slack to help designers advance their careers and find work they love. \r\n\r\nGive us a follow:\r\nInstagram - https://www.instagram.com/dribbble/\r\nTwitter - https://twitter.com/dribbble \r\nFacebook - https://www.facebook.com/dribbble	2009	Dribbble is the world’s leading community for creatives to share, grow, and get hired.	Walnut Creek, California	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683292419/companies/1546638528235_ijt0h1.jpg	2023-05-05 18:48:22.002508	https://www.dribbble.com	1	2
9	2023-05-05 18:49:41.04211	As a unique product team within Adobe, we're crafting the future of creative workflow. Our talented team of designers and developers work hand-in-hand, leveraging the latest technologies and design thinking to create revolutionary products that connect and empower the creative world.\r\n\r\nBEHANCE (Behance.net) \r\nBehance is the world's leading platform for creative professionals across all industries. Members create multi-media portfolios that showcase their work within the Network, as well as throughout partner sites and organizations, and the industry-specific Served Sites. Millions of visitors — including top creative companies, recruiters, editors, and more — come to the Network to see the incredible work and find talent to hire. Through instant and efficient promotion of work, ready access to a global pool of top talent, and a constant stream of the best creative work from around the world — Behance is revolutionizing the way creative professionals manage their careers and companies find talent.	2006	Showcase and be discovered for your creative work.	New York, NY	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683292402/companies/1651162170313_ujikc9.jpg	2023-05-05 18:49:41.04211	https://www.behance.com	1	2
24	2023-05-05 19:16:11.463879	Indian Institute of Technology Bombay, the second IIT to be set up in 1958, is recognised worldwide as a leader in the field of engineering education and research. It is reputed for the quality of its faculty and the outstanding calibre of students graduating from its undergraduate and postgraduate programmes. The institute has a total of 15 academic departments, 30 centres, one school and five Interdisciplinary programmes. Over the last five decades, more than 52,600 engineers and scientists have graduated from the institute. It is served by more than 650 faculty members considered not only amongst the best within the country, but also highly recognised in the world for achievements in the field of education and research. Today the Institute is recognized as one of the top centres of academic excellence in the country. Over the years, there has been dynamic and rapid progress at IIT Bombay in both academic and research activities, with a parallel improvement in facilities and infrastructure to match with the best institutions in the world.	1958	'Institute of Eminence'​	Mumbai, Maharashtra	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683292042/companies/1660636305804_y4fbvd.jpg	2023-05-05 19:16:11.463879	http://www.iitb.ac.in/	12	5
5	2023-05-05 12:10:31.76	A problem isn't truly solved until it's solved for all. Googlers build products that help create opportunities for everyone, whether down the street or across the globe. Bring your insight, imagination and a healthy disregard for the impossible. Bring everything that makes you unique. Together, we can build for everyone.\r\n	1998	Make life easier with a little help from our products	Mountain View, CA	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683288496/companies/1519856215226_rzxskk.jpg	2023-05-07 22:28:04.493721	https://google.com	0	5
11	2023-05-05 18:54:53.059566	Skadden, Arps, Slate, Meagher & Flom LLP and Affiliates delivers the highest quality advice and novel solutions to legal challenges, enabling clients to achieve their business goals. We are known for the innovative and creative thinking we rely on to handle the most complex transactions, litigation/controversy issues, and regulatory matters, as well as the open, collaborative relationships we build with clients, including corporations; financial and governmental entities; small, entrepreneurial companies; and cultural, educational and charitable institutions. Our attorneys, who reflect diverse backgrounds and perspectives, collaborate seamlessly across our 21 offices in the world’s major financial centers.	1948	Skadden advises corporations, financial institutions and government entities around the world on their most complex, high-profile matters.	New York, NY	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683292351/companies/1519855916271_cxrqxs.jpg	2023-05-05 18:54:53.059566	http://www.skadden.com	4	4
12	2023-05-05 18:56:29.817919	As the world’s largest food and beverage company we are driven by a simple aim: unlocking the power of food to enhance quality of life for everyone, today and for generations to come. To deliver on this, we serve with passion, with a spirit of excellence, offering products and services for all stages of life, every moment of the day, helping people care for themselves and their families. Our culture is based on our values rooted in respect: respect for ourselves, respect for others, respect for diversity and respect for the future.\n\nWe can trace our origin back to 1866, when the first European condensed milk factory was opened in Cham, Switzerland, by the Anglo-Swiss Condensed Milk Company. One year later, Henri Nestlé, a trained pharmacist, launched one of the world’s first prepared infant cereals ‘Farine lactée’ in Vevey, Switzerland.\n\nToday, we employ around 273,000 people and have factories or operations in almost every country in the world. With our headquarters still based in the Swiss town of Vevey, we had sales of CHF 84.3 billion in 2020.\n\nOur portfolio covers almost every food and beverage category –offering products and services for all stages of life, every moment of the day, helping people care for themselves and their families.\n\nHouse rules: https://nes.tl/HouseRules	1866	Unlocking the power of food to enhance quality of life for everyone, today and for generations to come.	Vevey, Switzerland	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683292321/companies/1592405863758_otcftx.jpg	2023-05-05 18:56:29.817919	http://www.nestle.com	6	5
13	2023-05-05 18:59:03.13146	Siemens is a technology company focused on industry, infrastructure, transport, and healthcare. From more resource-efficient factories, resilient supply chains, and smarter buildings and grids, to cleaner and more comfortable transportation as well as advanced healthcare, the company creates technology with purpose adding real value for customers. By combining the real and the digital worlds, Siemens empowers its customers to transform their industries and markets, helping them to transform the everyday for billions of people. Siemens also owns a majority stake in the publicly listed company Siemens Healthineers, a globally leading medical technology provider shaping the future of healthcare. In addition, Siemens holds a minority stake in Siemens Energy, a global leader in the transmission and generation of electrical power.\r\nIn fiscal 2022, which ended on September 30, 2022, the Siemens Group generated revenue of €72.0 billion and net income of €4.4 billion. As of September 30, 2022, the company had around 311,000 employees worldwide. Further information is available at www.siemens.com.	1847	Technology to transform the everyday.	Munich, Germany	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683292301/companies/1656603399847_iqnual.jpg	2023-05-05 18:59:03.13146	http://www.siemens.com	6	5
15	2023-05-05 19:02:28.337113	Mercedes-Benz USA, LLC (MBUSA), a Daimler Company, is responsible for the Distribution and Marketing of Mercedes-Benz and smart products in the United States.\r\n\r\nMBUSA was founded in 1965 and prior to that Mercedes-Benz cars were sold in the United States by Mercedes-Benz Car Sales, Inc., a subsidiary of the Studebaker-Packard corporation. Today MBUSA has over 300 dealerships with more than 1400 employees.\r\n\r\nFor employment opportunities please visit: http://bit.ly/2tFzlOV. \r\n\r\nFor information on how to get the most out of your Mercedes-Benz vehicle, visit the Owners'​ Support instructional videos section of our site: http://www.mbusa.com/mercedes/owners/videos	1925	The Best or Nothing	Atlanta, GA	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683292254/companies/1656694416923_vro8wv.jpg	2023-05-05 19:02:28.337113	http://www.mbusa.com	7	4
22	2023-05-05 19:13:48.557498	Harvard University is devoted to excellence in teaching, learning, and research, and to developing leaders in many disciplines who make a difference globally.\r\n\r\nHarvard University is a private university in Cambridge, Massachusetts, U.S., and a member of the Ivy League. Founded in 1636 by the colonial Massachusetts legislature, Harvard is the oldest institution of higher learning in the United States. It is also the first and oldest corporation in North America.	1636	Devoted to excellence in teaching, learning, and research, and to developing leaders who make a difference globally.	Cambridge, Massachusetts	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683292067/companies/1519855919126_nuvks7.jpg	2023-05-05 19:13:48.557498	http://harvard.edu	12	5
14	2023-05-05 19:00:22.466024	Our mission is to accelerate the world’s transition to sustainable energy. With global temperatures rising, the faster we free ourselves from fossil fuel reliance and achieve a zero-emission future, the better. \r\n \r\nIn pursuit of this mission, we make electric vehicles that are not just great EVs, but the best cars, period. We also produce and install infinitely scalable clean energy generation and storage products that help our customers further decrease their environmental impact. When it comes to achieving our goals, we pride ourselves in accomplishing what others deem impossible.\r\n \r\nWe are opening new factories and increasing our output everyday – join us in building a sustainable future.	2003	Tesla’s mission is to accelerate the world’s transition to sustainable energy.	Austin, Texas	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683292274/companies/1607665771371_lvn3pe.jpg	2023-05-07 19:17:18.28104	http://www.tesla.com	7	5
16	2023-05-05 19:04:07.510773	We are the world’s largest aerospace company and leading provider of commercial airplanes, defense, space and security systems, and global services. Building on a legacy of aerospace leadership, Boeing continues to lead in technology and innovation, deliver for its customers, and invest in its people and future growth.\r\nWith us you can create and contribute to what matters most in your career, in your community and around the world. Our team members are supported to explore their professional interests and pursue new opportunities that will deepen their knowledge of our business. Join us in building the future of aerospace: boeing.com/careers\r\nBoeing is an Equal Opportunity Employer. Employment decisions are made without regard to race, color, religion, national origin, gender, sexual orientation, gender identity, age, physical or mental disability, genetic factors, military/veteran status or other characteristics protected by law.	1916	Join us and find an inclusive workplace built on innovation and shared values.	Arlington, VA	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683292221/companies/1542647676208_tmj5jd.jpg	2023-05-05 19:04:07.510773	http://boeing.com	8	5
17	2023-05-05 19:05:51.29343	We connect customers with integrated solutions & predictive technologies to ensure they stay ahead of emerging threats.\r\n\r\nHeadquartered in Bethesda, Maryland, Lockheed Martin is a global security and aerospace company principally engaged in the research, design, development, manufacture, integration and sustainment of advanced technology systems, products and services.	1912	We connect customers with integrated solutions & predictive technologies to ensure they stay ahead of emerging threats.	Bethesda, MD	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683292202/companies/1668532984993_wqwpde.jpg	2023-05-05 19:05:51.29343	https://www.lockheedmartin.com	8	5
19	2023-05-05 19:08:59.998286	At H&M, we welcome you to be yourself and feel like you truly belong. Help us reimagine the future of an entire industry by making everyone look, feel, and do good.\r\n\r\nWe take pride in our history of making fashion accessible to everyone and led by our values we strive to build a more welcoming, inclusive, and sustainable industry. We are privileged to have more than 120,000 colleagues, in over 75 countries across the world. That’s 120 000 individuals with unique experiences, skills, and passions. At H&M, we believe everyone can make an impact, we believe in giving people responsibility and a strong sense of ownership. Our business is your business, and when you grow, we grow. Be yourself & more at H&M.	1947	Be yourself & more at H&M	Stockholm, Stockholm County	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683292148/companies/1679061165891_uba6hv.jpg	2023-05-05 19:08:59.998286	https://career.hm.com/	9	5
18	2023-05-05 19:07:17.896694	CHANEL is a private company and a world leader in creating, developing, manufacturing and distributing luxury products. \r\n\r\nFounded by Gabrielle Chanel at the beginning of the last century, CHANEL offers a broad range of high-end creations, including Ready-to-Wear, Leather Goods, Fashion Accessories, Eyewear, Fragrances, Makeup, Skincare, Jewelry and Watches. CHANEL is also renowned for its Haute Couture collections, presented twice yearly in Paris, and for having acquired a large number of specialized suppliers, collectively known as the Métiers d’Art. CHANEL is dedicated to ultimate luxury and to the highest level of craftsmanship. \r\nIt is a brand whose core values remain historically grounded on exceptional creation. As such, CHANEL promotes culture, art, creativity and “savoir-faire” throughout the world, and invests significantly in people, R&D and innovation. \r\n\r\nAt the end of 2019, CHANEL employed more than 28,000 people across the world.	1910	To be irreplaceable, one must be different	London, England	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683292174/companies/1575623209364_jyc877.jpg	2023-05-05 19:07:17.896694	http://www.chanel.com	9	5
20	2023-05-05 19:11:01.069523	FedEx connects people and possibilities through our worldwide portfolio of shipping, transportation, e-commerce and business services. We offer integrated business applications through our collaboratively managed operating companies — collectively delivering extraordinary service to our customers — using the expertise and reliability represented by the FedEx brand. \r\n\r\nOur people are the foundation of our success, and FedEx has consistently ranked among the world’s most admired and trusted employers. We inspire our global workforce of more than 575,000 employees to remain absolutely, positively focused on safety, the highest ethical and professional standards, and the needs of their customers and communities.\r\n\r\nWe owe our success as an industry leader to the more than 500,000 global team members who deliver exceptional customer service experiences day-in and day-out. Want to be part of this dynamic team?  Check out our open positions located on the Careers Site on fedex.com:  http://careers.van.fedex.com/	1973	Where now meets next	Memphis, TN	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683292119/companies/1683135507131_aziqdr.jpg	2023-05-05 19:11:01.069523	http://careers.fedex.com	11	5
21	2023-05-05 19:12:20.005604	DHL is the leading global brand in the logistics industry. Our divisions offer an unrivalled portfolio of logistics services ranging from national and international parcel delivery, e-commerce shipping and fulfillment solutions, international express, road, air and ocean transport to industrial supply chain management. \r\n \r\nWith about 380,000 employees in more than 220 countries and territories worldwide, DHL connects people and businesses securely and reliably, enabling global sustainable trade flows. \r\n \r\nWith specialized solutions for growth markets and industries including technology, life sciences and healthcare, engineering, manufacturing & energy, auto-mobility and retail, DHL is decisively positioned as “The logistics company for the world”.\r\n \r\nDHL is part of Deutsche Post DHL Group.	1969	Excellence. Simply Delivered	Bonn, Germany	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683292092/companies/1664877112168_o0jxq5.jpg	2023-05-05 19:12:20.005604	http://dhl.com	11	5
25	2023-05-05 19:31:58.221607	Promotes the sport of Cricket in India. \r\nThe Board of Control for Cricket in India, is the national governing body of Cricket in India, its headquarters is situated at Cricket centre near Wankhede Stadium in Mumbai.	1928	My way or the highway	Mumbai, Maharashtra	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683292005/companies/1656952875137_zkatfs.jpg	2023-05-05 19:31:58.221607	https://www.bcci.tv/	14	5
26	2023-05-05 19:34:33.356216	The National Football League is America's most popular sports league, comprised of 32 franchises that compete each year to win the Super Bowl, the world's biggest annual sporting event. Founded in 1920, the NFL developed the model for the successful modern sports league, including national and international distribution, extensive revenue sharing, competitive excellence, and strong franchises across the board. The NFL is the industry leader on a wide range of fronts.\r\n\r\nHeadquartered in New York City, the NFL expands across the nation and the globe with the offices including the NFL Media office based in Inglewood, CA, the NFL Films office based in Mt. Laurel, NJ. The NFL also has satellite offices in Atlanta, Washington DC, and Chicago. Our International offices are located in the UK, China, Mexico & Canada.	1920	We are all stewards of football. We unite people and inspire communities in the joy of the game by delivering the world's most exciting sports and en	New York, NY	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683291974/companies/1625144223531_b3ykcc.jpg	2023-05-05 19:34:33.356216	https://www.bcci.tv/	14	4
10	2023-05-05 18:52:20.504278	Mayer Brown is uniquely positioned to advise the world’s leading companies and financial institutions on their most complex deals and disputes. With extensive reach across four continents, we are the only integrated law firm in the world with approximately 200 lawyers in each of the world’s three largest financial centers—New York, London and Hong Kong—the backbone of the global economy. We have deep experience in high-stakes litigation and complex transactions across industry sectors, including our signature strength, the global financial services industry. Our diverse teams of lawyers are recognized by our clients as strategic partners with deep commercial instincts and a commitment to creatively anticipating their needs and delivering excellence in everything we do. Our “one-firm” culture—seamless and integrated across all practices and regions—ensures that our clients receive the best of our knowledge and experience.\r\n\r\nImpressum: https://www.mayerbrown.com/Legal-Notices/Legal-Regulatory-Information/	1900	Uniquely positioned to advise the world’s leading companies	Chicago, IL	https://res.cloudinary.com/dghvyb1zm/image/upload/v1683292374/companies/1656676759769_f9eg1r.jpg	2023-05-05 18:52:20.504278	http://www.mayerbrown.com	4	4
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	<< Flyway Baseline >>	BASELINE	<< Flyway Baseline >>	\N	postgres	2023-05-01 13:13:26.910841	0	t
2	2	insert  roles	SQL	V2__insert__roles.sql	-121978225	postgres	2023-05-01 13:18:36.815928	10	t
\.


--
-- Data for Name: job_applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_applications (candidate_id, job_id, created_at) FROM stdin;
1	9	2023-05-08 18:35:18.785827
\.


--
-- Data for Name: job_postings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_postings (id, category, created_at, description, experience_level, location, reference_id, tenure, title, type, company_id, open_till) FROM stdin;
2	0	2023-05-07 02:02:29.21292	Minimum qualifications:\r\n\r\nBachelor's degree in Computer Science or equivalent practical experience.\r\n5 years of experience developing in programming languages (e.g., C++, Java).\r\nExperience in researching and writing documentation for engineers/developers.\r\n\r\nPreferred qualifications:\r\n\r\nExperience with performance analysis and optimization.\r\nExperience developing accessible technologies.\r\nKnowledge of embedded systems.\r\nAbility to grow in a fast-changing environment.\r\n\r\nAbout The Job\r\n\r\nGoogle's software engineers develop the next-generation technologies that change how billions of users connect, explore, and interact with information and one another. Our products need to handle information at massive scale, and extend well beyond web search. We're looking for engineers who bring fresh ideas from all areas, including information retrieval, distributed computing, large-scale system design, networking and data storage, security, artificial intelligence, natural language processing, UI design and mobile; the list goes on and is growing every day. As a software engineer, you will work on a specific project critical to Google’s needs with opportunities to switch teams and projects as you and our fast-paced business grow and evolve. We need our engineers to be versatile, display leadership qualities and be enthusiastic to take on new problems across the full-stack as we continue to push technology forward.\r\n\r\nGoogle's mission is to organize the world's information and make it universally accessible and useful. Our team combines the best of Google AI, Software, and Hardware to create radically helpful experiences. We research, design, and develop new technologies and hardware to make computing faster, seamless, and more powerful. We aim to make people's lives better through technology.\r\n\r\nResponsibilities\r\n\r\nCreate instructional documentation for both internal and external audiences.\r\nFacilitate, edit, and curate documentation produced by engineers.\r\nReview code developed by other engineers and provide feedback to ensure best practices (e.g., style guidelines, checking code in, accuracy, testability, and efficiency).\r\nContribute to existing documentation or educational content and adapt content based on product/program updates and user feedback.\r\nTriage product or system issues and debug/track/resolve by analysing the sources of issues and the impact on hardware, network, or service operations and quality.\r\n\r\nGoogle is proud to be an equal opportunity workplace and is an affirmative action employer. We are committed to equal employment opportunity regardless of race, color, ancestry, religion, sex, national origin, sexual orientation, age, citizenship, marital status, disability, gender identity or Veteran status. We also consider qualified applicants regardless of criminal histories, consistent with legal requirements. See also Google's EEO Policy and EEO is the Law. If you have a disability or special need that requires accommodation, please let us know by completing our Accommodations for Applicants form .	3	Bengaluru, Karnataka, India	JS1683405149JOSEZ	0	Software Engineer, Developer Tools	0	9	2023-05-07
4	0	2023-05-07 02:21:49.256529	Note: Google’s hybrid workplace includes remote and in-office roles. By applying to this position you will have an opportunity to share your preferred working location from the following:\r\n\r\nIn-office locations: Hyderabad, Telangana, India; Bangalore, Karnataka, India; Gurgaon, Haryana, India.\r\n\r\nRemote location(s): India.Minimum qualifications:\r\n\r\nBachelor’s degree or equivalent practical experience.\r\n2 years of experience with software development in one or more programming languages, or 1 year of experience with an advanced degree.\r\n2 years of experience with data structures or algorithms.\r\n\r\nPreferred qualifications:\r\n\r\nMaster's degree or PhD in Computer Science or related technical fields.\r\nExperience developing accessible technologies.\r\n\r\nAbout The Job\r\n\r\nGoogle's software engineers develop the next-generation technologies that change how billions of users connect, explore, and interact with information and one another. Our products need to handle information at massive scale, and extend well beyond web search. We're looking for engineers who bring fresh ideas from all areas, including information retrieval, distributed computing, large-scale system design, networking and data storage, security, artificial intelligence, natural language processing, UI design and mobile; the list goes on and is growing every day. As a software engineer, you will work on a specific project critical to Google’s needs with opportunities to switch teams and projects as you and our fast-paced business grow and evolve. We need our engineers to be versatile, display leadership qualities and be enthusiastic to take on new problems across the full-stack as we continue to push technology forward.\r\n\r\nWith your technical expertise you will manage project priorities, deadlines, and deliverables. You will design, develop, test, deploy, maintain, and enhance software solutions.\r\n\r\nGoogle Cloud accelerates organizations’ ability to digitally transform their business with the best infrastructure, platform, industry solutions and expertise. We deliver enterprise-grade solutions that leverage Google’s cutting-edge technology – all on the cleanest cloud in the industry. Customers in more than 200 countries and territories turn to Google Cloud as their trusted partner to enable growth and solve their most critical business problems.\r\n\r\nResponsibilities\r\n\r\nWrite product or system development code.\r\nParticipate in, or lead design reviews with peers and stakeholders to decide amongst available technologies.\r\nReview code developed by other developers and provide feedback to ensure best practices (e.g., style guidelines, checking code in, accuracy, testability, and efficiency).\r\nContribute to existing documentation or educational content and adapt content based on product/program updates and user feedback.\r\nTriage product or system issues and debug/track/resolve by analyzing the sources of issues and the impact on hardware, network, or service operations and quality.\r\n\r\nGoogle is proud to be an equal opportunity workplace and is an affirmative action employer. We are committed to equal employment opportunity regardless of race, color, ancestry, religion, sex, national origin, sexual orientation, age, citizenship, marital status, disability, gender identity or Veteran status. We also consider qualified applicants regardless of criminal histories, consistent with legal requirements. See also Google's EEO Policy and EEO is the Law. If you have a disability or special need that requires accommodation, please let us know by completing our Accommodations for Applicants form .	2	India	JS1683406309UDBND	0	Software Engineer III, Google Cloud	2	9	2023-06-30
5	0	2023-05-07 02:23:13.33533	Minimum qualifications:\r\n\r\nBachelor's degree in Computer Science, Engineering, a related technical field, or equivalent practical experience.\r\n3 years of experience in silicon CAD.\r\nExperience in one or more programming languages (e.g., Python, Perl, Java, TCL, Bash, etc.).\r\n\r\nPreferred qualifications:\r\n\r\nExperience creating software/automation tools for hardware/silicon engineers to use.\r\nExperience in automation/scripting, CAD flow development.\r\nUnderstanding of software development concepts (e.g., data structures, algorithms, best coding practices, testing, version control, release, etc.).\r\nAbility to translate a high level user problem into a software spec and drive development.\r\nAbility to work with cross-functional teams.\r\nExcellent analytical, verbal, and written communication skills.\r\n\r\nAbout The Job\r\n\r\nOur computational challenges are so big, complex and unique we can't just purchase off-the-shelf hardware, we've got to make it ourselves. Your team designs and builds the hardware, software and networking technologies that power all of Google's services. As a Hardware Engineer, you design and build the systems that are the heart of the world's largest and most powerful computing infrastructure. You develop from the lowest levels of circuit design to large system design and see those systems all the way through to high volume manufacturing. Your work has the potential to shape the machinery that goes into our cutting-edge data centers affecting millions of Google users.\r\n\r\nWith your technical expertise, you lead projects in multiple areas of expertise (i.e., engineering domains or systems) within a data center facility, including construction and equipment installation/troubleshooting/debugging with vendors.\r\n\r\nGoogle's mission is to organize the world's information and make it universally accessible and useful. Our team combines the best of Google AI, Software, and Hardware to create radically helpful experiences. We research, design, and develop new technologies and hardware to make computing faster, seamless, and more powerful. We aim to make people's lives better through technology.\r\n\r\nResponsibilities\r\n\r\nDefine and develop software that provides the tooling, infrastructure, and automation necessary to create design systems that enable chip development with greater levels of efficiency and reliability, while managing increasingly complex chip designs.\r\nEnhance and maintain existing design systems for scale.\r\nDesign and build automated testing frameworks to increase quality of software releases.\r\nEnable observability in design systems and develop dashboards.\r\n\r\nGoogle is proud to be an equal opportunity workplace and is an affirmative action employer. We are committed to equal employment opportunity regardless of race, color, ancestry, religion, sex, national origin, sexual orientation, age, citizenship, marital status, disability, gender identity or Veteran status. We also consider qualified applicants regardless of criminal histories, consistent with legal requirements. See also Google's EEO Policy and EEO is the Law. If you have a disability or special need that requires accommodation, please let us know by completing our Accommodations for Applicants form .	1	Bengaluru, Karnataka, India	JS1683406393JFCHG	0	Software Engineer, Silicon CAD	0	9	2023-05-09
6	0	2023-05-07 02:25:47.670365	Minimum qualifications:\r\n\r\nBachelor's degree in Computer Science or equivalent practical experience.\r\n3 years of experience developing in one of the modern object oriented programming languages (e.g., C++, Java, etc.).\r\n\r\nPreferred qualifications:\r\n\r\nExperience with performance analysis and optimization.\r\nExperience developing accessible technologies.\r\nKnowledge of embedded systems.\r\n\r\nAbout The Job\r\n\r\nGoogle's software engineers develop the next-generation technologies that change how billions of users connect, explore, and interact with information and one another. Our products need to handle information at massive scale, and extend well beyond web search. We're looking for engineers who bring fresh ideas from all areas, including information retrieval, distributed computing, large-scale system design, networking and data storage, security, artificial intelligence, natural language processing, UI design and mobile; the list goes on and is growing every day. As a software engineer, you will work on a specific project critical to Google’s needs with opportunities to switch teams and projects as you and our fast-paced business grow and evolve. We need our engineers to be versatile, display leadership qualities and be enthusiastic to take on new problems across the full-stack as we continue to push technology forward.\r\n\r\nGoogle's mission is to organize the world's information and make it universally accessible and useful. Our team combines the best of Google AI, Software, and Hardware to create radically helpful experiences. We research, design, and develop new technologies and hardware to make computing faster, seamless, and more powerful. We aim to make people's lives better through technology.\r\n\r\nResponsibilities\r\n\r\nParticipate in, or lead design reviews with peers and stakeholders to decide among available technologies.\r\nReview code developed by other engineers and provide feedback to ensure best practices (e.g., style guidelines, checking code in, accuracy, testability, and efficiency).\r\nContribute to existing documentation or educational content and adapt content based on product/program updates and user feedback.\r\nTriage product or system issues and debug/track/resolve by analyzing the sources of issues and the impact on hardware, network, or service operations and quality.\r\n\r\nGoogle is proud to be an equal opportunity workplace and is an affirmative action employer. We are committed to equal employment opportunity regardless of race, color, ancestry, religion, sex, national origin, sexual orientation, age, citizenship, marital status, disability, gender identity or Veteran status. We also consider qualified applicants regardless of criminal histories, consistent with legal requirements. See also Google's EEO Policy and EEO is the Law. If you have a disability or special need that requires accommodation, please let us know by completing our Accommodations for Applicants form .	2	Bengaluru, Karnataka, India 	JS1683406547NPVPX	0	Embedded Systems Runtime and Firmware Engineer	0	9	2023-08-19
7	2	2023-05-07 02:28:35.584943	Preferred qualifications:\r\n\r\n10 years of experience selling infrastructure software, databases, analytic tools or applications software with the ability to exceed business goals.\r\nExperience working with and managing partners in complex implementation projects including global system integrator and packaged software vendors.\r\nExperience with large complex commercial and legal negotiations working with procurement, legal, and business teams.\r\nAbility to work with sales engineers and customer’s technical leads to inventory existing software estate, define migration plans, and build business cases for migrations.\r\nExcellent at leveraging C-level relationships with executives to sell software.\r\n\r\nAbout The Job\r\n\r\nThe Google Cloud Platform team helps customers transform and build what's next for their business — all with technology built in the cloud. Our products are engineered for security, reliability and scalability, running the full stack from infrastructure to applications to devices and hardware. Our teams are dedicated to helping our customers — developers, small and large businesses, educational institutions and government agencies — see the benefits of our technology come to life. As part of an entrepreneurial team in this rapidly growing business, you will play a key role in understanding the needs of our customers and help shape the future of businesses of all sizes use technology to connect with customers, employees and partners.\r\n\r\nAs an Field Sales Representative, you will leverage existing relationships with C-level executives, develop new relationships, and act as a trusted business partner to deeply understand their unique company challenges and goals. You will advocate the innovative power of our products to make organizations more productive, collaborative, and mobile. Using your passion for Google products, you will help spread the magic of Google to organizations around the world.\r\n\r\nGoogle Cloud accelerates organizations’ ability to digitally transform their business with the best infrastructure, platform, industry solutions and expertise. We deliver enterprise-grade solutions that leverage Google’s cutting-edge technology – all on the cleanest cloud in the industry. Customers in more than 200 countries and territories turn to Google Cloud as their trusted partner to enable growth and solve their most critical business problems.\r\n\r\nThe US base salary range for this full-time position is $106,000-$163,000 + bonus + equity + benefits. Our salary ranges are determined by role, level, and location. The range displayed on each job posting reflects the minimum and maximum target for new hire salaries for the position across all US locations. Within the range, individual pay is determined by work location and additional factors, including job-related skills, experience, and relevant education or training. Your recruiter can share more about the specific salary range for your preferred location during the hiring process.\r\n\r\nPlease note that the compensation details listed in US role postings reflect the base salary only, and do not include bonus, equity, or benefits. Learn more about benefits at Google .\r\n\r\nResponsibilities\r\n\r\nBuild and deepen executive relationships with enterprise customers. Bring to Google your mature C-level relationships to help us grow into new organizations and influence long-term strategic direction and serve as a business partner.\r\nNegotiate and manage end-to-end complex sales-cycles, often presenting to C-level executives in corporate customers.\r\nLead account strategy in generating and developing business growth opportunities, working collaboratively with Customer Engineers, and Google Partners.\r\nUnderstand each customer’s technology footprint, strategic growth plans and business drivers, technology strategy, and external landscape.\r\nDrive business development, forecast accurately, and achieve strategic goals by leading customers through the entire business cycle.\r\n\r\nGoogle is proud to be an equal opportunity workplace and is an affirmative action employer. We are committed to equal employment opportunity regardless of race, color, ancestry, religion, sex, national origin, sexual orientation, age, citizenship, marital status, disability, gender identity or Veteran status. We also consider qualified applicants regardless of criminal histories, consistent with legal requirements. See also Google's EEO Policy and EEO is the Law. If you have a disability or special need that requires accommodation, please let us know by completing our Accommodations for Applicants form .\r\n	3	Pittsburg, US	JS1683406715ZWPZE	0	Field Sales Representative, Google Cloud	1	9	2023-06-23
8	1	2023-05-07 19:10:06.447892	What are we looking for?\r\n\r\nWe are looking for a bright, creative mind – someone with a love for creating cut-through marketing designs with a positive, proactive attitude and a willingness to learn and develop. This role is remote, reporting to the Senior PR & Marketing Manager, and will work closely with regional marketing leads across our offices in the US, EMEA and APAC.\r\n\r\n\r\nThe best candidate will be a motivated, enthusiastic individual who understands the digital media landscape and is excited about the prospect of driving brand awareness for a leading global digital media agency. You will be comfortable creating marketing design assets across multiple channels – Digital (social & website), Print, Awards, Video, HTML5, Events, Presentations & Documents.\r\n\r\n\r\nThe Role\r\n\r\nHelp with the creation of consistent, bold, highly engaging design assets for our agency brand, in line with our brand guidelines, including case studies, social media content, presentations, creds decks, website posts, print collateral for internal and external use, award entries, campaign design, and event material.\r\nAct as a guardian for our brand; a go-to resource to turn to in using our branded assets (colours, fonts, logos, layouts) in client presentations and pitch decks.\r\nProvide creative support on the production of industry reports.\r\nProduce in-house photography and video projects (equipment provided) - from developing storyboards and structures, to recording/producing, and editing\r\nGlobal creative support for regional marketing leads; liasing with colleagues across our regions to support them as they deliver our brand to potential clients and partners.\r\n\r\n\r\nRequirements\r\n\r\n3-4 years experience in designing preferably in an agency.\r\nHigh level of skill in Adobe Creative Suite mainly Photoshop / Illustrator / AfterEffects.\r\nKnowledge of Adobe Animate. Experience with HTML5 (preferred).\r\nExperience at a media agency (preferred).\r\nAbility to work autonomously and integrate yourself in a fast-paced agency.\r\nProven creative passion and skills.\r\nProven experience working with a broad mix of marketing formats.\r\nStrong research and organisational skills; proactive, professional and positive approach\r\nOutstanding attention to detail, mature, self-sufficient, and able to interact with senior stakeholders.\r\nGreat communication skills; a crucial element of the role will be supporting regional marketing leads.	2	Bengaluru, Karnataka, India	JS1683466806KNCIG	0	Graphic Designer	1	15	2023-06-08
9	0	2023-05-07 19:12:45.973362	Join the Wireless Technologies and Ecosystems organization and be part of a best-in-class team of engineers, working with multi-functional teams to drive innovation and develop products used by millions worldwide.\r\n\r\n\r\nWe are looking for an expert virtual prototype engineer who can help us in deploying virtual prototype solutions for next generation cellular and connectivity products. Candidate must have an excellent record of efficiently developing IP models for complex SOCs.\r\n\r\n\r\nKey Qualifications\r\n\r\nAt least 3 to 8 years of experience in Virtual Prototypes, i’e IP modeling using SystemC or other languages, Platform integration and verification.\r\n\r\nBS or M.S. in Electronics Engineering or equivalent degree with minimum experience of 3 years in virtual platform development.\r\n\r\nStrong programming skills in C/C++. Proficiency with Python.\r\n\r\nGood understanding of CPU /subsystems, SOC architecture and knowledge of hardware-software interface.\r\n\r\nStrong debugging, analytical and problem-solving skills\r\n\r\nStrong collaboration skills with the ability to collaborate with multiple functional teams.\r\n\r\nAdded advantage\r\n\r\nUnderstanding of 3GPP standards and wireless communication.\r\n\r\n\r\nDescription\r\n\r\nAs a member of the simulation team you will be involved in the Virtual Prototype development for SoC for the purpose of cellular software development. You will closely work with system engineering, SOC and SW teams. Job also includes integration of cycle accurate CPU subsystems for profiling activities.\r\n\r\n\r\nYou will be involved in the IP modeling, developing test bench, Subsystem integration and developing low level driver for VP platform verification. You also closely involve in the SW bring up on the simulation platform and provide support to the SW team.\r\n\r\n\r\nCandidate should possess strong interpersonal skills and ability to work in dynamic work environment.\r\n\r\n\r\nEducation & Experience\r\n\r\nBS or M.S. in Electronics Engineering or equivalent degree with minimum experience of 3 years in virtual platform development.	3	Delhi, India	JS1683466965FZVGQ	1	Cellular Virtual Platform developer	0	10	2023-05-31
10	0	2023-05-07 19:13:54.30567	Imagine what you could do here. At Apple, creative ideas have a way of becoming wonderful products, services, and customer experiences very quickly. Bring passion and dedication to your job and there's no telling what you could accomplish.\r\n\r\n\r\nThe people here at Apple don’t just create products — they create the kind of wonder that’s revolutionized entire industries. It’s the diversity of those people and their ideas that inspires the innovation that runs through everything we do, from amazing technology to industry-leading environmental efforts. Join Apple, and help us leave the world better than we found it.\r\n\r\n\r\nWe are looking for a Molding Process Engineer who will work closely with Supply Management, Product Design, Industrial Design, Quality and Manufacturing Engineering groups on new part designs.\r\n\r\n\r\nKey Qualifications\r\n\r\nMinimum 8 years in plastic tool design, mold making, molding industry and minimum 5 years in molding process position\r\n\r\n\r\nExperience in developing plastic processing parameters with hand-on experience in mold setup, process optimization and problem solving\r\n\r\nExperience in managing and develop precision parts, high pace and mass volume products with multiple vendors in parallel\r\n\r\nGood knowledge of geometric dimensioning, hot runner systems application and scientific molding technique\r\n\r\nSystematic, analytical & strong trouble shooting skills are a must to possess\r\n\r\nAble to analyze mold flow analysis, scientific study and provide improvement feedback\r\n\r\nGood knowledge in wide range of materials such as engineering plastic, liquid silicon rubber, thermal plastics, primer and epoxy\r\n\r\nExtensive experience in molding process setup, improvement and optimization\r\n\r\nProficient in written, presentation and verbal communication\r\n\r\n\r\nDescription\r\n\r\n- Trouble shooting issues in scientific approach with the use engineering tools/ techniques such as decoupled molding, scientific molding approach, Tolerance Analysis, SPC, DOE and Six Sigma techniques\r\n\r\n\r\n- Take the leading role in driving the improvement of productivity and quality of plastic part manufacturing, molding and tooling techniques\r\n\r\n\r\n- Serve as Apple’s internal expert for molding process by using a thorough understanding various material properties and tool component fabrication techniques\r\n\r\n\r\n- To take part in new material development, new process development and innovation\r\n\r\n\r\n- Frequent travel domestic and within region is required\r\n\r\n\r\nEducation & Experience\r\n\r\nBachelor Degree / Masters in Engineering, Plastics Technology, Polymer Science or equivalent from a premier school	3	Hyderabad, India	JS1683467034QFNLI	0	Molding Process Engineer	1	10	2023-05-25
11	2	2023-05-07 19:16:29.228858	At H&M, we welcome you to be yourself and challenge you to grow and make a difference.\r\n\r\nYou’ll take on new responsibilities from day one, learn skills for life, meet friends completely unlike you that make you feel at home, and start finding ways to make your big dreams come true. By living our Values daily and being your authentic self, you help us reimagine the future of an entire industry by making everyone look, feel and do good.\r\n\r\nBe yourself & more at H&M.\r\n\r\nAbout the Role\r\n\r\nAt H&M, as a Retail Sales Associate you will be advising our customers and keeping them in style! A Retail Sales Associate, or Sales Advisor, as referred to internally, is responsible for delivering the Best Customer Experience that contributes to the store’s sales and profit.  As a Retail Sales Associate, you will always put customers first, offer assistance, and share your Product and Fashion knowledge.  You will create an environment that is easy for our customers to shop through Store Operations and Great Garment Care.  By sharing knowledge and skills with colleagues, you will actively contribute to creating a Best Team to meet our customers’ expectations.  This role will work in accordance with H&M standards, policies, procedures, and legal requirements.\r\n\r\nYour Day to Day*\r\n\r\nActively greet and engage with our customers in the service areas and on the sales floor to provide the best customer experience\r\nSupport in the maintenance of a neat and tidy sales floor to ensure a positive shopping experience inclusive of folding, hanging, displaying, and merchandising garments per H&M guidelines to maximize selling opportunities\r\nActively process, stock, and replenish garments on the sales floor and stock room\r\nUnload delivery truck, receive, open, and unpack merchandise and label merchandise with security tags within efficiency timeline goals\r\nRing on the register, report and handle all required transactions, issue receipts, and fold and place merchandise in the appropriate bag following the register best practices routine\r\nEager to educate and promote our H&M Loyalty program to our customers\r\nShare your knowledge and skills with your colleagues, offering help where needed to build a positive working environment\r\nWork in accordance with H&M standards and local legislation with health & safety and security routines to guarantee you, your colleagues, and customer safety at all times\r\nFollow all procedures and routines regarding safety, security, and administrative processes in all areas of the store\r\nWho You Are\r\n\r\nPassionate for customer service and helping people find their style\r\nA multi-tasker who enjoys working in a fast-paced environment\r\nInclusive, positive, creative, and willing to learn on the job!\r\nA team player with a flexible approach\r\nYou have the ability to lift in excess of 20 pounds\r\nAbility to stand for long periods of time, bend, stretch, engage in repetitive motions, push, pull and carry items (mannequins, clothing, totes, torsos, etc.) for a short distance\r\nAbility to climb a ladder and use a step stool\r\nMust be able to work a flexible work schedule, including nights and weekend\r\n	1	Global	JS1683467189BMMRZ	0	Retail Sales Associate	0	26	2023-05-31
12	7	2023-05-07 19:21:09.456162	About the role:\r\n\r\nIn collaboration with the hardware, software and mechanical teams, you are responsible for the following areas:\r\n\r\nThe development and control of requirements on projects, including to traceability to lower level requirements and test artifacts\r\nWork with customers to negotiate requirements\r\nDevelop and maintain artifacts to demonstrate compliance to customer and safety requirements, including collecting artifacts from other teams\r\nWork with customers to gain acceptance on any deviations to requirements\r\nSupport audits from customers\r\nDevelop, maintain and improve the requirements and control process\r\nDevelop metrics and tools to track progress on projects\r\nDevelop training materials and best practices for requirements and control process\r\nCreate technical documents such as manuals, reports, specifications\r\nConvey technical concepts in simple, clear instructions with detailed images such as charts or diagrams\r\nBe intimately familiar with product features and functionalities\r\n\r\nDesired Candidate Profile:\r\n\r\nMaster of Engineering or Bachelor of Engineering degree\r\nExperience with requirements management concepts and tools\r\nExperience in the design, development, and testing of electronics and software systems\r\nExperience with the automotive industry and ISO-26262 Functional Safety preferred\r\nA passion for continuous improvement through streamlined and optimizing engineering processes\r\nComfortable working with the ambiguity inherent in implementing new technologies and processes\r\nExcellent verbal and written communication skills to interface with technical contributors, projects leaders, executive management, and customers	2	Berlin, Germany	JS1683467469LILOA	0	Lead Systems Engineer	0	21	2023-06-28
13	0	2023-05-07 22:30:31.087188	Minimum qualifications:\r\n\r\nBachelor's degree in Electrical Engineering, Computer Science engineering, or equivalent practical experience.\r\n3 years of experience in silicon validation.\r\nExperience programming in C and Python.\r\nExperience in developing silicon validation tests and debugging post-silicon issues.\r\n\r\nPreferred qualifications:\r\n\r\nMaster's degree or PhD in a related domain.\r\nExperience with embedded software development, related toolchains, and hardware debugging tools (e.g., JTAG, TRACE32, etc.)\r\nExperience with Android, Embedded Linux, RTOSes, or bare metal platforms.\r\nExperience in test automation or system level testing (SLT).\r\n\r\nAbout The Job\r\n\r\nOur computational challenges are so unique we can't just purchase off-the-shelf hardware, we've got to make it ourselves. Your team designs and builds the hardware, software, and networking technologies that power all of Google's services. As a Hardware Engineer, you design and build the systems that are the heart of the world's largest and most powerful computing infrastructure. You develop from the lowest levels of circuit design to large system design and see those systems all the way through to high volume manufacturing. Your work has the potential to shape the machinery that goes into our cutting-edge data centers affecting millions of Google users.\r\n\r\nWith your technical expertise, you lead projects in multiple areas of expertise (e.g., engineering domains or systems) within a data center facility, including construction and equipment installation, troubleshooting, or debugging with vendors.\r\n\r\nGoogle's mission is to organize the world's information and make it universally accessible and useful. Our team combines the best of Google AI, Software, and Hardware to create radically helpful experiences. We research, design, and develop technologies and hardware to make computing faster, seamless, and more powerful. We aim to make people's lives better through technology.\r\n\r\nResponsibilities\r\n\r\nPerform SLT planning, test development, test stabilization, and debugging to support the silicon volume ramp at the system level.\r\nCollaborate with Design and Validation leads to support the SLT platform.\r\nCollaborate with internal test engineers, partner engineers, and contract manufacturers on screening parts, and sign off on the SLT releases.\r\nCollect the post-silicon data to improve the production quality and yield.\r\n\r\nGoogle is proud to be an equal opportunity workplace and is an affirmative action employer. We are committed to equal employment opportunity regardless of race, color, ancestry, religion, sex, national origin, sexual orientation, age, citizenship, marital status, disability, gender identity or Veteran status. We also consider qualified applicants regardless of criminal histories, consistent with legal requirements. See also Google's EEO Policy and EEO is the Law. If you have a disability or special need that requires accommodation, please let us know by completing our Accommodations for Applicants form .	0	Agra, India	JS1683478831ZGFNJ	2	Silicon Engineer, System Level Testing Volume Ramp	0	9	2023-05-31
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name) FROM stdin;
1	ADMIN
2	CANDIDATE
3	COMPANY
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, account_verified, company_logo, email, is_verified, name, password, role_id, created_at, company_profile_id, profile_completed) FROM stdin;
15	t	\N	jobs@dribble.com	\N	Dribble	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-05-05 18:14:39.310928	8	t
6	t	\N	dipu32@gmail.com	f	Dipu	$2a$10$EOhGy4S.IfVUMVcLqbfhkuNowMr2b0AgIAe.oC6lEsg37va3GJUD2	2	2023-05-01 11:41:59	\N	\N
16	t	\N	hello@behance.com	\N	Behance	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-05-05 18:14:39.310928	9	t
2	t	\N	dfkjldnkj@NKDLZ.DVSD	f	jdklfjnws	$2a$10$L/3S.6tCaZhhw2nBwRdT5eW73AY3BUy57iAmofQ6soUEH/UDqEqKK	2	2022-05-04 11:41:29	\N	\N
17	t	\N	jobs@mayerbrown.com	\N	Mayer Brown	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-05-05 18:34:20.082239	10	t
7	t	\N	saqib@gmail.com	f	Saqib Kar	$2a$10$bO7buyUeHOkm/le7AKEvYuajhfMR8.VZb3u4Yo4cF8Plk9TF4AhhS	2	2023-04-07 11:41:19	\N	\N
11	t	\N	jobs@tatagroup.com	f	Tata Consultancy	$2a$10$9mYw6KuvUFeewibIcYzB/eXIxyH7XWk/PinviibJeMepiYPpdJ4LS	3	2023-05-02 11:40:29.663	\N	\N
3	t	\N	shaiqkar+1@gmail.com	f	Shaiq	$2a$10$HVEFDpAoBWUnovo/gyXCLe/IKPrmdSJcQuFwbS2wVpRNEmedAOfJa	2	2023-05-02 11:41:05	\N	\N
5	t	\N	souyma@gmail.com	f	Souyma	$2a$10$WQ4sKu/ZcjFyzNTUYd3bDObeDc/oX/fIXPXGr8CxrurQCtjjkA6YC	2	2023-05-02 11:40:59	\N	\N
1	t	\N	shaiqkar@gmail.com	f	Shaiq Kar	$2a$10$1CGnLvVJwMx8oAosq5Ix3ujvL0cxqGJZWnchB4uk0q8VPyGuMiAnS	2	2023-01-02 11:41:06	\N	\N
4	t	\N	additi@gmail.com	f	Additi Singh	$2a$10$pqbcUVtPn5B2gnDQZBEcE.YBfXsKwa9J4qYmDEPvcRj2ixzx724lC	2	2023-04-01 04:42:12	\N	\N
18	t	\N	hello@skadden.com	\N	Skadden	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-05-05 18:34:20.082239	11	t
19	t	\N	jobs@nestle.com	\N	Nestlé	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-05-05 18:34:20.082239	12	t
10	t	\N	apply@apple.com	f	Apple Inc	$2a$10$R915JY7s9wsG..tTBlVxpOSKC4.4a4PRn6M/WExNYU.fezYOlZlDK	3	2023-05-02 11:41:49	3	t
20	t	\N	work@siemens.com	\N	Siemens	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-05-05 18:34:20.082239	13	t
9	t	\N	jobs@google.com	f	Google	$2a$10$N9EwemmmmSkn/F0ZUTVKPOYOB84mpKLz/uzkRDoRFw3lD.ria3Pze	3	2023-05-02 05:41:39	5	t
12	t	\N	jobs@phonepe.com	\N	PhonePe	$2a$10$JlOOrlEa6HJs3920uFgh7.qdVdtNn4JpjRnqALa60zKknHxznB7FO	3	2023-05-05 17:44:11.316326	6	t
13	t	\N	work@goldmansachs.com	\N	Goldman Sachs	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-05-05 17:48:04.575421	7	t
21	t	\N	jobs@tesla.com	\N	Tesla	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-05-05 18:34:20.082239	14	t
22	t	\N	work@mercedes-benz.com	\N	Mercedes Benz	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-05-05 18:34:20.082239	15	t
23	t	\N	jobs@boeing.com	\N	Boeing	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-05-05 18:34:20.082239	16	t
24	t	\N	jobs@lockheedmartin.com	\N	Lockheed Martin	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-05-05 18:34:20.082239	17	t
25	t	\N	work@chanel.com	\N	Chanel	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-05-05 18:34:20.082239	18	t
26	t	\N	jobs@hm.com	\N	H&M	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-05-05 18:34:20.082239	19	t
27	t	\N	work@fedex.com	\N	FedEx	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-05-05 18:34:20.082239	20	t
28	t	\N	jobs@dhl.com	\N	DHL	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-05-05 18:34:20.082239	21	t
29	t	\N	carrears@harvard.edu	\N	Harvard University	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-05-05 18:34:20.082239	22	t
30	t	\N	carrears@iitb.ac.in	\N	IIT Bombay	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-05-05 18:34:20.082239	24	t
31	t	\N	carrears@bcci.tv	\N	Board of Control for Cricket in India	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-05-05 18:34:20.082239	25	t
32	t	\N	carrears@nfl.com	\N	National Football League	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-05-05 18:34:20.082239	26	t
33	t	\N	jobs@paypal.com	\N	Paypal	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2022-01-02 02:43:46.860154	\N	f
34	t	\N	careers@samsung.com	\N	Samsung	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2021-10-21 02:43:46.860154	\N	f
35	t	\N	jobs@livpure.com	\N	Liv Pure	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2021-04-24 02:43:46.860154	\N	f
36	t	\N	work@burgerking.com	\N	Burger King	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2022-01-16 02:43:46.860154	\N	f
37	t	\N	jobs@crio.do	\N	Crio.Do	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-04-13 02:43:46.860154	\N	f
38	t	\N	jobs@meta.com	\N	Meta	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2022-10-24 02:43:46.860154	\N	f
39	t	\N	work@nike.com	\N	Nike	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2022-02-18 02:43:46.860154	\N	f
40	t	\N	jobs@nagarro.com	\N	Nagarro	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2020-09-27 02:43:46.860154	\N	f
41	t	\N	jobs@datatrained.com	\N	DataTrained	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2021-02-07 02:44:33.891512	\N	f
42	t	\N	jobs@innoviti.com	\N	Innoviti	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2021-08-25 02:44:33.891512	\N	f
43	t	\N	jobs@shopmatic.com	\N	Shopmatic	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2021-12-22 02:44:33.891512	\N	f
44	t	\N	jobs@sigtuple.com	\N	Sigtuple	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-03-03 02:44:33.891512	\N	f
45	t	\N	jobs@setu.co	\N	Setu	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-03-18 02:44:33.891512	\N	f
46	t	\N	jobs@pentationanalytics.com	\N	Pentation Analytics	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2022-10-06 02:44:33.891512	\N	f
47	t	\N	jobs@qandle.com	\N	Qandle	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2021-03-13 02:44:33.891512	\N	f
8	t	\N	admin@jobspot.in	f	Admin	$2a$10$6SNkcXnAoNQ0jcLbeSX1F.KXtix1jDnKbHW3MKD1TosXfaGIBRIhW	1	2023-02-02 11:42:05	\N	\N
48	t	\N	jobs@cerelabs.com	\N	Cere Labs	$2a$10$mqDCb3i.Pi7qi.yZuFsKOOp.Rhy54zVIoMiviDiySlxvKBZJGzWuW	3	2023-03-10 02:44:33.891512	\N	f
49	t	\N	jobs@sleevesup.com	\N	Sleevesup	$2a$10$E800MuQ/heeHg1HDGzoOkucXgOk1Jfayn0zB88ezQQWzb4FVJwV6m	3	2023-05-07 22:55:54.720413	\N	f
\.


--
-- Name: company_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_profiles_id_seq', 26, true);


--
-- Name: job_postings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_postings_id_seq', 13, true);


--
-- Name: job_postings_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_postings_seq', 151, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 49, true);


--
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: -
--

BEGIN;

SELECT pg_catalog.lo_open('17152', 131072);
SELECT pg_catalog.lowrite(0, '\x5765e2809972652061206469766572736520636f6c6c656374697665206f66207468696e6b65727320616e6420646f6572732c20636f6e74696e75616c6c79207265696d6167696e696e672077686174e280997320706f737369626c6520746f2068656c7020757320616c6c20646f2077686174207765206c6f766520696e206e657720776179732e20416e64207468652073616d6520696e6e6f766174696f6e207468617420676f657320696e746f206f75722070726f647563747320616c736f206170706c69657320746f206f75722070726163746963657320e2809420737472656e677468656e696e67206f757220636f6d6d69746d656e7420746f206c656176652074686520776f726c6420626574746572207468616e20776520666f756e642069742e205468697320697320776865726520796f757220776f726b2063616e206d616b65206120646966666572656e636520696e2070656f706c65e2809973206c697665732e20496e636c7564696e6720796f7572206f776e2e0d0a0d0a4170706c6520697320616e20657175616c206f70706f7274756e69747920656d706c6f796572207468617420697320636f6d6d697474656420746f20696e636c7573696f6e20616e64206469766572736974792e20');
SELECT pg_catalog.lo_close(0);

COMMIT;

--
-- Name: company_profiles company_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_profiles
    ADD CONSTRAINT company_profiles_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: job_applications job_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_applications
    ADD CONSTRAINT job_applications_pkey PRIMARY KEY (candidate_id, job_id);


--
-- Name: job_postings job_postings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_postings
    ADD CONSTRAINT job_postings_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: roles uk_ofx66keruapi6vyqpv6f2or37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT uk_ofx66keruapi6vyqpv6f2or37 UNIQUE (name);


--
-- Name: job_postings uk_qh22fu3anyejb0ci42335qti5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_postings
    ADD CONSTRAINT uk_qh22fu3anyejb0ci42335qti5 UNIQUE (reference_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: job_applications fknhwwf2t406ujtc15jnbq0ugd6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_applications
    ADD CONSTRAINT fknhwwf2t406ujtc15jnbq0ugd6 FOREIGN KEY (job_id) REFERENCES public.job_postings(id);


--
-- Name: users fkp56c1712k691lhsyewcssf40f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fkp56c1712k691lhsyewcssf40f FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: job_postings fkpfxli6egiaql4sgs0hb9p8n40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_postings
    ADD CONSTRAINT fkpfxli6egiaql4sgs0hb9p8n40 FOREIGN KEY (company_id) REFERENCES public.users(id);


--
-- Name: job_applications fkrdsm89ndk0w3wexcuiq8tut3w; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_applications
    ADD CONSTRAINT fkrdsm89ndk0w3wexcuiq8tut3w FOREIGN KEY (candidate_id) REFERENCES public.users(id);


--
-- Name: users fktqr6aw0s0xjoxxhx17ia0i76l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fktqr6aw0s0xjoxxhx17ia0i76l FOREIGN KEY (company_profile_id) REFERENCES public.company_profiles(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

