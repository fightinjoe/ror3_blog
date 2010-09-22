--
-- PostgreSQL database dump
--

SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: blogs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blogs (
    id integer NOT NULL,
    title character varying,
    path_title character varying,
    body text,
    body_html text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    "year" integer,
    "month" integer,
    permalink text,
    comments_expire_at timestamp with time zone,
    category_id integer,
    user_id integer,
    published_at timestamp with time zone
);


ALTER TABLE public.blogs OWNER TO postgres;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blogs_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.blogs_id_seq OWNER TO postgres;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blogs_id_seq OWNED BY blogs.id;


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blogs_id_seq', 111, true);


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categories_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_id_seq', 9, true);


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    body text,
    created_at timestamp with time zone,
    author_name text,
    author_email text,
    author_website text,
    blog_id integer
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comments_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_id_seq', 30, true);


--
-- Name: logged_exceptions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE logged_exceptions (
    id integer NOT NULL,
    exception_class character varying,
    controller_name character varying,
    action_name character varying,
    message text,
    backtrace text,
    cookies text,
    "session" text,
    params text,
    environment text,
    url text,
    created_at timestamp with time zone
);


ALTER TABLE public.logged_exceptions OWNER TO postgres;

--
-- Name: logged_exceptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE logged_exceptions_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.logged_exceptions_id_seq OWNER TO postgres;

--
-- Name: logged_exceptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE logged_exceptions_id_seq OWNED BY logged_exceptions.id;


--
-- Name: logged_exceptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('logged_exceptions_id_seq', 54, true);


--
-- Name: testers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE testers (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.testers OWNER TO postgres;

--
-- Name: testers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE testers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.testers_id_seq OWNER TO postgres;

--
-- Name: testers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE testers_id_seq OWNED BY testers.id;


--
-- Name: testers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('testers_id_seq', 1, false);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    "login" character varying,
    email character varying,
    crypted_password character varying,
    salt character varying,
    remember_token_expires_at timestamp with time zone,
    remember_token character varying,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE blogs ALTER COLUMN id SET DEFAULT nextval('blogs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE logged_exceptions ALTER COLUMN id SET DEFAULT nextval('logged_exceptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE testers ALTER COLUMN id SET DEFAULT nextval('testers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO blogs VALUES (20, 'Earning Interest on 15 Minutes', 'earning_interest_on_15_minutes', '<p><p>There used to be a time, or so I''m told, when family, hard work, and honesty were more important than being cool or following trends.  Somewhere just after the Jurassic era, I suspect, because ever since popularity has been a stronger motivating force than common sense and natural instinct for the bulk of humanity.  </p><p>Being "in" has historically been difficult due primarily to the time it took for information to travel.  That all changed in the past half-century, thanks to the weed-like growth of technology.  Who remembers when the neighborhood kids were no longer in awe your parents'' new RCA phonoraph/radio because Johnny next door had the first TV on the block?  And how sweet was the retribution of flipping it on Johnny by being the first to see a color TV in your 5th grade class?</p><p>Computers and internet connections, while equally revolutionary, were not quite so glamourized.  Perhaps because we were too busy lusting after the pair of Reebok Pumps in front of us, or the Guess? Jeans that were just outside our allowance price range?  Only when it was discovered that computers and the internet could be means for bragging about status (i.e. web pages, stock options, etc.) did this new means of communication become popular.</p><p>Companies are always eagerly trying to find the next pet rock or Tickle-Me Elmo.  In Japan, the once-treyndy cell phone industry has become so saturated that manufacturers are trying to design phones marketed to kids in kindergarten to 3rd grade.  How futile; don''t they realize they have missed the boat?  Who wants local recognition by being the first pre-schooler on the block with a cell phone when you can gain national recognition in reality TV?</p><p>I completly expect that when my kids do something stupid, I won''t find out from the principal or the police, but rather by watching them do it on TV.  I''ll be flipping through the channels, and there will be my son partying over spring break or my daughter eating rodent-sized bugs on a desert island, and the only thing I''ll be able to think is, "They better be home by curfew."  And when they get home, "Didn''t I tell you ''No being on TV before your homework is done''?"</p><p>In ten years, experts agree, 97% of the American population will have lost as a contestant on some reality TV show.  The goal isn''t to win necessarily, just don''t become William Hung singing "She Bangs".  If you can do that while waiting for the next hackneyed trend, popularity can eventually be yours!  Just keep true to your dreams, and keep reaching for the stars.</p>', '<p><p>There used to be a time, or so I&#8217;m told, when family, hard work, and honesty were more important than being cool or following trends.  Somewhere just after the Jurassic era, I suspect, because ever since popularity has been a stronger motivating force than common sense and natural instinct for the bulk of humanity.  </p><p>Being &#8220;in&#8221; has historically been difficult due primarily to the time it took for information to travel.  That all changed in the past half-century, thanks to the weed-like growth of technology.  Who remembers when the neighborhood kids were no longer in awe your parents&#8217; new <span class="caps">RCA</span> phonoraph/radio because Johnny next door had the first TV on the block?  And how sweet was the retribution of flipping it on Johnny by being the first to see a color TV in your 5th grade class?</p><p>Computers and internet connections, while equally revolutionary, were not quite so glamourized.  Perhaps because we were too busy lusting after the pair of Reebok Pumps in front of us, or the Guess? Jeans that were just outside our allowance price range?  Only when it was discovered that computers and the internet could be means for bragging about status (i.e. web pages, stock options, etc.) did this new means of communication become popular.</p><p>Companies are always eagerly trying to find the next pet rock or Tickle-Me Elmo.  In Japan, the once-treyndy cell phone industry has become so saturated that manufacturers are trying to design phones marketed to kids in kindergarten to 3rd grade.  How futile; don&#8217;t they realize they have missed the boat?  Who wants local recognition by being the first pre-schooler on the block with a cell phone when you can gain national recognition in reality TV?</p><p>I completly expect that when my kids do something stupid, I won&#8217;t find out from the principal or the police, but rather by watching them do it on TV.  I&#8217;ll be flipping through the channels, and there will be my son partying over spring break or my daughter eating rodent-sized bugs on a desert island, and the only thing I&#8217;ll be able to think is, &#8220;They better be home by curfew.&#8221;  And when they get home, &#8220;Didn&#8217;t I tell you &#8216;No being on TV before your homework is done&#8217;?&#8221;</p><p>In ten years, experts agree, 97% of the American population will have lost as a contestant on some reality TV show.  The goal isn&#8217;t to win necessarily, just don&#8217;t become William Hung singing &#8220;She Bangs&#8221;.  If you can do that while waiting for the next hackneyed trend, popularity can eventually be yours!  Just keep true to your dreams, and keep reaching for the stars.</p>', '2004-06-15 11:54:45+01', '2008-03-11 11:51:23+00', 2004, 6, NULL, NULL, 1, NULL, '2004-06-15 11:54:45+01');
INSERT INTO blogs VALUES (23, 'OxyMoronic', 'oxymoronic', '<p>I have been a moron recently, and it took the shortest long flight of my life for me to realize it.</p><p><h2>The longest short flight</h2>When flying from Japan to the US, you arrive about three hours after you take off.  But thanks to the International Date Line, it takes about sixteen hours for these three to pass.  Which is plenty of time to reflect on a week long vacation to Japan and the month that preceeded it.<h2>The luckiest unlucky fool</h2><p>At the top of my mind was the evening I spent at the police station in Nara Friday night trying to plead my innocence (or ignorance), which was a feat since I don''t know how to say either of those words in Japanese.</p><p>My unlucky streak started with getting stuck in traffic, continued with being late for picking up a friend for dinner, and climaxing an hour and a half later returning to the car after dinner.  </p><p>Evidently, the place where everybody parks by the station is a no-parking zone, or at least a no-parking-for-1-and-a-half-hour-zone.  I could see the ticket from 50 yards away, but I couldn''t see the police officer waiting on the other side of the car to nab me.</p><p>"License and Registration" is one thing that I do understand in Japanese, but what I couldn''t understand was why my driver''s license wasn''t in my jacket pocket like it should be.  While pondering this, I practiced my Japanese listening to such useful phrases as "Please follow me to the police station" and "What is the phone number of the place where you are staying" and "Ms. Kusumi?  This is the police station.  A Mr. Aaron Wheeler would like to speak with you."</p><p>The unluck stopped there, though, because Mr. Kusumi is the cheif of police in a neighboring town.  His reputation kept my fine to a minimum parking violation and a morning at the precinct with no charges pressed for driving without a license.  For being unlucky, I sure was lucky to be dating the daughter of a cop.<h2>The smartest stupid decision</h2><p>I should have seen my luck running out a few weeks earlier when I put 11 gallons of deisel gas in my Honda Civic.  Now I know that they make the nozels of the pump different sizes for different types of gasoline.  At the time, though, I thought that Shell was just being biased against imports.  I must have looked funny pressing the gas nozel hard against the tank to create a seal while cursing Shell for their oversight.</p><p>What serendepity, though, that it was a Friday and my father was bring an extra vehicle back to the house on the same weekend.  The fact that I had left my apartment keys at my office on the other side of town hardly seemed to matter because all of my stupid decisions were being offset by my smart timing: extra car, weekend, and it was time for the 50k tuneup anyway.</p><p>My decision making process is in need of its 25y tuneup.  Unfortunately, car insurance doesn''t cover that, and 30,000 feet up in the air, returning from Japan is hardly the place for a brain lube, oil, and filter.', '<p>I have been a moron recently, and it took the shortest long flight of my life for me to realize it.</p><p><h2>The longest short flight</h2>When flying from Japan to the US, you arrive about three hours after you take off.  But thanks to the International Date Line, it takes about sixteen hours for these three to pass.  Which is plenty of time to reflect on a week long vacation to Japan and the month that preceeded it.<h2>The luckiest unlucky fool</h2><p>At the top of my mind was the evening I spent at the police station in Nara Friday night trying to plead my innocence (or ignorance), which was a feat since I don&#8217;t know how to say either of those words in Japanese.</p><p>My unlucky streak started with getting stuck in traffic, continued with being late for picking up a friend for dinner, and climaxing an hour and a half later returning to the car after dinner.  </p><p>Evidently, the place where everybody parks by the station is a no-parking zone, or at least a no-parking-for-1-and-a-half-hour-zone.  I could see the ticket from 50 yards away, but I couldn&#8217;t see the police officer waiting on the other side of the car to nab me.</p><p>&#8220;License and Registration&#8221; is one thing that I do understand in Japanese, but what I couldn&#8217;t understand was why my driver&#8217;s license wasn&#8217;t in my jacket pocket like it should be.  While pondering this, I practiced my Japanese listening to such useful phrases as &#8220;Please follow me to the police station&#8221; and &#8220;What is the phone number of the place where you are staying&#8221; and &#8220;Ms. Kusumi?  This is the police station.  A Mr. Aaron Wheeler would like to speak with you.&#8221;</p><p>The unluck stopped there, though, because Mr. Kusumi is the cheif of police in a neighboring town.  His reputation kept my fine to a minimum parking violation and a morning at the precinct with no charges pressed for driving without a license.  For being unlucky, I sure was lucky to be dating the daughter of a cop.<h2>The smartest stupid decision</h2><p>I should have seen my luck running out a few weeks earlier when I put 11 gallons of deisel gas in my Honda Civic.  Now I know that they make the nozels of the pump different sizes for different types of gasoline.  At the time, though, I thought that Shell was just being biased against imports.  I must have looked funny pressing the gas nozel hard against the tank to create a seal while cursing Shell for their oversight.</p><p>What serendepity, though, that it was a Friday and my father was bring an extra vehicle back to the house on the same weekend.  The fact that I had left my apartment keys at my office on the other side of town hardly seemed to matter because all of my stupid decisions were being offset by my smart timing: extra car, weekend, and it was time for the 50k tuneup anyway.</p><p>My decision making process is in need of its 25y tuneup.  Unfortunately, car insurance doesn&#8217;t cover that, and 30,000 feet up in the air, returning from Japan is hardly the place for a brain lube, oil, and filter.', '2004-03-14 13:29:58+00', '2008-03-11 11:51:23+00', 2004, 3, NULL, NULL, 1, NULL, '2004-03-14 13:29:58+00');
INSERT INTO blogs VALUES (24, 'LasVegas.css', 'lasvegas.css', '<p>After compiling my expendatures and tabulating my accounts from the end of 2003', '<p>After compiling my expendatures and tabulating my accounts from the end of 2003', '2004-02-05 11:56:03+00', '2008-03-11 11:51:23+00', 2004, 2, NULL, NULL, 1, NULL, '2004-02-05 11:56:03+00');
INSERT INTO blogs VALUES (25, 'The BIG Put-Off', 'the_big_put-off', '<p><p>I''m being too productive.  Which is in stark contrast with my childhood.  I wasted countless hours in sixth grade playing Mario instead of studying, playing outside, or doing chores.  The encouragement was always "Do something! Exercise your body! Expand your mind!"</p><p>This is what I thought I was doing the first time I picked up a candy-coated Michael Cricton NYTimes best-seller and couldn''t put it down.  At the end of the weekend when I finally finished the book, I triumphantly walked into the kitchen and announced that I had invested a whole weekend in the expansion of my mind via consideration of the moral struggle of genetically reincarnating dinosaurs.  The look my mother gave me told me that my time would have been better spent playing Mario.  Worse than just being inanimate indoors, I had locked myself in my room, laid up in bed finishing the book.  At least with Nintendo I could exercise social skills like negotiating for time to play between NASCAR and the PGA.</p><p>As I grew up, I had little time for procrastination.  School, then friends, then standardized tests, then college, then parties, then girls started to preoccupy my time.  Until I moved back to Alabama and into my own apartment.  The race from 8 to 5 keeps me on my toes until I make it home.  On the lucky nights I have frisbee to keep me busy.  But on off nights, I''ve been resorting to old habits: Nintendo and novels.</p><p>A library is a great way to save money, and in my case, clear my conscience.  I have never forgiven myself for not reading the books that I should have read while I was in high school.  So over the past few years, I have been going back and filling in the blanks.  For Whom the Bell Tolls.  Fahrenheit 451.  The Grapes of Wrath.  A Tale of Two Cities.  I almost feel like registering for the SAT again just to see how well I would do now that I have actually read what I am being tested on.  Continuing with this trend, I checked out a book to read when my thumbs got tired from playing Mario in my now copious amounts of free time.  And then I realized that new habits of mine are actually harder to break than the older ones.</p><p>Who wants to go back to sucking on a pacifier?  Or picking their nose?  Or eating glue?  These old habits might have been hard to break, but hopefully once they were broken, the weren''t reoccurring.  This is the case with me, especially with my old habit of procrastinating.  I can''t do it.  For some reason I get things done.  Dirty dishes aren''t dirty for more than 24 hours.  The floors get vacuumed.  I respond to emails (... eventually).  And though I am not the ideal of punctuality, I am no poster child for procrastination.</p><p>This leaves me in a bind.  I have a duty to clear my conscience one novel at a time, but without the procrastinating habit, I don''t have the time!  This one measly paperback was lost, renewed for an extra month, and turned in a week late before I finished it.  And now on my next book, and easy read of 250  double-spaced large-font novel, I can''t average more than three pages per day.  It will be turned in a  week late, too.  </p><p>Now, all of the sudden, the library isn''t so economical.  But at least with a life free of procrastination, I''m getting things done.', '<p><p>I&#8217;m being too productive.  Which is in stark contrast with my childhood.  I wasted countless hours in sixth grade playing Mario instead of studying, playing outside, or doing chores.  The encouragement was always &#8220;Do something! Exercise your body! Expand your mind!&#8221;</p><p>This is what I thought I was doing the first time I picked up a candy-coated Michael Cricton NYTimes best-seller and couldn&#8217;t put it down.  At the end of the weekend when I finally finished the book, I triumphantly walked into the kitchen and announced that I had invested a whole weekend in the expansion of my mind via consideration of the moral struggle of genetically reincarnating dinosaurs.  The look my mother gave me told me that my time would have been better spent playing Mario.  Worse than just being inanimate indoors, I had locked myself in my room, laid up in bed finishing the book.  At least with Nintendo I could exercise social skills like negotiating for time to play between <span class="caps">NASCAR</span> and the <span class="caps">PGA</span>.</p><p>As I grew up, I had little time for procrastination.  School, then friends, then standardized tests, then college, then parties, then girls started to preoccupy my time.  Until I moved back to Alabama and into my own apartment.  The race from 8 to 5 keeps me on my toes until I make it home.  On the lucky nights I have frisbee to keep me busy.  But on off nights, I&#8217;ve been resorting to old habits: Nintendo and novels.</p><p>A library is a great way to save money, and in my case, clear my conscience.  I have never forgiven myself for not reading the books that I should have read while I was in high school.  So over the past few years, I have been going back and filling in the blanks.  For Whom the Bell Tolls.  Fahrenheit 451.  The Grapes of Wrath.  A Tale of Two Cities.  I almost feel like registering for the <span class="caps">SAT</span> again just to see how well I would do now that I have actually read what I am being tested on.  Continuing with this trend, I checked out a book to read when my thumbs got tired from playing Mario in my now copious amounts of free time.  And then I realized that new habits of mine are actually harder to break than the older ones.</p><p>Who wants to go back to sucking on a pacifier?  Or picking their nose?  Or eating glue?  These old habits might have been hard to break, but hopefully once they were broken, the weren&#8217;t reoccurring.  This is the case with me, especially with my old habit of procrastinating.  I can&#8217;t do it.  For some reason I get things done.  Dirty dishes aren&#8217;t dirty for more than 24 hours.  The floors get vacuumed.  I respond to emails (... eventually).  And though I am not the ideal of punctuality, I am no poster child for procrastination.</p><p>This leaves me in a bind.  I have a duty to clear my conscience one novel at a time, but without the procrastinating habit, I don&#8217;t have the time!  This one measly paperback was lost, renewed for an extra month, and turned in a week late before I finished it.  And now on my next book, and easy read of 250  double-spaced large-font novel, I can&#8217;t average more than three pages per day.  It will be turned in a  week late, too.  </p><p>Now, all of the sudden, the library isn&#8217;t so economical.  But at least with a life free of procrastination, I&#8217;m getting things done.', '2004-01-20 12:44:49+00', '2008-03-11 11:51:23+00', 2004, 1, NULL, NULL, 1, NULL, '2004-01-20 12:44:49+00');
INSERT INTO blogs VALUES (68, 'Homesick Gut', 'homesick_gut', '<p>hat I was reading two different Western novels at the time, both of which seemed to dwell for absurd amounts of time on seasonal feasts the protagonist was always running into. Paragraphs were filled with succulent descriptions of food; pages were dedicated to describing every item of Thanksgiving cornucopias, winter harvests, and holiday celebrations. And all that our current hero (me) had to rest his eyes upon was the simple (yet elegant) traditional Japanese New Years meal one piece of sushi, five beans, a few slices of pickled vegetables, one chestnut, and a twig with two berries on it', '<p>hat I was reading two different Western novels at the time, both of which seemed to dwell for absurd amounts of time on seasonal feasts the protagonist was always running into. Paragraphs were filled with succulent descriptions of food; pages were dedicated to describing every item of Thanksgiving cornucopias, winter harvests, and holiday celebrations. And all that our current hero (me) had to rest his eyes upon was the simple (yet elegant) traditional Japanese New Years meal one piece of sushi, five beans, a few slices of pickled vegetables, one chestnut, and a twig with two berries on it', '2002-12-15 03:00:00+00', '2008-03-11 11:51:24+00', 2002, 12, NULL, NULL, 1, NULL, '2002-12-15 03:00:00+00');
INSERT INTO blogs VALUES (77, 'Viva la Nippon!', 'viva_la_nippon!', '<p>This will be short, as I am about to leave, but I am in Japan! I have been here in Tokyo for the past three days and will be leaving in ten minutes for Nara-ken, the prefecture that I am working in. Tomorrow I will arrive in my town, Tenkawa-mura. Viva la Nippon!', '<p>This will be short, as I am about to leave, but I am in Japan! I have been here in Tokyo for the past three days and will be leaving in ten minutes for Nara-ken, the prefecture that I am working in. Tomorrow I will arrive in my town, Tenkawa-mura. Viva la Nippon!', '2001-08-07 11:05:38+01', '2008-03-11 11:51:24+00', 2001, 8, NULL, NULL, 1, NULL, '2001-08-07 11:05:38+01');
INSERT INTO blogs VALUES (79, 'Oral Fixation', 'oral-fixation', 'Which is funnier?  A speaking mistake or a cultural faux pas?  How about both?  While talking with M over the dirty dishes tonight, I was asked to consider something I had never thought of before: why the women in the documentaries about families with more than a dozen children never have any teeth.

First of all, I''d never dreamed that there was a documentary about such families, must less multiple documentaries, but it''s not beyond the realm of suspended disbelieve, a state I am perpetually in in Japan.  On the other hand, I have often wondered about the nation''s dental state, as many Western foreigners to Japan have.  With my former coworkers living all across Japan, we all had different stories to report to one another during bi-annual conferences, yet one story was universally the same: the children''s teeth were ghastly, and the teachers'' weren''t much better.

Some blamed the lack of flouride in the water and tooth paste (rumor has it that an over-flouridation of the water supply by the occupying US forces in the 50s left a bad taste in the mouth of the water-works powers that be), other''s blame it on the calcuim depravity caused by giving birth to 12 children.  Others noted that while there is no shortage of tooth brushes or enthusiasm for brushing, no one really knows the proper technique.  Regardless of the cause, the effects are undeniable.  Often young children don''t lose their baby teeth; they rot out.  And amongst adults, benign cases of snaggle tooth and halitosis are commonplace, while the occassional case of pneumonia linked to untreated cavities are not unheard of.  Which leaves a lot of people asking how the second largest economy of the most literate, highly educated, and longest living country in the word could tollerate such poor dental hygene practices.

Good question, indeed, but it''s often harder to find answers about foreign cultures than about one''s own culture.  So, turning the question back on US culture, why are Americans such hypocondriacts when it comes to dentistry?  Could it be fear mongering dentists?  Surely, it takes a high level of skill and training to be a dentist, and the service they provide is hardly trivial, but in the backs of their mind, dentists must realize that they are only a step above pediatrists, with the difference that dentists can sell themselves as plastic surgeons while pediatrists have to differentiate their doctorate from that of Dr. Schoals.  Insoles are to the never-perfect arch problem of pediatry as braces are to the never-perfect bite problem of dentistry.  These problems have been the workhorse of their respective industries for decades, requiring expensive solutions that cause pain, distress, and self conciousness.  These problems have kept their practiotioners fed, clothed, and housed.  But for a dentist who wants more, striaght teeth aren''t enough.  They need to be bleached whiter.  They need to be shaved straighter.  They need to be pimped and given an extreme makeover.

Forget healthier; Americans want to be prettier.  Dentistry is the gateway drug to a prettier, plastic life of preventing problems that may never materialize.  And while the extreme alternative of rotting teeth is definitely less attractive, I don''t find teeth so white that they glow in the dark an ideal alternative.  Isn''t there a happy, natural medium?', '<p>Which is funnier?  A speaking mistake or a cultural faux pas?  How about both?  While talking with M over the dirty dishes tonight, I was asked to consider something I had never thought of before: why the women in the documentaries about families with more than a dozen children never have any teeth.</p>


	<p>First of all, I&#8217;d never dreamed that there was a documentary about such families, must less multiple documentaries, but it&#8217;s not beyond the realm of suspended disbelieve, a state I am perpetually in in Japan.  On the other hand, I have often wondered about the nation&#8217;s dental state, as many Western foreigners to Japan have.  With my former coworkers living all across Japan, we all had different stories to report to one another during bi-annual conferences, yet one story was universally the same: the children&#8217;s teeth were ghastly, and the teachers&#8217; weren&#8217;t much better.</p>


	<p>Some blamed the lack of flouride in the water and tooth paste (rumor has it that an over-flouridation of the water supply by the occupying US forces in the 50s left a bad taste in the mouth of the water-works powers that be), other&#8217;s blame it on the calcuim depravity caused by giving birth to 12 children.  Others noted that while there is no shortage of tooth brushes or enthusiasm for brushing, no one really knows the proper technique.  Regardless of the cause, the effects are undeniable.  Often young children don&#8217;t lose their baby teeth; they rot out.  And amongst adults, benign cases of snaggle tooth and halitosis are commonplace, while the occassional case of pneumonia linked to untreated cavities are not unheard of.  Which leaves a lot of people asking how the second largest economy of the most literate, highly educated, and longest living country in the word could tollerate such poor dental hygene practices.</p>


	<p>Good question, indeed, but it&#8217;s often harder to find answers about foreign cultures than about one&#8217;s own culture.  So, turning the question back on US culture, why are Americans such hypocondriacts when it comes to dentistry?  Could it be fear mongering dentists?  Surely, it takes a high level of skill and training to be a dentist, and the service they provide is hardly trivial, but in the backs of their mind, dentists must realize that they are only a step above pediatrists, with the difference that dentists can sell themselves as plastic surgeons while pediatrists have to differentiate their doctorate from that of Dr. Schoals.  Insoles are to the never-perfect arch problem of pediatry as braces are to the never-perfect bite problem of dentistry.  These problems have been the workhorse of their respective industries for decades, requiring expensive solutions that cause pain, distress, and self conciousness.  These problems have kept their practiotioners fed, clothed, and housed.  But for a dentist who wants more, striaght teeth aren&#8217;t enough.  They need to be bleached whiter.  They need to be shaved straighter.  They need to be pimped and given an extreme makeover.</p>


	<p>Forget healthier; Americans want to be prettier.  Dentistry is the gateway drug to a prettier, plastic life of preventing problems that may never materialize.  And while the extreme alternative of rotting teeth is definitely less attractive, I don&#8217;t find teeth so white that they glow in the dark an ideal alternative.  Isn&#8217;t there a happy, natural medium?</p>', '2007-01-10 04:22:07+00', '2008-03-11 11:51:24+00', 2007, 1, NULL, NULL, 1, NULL, '2007-01-10 04:22:07+00');
INSERT INTO blogs VALUES (5, 'Retreat', 'retreat', '<p>My father''s hairline coincided with the state of the US economy in the 70''s and 80''s.  Both were in a state of recession that looked helpless.  But while the US economy improved in the 90''s, my father''s hairline didn''t.<p>
<p><p>
<p>My hair''s been thinning ever since the .com bubble burst in 2001.  Thus, for me, Web 2.0 is defined by Rogaine with Monoxidle (ask your doctor!), follicle harvesting and relocation, and the resurgence of hair bands (Wolfmother, The Darkness, etc.)  Unfortunately, all of these seem to still be in beta and I''m not willing to bite; instead I''ll wait for the Google acquisition.<p>
<p><p>
<p>Figuring that I might be waiting a while, I''ve decided to consider this my last hurrah and grow the golden locks that my mother has always wished for and the whispy wings that my girlfriend daily wishes away.  And if all goes as planned, I''ll cut the top business-like and leave a party flowing in the back for my friend''s wedding that I''m attending this summer.  What better way to send my love than through mullett love?<p>
<p><p>
<p>On a side note, here''s a pop quiz.  What do they call comb-overs in Japanese?  "Ba-kodo," which means "bar code," which is the way that a greasy black Japanese comb-over looks against a pale white scalp.  ', '<p>My father&#8217;s hairline coincided with the state of the US economy in the 70&#8217;s and 80&#8217;s.  Both were in a state of recession that looked helpless.  But while the US economy improved in the 90&#8217;s, my father&#8217;s hairline didn&#8217;t.<p>
<p><p>
<p>My hair&#8217;s been thinning ever since the .com bubble burst in 2001.  Thus, for me, Web 2.0 is defined by Rogaine with Monoxidle (ask your doctor!), follicle harvesting and relocation, and the resurgence of hair bands (Wolfmother, The Darkness, etc.)  Unfortunately, all of these seem to still be in beta and I&#8217;m not willing to bite; instead I&#8217;ll wait for the Google acquisition.<p>
<p><p>
<p>Figuring that I might be waiting a while, I&#8217;ve decided to consider this my last hurrah and grow the golden locks that my mother has always wished for and the whispy wings that my girlfriend daily wishes away.  And if all goes as planned, I&#8217;ll cut the top business-like and leave a party flowing in the back for my friend&#8217;s wedding that I&#8217;m attending this summer.  What better way to send my love than through mullett love?<p>
<p><p>
<p>On a side note, here&#8217;s a pop quiz.  What do they call comb-overs in Japanese?  &#8220;Ba-kodo,&#8221; which means &#8220;bar code,&#8221; which is the way that a greasy black Japanese comb-over looks against a pale white scalp.', '2006-06-06 16:25:51+01', '2008-03-11 11:51:23+00', 2006, 6, NULL, NULL, 1, NULL, '2006-06-06 16:25:51+01');
INSERT INTO blogs VALUES (88, 'Travel Advisory', 'travel-advisory', 'Traveling to new countries and talking to children both provide similar opportunities.  In the context of each, one has no history, no stereotype (at least from my experience on the individual level), and a blanket assumption of honesty.  Which makes a great platform for finally getting to be all of those things you wanted to be when you were a child but didn''t have the time, energy, funds, or nerve to pursue as an adult.

For a while I was inclined to introduce myself as a world class surfer, but bailing on my first wave would be a dead giveaway.  I''ve also had aspirations to be a fireman, a para-glider, and a pilot.  But I''d never imagine that I''d find myself pretending to be Highly Contagious Disease Researcher for the CDC.

It wasn''t planned; it just happened all of the sudden.  I was at dinner with some friends and I was playing with one of their daughters K.  We were shooting the shoot, when the words popped out of my mouth: "Do you know what cooties are?"  K knew what I was talking about immediately.  Suspiciously, since I am a boy, she looked at me.  "Yes, I know about cooties," she said.  Curious whether it was the American or Japanese half of her that knew about this, I asked if there were cooties in Japan.  "No, there aren''t, but there are cooties in Australia, New Zealand, and America."

I then asked if her parents had taught her about cooties. But the knowledge hadn''t come from parents or aunts or uncles or an older generation, but from a friend, whose friend had told her, whose friend had in turn told her.  Interesting that the youth are so proactive in supporting education of such communicable diseases while there is hardly a whisper of it amongst the adult population.  What''s even more interesting, though, is how this knowledge propagates itself without the help of the older generations.  Amazing, isn''t it, that there is a whole culture, vernacular, believe system, and caste that exists from year to year, and the only cure is puberty.

This young culture is curious, especially in light of indigenous cultures, such as the Fijian culture, which are slowly being exchanged for western and consumerist cultures.  While many of the traditions are still observed, few know where the traditions come from, many are losing their language (and in the interim speaking it with a foreign accent), and the only person alive who knows all 300 dialects of the Fijian language is a British scholar.  I don''t know if there''s any way for these cultures to learn from the youth culture.  But if you''re more of the mind of cultural prevention than cultural preservation, Japan''s the place to be to avoid cooties.', '<p>Traveling to new countries and talking to children both provide similar opportunities.  In the context of each, one has no history, no stereotype (at least from my experience on the individual level), and a blanket assumption of honesty.  Which makes a great platform for finally getting to be all of those things you wanted to be when you were a child but didn&#8217;t have the time, energy, funds, or nerve to pursue as an adult.</p>


	<p>For a while I was inclined to introduce myself as a world class surfer, but bailing on my first wave would be a dead giveaway.  I&#8217;ve also had aspirations to be a fireman, a para-glider, and a pilot.  But I&#8217;d never imagine that I&#8217;d find myself pretending to be Highly Contagious Disease Researcher for the <span class="caps">CDC</span>.</p>


	<p>It wasn&#8217;t planned; it just happened all of the sudden.  I was at dinner with some friends and I was playing with one of their daughters K.  We were shooting the shoot, when the words popped out of my mouth: &#8220;Do you know what cooties are?&#8221;  K knew what I was talking about immediately.  Suspiciously, since I am a boy, she looked at me.  &#8220;Yes, I know about cooties,&#8221; she said.  Curious whether it was the American or Japanese half of her that knew about this, I asked if there were cooties in Japan.  &#8220;No, there aren&#8217;t, but there are cooties in Australia, New Zealand, and America.&#8221;</p>


	<p>I then asked if her parents had taught her about cooties. But the knowledge hadn&#8217;t come from parents or aunts or uncles or an older generation, but from a friend, whose friend had told her, whose friend had in turn told her.  Interesting that the youth are so proactive in supporting education of such communicable diseases while there is hardly a whisper of it amongst the adult population.  What&#8217;s even more interesting, though, is how this knowledge propagates itself without the help of the older generations.  Amazing, isn&#8217;t it, that there is a whole culture, vernacular, believe system, and caste that exists from year to year, and the only cure is puberty.</p>


	<p>This young culture is curious, especially in light of indigenous cultures, such as the Fijian culture, which are slowly being exchanged for western and consumerist cultures.  While many of the traditions are still observed, few know where the traditions come from, many are losing their language (and in the interim speaking it with a foreign accent), and the only person alive who knows all 300 dialects of the Fijian language is a British scholar.  I don&#8217;t know if there&#8217;s any way for these cultures to learn from the youth culture.  But if you&#8217;re more of the mind of cultural prevention than cultural preservation, Japan&#8217;s the place to be to avoid cooties.</p>', '2007-06-27 03:33:27+01', '2008-03-11 11:51:24+00', 2007, 6, NULL, NULL, 1, NULL, '2007-06-27 03:33:27+01');
INSERT INTO blogs VALUES (32, 'Dirty Little Secrets', 'dirty_little_secrets', '<p>To become clean, my apartment first must become dirty. Not that it wasn''t dirty to begin with, but all of these dirty little secrets were busy hiding under my bed and behind my refrigerator and generally staying out of my way. Now all of the dust bunny petting zoos and moldy petri dish samples have been exterminated, but my room somehow looks worse than before. Half packed boxes, a closet throwing up clothes, and a bed surrounded by a gang of top-heavy chairs and a desk don''t give the room the usual "lived in" air, but rather "eye of the storm" air.<p>Which is appropriate, considering the way my life has been going. Three goodbye parties and five speaches last week, a romp in Tokyo and Kyoto, and now a four day cleaning binge has left me feeling disoriented; I was planning on feeling pained by nostalgia now that I have only one week left in Tenkawa, but I can''t recognize my apartment, my pictures are all packed, and the familiar daily routine has vanished, making nostalgia hard to come by. </p><p> Quite frankly, though, I am too busy now to feel nostalgic. My heart may want to return to my familiar apartment of dirty little secrets, but my allergies say good riddance. </p>', '<p>To become clean, my apartment first must become dirty. Not that it wasn&#8217;t dirty to begin with, but all of these dirty little secrets were busy hiding under my bed and behind my refrigerator and generally staying out of my way. Now all of the dust bunny petting zoos and moldy petri dish samples have been exterminated, but my room somehow looks worse than before. Half packed boxes, a closet throwing up clothes, and a bed surrounded by a gang of top-heavy chairs and a desk don&#8217;t give the room the usual &#8220;lived in&#8221; air, but rather &#8220;eye of the storm&#8221; air.<p>Which is appropriate, considering the way my life has been going. Three goodbye parties and five speaches last week, a romp in Tokyo and Kyoto, and now a four day cleaning binge has left me feeling disoriented; I was planning on feeling pained by nostalgia now that I have only one week left in Tenkawa, but I can&#8217;t recognize my apartment, my pictures are all packed, and the familiar daily routine has vanished, making nostalgia hard to come by. </p><p> Quite frankly, though, I am too busy now to feel nostalgic. My heart may want to return to my familiar apartment of dirty little secrets, but my allergies say good riddance. </p>', '2003-07-28 18:33:41+01', '2008-03-11 11:51:24+00', 2003, 7, NULL, NULL, 1, NULL, '2003-07-28 18:33:41+01');
INSERT INTO blogs VALUES (95, 'Getting started with Ruby on Rails', 'getting-started-with-ruby-on-rails', '', NULL, '2007-11-14 00:40:46+00', '2008-03-11 14:32:22+00', 2007, 11, NULL, '2008-12-31 00:00:00+00', 7, NULL, NULL);
INSERT INTO blogs VALUES (96, 'Internet in New Zealand', 'internet-in-new-zealand', 'What''s not to love about New Zealand? The internet.  Capped bandwidth, slow speeds, expensive fees, no naked DSL, an a lack of wifi hotspots are all examples of why telecom monopolies are bad things.  Don''t get me started on Telecom''s current puppet ad campaign.

The most affordable short-term internet connection option in New Zealand is also the most versatile.  Vodafone''s "Vodem" device and service provides a broadband internet connection via their 3G network.  When in the country, the device "seamlessly" downgrades to the nation-wide GPRS network to keep you connected.

With a Vodem purchased off of TradeMe and a subscription-free contract, we can surf 6 gigs worth of the net per month for a mere $90 NZD.  And this is our cheapest option (for three 3 months, including the installation and disconnect fees of the other options).

Traveling all around the north island, we haven''t had any geographical issues with the Vodem.  In the cities, 3G works well and in the country, GPRS is slow but gets the job done.  The main issue we''ve had is dropped connections to the network.

Typically, we''re able to authenticate and get online within 15 - 20 seconds of plugging in the Vodem to one of our Mac notebooks.  Pinging a server like google.com gives us an average of a 300ms response, with about 1 - 2% of the packets dropped.  This is good enough to make VOIP calls to the States and work within SSH tunnels to remote servers, not to mention read email, update blogs, and surf the web.

What will happen without warning, however, is that responses from the network will disappear.  We''ll notice that web pages aren''t loading.  From a terminal window, pings to our favorite domains don''t even hit the DNS server.  The Vodem thinks it is still connected, but there is no response.  Manually disconnecting and reconnecting the Vodem usually solves the problem, but can be a hassle when in the middle of a phone call or a download.

There aren''t many documents online helping to troubleshoot this issue.  Vodafone solution support team (0800-921-021), however, has been very helpful.  This morning they said that this sounded like a typical issue other customers have been having, and they suggested that I change the APN (access point name) from ''www.vodafone.net.nz'' to ''internet''.

Changing this on a Mac running Tiger (OS X 10.4.10) isn''t straightforward but can be done.  Vodafone support said that in the Device Manager, there would be an option section and an APN tab where this value could be changed.  I couldn''t find the Device Manager, so instead, inspired by a "Tao of Mac":http://the.taoofmac.com/space/HOWTO/Setup%20GPRS/UMTS%20Access%20on%20a%20Mac article, I hacked the configs myself.

The Vodem, when installed, installs a modem script that Internet Connect uses to dail into Vodafone''s network.  This file is:

 /Library/Modem Scripts/MMHS Modem

Opening the file, line 87 has the string string we''re looking to change.  Change line 87 to look like this:

 ! write "AT+CGDCONT=1,IP,www.vodafone.net.nz,,0,0"
 write "AT+CGDCONT=1,IP,internet,,0,0"

That exclamation mark comments out the old line, and then below that we the ''internet'' value.

This is my first time every dealing with modem scripts.  My hack was led more by my deductive reasoning skills than any advanced knowledge I have on the subject.  Additionally, I''ve only so far tested this fix with a 30 minute VOIP call.  But all seems to be well.  Initially my ping response time was ~360ms, but now is around ~320ms, with the dropped rate remaining about the same.  Here''s hoping the fix lasts more than 30 minutes!', '<p>What&#8217;s not to love about New Zealand? The internet.  Capped bandwidth, slow speeds, expensive fees, no naked <span class="caps">DSL</span>, an a lack of wifi hotspots are all examples of why telecom monopolies are bad things.  Don&#8217;t get me started on Telecom&#8217;s current puppet ad campaign.</p>


	<p>The most affordable short-term internet connection option in New Zealand is also the most versatile.  Vodafone&#8217;s &#8220;Vodem&#8221; device and service provides a broadband internet connection via their 3G network.  When in the country, the device &#8220;seamlessly&#8221; downgrades to the nation-wide <span class="caps">GPRS</span> network to keep you connected.</p>


	<p>With a Vodem purchased off of TradeMe and a subscription-free contract, we can surf 6 gigs worth of the net per month for a mere $90 <span class="caps">NZD</span>.  And this is our cheapest option (for three 3 months, including the installation and disconnect fees of the other options).</p>


	<p>Traveling all around the north island, we haven&#8217;t had any geographical issues with the Vodem.  In the cities, 3G works well and in the country, <span class="caps">GPRS</span> is slow but gets the job done.  The main issue we&#8217;ve had is dropped connections to the network.</p>


	<p>Typically, we&#8217;re able to authenticate and get online within 15 &#8211; 20 seconds of plugging in the Vodem to one of our Mac notebooks.  Pinging a server like google.com gives us an average of a 300ms response, with about 1 &#8211; 2% of the packets dropped.  This is good enough to make <span class="caps">VOIP</span> calls to the States and work within <span class="caps">SSH</span> tunnels to remote servers, not to mention read email, update blogs, and surf the web.</p>


	<p>What will happen without warning, however, is that responses from the network will disappear.  We&#8217;ll notice that web pages aren&#8217;t loading.  From a terminal window, pings to our favorite domains don&#8217;t even hit the <span class="caps">DNS</span> server.  The Vodem thinks it is still connected, but there is no response.  Manually disconnecting and reconnecting the Vodem usually solves the problem, but can be a hassle when in the middle of a phone call or a download.</p>


	<p>There aren&#8217;t many documents online helping to troubleshoot this issue.  Vodafone solution support team (0800-921-021), however, has been very helpful.  This morning they said that this sounded like a typical issue other customers have been having, and they suggested that I change the <span class="caps">APN</span> (access point name) from &#8216;www.vodafone.net.nz&#8217; to &#8216;internet&#8217;.</p>


	<p>Changing this on a Mac running Tiger (OS <span class="caps">X 10</span>.4.10) isn&#8217;t straightforward but can be done.  Vodafone support said that in the Device Manager, there would be an option section and an <span class="caps">APN</span> tab where this value could be changed.  I couldn&#8217;t find the Device Manager, so instead, inspired by a <a href="http://the.taoofmac.com/space/HOWTO/Setup%20GPRS/UMTS%20Access%20on%20a%20Mac">Tao of Mac</a> article, I hacked the configs myself.</p>


	<p>The Vodem, when installed, installs a modem script that Internet Connect uses to dail into Vodafone&#8217;s network.  This file is:</p>


	<pre><code>/Library/Modem Scripts/MMHS Modem</code></pre>


	<p>Opening the file, line 87 has the string string we&#8217;re looking to change.  Change line 87 to look like this:</p>


	<pre><code>! write "AT+CGDCONT=1,IP,www.vodafone.net.nz,,0,0" 
write "AT+CGDCONT=1,IP,internet,,0,0"</code></pre>


	<p>That exclamation mark comments out the old line, and then below that we the &#8216;internet&#8217; value.</p>


	<p>This is my first time every dealing with modem scripts.  My hack was led more by my deductive reasoning skills than any advanced knowledge I have on the subject.  Additionally, I&#8217;ve only so far tested this fix with a 30 minute <span class="caps">VOIP</span> call.  But all seems to be well.  Initially my ping response time was ~360ms, but now is around ~320ms, with the dropped rate remaining about the same.  Here&#8217;s hoping the fix lasts more than 30 minutes!</p>', '2007-12-04 12:56:40+00', '2008-03-11 11:51:24+00', 2007, 12, NULL, NULL, 1, NULL, '2007-12-04 12:56:40+00');
INSERT INTO blogs VALUES (57, 'Housewifery', 'housewifery', '<p>Every day Japanese students all across Japan engage in <em>souji </em>s which is loosly translated as Cleaning Time, but more appropriately referred to as a ritual of shoving dirt from one corner to another. I, too, participate, and from time to time, complain to anyone who will listen. One day, while complaining to a fellow teacher, he agreed that it was bothersome, but told me that not everyone feels this way. All Japanese women, for example, love to clean (at least according to him). I find this hard to believe, though, due to difficulty Ilean.<p>When I was younger, I used to taunt my younger brother by stealing something from him and then, as he reached for it, I would pin his harms and place the desired item on top of his head, right in front of his face, or on the backside of his hand to illustrate how close, yet how far away the item was. Now my past is coming back to haunt me. I use a new-fangled dust mop to clean my apartment, and every time I squat down to change the scientifically designed cleaning wipe, I notice that the top of the mop is covered in dust. Not from lack of use, but due to the rate at which dirt accumulates in my apartment. </p><p>Dirt doesn''t just accumulate it Japan, though. It gains consciousness, establishes groups and unions, hides in the darkests of spots, and is constantly moving about. How do I know this? The last Japanese person to visit my house came for an evening last year. I am still finding their hair in my apartment. </p><p>So as I shove dirt around from one corner to the next because if you can''t beat them, you must join them. And thus I am slowly turning into the savior of dust bunnies everywhere, becoming the Japanese housewife who loves to clean. </p>', '<p>Every day Japanese students all across Japan engage in <em>souji </em>s which is loosly translated as Cleaning Time, but more appropriately referred to as a ritual of shoving dirt from one corner to another. I, too, participate, and from time to time, complain to anyone who will listen. One day, while complaining to a fellow teacher, he agreed that it was bothersome, but told me that not everyone feels this way. All Japanese women, for example, love to clean (at least according to him). I find this hard to believe, though, due to difficulty Ilean.<p>When I was younger, I used to taunt my younger brother by stealing something from him and then, as he reached for it, I would pin his harms and place the desired item on top of his head, right in front of his face, or on the backside of his hand to illustrate how close, yet how far away the item was. Now my past is coming back to haunt me. I use a new-fangled dust mop to clean my apartment, and every time I squat down to change the scientifically designed cleaning wipe, I notice that the top of the mop is covered in dust. Not from lack of use, but due to the rate at which dirt accumulates in my apartment. </p><p>Dirt doesn&#8217;t just accumulate it Japan, though. It gains consciousness, establishes groups and unions, hides in the darkests of spots, and is constantly moving about. How do I know this? The last Japanese person to visit my house came for an evening last year. I am still finding their hair in my apartment. </p><p>So as I shove dirt around from one corner to the next because if you can&#8217;t beat them, you must join them. And thus I am slowly turning into the savior of dust bunnies everywhere, becoming the Japanese housewife who loves to clean. </p>', '2002-05-15 22:05:52+01', '2008-03-11 11:51:24+00', 2002, 5, NULL, NULL, 1, NULL, '2002-05-15 22:05:52+01');
INSERT INTO blogs VALUES (69, 'Translation', 'translation', '<p>Wow! After almost four months teaching English in Japan, my students are on the verge of fluency. My Japanese is another story, but I have been able to spend some time investigating the idiosyncrasies and pecularities of the language. This research has led to an understanding of Japanese culture, society, and life that I now attempt to share with you.<p>One way to understand life in Japan is to learn about English words that don''t exist in Japanese. ''Central Heating'' is one example. Paper walls offer no insulation against the elements, much less a ravenous monkey, but that is a story for another day... ''Noise Polution'' is another word that has no counterpart in Japan. It is quite popular for stores to hire empolyees to scream at customers "IRASHAIMASEEEE!" losely translated "SOMEONE HONORABLE HAS ARRIVED!" And at larger stores, such as the supermarket, where the employees are busy yelling at customers in the check-out line, the manager sets up small tape-playing boom-boxes that loop a prerecorded tape of people yelling honorable announcements. "Epilepsy" is the last word that I will mention which means nothing in Japan. The brighter and faster that something flashes, the better. Flashing lights are especially popular with road workers, who line their bodies, equipment, and pot holes with no less than a dozen different varieties of flashing nonsense. But instead of alerting drivers, the strobe lights create a more "deer in the headlights" effect. The lights, spinning around in circles, motioning in a dozen different directions, and blinking at an uncoordinated rate create more confusion than clarity. </p><p>These are all common occurences in Japan. Love them or hate them, Japan just isn''t <em>Japan </em> without them. </p>', '<p>Wow! After almost four months teaching English in Japan, my students are on the verge of fluency. My Japanese is another story, but I have been able to spend some time investigating the idiosyncrasies and pecularities of the language. This research has led to an understanding of Japanese culture, society, and life that I now attempt to share with you.<p>One way to understand life in Japan is to learn about English words that don&#8217;t exist in Japanese. &#8216;Central Heating&#8217; is one example. Paper walls offer no insulation against the elements, much less a ravenous monkey, but that is a story for another day&#8230; &#8216;Noise Polution&#8217; is another word that has no counterpart in Japan. It is quite popular for stores to hire empolyees to scream at customers &#8220;IRASHAIMASEEEE!&#8221; losely translated &#8220;SOMEONE <span class="caps">HONORABLE HAS ARRIVED</span>!&#8221; And at larger stores, such as the supermarket, where the employees are busy yelling at customers in the check-out line, the manager sets up small tape-playing boom-boxes that loop a prerecorded tape of people yelling honorable announcements. &#8220;Epilepsy&#8221; is the last word that I will mention which means nothing in Japan. The brighter and faster that something flashes, the better. Flashing lights are especially popular with road workers, who line their bodies, equipment, and pot holes with no less than a dozen different varieties of flashing nonsense. But instead of alerting drivers, the strobe lights create a more &#8220;deer in the headlights&#8221; effect. The lights, spinning around in circles, motioning in a dozen different directions, and blinking at an uncoordinated rate create more confusion than clarity. </p><p>These are all common occurences in Japan. Love them or hate them, Japan just isn&#8217;t <em>Japan </em> without them. </p>', '2001-11-19 03:07:17+00', '2008-03-11 11:51:24+00', 2001, 11, NULL, NULL, 1, NULL, '2001-11-19 03:07:17+00');
INSERT INTO blogs VALUES (2, '21st Century', '21st_century', 'Ginowan City''s up and coming.  30 minutes north of Naha, the largest city in Okinawa, it''s got all the amenities any modern suburbanite could hope for.  Shopping, utilities, traffic jams, noise, etc.  But Masayo and I were hoping for sub-suburban living.

Across the railroad tracks to the east of Ginowan is Nakagusuku.  Of course, there aren''t any trains in Okinawa, so it''s actually a highway running through a valley between the two towns that separates them, but that highway delimits more than just the towns'' border.

East of the highway life is quieter.  The houses are more spread out, the air is a little crisper, the kids are nicer, the birds chirp a little more melodically, and all the amenities of Ginowan are available for only a 5 minute driving premium to cross the bridge back into suburban civilization.

Unfortunatly the reality of this geography is not what dictated the districting and planning of Nakagusuku.  The eastern border of the city is the ocean, and that is historically where everything has come from.  Thus, city hall is on the coast and all of the telephone and cable lines run up the coast, then inland.  So for the past two weeks, Masayo and I have stared across the bridge into Ginowan with greedy eyes.  The Ginowan city hall is walking distance from our place.  The Nakagusuku''s city all requies a car - busses don''t even run there from our place.  Just across the bridge, internet access is 5 times faster and ready to install the same day.  Here we had to wait two weeks.

Today was installation day, but it wasn''t without some drama.  The contractor for NTT said that NTT had lied when they said we could have internet at our house.  According to him, there wasn''t a free line to connet to the apartment; all 30 had been used already for the houses and apartments on our street.  So we wouldn''t even be able to get a home phone.  On the bright side, though, NTT did have plans to run new phone cables up from the coast that would provide access for 200 new places, and construction was scheduled to happen as early as next year.

You can tease and taunt Masayo all you like, but I''m warning you, never take away her internet connection!  Upon hearing this news, she grew horns and proceeded to prod the contractor into finding some other solution.  45 minutes later, after climing several dozen telephone polls in the neighborhood, he reported that he''d solved the problem and redirected some open lines our way.

Elated, we spent the next hour sitting next to one another online, not saying a word.  To think that we had to survive for a week with only our feet to walk with, our mouths to talk with, and our minds to entertain us!

This isn''t quite the rates I was getting in Vancouver, but it was enough of a victory over this morning''s ordeal to still put a smile on my face.

<a href="http://speedtest.dslreports.com"><img border=0 src="http://www.dslreports.com/im/17157020/32438.png"></a>', '<p>Ginowan City&#8217;s up and coming.  30 minutes north of Naha, the largest city in Okinawa, it&#8217;s got all the amenities any modern suburbanite could hope for.  Shopping, utilities, traffic jams, noise, etc.  But Masayo and I were hoping for sub-suburban living.</p>


	<p>Across the railroad tracks to the east of Ginowan is Nakagusuku.  Of course, there aren&#8217;t any trains in Okinawa, so it&#8217;s actually a highway running through a valley between the two towns that separates them, but that highway delimits more than just the towns&#8217; border.</p>


	<p>East of the highway life is quieter.  The houses are more spread out, the air is a little crisper, the kids are nicer, the birds chirp a little more melodically, and all the amenities of Ginowan are available for only a 5 minute driving premium to cross the bridge back into suburban civilization.</p>


	<p>Unfortunatly the reality of this geography is not what dictated the districting and planning of Nakagusuku.  The eastern border of the city is the ocean, and that is historically where everything has come from.  Thus, city hall is on the coast and all of the telephone and cable lines run up the coast, then inland.  So for the past two weeks, Masayo and I have stared across the bridge into Ginowan with greedy eyes.  The Ginowan city hall is walking distance from our place.  The Nakagusuku&#8217;s city all requies a car &#8211; busses don&#8217;t even run there from our place.  Just across the bridge, internet access is 5 times faster and ready to install the same day.  Here we had to wait two weeks.</p>


	<p>Today was installation day, but it wasn&#8217;t without some drama.  The contractor for <span class="caps">NTT</span> said that <span class="caps">NTT</span> had lied when they said we could have internet at our house.  According to him, there wasn&#8217;t a free line to connet to the apartment; all 30 had been used already for the houses and apartments on our street.  So we wouldn&#8217;t even be able to get a home phone.  On the bright side, though, <span class="caps">NTT</span> did have plans to run new phone cables up from the coast that would provide access for 200 new places, and construction was scheduled to happen as early as next year.</p>


	<p>You can tease and taunt Masayo all you like, but I&#8217;m warning you, never take away her internet connection!  Upon hearing this news, she grew horns and proceeded to prod the contractor into finding some other solution.  45 minutes later, after climing several dozen telephone polls in the neighborhood, he reported that he&#8217;d solved the problem and redirected some open lines our way.</p>


	<p>Elated, we spent the next hour sitting next to one another online, not saying a word.  To think that we had to survive for a week with only our feet to walk with, our mouths to talk with, and our minds to entertain us!</p>


	<p>This isn&#8217;t quite the rates I was getting in Vancouver, but it was enough of a victory over this morning&#8217;s ordeal to still put a smile on my face.</p>


	<p><a href="http://speedtest.dslreports.com"><img border=0 src="http://www.dslreports.com/im/17157020/32438.png"></a></p>', '2006-10-16 18:41:26+01', '2008-03-11 11:51:23+00', 2006, 10, NULL, NULL, 1, NULL, '2006-10-16 18:41:26+01');
INSERT INTO blogs VALUES (3, 'Irrefutably Japan', 'irrefutably_japan', '<p>I''m not sure what is stranger, waking up to an empty and desolate apartment in the middle of Vancouver, or waking up illiterate and jet lagged in the middle of Japan.  So the other morning, when I woke up at 5, I decided to set out just after sunset to take some pictures that would be irrefutable proof that I am indeed in Japan.<p>
<p><p>
<p>I''m staying for the time being at Masayo''s parents'' house, which is on the cusp between urban and rural.  Things haven''t changed much since I was last here, but with Masayo''s nephew around, I''m inspired to see the area as Masayo saw it when she was a child.<p>
<p><p>
<p>There are plenty of rice paddies in all directions, dotted with the resivoirs that flood them at the height of the season.  Just south of the house there is an overgrown river and a small shrine beside it.  And in the human equivalent of marking our territory, there are signs everywhere.<p>
<p><p>
<p>I''m slowly getting acclimated to Japan, and it is much nicer than the life in the empty Vancouver apartment that I traded it for.  The strangest thing so far is that having come from Vancouver, I''m used to living amongst a large asian population.  But every once in a while here in Japan, I''ll notice that I''m not asian and for a fleeting moment I''ll realize how different I am.  We''ll have to see how the assimilation goes.  As for the diet, though, I''m already there!', '<p>I&#8217;m not sure what is stranger, waking up to an empty and desolate apartment in the middle of Vancouver, or waking up illiterate and jet lagged in the middle of Japan.  So the other morning, when I woke up at 5, I decided to set out just after sunset to take some pictures that would be irrefutable proof that I am indeed in Japan.<p>
<p><p>
<p>I&#8217;m staying for the time being at Masayo&#8217;s parents&#8217; house, which is on the cusp between urban and rural.  Things haven&#8217;t changed much since I was last here, but with Masayo&#8217;s nephew around, I&#8217;m inspired to see the area as Masayo saw it when she was a child.<p>
<p><p>
<p>There are plenty of rice paddies in all directions, dotted with the resivoirs that flood them at the height of the season.  Just south of the house there is an overgrown river and a small shrine beside it.  And in the human equivalent of marking our territory, there are signs everywhere.<p>
<p><p>
<p>I&#8217;m slowly getting acclimated to Japan, and it is much nicer than the life in the empty Vancouver apartment that I traded it for.  The strangest thing so far is that having come from Vancouver, I&#8217;m used to living amongst a large asian population.  But every once in a while here in Japan, I&#8217;ll notice that I&#8217;m not asian and for a fleeting moment I&#8217;ll realize how different I am.  We&#8217;ll have to see how the assimilation goes.  As for the diet, though, I&#8217;m already there!', '2006-09-29 14:34:31+01', '2008-03-11 11:51:23+00', 2006, 9, NULL, NULL, 1, NULL, '2006-09-29 14:34:31+01');
INSERT INTO blogs VALUES (4, 'Holy Matrimony', 'holy_matrimony', '<p>After 1,051 days of dating (355 days since we first met, but who''s counting?), I decided to start over counting from zero when I asked my girlfriend to marry me.<p>
<p><p>
<p>After attending two weddings in two weeks, ''twas the season to get bitten by the marriage bug.  But I''d been thinking of getting married for the past few months before the weddings blitz.  I didn''t ask Masayo sooner because I needed the time to do my planning so that everything would be perfect.  And now that she has said ''Yes,'' I present with you 12 easy steps to making sure that your proposal gets the response you desire:<p>
<p><p>
<p># First, talk with your hunny bunny about marriage and what it means to you.  It is normal for these conversations to end with shouting and a concensus that you could never stand to marry the other person.<p>
<p># Next, avoid the topic of marriage while making plans to move together to her native homeland.<p>
<p># Make an origami box to fit a candy ring after she threatens to return home a month early.<p>
<p># Make plans to attend two weddings right at the beginning of summer and take her to one of them.<p>
<p># Speak privately with your father about how he was able to get away with proposing to your mother without an engagement ring.<p>
<p># Make mental preparations to purchase a ring and propose marriage a week or two after you return home from the wedding.<p>
<p># In the middle of an arguement the night after you return, surprise her with your two-week premature proposal.  Give her the origami box and candy ring you''d prepared for just such an emergency situation.<p>
<p># Wait until the next morning to frantically search for a ring online (http://www.bluenile.com hint hint hint).  The average American woman wears a size 6 ring; order one sized 6.5 just to be on the safe side.<p>
<p># Have the ring company rush delivery of the ring so that it arrives 24 hours before your fiance returns to Japan.<p>
<p># Demand that your fiance join you for a hot date at an undisclosed location.  (Location is at the top of Grouse Mountain, a local mountain 1,250 meters above sea level that looks over the city).<p>
<p># Prepare a meaningful speach in your head in Japanese over dinner, realizing that she won''t listen to a word that you say once she sees the diamond.<p>
<p># Give her the ring, which she claims fits perfectly, and then try each finger systematically until you find one that it fits on.<p>
<p># Watch the fireworks down in the city while holding hands and trying to forget that she leaves tomorrow for Japan.  Discuss whether to wait 2 weeks or 2 months to tell her family (2 weeks is the better choice).<p>
<p><p>
<p>Congratulations!  You are now engaged!  Now for the tricky part: how do you tell people and when do you become comfortable referring to her as your fiance?', '<p>After 1,051 days of dating (355 days since we first met, but who&#8217;s counting?), I decided to start over counting from zero when I asked my girlfriend to marry me.<p>
<p><p>
<p>After attending two weddings in two weeks, &#8216;twas the season to get bitten by the marriage bug.  But I&#8217;d been thinking of getting married for the past few months before the weddings blitz.  I didn&#8217;t ask Masayo sooner because I needed the time to do my planning so that everything would be perfect.  And now that she has said &#8216;Yes,&#8217; I present with you 12 easy steps to making sure that your proposal gets the response you desire:<p>
<p><p>
<p># First, talk with your hunny bunny about marriage and what it means to you.  It is normal for these conversations to end with shouting and a concensus that you could never stand to marry the other person.<p>
<p># Next, avoid the topic of marriage while making plans to move together to her native homeland.<p>
<p># Make an origami box to fit a candy ring after she threatens to return home a month early.<p>
<p># Make plans to attend two weddings right at the beginning of summer and take her to one of them.<p>
<p># Speak privately with your father about how he was able to get away with proposing to your mother without an engagement ring.<p>
<p># Make mental preparations to purchase a ring and propose marriage a week or two after you return home from the wedding.<p>
<p># In the middle of an arguement the night after you return, surprise her with your two-week premature proposal.  Give her the origami box and candy ring you&#8217;d prepared for just such an emergency situation.<p>
<p># Wait until the next morning to frantically search for a ring online (http://www.bluenile.com hint hint hint).  The average American woman wears a size 6 ring; order one sized 6.5 just to be on the safe side.<p>
<p># Have the ring company rush delivery of the ring so that it arrives 24 hours before your fiance returns to Japan.<p>
<p># Demand that your fiance join you for a hot date at an undisclosed location.  (Location is at the top of Grouse Mountain, a local mountain 1,250 meters above sea level that looks over the city).<p>
<p># Prepare a meaningful speach in your head in Japanese over dinner, realizing that she won&#8217;t listen to a word that you say once she sees the diamond.<p>
<p># Give her the ring, which she claims fits perfectly, and then try each finger systematically until you find one that it fits on.<p>
<p># Watch the fireworks down in the city while holding hands and trying to forget that she leaves tomorrow for Japan.  Discuss whether to wait 2 weeks or 2 months to tell her family (2 weeks is the better choice).<p>
<p><p>
<p>Congratulations!  You are now engaged!  Now for the tricky part: how do you tell people and when do you become comfortable referring to her as your fiance?', '2006-07-31 22:34:46+01', '2008-03-11 11:51:23+00', 2006, 8, NULL, NULL, 1, NULL, '2006-07-31 22:34:46+01');
INSERT INTO blogs VALUES (1, 'Migration', 'migration', 'Out with the old, in with the new.  My website''s been sputtering recently and requires some backend loving.

Before you get the wrong idea, though, things hopefully by the new year will be back to normal.  In the short term, though, the layout of the site will be changing for the better.  The focus moving forward will be on stability (thanks to [Mephisto](http://www.mephistoblog.com) and [Flickr](http://www.flickr.com/photos/fightinjoe)) with a few extras peppered in (for example, [RSS Feeds](http://fightinjoe.krunchr.com/feed/atom.xml)).

You''ll have to wait to see if this means more frequent posts or not, but hopefully at least once a month will no longer be too much to ask!', '<p>Out with the old, in with the new.  My website&#8217;s been sputtering recently and requires some backend loving.</p>


	<p>Before you get the wrong idea, though, things hopefully by the new year will be back to normal.  In the short term, though, the layout of the site will be changing for the better.  The focus moving forward will be on stability (thanks to <a href="http://www.mephistoblog.com">Mephisto</a> and <a href="http://www.flickr.com/photos/fightinjoe">Flickr</a>) with a few extras peppered in (for example, <a href="http://fightinjoe.krunchr.com/feed/atom.xml"><span class="caps">RSS</span> Feeds</a>).</p>


	<p>You&#8217;ll have to wait to see if this means more frequent posts or not, but hopefully at least once a month will no longer be too much to ask!</p>', '2006-12-29 22:48:21+00', '2008-03-11 11:50:27+00', 2006, 12, NULL, NULL, 1, NULL, '2006-12-29 22:48:21+00');
INSERT INTO blogs VALUES (11, 'Geatest Show on Earth', 'greatest_show_on_earth', '<p>Who would have thought that my brother would come to visit me in Vancouver before my parents!<p>
<p><p>
<p>The year didn''t really seem to start until he came to visit, and then it shot off with a bang!  A promotion at the office was followed by a winning offer on a condo downtown, a summer romp in the southeast, the big move, a birthday, home improvements, and the circus.  And somehow web updates got left out of there.<p>
<p><p>
<p>I went with my girlfriend to the circus in Everett, Washington.  It''s been at least 20 years since I''ve been to the circus, and the only memory I had left was one of the distinct smell of elephant dung.  But as the time of the show grew closer, I started getting more and more excited for no aparent reason.<p>
<p><p>
<p>The excitement was contageous and was hard to escape outside of the colloseum.  Even the PETA protesters were silenced by their awe of the Greatest Show On Earth and their jealousy of us chosen ones who were getting to see the show while they were stuck outside with large sandwich boards and flyers nobody wanted to take.<p>
<p><p>
<p>As it turned out, qualifying as one of the chosen ones was quite easy.  $30 bought second row, center ring-side seats.  Once seat away from "Circus Celebrity VIP" seating.  10 feet away from the elephant dung and a tidal wave of memories from my childhood.<p>
<p><p>
<p>The only thing that kept me from falling overboard into a sea of emotions was my girlfriend falling first.  She was choked up by the clowns, given a lump in her throat by the husband and wife duo who got shot out of the canon, became teary when the horses paraded around, and nearly missed the elephants because she was hiding her face behind a bunker of tissues.  At intermission she explained, "Everyone out there, they are trying so hard and always smiling, because they all want us to be happy!  They are trying so hard to make us happy!"<p>
<p><p>
<p>So the updates recently may have been few and far between, and a lot has happened to me, as well as the rest of the world, over the past 5 months.  But rest assured that I''m happy.', '<p>Who would have thought that my brother would come to visit me in Vancouver before my parents!<p>
<p><p>
<p>The year didn&#8217;t really seem to start until he came to visit, and then it shot off with a bang!  A promotion at the office was followed by a winning offer on a condo downtown, a summer romp in the southeast, the big move, a birthday, home improvements, and the circus.  And somehow web updates got left out of there.<p>
<p><p>
<p>I went with my girlfriend to the circus in Everett, Washington.  It&#8217;s been at least 20 years since I&#8217;ve been to the circus, and the only memory I had left was one of the distinct smell of elephant dung.  But as the time of the show grew closer, I started getting more and more excited for no aparent reason.<p>
<p><p>
<p>The excitement was contageous and was hard to escape outside of the colloseum.  Even the <span class="caps">PETA</span> protesters were silenced by their awe of the Greatest Show On Earth and their jealousy of us chosen ones who were getting to see the show while they were stuck outside with large sandwich boards and flyers nobody wanted to take.<p>
<p><p>
<p>As it turned out, qualifying as one of the chosen ones was quite easy.  $30 bought second row, center ring-side seats.  Once seat away from &#8220;Circus Celebrity <span class="caps">VIP</span>&#8221; seating.  10 feet away from the elephant dung and a tidal wave of memories from my childhood.<p>
<p><p>
<p>The only thing that kept me from falling overboard into a sea of emotions was my girlfriend falling first.  She was choked up by the clowns, given a lump in her throat by the husband and wife duo who got shot out of the canon, became teary when the horses paraded around, and nearly missed the elephants because she was hiding her face behind a bunker of tissues.  At intermission she explained, &#8220;Everyone out there, they are trying so hard and always smiling, because they all want us to be happy!  They are trying so hard to make us happy!&#8221;<p>
<p><p>
<p>So the updates recently may have been few and far between, and a lot has happened to me, as well as the rest of the world, over the past 5 months.  But rest assured that I&#8217;m happy.', '2005-09-20 22:06:09+01', '2008-03-11 11:51:23+00', 2005, 9, NULL, NULL, 1, NULL, '2005-09-20 22:06:09+01');
INSERT INTO blogs VALUES (15, 'Staying Put', 'staying_put', '<p><p>Happy New Year!  I''ve posted the images that I used for my holiday post cards.  I haven''t mailed them out yet, so don''t fret if your''s hasn''t arrived.  If you''re worried you won''t be getting one, it is probably because I don''t have your address!  Only one way to fix that: <a href="contact.php">send it to me!</a><hr /><p>I''m tired of traveling.  By my calculations, I''ve traveled over 30,000 miles this year and taken a big trip every month for the past six months.</p><ul><li>Boston in June for Renny and Eileen''s wedding</li><li>An Ultimate roadtrip to Kentucky and a flight Colorado in July to visit my grandmother</li><li>Japan in August before my move in the middle of the month to Vancouver (that was my third trip to Japan in a year''s time)</li><li>Taking care of unfinished business in the southeast in September</li><li>A costume party with PJ Harvey in Seattle in October</li><li>Thanksgiving in Wisconsin followed my passing of the ''Southerner in New England'' the last week of November</li><li>And home-again home-again for the holidays in December</li></ul><p>So from now on, everyone should come and visit me.  I may be too pooped to travel, but I''m not too pooped to party.</p><p>I''ve got a new full-time job in Vancouver with <a href="http://www.combustionlabs.com">Combustion Labs</a> so the invitation to come and visit has been extended to the length of my work visa.  Looks like I''ve not got reason to stay in one place for an extended amount of time!</p>', '<p><p>Happy New Year!  I&#8217;ve posted the images that I used for my holiday post cards.  I haven&#8217;t mailed them out yet, so don&#8217;t fret if your&#8217;s hasn&#8217;t arrived.  If you&#8217;re worried you won&#8217;t be getting one, it is probably because I don&#8217;t have your address!  Only one way to fix that: <a href="contact.php">send it to me!</a><hr /><p>I&#8217;m tired of traveling.  By my calculations, I&#8217;ve traveled over 30,000 miles this year and taken a big trip every month for the past six months.</p><ul><li>Boston in June for Renny and Eileen&#8217;s wedding</li><li>An Ultimate roadtrip to Kentucky and a flight Colorado in July to visit my grandmother</li><li>Japan in August before my move in the middle of the month to Vancouver (that was my third trip to Japan in a year&#8217;s time)</li><li>Taking care of unfinished business in the southeast in September</li><li>A costume party with PJ Harvey in Seattle in October</li><li>Thanksgiving in Wisconsin followed my passing of the &#8216;Southerner in New England&#8217; the last week of November</li><li>And home-again home-again for the holidays in December</li></ul><p>So from now on, everyone should come and visit me.  I may be too pooped to travel, but I&#8217;m not too pooped to party.</p><p>I&#8217;ve got a new full-time job in Vancouver with <a href="http://www.combustionlabs.com">Combustion Labs</a> so the invitation to come and visit has been extended to the length of my work visa.  Looks like I&#8217;ve not got reason to stay in one place for an extended amount of time!</p>', '2005-01-04 10:53:35+00', '2008-03-11 11:51:23+00', 2005, 1, NULL, NULL, 1, NULL, '2005-01-04 10:53:35+00');
INSERT INTO blogs VALUES (17, 'Middle of Everywhere', 'middle_of_everywhere', '<p>Receiving orders, captian.<p><a href="http://www.cityofmc.com">"Conveniently located in the middle of Everywhere,"</a> (with Everywhere being comprised of Baton Rouge, Lafayette, and New Orleans) Morgan City, LA, is the home of the annual <a href="http://www.shrimp-petrofest.org/">Shrimp and Petroleum Festival</a>.  Additionally, it has also been my home for the past week.</p><p>I came down for business at the end of August after having been in Vancouver for only two weeks.  Work has been complimented by ample amounts of play, thanks to the festival.  I''ve been listening to the lasted Swamp Pop tunes, eating alligator on a stick, and working on my pronounciation of names such as Thibodeaux (Ti-ba-doe) and Natchitoches (Na-ko-dish).</p><p>Down here in the heat it is hard to believe that I was wishing for winter clothes a week ago in Vancouver.  It has been easy for me to become acclimated to the climate and culture down here, but living out of a suitcase is something best done for only a few weeks at a time.  Disregarding my 6 day haitus in Vancouver, it will have been a month and a half straight of living out of my suitcase.</p><p>I''m stopping by Birmingham before I return home to Vancouver.  After that, you''ll be hard pressed to get me to come and visit you.  It''s your turn to come and visit me!', '<p>Receiving orders, captian.<p><a href="http://www.cityofmc.com">&#8220;Conveniently located in the middle of Everywhere,&#8221;</a> (with Everywhere being comprised of Baton Rouge, Lafayette, and New Orleans) Morgan City, LA, is the home of the annual <a href="http://www.shrimp-petrofest.org/">Shrimp and Petroleum Festival</a>.  Additionally, it has also been my home for the past week.</p><p>I came down for business at the end of August after having been in Vancouver for only two weeks.  Work has been complimented by ample amounts of play, thanks to the festival.  I&#8217;ve been listening to the lasted Swamp Pop tunes, eating alligator on a stick, and working on my pronounciation of names such as Thibodeaux (Ti-ba-doe) and Natchitoches (Na-ko-dish).</p><p>Down here in the heat it is hard to believe that I was wishing for winter clothes a week ago in Vancouver.  It has been easy for me to become acclimated to the climate and culture down here, but living out of a suitcase is something best done for only a few weeks at a time.  Disregarding my 6 day haitus in Vancouver, it will have been a month and a half straight of living out of my suitcase.</p><p>I&#8217;m stopping by Birmingham before I return home to Vancouver.  After that, you&#8217;ll be hard pressed to get me to come and visit you.  It&#8217;s your turn to come and visit me!', '2004-09-06 05:55:00+01', '2008-03-11 11:51:23+00', 2004, 9, NULL, NULL, 1, NULL, '2004-09-06 05:55:00+01');
INSERT INTO blogs VALUES (22, 'Getting the hang of things', 'getting_the_hang_of_things', '<p><p>I am convinced that regardless of the amount of time spent sleeping, waking up before 6:00 will always leave you tired.  Go to sleep at 9pm or 3am and I guarantee you will be tired if you wake up 5:45.  There may be some naysayers out there who claim that they are not tired when they wake up before the sun has risen.  But the truth is, nobody else is up at that time to confirm that they aren''t tired.  As they say about a tree falling in the forest: if my father wakes up before 6:00 am but nobody is awake to hear or see him, is he really bright eyed and bushy tailed?</p><p>In an effort to scientifically prove this fact, I am dog-sitting two puppies who combined weigh more than I do.  They are mild-mannered, sweet, precocious, and devils in the morning.  They are very passive-agressive, so instead of barking to wake you, they will pace the room, scratch at the bedposts, sniff at your pillow, burp, fart, and lick themselves with their deafening tongue.  All precisely timed to reach a climax at 5:45.  Thus, partially due to aggravation, partially due to the implied threat of territory being marked indoors, I indulge the pups and get up to take them outside.</p><p>I have tried sleeping at 10:00 pm, 11:00 pm, and midnight, and every morning I wake up just as groggy as the next.  I imagine that if I just had 15 more minutes of rest (as I typically do at home), I would be able to function instead of having the dogs have to remind me of what I do next.</p><p>I''m convinced that it is a mind over matter situation.  So to that extent I have decided to become a masochistic pessimist.  This way, I''m always expecting the worst, so things can only get better, but if they happen to be as bad as I expect, I''ll reather enjoy it. 5:45am has never hurt so good!</p>', '<p><p>I am convinced that regardless of the amount of time spent sleeping, waking up before 6:00 will always leave you tired.  Go to sleep at 9pm or 3am and I guarantee you will be tired if you wake up 5:45.  There may be some naysayers out there who claim that they are not tired when they wake up before the sun has risen.  But the truth is, nobody else is up at that time to confirm that they aren&#8217;t tired.  As they say about a tree falling in the forest: if my father wakes up before 6:00 am but nobody is awake to hear or see him, is he really bright eyed and bushy tailed?</p><p>In an effort to scientifically prove this fact, I am dog-sitting two puppies who combined weigh more than I do.  They are mild-mannered, sweet, precocious, and devils in the morning.  They are very passive-agressive, so instead of barking to wake you, they will pace the room, scratch at the bedposts, sniff at your pillow, burp, fart, and lick themselves with their deafening tongue.  All precisely timed to reach a climax at 5:45.  Thus, partially due to aggravation, partially due to the implied threat of territory being marked indoors, I indulge the pups and get up to take them outside.</p><p>I have tried sleeping at 10:00 pm, 11:00 pm, and midnight, and every morning I wake up just as groggy as the next.  I imagine that if I just had 15 more minutes of rest (as I typically do at home), I would be able to function instead of having the dogs have to remind me of what I do next.</p><p>I&#8217;m convinced that it is a mind over matter situation.  So to that extent I have decided to become a masochistic pessimist.  This way, I&#8217;m always expecting the worst, so things can only get better, but if they happen to be as bad as I expect, I&#8217;ll reather enjoy it. 5:45am has never hurt so good!</p>', '2004-04-29 12:11:10+01', '2008-03-11 11:51:23+00', 2004, 4, NULL, NULL, 1, NULL, '2004-04-29 12:11:10+01');
INSERT INTO blogs VALUES (27, 'State the Obvious, Expect the Unexpected', 'state_the_obvious,_expect_the_unexpected', '<p>Why can''t Mondays be as enjoyable as Thursdays?  Which introduces the corollary, why can''t Fridays be as miserable as Tuesdays?  Well, after careful data sampling and experimenting, I have a definitive answer.  Fridays CAN and WILL stink, especially when you spend two thirds of your working on the phone with customer support.  My calls today to find the source of our internet outage culminated with a thanks for my patience and a reminder that I could find helpful solutions to problems by visiting our ISP''s service web page.  I told the customer service representative that I would be sure to try this solution once I had internet service again.</p><p>I should have seen Friday coming, though.  All the hints were there, like when, Tuesday morning, I discovered the one thing that is worse than drinking orange juice after you brush your teeth.  I woke up early Wednesday and was pleased with the progress that I was making not only towards getting ready for work, but also my prospects for arriving to work on time.  I ate a quick breakfast, drank a glass of orange juice, showered, brushed my teeth, and gargled (a habit I picked up in Japan).  When I gargle, I appreciate the tickle of a deep gargle that massages your uvula and tickles your throat.  Things got a bit out of hand, though, with all of my gargling excitement, and I let the water go a bit too deep into my throat.  This caused a gag reflex to bend me in two, doubling me over the sink, where I threw up all of the orange juice that I drank moments before.  Thus, leading to my discovery that throwing up orange juice after you have brushed your teeth tastes worse than only drinking it after the brushing is done.</p><p>These two downsides to my week couldn''t compete with the one major upswing that came Wednesday at the local thrift store.  I was shopping with Jamie who was on a mission to find a sports jacket.  Jamie, who is just over six feet tall, had had problems shopping earlier with finding pants that fit well.  He had found plenty of pants that were the correct width of 32", but none that were as long as the 34" his legs required.  Most were 32" x 27" and looked like knickers on him.  His prospects improved, though, when we focused on jackets.  Digging through the suits, it looked like we had found the perfect match: a black pinstripe jacket with matching vest and pants.  The jacket fit well enough; it was perfect in the shoulders and didn''t bunch too much in the back, though it did fit a bit wide at the bottom.</p><p>The excitement surround this three piece find was due not only to the fit of the jacket, but the possibilities for mixing and matching all three pieces with Jamie''s existing wardrobe.  With anticipation, Jamie inspected the vest and pants to revel in his discovery.  No stains, no holes, no burrowing insects; it was truly a rare thrift store find.  But as Jamie looked further, his elation turned to disappointment.  With a furrowed brow, he turned to me and said "31" x 48"."</p><p>Evidently the pants had belonged to a <a href="http://www.got2haveit.com/pic2/pirateweeble75.jpg"> Weeble</a> in a previous life.  Jamie and I figured that he could alter the pants to fit him, but they would have to be brought in so much in the butt that the two back pockets would merge into one and his side pockets would be two thirds of the way around his legs.  So it wasn''t a thrifty find after all, but it was the cheapest laugh I had all week.', '<p>Why can&#8217;t Mondays be as enjoyable as Thursdays?  Which introduces the corollary, why can&#8217;t Fridays be as miserable as Tuesdays?  Well, after careful data sampling and experimenting, I have a definitive answer.  Fridays <span class="caps">CAN</span> and <span class="caps">WILL</span> stink, especially when you spend two thirds of your working on the phone with customer support.  My calls today to find the source of our internet outage culminated with a thanks for my patience and a reminder that I could find helpful solutions to problems by visiting our <span class="caps">ISP</span>&#8217;s service web page.  I told the customer service representative that I would be sure to try this solution once I had internet service again.</p><p>I should have seen Friday coming, though.  All the hints were there, like when, Tuesday morning, I discovered the one thing that is worse than drinking orange juice after you brush your teeth.  I woke up early Wednesday and was pleased with the progress that I was making not only towards getting ready for work, but also my prospects for arriving to work on time.  I ate a quick breakfast, drank a glass of orange juice, showered, brushed my teeth, and gargled (a habit I picked up in Japan).  When I gargle, I appreciate the tickle of a deep gargle that massages your uvula and tickles your throat.  Things got a bit out of hand, though, with all of my gargling excitement, and I let the water go a bit too deep into my throat.  This caused a gag reflex to bend me in two, doubling me over the sink, where I threw up all of the orange juice that I drank moments before.  Thus, leading to my discovery that throwing up orange juice after you have brushed your teeth tastes worse than only drinking it after the brushing is done.</p><p>These two downsides to my week couldn&#8217;t compete with the one major upswing that came Wednesday at the local thrift store.  I was shopping with Jamie who was on a mission to find a sports jacket.  Jamie, who is just over six feet tall, had had problems shopping earlier with finding pants that fit well.  He had found plenty of pants that were the correct width of 32&#8221;, but none that were as long as the 34&#8221; his legs required.  Most were 32&#8221; x 27&#8221; and looked like knickers on him.  His prospects improved, though, when we focused on jackets.  Digging through the suits, it looked like we had found the perfect match: a black pinstripe jacket with matching vest and pants.  The jacket fit well enough; it was perfect in the shoulders and didn&#8217;t bunch too much in the back, though it did fit a bit wide at the bottom.</p><p>The excitement surround this three piece find was due not only to the fit of the jacket, but the possibilities for mixing and matching all three pieces with Jamie&#8217;s existing wardrobe.  With anticipation, Jamie inspected the vest and pants to revel in his discovery.  No stains, no holes, no burrowing insects; it was truly a rare thrift store find.  But as Jamie looked further, his elation turned to disappointment.  With a furrowed brow, he turned to me and said &#8220;31&#8221; x 48&#8221;.&#8221;</p><p>Evidently the pants had belonged to a <a href="http://www.got2haveit.com/pic2/pirateweeble75.jpg"> Weeble</a> in a previous life.  Jamie and I figured that he could alter the pants to fit him, but they would have to be brought in so much in the butt that the two back pockets would merge into one and his side pockets would be two thirds of the way around his legs.  So it wasn&#8217;t a thrifty find after all, but it was the cheapest laugh I had all week.', '2003-11-21 07:47:42+00', '2008-03-11 11:51:23+00', 2003, 11, NULL, NULL, 1, NULL, '2003-11-21 07:47:42+00');
INSERT INTO blogs VALUES (28, 'Changing Changed Changes', 'changing_changed_changes', '<p>I don''t have the scientific facts, but the days are getting shorter.  Children are getting younger.  And if it weren''t for concerned and involved citizens like you and myself, the holiday season would never end.  In the ever-changing world around me, I seem to be the only constant.</p><p>Then again, maybe I am the only thing changing.  Boredom during third grade prompted me to count the seconds in a day.  Boredom during the ride from Longview, TX, back home prompted me to do it again.  And guess what?  The amounts were not only scientifically, but also mathematically the same!  So I took out my sliderule to compare the start of the holiday season ten years ago to this year.  No matter how I integrate, differentiate, and accommodate for rounding errors, one Thanksgiving seems to always do a good job of approximating another.</p><p>Hoping to find discrepancies among other things that appear to change, I looked at children.  But scientifically, biology still happens at the same rate it did in the 1800s.  Acoustically, the music today sounds just as noisy to me as my music does to my parents.  And fashionably, the need for national funding of the fashion police is as great as it ever was. The only difference is now there are less bee-hive hairdoos and more obese midriffs showing.  Both of which ought to be illegal.</p><p>Strange, you don''t hear people complaining about how women''s sufferage isn''t want it use to (not) be.  People don''t long for the literacy rates of the 1800''s.  SARS wasn''t criticized for not living up to beubonic standards.  Maybe some things are changing.</p><p>Another thing that has changed is minority visibility in movies, on TV, and in print.  For a while it was all blonde hair and blue eyes.  But things have changed.  First it came in the collegiate brochures that digitally placed an image of the same minority student in 50 different publicity photos all taken from different angles to give the impression that there was more than one student of color attending these schools.  But since this student graduated, so has the WASPy image of the media, which despite the change still plays it safe.  There really hasn''t been as much a diversity explosion in the media as an agreement on what minorities are now chic and trendy.</p><p>If you want to be a cool minority, you are most definately Chinese, Japanese, or Korean.  By far the most prominent minority I have seen, especially in advertising, is east Asian.  But maybe that is because my mind is still overseas.  If you are female, it is definately cool to be from ''south of the border, thanks to J''Lo who brought sassy latin booty''s back in vogue.  Just like Colin Ferril and the Crocodile Hunter made accents sexy, ''eh?  Austrian body builders seem to get respect out in California. Unfortunately for African Americans and Arabs, the media seems only to be interested in EMINEM and Saddam look-alikes.</p><p>So is change worth it if only the same results keep reoccurring?  Scientifically, we are progressing, but what about socially?  I''m not so sure, though I do believe that things are better than they were 50 years ago, if only for the knowledge that we have now.  Hard to tell which is more difficult and painful: gaining that knowledge or putting it to use.', '<p>I don&#8217;t have the scientific facts, but the days are getting shorter.  Children are getting younger.  And if it weren&#8217;t for concerned and involved citizens like you and myself, the holiday season would never end.  In the ever-changing world around me, I seem to be the only constant.</p><p>Then again, maybe I am the only thing changing.  Boredom during third grade prompted me to count the seconds in a day.  Boredom during the ride from Longview, TX, back home prompted me to do it again.  And guess what?  The amounts were not only scientifically, but also mathematically the same!  So I took out my sliderule to compare the start of the holiday season ten years ago to this year.  No matter how I integrate, differentiate, and accommodate for rounding errors, one Thanksgiving seems to always do a good job of approximating another.</p><p>Hoping to find discrepancies among other things that appear to change, I looked at children.  But scientifically, biology still happens at the same rate it did in the 1800s.  Acoustically, the music today sounds just as noisy to me as my music does to my parents.  And fashionably, the need for national funding of the fashion police is as great as it ever was. The only difference is now there are less bee-hive hairdoos and more obese midriffs showing.  Both of which ought to be illegal.</p><p>Strange, you don&#8217;t hear people complaining about how women&#8217;s sufferage isn&#8217;t want it use to (not) be.  People don&#8217;t long for the literacy rates of the 1800&#8217;s.  <span class="caps">SARS</span> wasn&#8217;t criticized for not living up to beubonic standards.  Maybe some things are changing.</p><p>Another thing that has changed is minority visibility in movies, on TV, and in print.  For a while it was all blonde hair and blue eyes.  But things have changed.  First it came in the collegiate brochures that digitally placed an image of the same minority student in 50 different publicity photos all taken from different angles to give the impression that there was more than one student of color attending these schools.  But since this student graduated, so has the WASPy image of the media, which despite the change still plays it safe.  There really hasn&#8217;t been as much a diversity explosion in the media as an agreement on what minorities are now chic and trendy.</p><p>If you want to be a cool minority, you are most definately Chinese, Japanese, or Korean.  By far the most prominent minority I have seen, especially in advertising, is east Asian.  But maybe that is because my mind is still overseas.  If you are female, it is definately cool to be from &#8216;south of the border, thanks to J&#8217;Lo who brought sassy latin booty&#8217;s back in vogue.  Just like Colin Ferril and the Crocodile Hunter made accents sexy, &#8216;eh?  Austrian body builders seem to get respect out in California. Unfortunately for African Americans and Arabs, the media seems only to be interested in <span class="caps">EMINEM</span> and Saddam look-alikes.</p><p>So is change worth it if only the same results keep reoccurring?  Scientifically, we are progressing, but what about socially?  I&#8217;m not so sure, though I do believe that things are better than they were 50 years ago, if only for the knowledge that we have now.  Hard to tell which is more difficult and painful: gaining that knowledge or putting it to use.', '2003-11-14 13:20:17+00', '2008-03-11 11:51:23+00', 2003, 11, NULL, NULL, 1, NULL, '2003-11-14 13:20:17+00');
INSERT INTO blogs VALUES (30, 'The Inverse of Culture-Shock', 'the_inverse_of_culture-shock', '<p><p>While visiting a hospital in Japan, I heard about an interesting problem: adults playing hookey.  Overworked salarymen and underappreciated housewives who fall ill or injure themselves and end up in the hospital are increasingly finding reasons not to get better.  They will complain about the monotony of hospital life, the consistency of hospital food, and the sterile hospital air, but only until confronted with the prospect of returning to their daily routine.</p><p>This past month I have been similarly stuck.  With no exertion on my part, I figured that this web page would build itself, friends would find their way to my doorstep, and happiness would be waiting for me in the mailbox when I got home from work.  I would complain about my situation, but when confronted with changing my routine, I would feign lightheadedness and hyperventilate.  I was waiting for a doctor to come and daignose my future, perscribe me focus, and tell me to come back if everything wasn''t better in two weeks.</p><p>And this I blame on lack of rent and home-cooked meals.  Complacency is knowing that I am not responsible for anything from 5:00 pm until 8:00 am except washing and putting the dishes away.  Not that I have been feeling irresponsible, mind you.  I was just waiting until I was certian about what I wanted before I took responsibility.  Well, not anymore.</p><p>A woman I met at a party in Savannah demanded to know exactly why I went to Japan and was hardly satisfied with my answer, "Why not?"  I put a lot of thought into what I didn''t want to do after college, where I didn''t want to work, and who I didn''t want to become.  Maybe I didn''t know the right answers, but I knew the wrong ones.</p><p>Reverse culture-shock for me was an age-reversing time machine; it took me back to the past while propelling everything around me into the future.  I thought I was 18 again (the last time I had lived at home), but Hoover felt ten years older.  And I felt even more lost among the big cars, bigger people, and biggest strip malls, just like I was 18 again.  I''m tired of being a teenager, though I''m not quite sure that I want to grow up.  I don''t know exactly what I want, so I have decided to take responsibility for the things that I don''t want.  Because if I don''t start there, I might never start.</p>', '<p><p>While visiting a hospital in Japan, I heard about an interesting problem: adults playing hookey.  Overworked salarymen and underappreciated housewives who fall ill or injure themselves and end up in the hospital are increasingly finding reasons not to get better.  They will complain about the monotony of hospital life, the consistency of hospital food, and the sterile hospital air, but only until confronted with the prospect of returning to their daily routine.</p><p>This past month I have been similarly stuck.  With no exertion on my part, I figured that this web page would build itself, friends would find their way to my doorstep, and happiness would be waiting for me in the mailbox when I got home from work.  I would complain about my situation, but when confronted with changing my routine, I would feign lightheadedness and hyperventilate.  I was waiting for a doctor to come and daignose my future, perscribe me focus, and tell me to come back if everything wasn&#8217;t better in two weeks.</p><p>And this I blame on lack of rent and home-cooked meals.  Complacency is knowing that I am not responsible for anything from 5:00 pm until 8:00 am except washing and putting the dishes away.  Not that I have been feeling irresponsible, mind you.  I was just waiting until I was certian about what I wanted before I took responsibility.  Well, not anymore.</p><p>A woman I met at a party in Savannah demanded to know exactly why I went to Japan and was hardly satisfied with my answer, &#8220;Why not?&#8221;  I put a lot of thought into what I didn&#8217;t want to do after college, where I didn&#8217;t want to work, and who I didn&#8217;t want to become.  Maybe I didn&#8217;t know the right answers, but I knew the wrong ones.</p><p>Reverse culture-shock for me was an age-reversing time machine; it took me back to the past while propelling everything around me into the future.  I thought I was 18 again (the last time I had lived at home), but Hoover felt ten years older.  And I felt even more lost among the big cars, bigger people, and biggest strip malls, just like I was 18 again.  I&#8217;m tired of being a teenager, though I&#8217;m not quite sure that I want to grow up.  I don&#8217;t know exactly what I want, so I have decided to take responsibility for the things that I don&#8217;t want.  Because if I don&#8217;t start there, I might never start.</p>', '2003-10-13 11:50:49+01', '2008-03-11 11:51:24+00', 2003, 10, NULL, NULL, 1, NULL, '2003-10-13 11:50:49+01');
INSERT INTO blogs VALUES (35, 'Mohawks with Japanese Bunny', 'mohawks_with_japanese_bunny', '<p>When I arrived in Tenkawa, Japan, two years ago, I was the biggest new in town since my predecessor arrived three years earlier. My jogging in the morning was such a hot news item that my students would brag about living in the "house that the foreigner ran in front of." Even today old women whom I have never met will tell me that they saw me jogging in front of their house once, even though I haven''t jogged through town in about a year and a half. Now I ride my bicycle, disguised in spandex and a helmet.<p>I have gotten use to my stardome and expect that it will be one of the things that I miss most about Japan. Once I return home, will people gawk and stare at me as I walk down the street? Will junior high school girls giggle at me and tell me I look like Tom Cruise? Will a mention that I am a foreigner forgive all of my social faux paus? I think not. </p><p>So in a last hurrah, this weekend I shaved my head into a Mohawk and paraded around town, hand in hand with my Japanese girlfriend. Most people had to do a double-take to recognize me, and most were more interested in whether or not my gf could speak English than my hairstyle, but one thing was cemented this weekend: there is no chance that my successor''s jogging route will surpass the news headlines from this weeked for a long time. </p>', '<p>When I arrived in Tenkawa, Japan, two years ago, I was the biggest new in town since my predecessor arrived three years earlier. My jogging in the morning was such a hot news item that my students would brag about living in the &#8220;house that the foreigner ran in front of.&#8221; Even today old women whom I have never met will tell me that they saw me jogging in front of their house once, even though I haven&#8217;t jogged through town in about a year and a half. Now I ride my bicycle, disguised in spandex and a helmet.<p>I have gotten use to my stardome and expect that it will be one of the things that I miss most about Japan. Once I return home, will people gawk and stare at me as I walk down the street? Will junior high school girls giggle at me and tell me I look like Tom Cruise? Will a mention that I am a foreigner forgive all of my social faux paus? I think not. </p><p>So in a last hurrah, this weekend I shaved my head into a Mohawk and paraded around town, hand in hand with my Japanese girlfriend. Most people had to do a double-take to recognize me, and most were more interested in whether or not my gf could speak English than my hairstyle, but one thing was cemented this weekend: there is no chance that my successor&#8217;s jogging route will surpass the news headlines from this weeked for a long time. </p>', '2003-05-19 04:21:15+01', '2008-03-11 11:51:24+00', 2003, 5, NULL, NULL, 1, NULL, '2003-05-19 04:21:15+01');
INSERT INTO blogs VALUES (34, 'When in Rome', 'when_in_rome', '<p>I sat down to watch Kirk Douglas in Spartacus for two hours and quickly realized that I had rented Charlton Heston in Ben Hur and was stuck for four hours. So I decided, with only three months left in Japan, to use my time wisely to reflect on the beauty and complexity of society, both Japanese and Roman.<p>Both civilizations look great on paper. Both societies were world conquerers. Both have incomprehensible languages. And both have a lot of parades, ceremonies, and occasions where you must stand in one place for a long time. But most importantly, these societies and especially their ceremonies look austere, rightious, and powerful, especially when portrayed through the lense of Hollywood. </p><p>The truth behind the matter is that it is all a farce. It is a slight of hand that is good in theory but not in practice. I know, because ceremonies big and small are the national passtime in Japan. There are ceremonial precedings in Japan for the start and the end of the school year; there are more to congratulate the graduates and a separate one to welcome the new students; sports day and culture day both have ceremonies of marches, speaches, and bowing; and once there was a ceremony to celebrate not having had a ceremony for a whole month. </p><p>The first thing that I learned about ceremonies in Japan is that nobody knows what is going on. You can''t ask the senior teacher sitting behind you because he is asleep; the teacher to your right can''t help because she just missed her cue to be on stage, and the teacher to your left is too busy trying to remember how to use the PA system to be bothered with mic feedback, much less your inquiries. </p><p>Which made me wonder, "Is Japan really that unique? What if ancient Rome was like this?" With such a large country, so many people, and a nearly equal number of ceremonies, I am certain that Roman ceremonies were less prim and propper and more wearing of breastplates upside down, off-key trumpeting, lazy horses and misled legions, and general confusion. Thank goodness we have Charlton Heston to keep us on the straight and narrow! </p>', '<p>I sat down to watch Kirk Douglas in Spartacus for two hours and quickly realized that I had rented Charlton Heston in Ben Hur and was stuck for four hours. So I decided, with only three months left in Japan, to use my time wisely to reflect on the beauty and complexity of society, both Japanese and Roman.<p>Both civilizations look great on paper. Both societies were world conquerers. Both have incomprehensible languages. And both have a lot of parades, ceremonies, and occasions where you must stand in one place for a long time. But most importantly, these societies and especially their ceremonies look austere, rightious, and powerful, especially when portrayed through the lense of Hollywood. </p><p>The truth behind the matter is that it is all a farce. It is a slight of hand that is good in theory but not in practice. I know, because ceremonies big and small are the national passtime in Japan. There are ceremonial precedings in Japan for the start and the end of the school year; there are more to congratulate the graduates and a separate one to welcome the new students; sports day and culture day both have ceremonies of marches, speaches, and bowing; and once there was a ceremony to celebrate not having had a ceremony for a whole month. </p><p>The first thing that I learned about ceremonies in Japan is that nobody knows what is going on. You can&#8217;t ask the senior teacher sitting behind you because he is asleep; the teacher to your right can&#8217;t help because she just missed her cue to be on stage, and the teacher to your left is too busy trying to remember how to use the PA system to be bothered with mic feedback, much less your inquiries. </p><p>Which made me wonder, &#8220;Is Japan really that unique? What if ancient Rome was like this?&#8221; With such a large country, so many people, and a nearly equal number of ceremonies, I am certain that Roman ceremonies were less prim and propper and more wearing of breastplates upside down, off-key trumpeting, lazy horses and misled legions, and general confusion. Thank goodness we have Charlton Heston to keep us on the straight and narrow! </p>', '2003-05-29 14:59:32+01', '2008-03-11 11:51:24+00', 2003, 5, NULL, NULL, 1, NULL, '2003-05-29 14:59:32+01');
INSERT INTO blogs VALUES (37, 'Going Nowhere Fast', 'going_nowhere_fast', '<p>The speed limits posted throughout Japan are utterly rediculous. Upon first glance, they don''t seem unreasonable. But after converting from kilometers/hour to miles/hour, you realize that only retirement home parking lots have speed limits less than 20 mph. The highest posted speed sign I have seen in Japan was on the highway, and it was only 80 kmph, which is about 55 mph. In other words, agonizing. That is why I have made a promise to myself, as a self-concious safety driver, to never drive more than twice the posted speed limit in Japan.<p>The speed limits posted throughout New Zealand are also utterly rediculous. Unless otherwise posted, the speed limit throughout New Zealand is 100 kmph (about 65 mph) which is the perfect speed to see scenery and scare sheet at. Since this speed is so ubiquitous across NZ, it has taken on a meaning of being the status quo. So to signal the end of road work, not only is there a sign saying "Works End," but usually there is also a sign posting a speed limit of 100 kmph, signaling the return to the status quo. This is the case indiscriminate of where construction is occurring, though. So for a small patch of road repair on a curvey road, it isn''t uncommon for the warning sign to indicate a drop to 30 kmph, a "Work Ends" 100 kmph sign, and a "Dangerous Curve" 25 kmph sign all within a 100 yard span. </p><p>In cases like these, the time it takes to get from 0 to 60 is just as impoartant as the time to get from 60 to 0. </p>', '<p>The speed limits posted throughout Japan are utterly rediculous. Upon first glance, they don&#8217;t seem unreasonable. But after converting from kilometers/hour to miles/hour, you realize that only retirement home parking lots have speed limits less than 20 mph. The highest posted speed sign I have seen in Japan was on the highway, and it was only 80 kmph, which is about 55 mph. In other words, agonizing. That is why I have made a promise to myself, as a self-concious safety driver, to never drive more than twice the posted speed limit in Japan.<p>The speed limits posted throughout New Zealand are also utterly rediculous. Unless otherwise posted, the speed limit throughout New Zealand is 100 kmph (about 65 mph) which is the perfect speed to see scenery and scare sheet at. Since this speed is so ubiquitous across NZ, it has taken on a meaning of being the status quo. So to signal the end of road work, not only is there a sign saying &#8220;Works End,&#8221; but usually there is also a sign posting a speed limit of 100 kmph, signaling the return to the status quo. This is the case indiscriminate of where construction is occurring, though. So for a small patch of road repair on a curvey road, it isn&#8217;t uncommon for the warning sign to indicate a drop to 30 kmph, a &#8220;Work Ends&#8221; 100 kmph sign, and a &#8220;Dangerous Curve&#8221; 25 kmph sign all within a 100 yard span. </p><p>In cases like these, the time it takes to get from 0 to 60 is just as impoartant as the time to get from 60 to 0. </p>', '2003-03-28 20:58:54+00', '2008-03-11 11:51:24+00', 2003, 3, NULL, NULL, 1, NULL, '2003-03-28 20:58:54+00');
INSERT INTO blogs VALUES (41, 'What it means to be an American', 'what_it_means_to_be_an_american', '<p>Every Friday night I have a hot date at 11:00 sharp with the President of the United States of America. Usually he talks and I listen. Which is fine by me, because I am enthralled with his charisma and smitten with his infallable character.<p>I know that The West Wing is completely mythical; no group of people is that perfect or well-intentioned. But for forty-five minutes every Friday, as my nostalgia melts away and I daydream of a world actually interested in making the right decision, I could care less. </p><p>I know that the show has a one hour timeslot, but as foreign television shows are imported to Japan, customs officialls seize all commercials, cutting the running time of most shows by about a quarter. So The West Wing runs about 45 minutes, Night Line is 20 minutes, and if you blink you miss Headline News. </p><p>Which is all fine by me, except today. Despite living in the future, the Super Bowl is broadcast a day late in Japan. Being a patriotic American, it is my duty to watch it. I even found some cheese dip and pork rinds. But to watch the Super Bowl in an hour and a quarter without commercials? What is the point? </p>', '<p>Every Friday night I have a hot date at 11:00 sharp with the President of the United States of America. Usually he talks and I listen. Which is fine by me, because I am enthralled with his charisma and smitten with his infallable character.<p>I know that The West Wing is completely mythical; no group of people is that perfect or well-intentioned. But for forty-five minutes every Friday, as my nostalgia melts away and I daydream of a world actually interested in making the right decision, I could care less. </p><p>I know that the show has a one hour timeslot, but as foreign television shows are imported to Japan, customs officialls seize all commercials, cutting the running time of most shows by about a quarter. So The West Wing runs about 45 minutes, Night Line is 20 minutes, and if you blink you miss Headline News. </p><p>Which is all fine by me, except today. Despite living in the future, the Super Bowl is broadcast a day late in Japan. Being a patriotic American, it is my duty to watch it. I even found some cheese dip and pork rinds. But to watch the Super Bowl in an hour and a quarter without commercials? What is the point? </p>', '2003-01-26 21:25:00+00', '2008-03-11 11:51:24+00', 2003, 1, NULL, NULL, 1, NULL, '2003-01-26 21:25:00+00');
INSERT INTO blogs VALUES (42, 'Raining in the New Year', 'raining_in_the_new_year', '<p>They call me Rainman in Japanese - ame otoko - because Mother Nature seems to cry wherever I go. I was looking forward to my three week winter vacation in Okinawa because December in Tenkawa was nothing but grey skies and threatening thunder storms. I should have gotten the hint, though, during the flight south, because for two an a half hours, we flew in nothing but grey clouds. For the first five days in Okinawa, I only saw the sun once. It rained every day. Ten days later, I couldn''t take the rain any more, booked a flight back to Nara, and arrived in time for the new year.<p>In reflection, it felt very good to come back. It had been more than a year since I had celebrated a holiday festively (last year I was too frozen to enjoy New Years) with friends and family, and the nostalgia that came back after eating a big meal and opening presents reconfirmed my decision to return to America after this year in Japan. </p><p>Ironically, living outside the US has given me a great perspective on what it is like to live within the US. And now I am looking for a similar perspective on Japan, my job, and my future. I will be home by September 1st, and from then, to infinity and beyond! </p>', '<p>They call me Rainman in Japanese &#8211; ame otoko &#8211; because Mother Nature seems to cry wherever I go. I was looking forward to my three week winter vacation in Okinawa because December in Tenkawa was nothing but grey skies and threatening thunder storms. I should have gotten the hint, though, during the flight south, because for two an a half hours, we flew in nothing but grey clouds. For the first five days in Okinawa, I only saw the sun once. It rained every day. Ten days later, I couldn&#8217;t take the rain any more, booked a flight back to Nara, and arrived in time for the new year.<p>In reflection, it felt very good to come back. It had been more than a year since I had celebrated a holiday festively (last year I was too frozen to enjoy New Years) with friends and family, and the nostalgia that came back after eating a big meal and opening presents reconfirmed my decision to return to America after this year in Japan. </p><p>Ironically, living outside the US has given me a great perspective on what it is like to live within the US. And now I am looking for a similar perspective on Japan, my job, and my future. I will be home by September 1st, and from then, to infinity and beyond! </p>', '2003-01-09 03:42:15+00', '2008-03-11 11:51:24+00', 2003, 1, NULL, NULL, 1, NULL, '2003-01-09 03:42:15+00');
INSERT INTO blogs VALUES (43, 'I''m Flying!', 'i''m_flying!', '<p>The future has arrived here in Tenkawa, of all places. Yes, my phone line was switched from analog to digital and my ISDN service was set up Tuesday, and while it has been difficult learning to balance while surfing at !!!64,000 BYTES PER SECOND!!! I haven''t gotten water up my nose once yet!<p>There is time for that yet, particularly since I will be spending Christmas and the new year in Okinawa. While tempted to fraternize with the American military stationed there, I hope to spend most of my time on some of the more remote islands, bicycling and scuba diving. And of course working on the savage tan that was denied to me by this year''s frigid summer vacation. </p><p>There are only two things that are missing during this year''s winter vacation: family and friends. I miss you all and encourage all of you who are good swimmers to come out and visit me as soon as possible, because like grains of sand in an hour glass, so is my time in Japan! </p>', '<p>The future has arrived here in Tenkawa, of all places. Yes, my phone line was switched from analog to digital and my <span class="caps">ISDN</span> service was set up Tuesday, and while it has been difficult learning to balance while surfing at !!!64,000 <span class="caps">BYTES PER SECOND</span>!!! I haven&#8217;t gotten water up my nose once yet!<p>There is time for that yet, particularly since I will be spending Christmas and the new year in Okinawa. While tempted to fraternize with the American military stationed there, I hope to spend most of my time on some of the more remote islands, bicycling and scuba diving. And of course working on the savage tan that was denied to me by this year&#8217;s frigid summer vacation. </p><p>There are only two things that are missing during this year&#8217;s winter vacation: family and friends. I miss you all and encourage all of you who are good swimmers to come out and visit me as soon as possible, because like grains of sand in an hour glass, so is my time in Japan! </p>', '2002-12-04 23:48:12+00', '2008-03-11 11:51:24+00', 2002, 12, NULL, NULL, 1, NULL, '2002-12-04 23:48:12+00');
INSERT INTO blogs VALUES (44, 'Something Fishy', 'something_fishy', '<p>Can you be nostalgic for something you don''t like? I miss bass fishing shows on American telivision being religated to the margins of programming. You either had to rise with the sun or get 80+ channels of cable to catch a glimpse of quite possibly the most boring television concept ever. But not in Japan. While people in the states would be tuning into Jay or Dave for late nite talk, three of my ten channels are dedicated tfferent sectors of society. While there is a vacuum of dedication to quality television programming in Japan, the bathroom service industry is overflowing with pride and joy. It is hardly uncommon to have old grandmothers with their backs bent at a 90 degree angle waltz into the boys bathroom to check for garbage. That seems normal, though this caught me by surprise: just last week as I was leaving a bathroom in the Tokyo train station, a woman sitting behind a desk outside of the bathrooms very politely thanked me. For what, I don''t know. But judging from where gramps gets away with taking a leak in Japan, I think that she was just expressing happiness that I didn''t go behind her desk. </p>', '<p>Can you be nostalgic for something you don&#8217;t like? I miss bass fishing shows on American telivision being religated to the margins of programming. You either had to rise with the sun or get 80+ channels of cable to catch a glimpse of quite possibly the most boring television concept ever. But not in Japan. While people in the states would be tuning into Jay or Dave for late nite talk, three of my ten channels are dedicated tfferent sectors of society. While there is a vacuum of dedication to quality television programming in Japan, the bathroom service industry is overflowing with pride and joy. It is hardly uncommon to have old grandmothers with their backs bent at a 90 degree angle waltz into the boys bathroom to check for garbage. That seems normal, though this caught me by surprise: just last week as I was leaving a bathroom in the Tokyo train station, a woman sitting behind a desk outside of the bathrooms very politely thanked me. For what, I don&#8217;t know. But judging from where gramps gets away with taking a leak in Japan, I think that she was just expressing happiness that I didn&#8217;t go behind her desk. </p>', '2002-11-13 23:46:12+00', '2008-03-11 11:51:24+00', 2002, 11, NULL, NULL, 1, NULL, '2002-11-13 23:46:12+00');
INSERT INTO blogs VALUES (45, 'Keeping In Touch', 'keeping_in_touch', '<p>The Pacific Ocean does a pretty good job of keeping me out of touch. So does my dail-up connection to the internet. I never thought that I would be excited about getting ISDN, but now I am lusting after it so much that it is making guest appearances in my daydreams. Part of me can''t wait to be blazing along the internet at 64 kbps. But another part of me worries that ISDN will be the end of an era of self-reflection and deep-pondering.<p>The time that I spendives. If only blogs were as sexy as Dr. Phil, there would be no competition. </p>', '<p>The Pacific Ocean does a pretty good job of keeping me out of touch. So does my dail-up connection to the internet. I never thought that I would be excited about getting <span class="caps">ISDN</span>, but now I am lusting after it so much that it is making guest appearances in my daydreams. Part of me can&#8217;t wait to be blazing along the internet at 64 kbps. But another part of me worries that <span class="caps">ISDN</span> will be the end of an era of self-reflection and deep-pondering.<p>The time that I spendives. If only blogs were as sexy as Dr. Phil, there would be no competition. </p>', '2002-11-06 22:58:23+00', '2008-03-11 11:51:24+00', 2002, 11, NULL, NULL, 1, NULL, '2002-11-06 22:58:23+00');
INSERT INTO blogs VALUES (46, 'Adorable Rodents', 'adorable_rodents', '<p>The sight of my car confused me when I returned home from school the other day. From a distance, it looked like a pigeon''s post-modern art thesis. But upon further inspection I saw that it was caked mud and tiny paw prints that were covering my car. I got excited, thinking that I might see a herd of wild monkeys or a flock of fish that decided the river was too cold, grew legs, and was now terrorizing land-lubbers in central Nara-ken. But then my eyes fell on telltale clues left scattered throughout the parking lot.<p>A torn shoe here, a sacraficial pile of rolly-poleys, and a shovel were scattered among a gang of forgotten tricycles. No rat living in the glovebox of a car could have done this. Only the two adorable rodents that live next door could have. </p><p>Perhaps I have discovered a new species. I am certain they are rodents; they squeal when you pick them up, they eat just about anything, and they do smell a bit funny. And yet they pass for kindergarten students five days a week and can utter a few demanding phrases in Japanese, such as "piggy-back" and "airplane." </p><p>Of course, I shouldn''t be talking. Anyone who has seen a picture of me would claim that I am the missing link between humans and shaggy primates. The smoke you see in the picture to the left is actually my hair... </p>', '<p>The sight of my car confused me when I returned home from school the other day. From a distance, it looked like a pigeon&#8217;s post-modern art thesis. But upon further inspection I saw that it was caked mud and tiny paw prints that were covering my car. I got excited, thinking that I might see a herd of wild monkeys or a flock of fish that decided the river was too cold, grew legs, and was now terrorizing land-lubbers in central Nara-ken. But then my eyes fell on telltale clues left scattered throughout the parking lot.<p>A torn shoe here, a sacraficial pile of rolly-poleys, and a shovel were scattered among a gang of forgotten tricycles. No rat living in the glovebox of a car could have done this. Only the two adorable rodents that live next door could have. </p><p>Perhaps I have discovered a new species. I am certain they are rodents; they squeal when you pick them up, they eat just about anything, and they do smell a bit funny. And yet they pass for kindergarten students five days a week and can utter a few demanding phrases in Japanese, such as &#8220;piggy-back&#8221; and &#8220;airplane.&#8221; </p><p>Of course, I shouldn&#8217;t be talking. Anyone who has seen a picture of me would claim that I am the missing link between humans and shaggy primates. The smoke you see in the picture to the left is actually my hair&#8230; </p>', '2002-10-23 02:26:49+01', '2008-03-11 11:51:24+00', 2002, 10, NULL, NULL, 1, NULL, '2002-10-23 02:26:49+01');
INSERT INTO blogs VALUES (47, 'Sweet Tea and Monster Truck Rallies', 'sweet_tea_and_monster_truck_rallies', '<p>Seems like just yesterday when all that I needed to turn an unhappy day''s frown upside down was some sweet tea and a monster truck rally. But when the tea is green and the cars are monster truck fodder, this prodigal son can''t help but pout.<p>That is, until now. Today I had an ''episode'' at the the DMV. Usually this isn''t a problem; I just do what any reasonable American would do. I put in some death metal, roll down the windows, step on the gas, and leave my bad mood in the dust. But not even this traditional remedy could cure my affliction. </p><p>So I did what any reasonable Japanese person would do. I got naked with a bunch of the town men to sit together in a big outdoor tub of warm water to talk about the weather. Keeping my head just below the water so I couldn''t hear the conversation, I let my body shrivel like a prune. Upon getting out, a local third grader asked me if I wanted him to wash and scrub my back, since he was all soaped up. And as my mind translated his question, the tarnishing that the DMV did was spiffed right up. </p><p>Of course, I still have cravings for a good tractor pull or super sucrose saturates. I am just wondering if after Japan I will crave soap suds and naked men. </p>', '<p>Seems like just yesterday when all that I needed to turn an unhappy day&#8217;s frown upside down was some sweet tea and a monster truck rally. But when the tea is green and the cars are monster truck fodder, this prodigal son can&#8217;t help but pout.<p>That is, until now. Today I had an &#8216;episode&#8217; at the the <span class="caps">DMV</span>. Usually this isn&#8217;t a problem; I just do what any reasonable American would do. I put in some death metal, roll down the windows, step on the gas, and leave my bad mood in the dust. But not even this traditional remedy could cure my affliction. </p><p>So I did what any reasonable Japanese person would do. I got naked with a bunch of the town men to sit together in a big outdoor tub of warm water to talk about the weather. Keeping my head just below the water so I couldn&#8217;t hear the conversation, I let my body shrivel like a prune. Upon getting out, a local third grader asked me if I wanted him to wash and scrub my back, since he was all soaped up. And as my mind translated his question, the tarnishing that the <span class="caps">DMV</span> did was spiffed right up. </p><p>Of course, I still have cravings for a good tractor pull or super sucrose saturates. I am just wondering if after Japan I will crave soap suds and naked men. </p>', '2002-10-16 23:58:00+01', '2008-03-11 11:51:24+00', 2002, 10, NULL, NULL, 1, NULL, '2002-10-16 23:58:00+01');
INSERT INTO blogs VALUES (48, 'Repentance', 'repentance', '<p>I guess Mother Nature was trying to make up for the overcast and cold weather this summer with warm and sunny weather this past weekend when I went touring for the last time this season. Me and Lala (my Yamaha Diversion 400) made it from Nara out west to Tottori along the Sea of Japan, then back along the coast then south along the edge of Kyoto.<p>It was an interesting trip in many ways, but mostly for the sand dune beach of Tottori. Like Godzilla emerging from the Pacific, this beach comes out of nowhere and sits oblivious of anything but it''s bad sandy self, perhaps 1 km deep and 2 km wide. And obliviousness seems to be its major attraction. </p><p>Oblivious to the <strong>fact that they are in Japan </strong> tourists come to take photos and then tell their friends about their "desert experience." I even heard rumors that some entropreneurs brought camels to the beach for photo opportunistic tourists. Forget that camels don''t grow in Japan. Forget that they are mean tempered and like to spit. If a sandy beach looks like a desert, then by golly, camels belong there! </p><p>Truth is now less important than preconceived notions in Japan. And thus, the ''real'' Japan is being marginalized by those who value photographs more than experience. So in protest, no new photos for you! </p>', '<p>I guess Mother Nature was trying to make up for the overcast and cold weather this summer with warm and sunny weather this past weekend when I went touring for the last time this season. Me and Lala (my Yamaha Diversion 400) made it from Nara out west to Tottori along the Sea of Japan, then back along the coast then south along the edge of Kyoto.<p>It was an interesting trip in many ways, but mostly for the sand dune beach of Tottori. Like Godzilla emerging from the Pacific, this beach comes out of nowhere and sits oblivious of anything but it&#8217;s bad sandy self, perhaps 1 km deep and 2 km wide. And obliviousness seems to be its major attraction. </p><p>Oblivious to the <strong>fact that they are in Japan </strong> tourists come to take photos and then tell their friends about their &#8220;desert experience.&#8221; I even heard rumors that some entropreneurs brought camels to the beach for photo opportunistic tourists. Forget that camels don&#8217;t grow in Japan. Forget that they are mean tempered and like to spit. If a sandy beach looks like a desert, then by golly, camels belong there! </p><p>Truth is now less important than preconceived notions in Japan. And thus, the &#8216;real&#8217; Japan is being marginalized by those who value photographs more than experience. So in protest, no new photos for you! </p>', '2002-10-16 20:51:19+01', '2008-03-11 11:51:24+00', 2002, 10, NULL, NULL, 1, NULL, '2002-10-16 20:51:19+01');
INSERT INTO blogs VALUES (49, 'Shrinkage', 'shrinkage', '<p>I couldn''t have said it better. This was swipped from <a href="http://www.onion.com">The Onion </a>:<p><strong>Tokyo Squeezes In Five More Residents </strong> TOKYO?Tokyo somehow managed to squeeze in five more residents Monday, when the Takashi family moved into a converted studio apartment. "This was a one-bedroom apartment housing a family of six, but a wall was cleverly constructed to create a small studio," city planning minister Hideki Kumagai said. "This was good: We rarely can fit new citizenry into our city without drilling into the bedrock." The Takashi family, brought in from Osaka''s overflow, will pay the equivalent of $12,600 monthly for 144 square feet of living space. </p><p>On a similar yet opposite note, there are about a hundred less people in my town of 2000 people now than when I arrived. There are more people attending funerals than baby showers, and those that aren''t attending are either leaving town for high school, college, or their career. Strange to want to invest my future in a country that has been shrinking in more ways than one for the past decade.  </p>', '<p>I couldn&#8217;t have said it better. This was swipped from <a href="http://www.onion.com">The Onion </a>:<p><strong>Tokyo Squeezes In Five More Residents </strong> TOKYO?Tokyo somehow managed to squeeze in five more residents Monday, when the Takashi family moved into a converted studio apartment. &#8220;This was a one-bedroom apartment housing a family of six, but a wall was cleverly constructed to create a small studio,&#8221; city planning minister Hideki Kumagai said. &#8220;This was good: We rarely can fit new citizenry into our city without drilling into the bedrock.&#8221; The Takashi family, brought in from Osaka&#8217;s overflow, will pay the equivalent of $12,600 monthly for 144 square feet of living space. </p><p>On a similar yet opposite note, there are about a hundred less people in my town of 2000 people now than when I arrived. There are more people attending funerals than baby showers, and those that aren&#8217;t attending are either leaving town for high school, college, or their career. Strange to want to invest my future in a country that has been shrinking in more ways than one for the past decade.  </p>', '2002-10-06 18:15:50+01', '2008-03-11 11:51:24+00', 2002, 10, NULL, NULL, 1, NULL, '2002-10-06 18:15:50+01');
INSERT INTO blogs VALUES (50, 'Between the Eyes', 'between_the_eyes', '<p>I''ll tell you a story if you promise not to ask for details.<p>I was sitting in my room tonight playing with my staple gun. I pointed it at the wall seven feet away and pulled the trigger. The snap of the spring and the slight recoil sent my mind spinning. I was traveling backwards in time, back to this morning''s sports festival, where in the eleventh event parents and first graders played a game where the children had themselves individually stuffed and tied inside large sacks. At the sound of the whistle, the parents ran up, chose a sack, carried it and the child 15 yards, opened the sack and checked to see if the child is theirs, and if not, returned to the guessing game again. </p><p>This bizarro game reminded me of one of my favorite games when I was younger: the fan game. I would soothingly call to my younger brother to come over to where I was standing (conveniently under a spinning ceiling fan). I would then prod him to dare me to see how high I could lift him to the ceiling. Unfortunately, he cought on quickly and I didn''t get a chance to play the game more than once. </p><p>From here my memories spiraled back towards kindergarten, but not fast enough for me not to realize what was happening. As the epiphany hit I started to mouth the words "My life is flashing before my ..." when my trance was broken by a pricking sensation that was caused by the staple that in a split second had bounced off the wall I had fired it at to hit me square between the eyes. True story. </p>', '<p>I&#8217;ll tell you a story if you promise not to ask for details.<p>I was sitting in my room tonight playing with my staple gun. I pointed it at the wall seven feet away and pulled the trigger. The snap of the spring and the slight recoil sent my mind spinning. I was traveling backwards in time, back to this morning&#8217;s sports festival, where in the eleventh event parents and first graders played a game where the children had themselves individually stuffed and tied inside large sacks. At the sound of the whistle, the parents ran up, chose a sack, carried it and the child 15 yards, opened the sack and checked to see if the child is theirs, and if not, returned to the guessing game again. </p><p>This bizarro game reminded me of one of my favorite games when I was younger: the fan game. I would soothingly call to my younger brother to come over to where I was standing (conveniently under a spinning ceiling fan). I would then prod him to dare me to see how high I could lift him to the ceiling. Unfortunately, he cought on quickly and I didn&#8217;t get a chance to play the game more than once. </p><p>From here my memories spiraled back towards kindergarten, but not fast enough for me not to realize what was happening. As the epiphany hit I started to mouth the words &#8220;My life is flashing before my &#8230;&#8221; when my trance was broken by a pricking sensation that was caused by the staple that in a split second had bounced off the wall I had fired it at to hit me square between the eyes. True story. </p>', '2002-09-29 01:59:15+01', '2008-03-11 11:51:24+00', 2002, 9, NULL, NULL, 1, NULL, '2002-09-29 01:59:15+01');
INSERT INTO blogs VALUES (53, 'Transition', 'transition', '<p>The summer solstice has come and gone, summer vacation is coming and going, and while I will physically be gone shortly, my mind had been gone for the past month.<p>Japanese students take final exams three weeks before the end of the semester, which means that the last few weeks of school not nearly as cramped or hectic as their American counterpart. This is quite nice for a week, but three weeks of no mental or career stimulation has caused my brain to atrophy. </p><p>At the same time, everyone and their uncle has decided to come to Tenkawa for vacation due to the cooler weather. Unfortunately, the combination of the surrounding mountains that trap the air in the valley along with the mass of sweaty vagabonds has made Tenkawa a sweltering jungle of humanity. The temperature here is just as hot as my cabin fever. </p><p>But I have a solution. I''m going to Canada. <a href="http://www.brinkster.com/canada.html">Rumor has it </a> that there is no racism in Canada where all 400 million residents work together in the throbbing economy and live together in the absence of crime. Sounds like my kind of utopia! </p>', '<p>The summer solstice has come and gone, summer vacation is coming and going, and while I will physically be gone shortly, my mind had been gone for the past month.<p>Japanese students take final exams three weeks before the end of the semester, which means that the last few weeks of school not nearly as cramped or hectic as their American counterpart. This is quite nice for a week, but three weeks of no mental or career stimulation has caused my brain to atrophy. </p><p>At the same time, everyone and their uncle has decided to come to Tenkawa for vacation due to the cooler weather. Unfortunately, the combination of the surrounding mountains that trap the air in the valley along with the mass of sweaty vagabonds has made Tenkawa a sweltering jungle of humanity. The temperature here is just as hot as my cabin fever. </p><p>But I have a solution. I&#8217;m going to Canada. <a href="http://www.brinkster.com/canada.html">Rumor has it </a> that there is no racism in Canada where all 400 million residents work together in the throbbing economy and live together in the absence of crime. Sounds like my kind of utopia! </p>', '2002-07-27 15:12:25+01', '2008-03-11 11:51:24+00', 2002, 7, NULL, NULL, 1, NULL, '2002-07-27 15:12:25+01');
INSERT INTO blogs VALUES (52, 'Back in the Saddle', 'back_in_the_saddle', '<p>"I can see by your outfit, you must be a cowboy." I must be wearing the wrong clothes. I grew a beard and mustache in order to look older for summer vacation, and it worked to some extent. Instead of being mistaken for a high school student, I got asked if I was a college student. </p><p>The polite answer was always "No, I am an English teacher." And now I truly am, once again, after having said "goodbye" to my last summer vacation ever and "hello" to one more year in Japan. It feels good to be back in the saddle again. I have a new study agenda for improving my Japanese, new motivation for becoming a better teacher, and a new ASP powered web site to make updates smoother. Now if only I had a plan for the future. Suggestions? </p>', '<p>&#8220;I can see by your outfit, you must be a cowboy.&#8221; I must be wearing the wrong clothes. I grew a beard and mustache in order to look older for summer vacation, and it worked to some extent. Instead of being mistaken for a high school student, I got asked if I was a college student. </p><p>The polite answer was always &#8220;No, I am an English teacher.&#8221; And now I truly am, once again, after having said &#8220;goodbye&#8221; to my last summer vacation ever and &#8220;hello&#8221; to one more year in Japan. It feels good to be back in the saddle again. I have a new study agenda for improving my Japanese, new motivation for becoming a better teacher, and a new <span class="caps">ASP</span> powered web site to make updates smoother. Now if only I had a plan for the future. Suggestions? </p>', '2002-09-03 04:44:45+01', '2008-03-11 11:51:24+00', 2002, 9, NULL, NULL, 1, NULL, '2002-09-03 04:44:45+01');
INSERT INTO blogs VALUES (55, '9 months, 21 days', '9_months,_21_days', '<p>This Sunday the 26th I will return to the United States for the first time since arriving in Japan. It will be the first time I have been home since Christmas of 2000/. / A nd: i:t is all for my baby brother, Paul, who is graduating from Hoover High School on the following Thursday. He will be matriculating at Birmingham Southern this fall.<p>Time they are a'' changin''. But some things never change. Like the thrill, convenience, and natural pleasure of "going" outside. I will admit that us Wheeler boys had a penchant for marking our territory outside when we were younger, but never have I known someone to be so enthusiastic about it as old Japanese men seem to be. </p><p>By my calculations, Tenkawa must be one of the biggest outdoor urinals in all of Japan, second only behind Totsukawa, the largest village in Japan. When I drive, I don''t watch the road for wildlive; I look out for grandpa. He is easy to spot since he uses no discression at all, peeing in the rice field, wizzin'' into the river, or staining a tree. Stand in one place too long and he might try to paint you yellow, too! </p><p>Next week, I will write about my theory on why the water tastes funny. </p>', '<p>This Sunday the 26th I will return to the United States for the first time since arriving in Japan. It will be the first time I have been home since Christmas of 2000/. / A nd: i:t is all for my baby brother, Paul, who is graduating from Hoover High School on the following Thursday. He will be matriculating at Birmingham Southern this fall.<p>Time they are a&#8217; changin&#8217;. But some things never change. Like the thrill, convenience, and natural pleasure of &#8220;going&#8221; outside. I will admit that us Wheeler boys had a penchant for marking our territory outside when we were younger, but never have I known someone to be so enthusiastic about it as old Japanese men seem to be. </p><p>By my calculations, Tenkawa must be one of the biggest outdoor urinals in all of Japan, second only behind Totsukawa, the largest village in Japan. When I drive, I don&#8217;t watch the road for wildlive; I look out for grandpa. He is easy to spot since he uses no discression at all, peeing in the rice field, wizzin&#8217; into the river, or staining a tree. Stand in one place too long and he might try to paint you yellow, too! </p><p>Next week, I will write about my theory on why the water tastes funny. </p>', '2002-05-25 08:57:26+01', '2008-03-11 11:51:24+00', 2002, 5, NULL, NULL, 1, NULL, '2002-05-25 08:57:26+01');
INSERT INTO blogs VALUES (56, 'Times they are a changin''', 'times_they_are_a_changin''', '<p>More minor updates, this time to my journal page. The colors have stayed the same but the underpinnings have changed. I am phasing out my use of Perl in favor of PHP. Now a PHP script is running this page, allowing you, the viewer, greater flexability for your viewing pleasure.<p>Now what you think! </p>', '<p>More minor updates, this time to my journal page. The colors have stayed the same but the underpinnings have changed. I am phasing out my use of Perl in favor of <span class="caps">PHP</span>. Now a <span class="caps">PHP</span> script is running this page, allowing you, the viewer, greater flexability for your viewing pleasure.<p>Now what you think! </p>', '2002-05-19 15:04:58+01', '2008-03-11 11:51:24+00', 2002, 5, NULL, NULL, 1, NULL, '2002-05-19 15:04:58+01');
INSERT INTO blogs VALUES (61, 'Spring has Sprung', 'spring_has_sprung', '<p>The parents came, saw, and almost conquered Japan, but were driven back by raw strength of the Japanese (or rather, the raw food). Next up to bat is a friend from California; we shall see if Christine has what it takes to stomach all that Japan can dish out!<p>While I have grown accustomed to Japanese food, there are things that never cease to surprise me. I was riding with a friend the other day when a police car with its sirens on and lights flashing drove past us going the speed limit. I commented that the police in Japan never seem to be in a hurry to go anywhere and are content to stroll down the roads at a leisurly pace while deafening young children with their sirens and sending epileptics into fits with their flashing lights. My Japanese friend looked at me confused and said "If they didn''t drive around with their lights and sirens on, how would we know where they are?" </p><p>Needless to say, my driving record keeps getting better and better over here in Japan. </p>', '<p>The parents came, saw, and almost conquered Japan, but were driven back by raw strength of the Japanese (or rather, the raw food). Next up to bat is a friend from California; we shall see if Christine has what it takes to stomach all that Japan can dish out!<p>While I have grown accustomed to Japanese food, there are things that never cease to surprise me. I was riding with a friend the other day when a police car with its sirens on and lights flashing drove past us going the speed limit. I commented that the police in Japan never seem to be in a hurry to go anywhere and are content to stroll down the roads at a leisurly pace while deafening young children with their sirens and sending epileptics into fits with their flashing lights. My Japanese friend looked at me confused and said &#8220;If they didn&#8217;t drive around with their lights and sirens on, how would we know where they are?&#8221; </p><p>Needless to say, my driving record keeps getting better and better over here in Japan. </p>', '2002-04-22 15:22:33+01', '2008-03-11 11:51:24+00', 2002, 4, NULL, NULL, 1, NULL, '2002-04-22 15:22:33+01');
INSERT INTO blogs VALUES (65, 'Essentials', 'essentials', '<p>My town doesn''t have much. There are no supermarkets in village, there are no pachinko parlors, and there are no McDonald''s (though there is an old, rusty Coca-cola sign). What my town does have, though, is a post office.<p>Those of you familiar with the postal system in Japan know that you can not only send and receive mail, but also save money at the post office. The savings account interest rate is lower than inflation, so you will actually lose money if you only save at a post office, but since you can withdraw money from their cash machines, the post office is the most ubiquitous ATM network in Japan. </p><p>Just because they are in every city, though, doesn''t mean that they are convenient. ATM still stands for "Automatic Teller Machine," not "Any-Time Machine," which means that ATMs often keep worse hours than banks do, opening after 9:00 and closing before 5:00. If they do happen to be accessible outside of those hours, there is usually a fee, even if you belong to the bank that operates the machine! And if you want cash on the weekend, convenient is the last word on your mind. </p><p>ATMs in Japan do have one advantage over their American counterparts. When I about to purchase my motorcycle, it took five days to withdraw the amount of money I needed to purchase my bike ($200 /a /da y :wi:thdrawal limit). Yesterday, though, I withdrew 500,000 yen, which is about four thousand dollars. Guess what I stuffed into my pillowcase to sleep on last night! </p>', '<p>My town doesn&#8217;t have much. There are no supermarkets in village, there are no pachinko parlors, and there are no McDonald&#8217;s (though there is an old, rusty Coca-cola sign). What my town does have, though, is a post office.<p>Those of you familiar with the postal system in Japan know that you can not only send and receive mail, but also save money at the post office. The savings account interest rate is lower than inflation, so you will actually lose money if you only save at a post office, but since you can withdraw money from their cash machines, the post office is the most ubiquitous <span class="caps">ATM</span> network in Japan. </p><p>Just because they are in every city, though, doesn&#8217;t mean that they are convenient. <span class="caps">ATM</span> still stands for &#8220;Automatic Teller Machine,&#8221; not &#8220;Any-Time Machine,&#8221; which means that ATMs often keep worse hours than banks do, opening after 9:00 and closing before 5:00. If they do happen to be accessible outside of those hours, there is usually a fee, even if you belong to the bank that operates the machine! And if you want cash on the weekend, convenient is the last word on your mind. </p><p>ATMs in Japan do have one advantage over their American counterparts. When I about to purchase my motorcycle, it took five days to withdraw the amount of money I needed to purchase my bike ($200 /a /da y :wi:thdrawal limit). Yesterday, though, I withdrew 500,000 yen, which is about four thousand dollars. Guess what I stuffed into my pillowcase to sleep on last night! </p>', '2002-03-04 23:54:37+00', '2008-03-11 11:51:24+00', 2002, 3, NULL, NULL, 1, NULL, '2002-03-04 23:54:37+00');
INSERT INTO blogs VALUES (67, 'Department of Transportation', 'department_of_transportation', '<p>When it snows, do they plow the roads in Japan?. But of course, it isn''t as easy as that. If you look carefully, you might actually see a yellow-plate truck (i.e. its engine is smaller than 500ccs) with a snow shovel bandaged to the front fender struggling against a foot of snow that is blanketing the road. Or maybe you will see someone placing bags of rock salt alongside the road so that whoever comes by and gets stuck, while waiting to become unstuck, can salt the road for other drivers. And there is the ever optimistic outlook that spring is just (read also two months) around the corner, which means that the sun will soon enough take the place of snow shovels and rock salt. These are all good solutions, though none acknowledge the needs of time-concious drivers </td>', '<p>When it snows, do they plow the roads in Japan?. But of course, it isn&#8217;t as easy as that. If you look carefully, you might actually see a yellow-plate truck (i.e. its engine is smaller than 500ccs) with a snow shovel bandaged to the front fender struggling against a foot of snow that is blanketing the road. Or maybe you will see someone placing bags of rock salt alongside the road so that whoever comes by and gets stuck, while waiting to become unstuck, can salt the road for other drivers. And there is the ever optimistic outlook that spring is just (read also two months) around the corner, which means that the sun will soon enough take the place of snow shovels and rock salt. These are all good solutions, though none acknowledge the needs of time-concious drivers </td>', '2002-01-15 03:00:00+00', '2008-03-11 11:51:24+00', 2002, 1, NULL, NULL, 1, NULL, '2002-01-15 03:00:00+00');
INSERT INTO blogs VALUES (70, 'All the leaves are brown...', 'all_the_leaves_are_brown...', '<p>Yes, the leaves here in Japan do change color as well. In fact, my quaint little mountain village is quite popular for its changing leaves. We are having a festival this weekend "Momijimatsuri" to watch the leaves change, and all of you are invited! Of course, if you can''t make it to our leaf watching festival, there is the wild and crazy Acrylic Festival in February when we watch paint dry, and then Green Day in April where we watch grass grow.Rural Japan is full of wonder and excitement. But it isn''t just nature that is astounding up here. The biker gangs also command awe and respect from humble citizens like myself. These street tough rough necks don''t ride Harleys, though. They ride 50cc Kawasaki scooters with black enameled baskets on the front, which makes a rider look like one mean mother. Actually, grandmother would be more correct, since they are all 65 and older. If you get up early enough on Saturday morning, you can hear their high pitched squeel peeling down the road, carrying branches for burning or one too many persimmons, but if you are out looking for them past 6pm, forget about it. Their bedtime coincides with the setting of the sun, which right now is around 4:45. Ride granny ride...', '<p>Yes, the leaves here in Japan do change color as well. In fact, my quaint little mountain village is quite popular for its changing leaves. We are having a festival this weekend &#8220;Momijimatsuri&#8221; to watch the leaves change, and all of you are invited! Of course, if you can&#8217;t make it to our leaf watching festival, there is the wild and crazy Acrylic Festival in February when we watch paint dry, and then Green Day in April where we watch grass grow.Rural Japan is full of wonder and excitement. But it isn&#8217;t just nature that is astounding up here. The biker gangs also command awe and respect from humble citizens like myself. These street tough rough necks don&#8217;t ride Harleys, though. They ride 50cc Kawasaki scooters with black enameled baskets on the front, which makes a rider look like one mean mother. Actually, grandmother would be more correct, since they are all 65 and older. If you get up early enough on Saturday morning, you can hear their high pitched squeel peeling down the road, carrying branches for burning or one too many persimmons, but if you are out looking for them past 6pm, forget about it. Their bedtime coincides with the setting of the sun, which right now is around 4:45. Ride granny ride&#8230;', '2001-10-29 03:50:30+00', '2008-03-11 11:51:24+00', 2001, 10, NULL, NULL, 1, NULL, '2001-10-29 03:50:30+00');
INSERT INTO blogs VALUES (73, 'New York to Osaka', 'new_york_to_osaka', '<p>Here in Japan, on the other side of the International Date Line, I am 14 hours ahead of the east coast. Thus, for those living in New York, I am actually living in the future. Unfortunately, such circumstances prevented me from seeing and warning everyone about the four hijacked airplanes.<p>Everyone has been abuzz about what happened on the morning (or evening, for me) of the 11th, even here in rural Japan. And other than Alabama, I must say that there is no place that I would rather be. The outpouring of comfort and sympathy for me, my family, friends, and fellow Americans has been so great and inspiring that I almost feel more at home here, being accepted despite my differences, than in the states, where the confusion has let some to act violently against innocent Muslims. So, to all who are curious, I am healthy and well taken care of. I, along with my 2800 other villagers, are keeping all of you in our prayers and thoughts. </p>', '<p>Here in Japan, on the other side of the International Date Line, I am 14 hours ahead of the east coast. Thus, for those living in New York, I am actually living in the future. Unfortunately, such circumstances prevented me from seeing and warning everyone about the four hijacked airplanes.<p>Everyone has been abuzz about what happened on the morning (or evening, for me) of the 11th, even here in rural Japan. And other than Alabama, I must say that there is no place that I would rather be. The outpouring of comfort and sympathy for me, my family, friends, and fellow Americans has been so great and inspiring that I almost feel more at home here, being accepted despite my differences, than in the states, where the confusion has let some to act violently against innocent Muslims. So, to all who are curious, I am healthy and well taken care of. I, along with my 2800 other villagers, are keeping all of you in our prayers and thoughts. </p>', '2001-09-12 02:20:47+01', '2008-03-11 11:51:24+00', 2001, 9, NULL, NULL, 1, NULL, '2001-09-12 02:20:47+01');
INSERT INTO blogs VALUES (74, 'It''s Official', 'it''s_official', '<p>I am now a full fledged teacher, and after tonight, I will have survived all of my initiations. I am at three different schools throughout the week. On Monday and Tuesday, I walk across a dirt baseball field to Tenkawa Junior High where I teach two classes a day. There are about forty students there, and at the rate I am going, I should have their names memorized in about a year.<p>Wednesdays and Thursdays take me to Dorogawa Junior High School where I have about twenty names to learn. The classes are quite small, with only four students in the thrid year class. They are sweet, though, and have a lust for learning. </p><p>Fridays are spent at Kurotaki Junior High School, where there are about 35 new faces. They are a bit rowdy, but fun to play games with. I have been able to use my sticking-out-as-a-foreigner to my benefit to get their attention, and I predict that by the end of my first year here not only will everyone be speaking English, but they will also have blonde hair and blue eyes! </p>', '<p>I am now a full fledged teacher, and after tonight, I will have survived all of my initiations. I am at three different schools throughout the week. On Monday and Tuesday, I walk across a dirt baseball field to Tenkawa Junior High where I teach two classes a day. There are about forty students there, and at the rate I am going, I should have their names memorized in about a year.<p>Wednesdays and Thursdays take me to Dorogawa Junior High School where I have about twenty names to learn. The classes are quite small, with only four students in the thrid year class. They are sweet, though, and have a lust for learning. </p><p>Fridays are spent at Kurotaki Junior High School, where there are about 35 new faces. They are a bit rowdy, but fun to play games with. I have been able to use my sticking-out-as-a-foreigner to my benefit to get their attention, and I predict that by the end of my first year here not only will everyone be speaking English, but they will also have blonde hair and blue eyes! </p>', '2001-09-06 19:01:14+01', '2008-03-11 11:51:24+00', 2001, 9, NULL, NULL, 1, NULL, '2001-09-06 19:01:14+01');
INSERT INTO blogs VALUES (78, 'New Web Site!', 'new_web_site!', '<p>It took me long enough, but I finally got around to updating my web site. Inspired by the blues in the waters surrounding Hawaii, my new site no longer black and white, but rather indigo and aqua.<p>Affairs in Hawaii are anything but blue; I have started to surf more avidly, though minor injuries keep putting me out of commission for a few days. I have also been out more recently, hiking a bit along the north shore of Kauai, checking out the beaches on the east coast, and seeing some killer sunsets on the western shore. I am only here for another week and a half, then Oahu for a few days before I depart for Japan. So for all of you planning a visit, you better finalize your plans now!', '<p>It took me long enough, but I finally got around to updating my web site. Inspired by the blues in the waters surrounding Hawaii, my new site no longer black and white, but rather indigo and aqua.<p>Affairs in Hawaii are anything but blue; I have started to surf more avidly, though minor injuries keep putting me out of commission for a few days. I have also been out more recently, hiking a bit along the north shore of Kauai, checking out the beaches on the east coast, and seeing some killer sunsets on the western shore. I am only here for another week and a half, then Oahu for a few days before I depart for Japan. So for all of you planning a visit, you better finalize your plans now!', '2001-07-23 20:39:42+01', '2008-03-11 11:51:24+00', 2001, 7, NULL, NULL, 1, NULL, '2001-07-23 20:39:42+01');
INSERT INTO blogs VALUES (84, 'Community Building', 'community-building', 'Freshman year at college is everyone''s golden age when it comes to community development and participation.  How can you do anything but not be involved when you''re surrounded by so many new and eager faces, presented with so many different opportunities, and have a seemingly endless amount of free time and raw energy?

It''s hard to duplicate the freshman experience anywhere else.  The coordination, the numbers, and the means are hard to find in the adult world.  Plus, with the demands of a career in programming, many things take a back seat to the frenzied pace of software development.  The time you could commit during college just isn''t available any more.

I''ve been looking for this community experience for several years now.  I''ve worked in some great, friendly and supportive work environments, but the numbers have always been small and the pressure has always been intense.  That''s why when I came across the <a href="http://gigs.37signals.com/gigs/207">job posting</a> to work for <a href="http://tribewanted.com">TribeWanted.com</a>, my attention was piqued.  The job is not only part of a community, the job is to help build the community.  I''m not just part of the community experience; I''m actually getting to help shape the experience!

M and I will be moving to Fiji early this summer to fully immerse ourselves in this exciting opportunity.  I''ll be splitting my time between Vorovoro and Suva (the capital), where I''ll be working with the team at <a href="http://oceanic.com.fj">Oceanic</a>.  I''ve started putting a few points on <a href="http://maps.google.com/maps/ms?ie=UTF8&hl=en&msa=0&msid=106261184402795841120.00000112c54b2a9b5981c">my Google map of Fiji</a>.  With the timing, we''ll have two winters this year since winter is just now starting south of the equator.  Fortunately, the highs in Fiji are around 30C (90ish F), so the only winter clothes we''ll take are some knee length bathing suits!  Exciting times!', '<p>Freshman year at college is everyone&#8217;s golden age when it comes to community development and participation.  How can you do anything but not be involved when you&#8217;re surrounded by so many new and eager faces, presented with so many different opportunities, and have a seemingly endless amount of free time and raw energy?</p>


	<p>It&#8217;s hard to duplicate the freshman experience anywhere else.  The coordination, the numbers, and the means are hard to find in the adult world.  Plus, with the demands of a career in programming, many things take a back seat to the frenzied pace of software development.  The time you could commit during college just isn&#8217;t available any more.</p>


	<p>I&#8217;ve been looking for this community experience for several years now.  I&#8217;ve worked in some great, friendly and supportive work environments, but the numbers have always been small and the pressure has always been intense.  That&#8217;s why when I came across the <a href="http://gigs.37signals.com/gigs/207">job posting</a> to work for <a href="http://tribewanted.com">TribeWanted.com</a>, my attention was piqued.  The job is not only part of a community, the job is to help build the community.  I&#8217;m not just part of the community experience; I&#8217;m actually getting to help shape the experience!</p>


	<p>M and I will be moving to Fiji early this summer to fully immerse ourselves in this exciting opportunity.  I&#8217;ll be splitting my time between Vorovoro and Suva (the capital), where I&#8217;ll be working with the team at <a href="http://oceanic.com.fj">Oceanic</a>.  I&#8217;ve started putting a few points on <a href="http://maps.google.com/maps/ms?ie=UTF8&#38;hl=en&#38;msa=0&#38;msid=106261184402795841120.00000112c54b2a9b5981c">my Google map of Fiji</a>.  With the timing, we&#8217;ll have two winters this year since winter is just now starting south of the equator.  Fortunately, the highs in Fiji are around 30C (90ish F), so the only winter clothes we&#8217;ll take are some knee length bathing suits!  Exciting times!</p>', '2007-05-27 03:39:36+01', '2008-03-11 11:51:24+00', 2007, 5, NULL, NULL, 1, NULL, '2007-05-27 03:39:36+01');
INSERT INTO blogs VALUES (87, 'Marriage recommendations', 'marriage-recommendations', 'I''ve been married now for one month, 27 days, 5 hours, and 24 minutes.  And I''m still waiting for things to change.  Not because I''m unhappy, but because I feel like I''ve been lied to all of these years by Hollywood and the media.  People say that they''re both liberal hornets nests, but given the way they portray the nuclear family, I''d say they are conservatives in disguise!

For the past 2,352,240 married seconds of my life, not once has the Mrs. served me coffee and toast in the morning, not once have the kids been late to catch the bus, never have I brought home "the bacon" (though I haven''t officially been employed for the past six weeks), and M must have misplaced her pinafore, because I can''t think of any other reason she''s not baking loaves of bread or leaving apple pies to cool on the windowsill.

But despite all of these shattered stereotypes, married life for me is the good life.  Looking back on how we got here, I''m reminded of all of the advice nameless husbands gave me growing up: "have children before you''re 30;" "don''t let your wife know there''s a baby changing table in the men''s room;" "one word: plastics;" "I highly recommend marriage."  So when a friend asked me the other day what I thought of married life, I almost regurgitated one of these catch phrases.

But I realized that I''m in no position to recommend marriage to someone else.  The only recommendation that I can honestly speak on is marriage to my wife, and I''m not about to recommend that anyone else marries her!  With so many people getting married for the wrong reasons, it seems reckless to recommend marriage to others.  Committing your life to someone you love, on the other hand, I think is a fairly safe recommendation.  So to each his own: his own pace, his own wife, and his own life!', '<p>I&#8217;ve been married now for one month, 27 days, 5 hours, and 24 minutes.  And I&#8217;m still waiting for things to change.  Not because I&#8217;m unhappy, but because I feel like I&#8217;ve been lied to all of these years by Hollywood and the media.  People say that they&#8217;re both liberal hornets nests, but given the way they portray the nuclear family, I&#8217;d say they are conservatives in disguise!</p>


	<p>For the past 2,352,240 married seconds of my life, not once has the Mrs. served me coffee and toast in the morning, not once have the kids been late to catch the bus, never have I brought home &#8220;the bacon&#8221; (though I haven&#8217;t officially been employed for the past six weeks), and M must have misplaced her pinafore, because I can&#8217;t think of any other reason she&#8217;s not baking loaves of bread or leaving apple pies to cool on the windowsill.</p>


	<p>But despite all of these shattered stereotypes, married life for me is the good life.  Looking back on how we got here, I&#8217;m reminded of all of the advice nameless husbands gave me growing up: &#8220;have children before you&#8217;re 30;&#8221; &#8220;don&#8217;t let your wife know there&#8217;s a baby changing table in the men&#8217;s room;&#8221; &#8220;one word: plastics;&#8221; &#8220;I highly recommend marriage.&#8221;  So when a friend asked me the other day what I thought of married life, I almost regurgitated one of these catch phrases.</p>


	<p>But I realized that I&#8217;m in no position to recommend marriage to someone else.  The only recommendation that I can honestly speak on is marriage to my wife, and I&#8217;m not about to recommend that anyone else marries her!  With so many people getting married for the wrong reasons, it seems reckless to recommend marriage to others.  Committing your life to someone you love, on the other hand, I think is a fairly safe recommendation.  So to each his own: his own pace, his own wife, and his own life!</p>', '2007-06-21 01:47:05+01', '2008-03-11 11:51:24+00', 2007, 6, NULL, NULL, 1, NULL, '2007-06-21 01:47:05+01');
INSERT INTO blogs VALUES (89, 'What did I do?', 'what-did-i-do', 'Before heading to Fiji to work with "Tribewanted":http://www.tribewanted.com, I got a lot of questions, the main one being "WHAT? ! ? !"  After the dust settled from my original announcement, however, the questions became a bit more articulate. "Where will you be?"  "How long will you be there?"  "What will you be doing?"  "Yeah, but what will you be doing?"

Before departing it was difficult to correctly answer the last question.  Often, when people asked what I''d be doing, I''d describe typical IT work and how it usually maroons professionals in an island chain of cubicles, each it''s own private island.  So if I was building websites and changing the face of the internet, it didn''t much matter whether I was on a virtual island or a real one.  Some pointed out that the lack of power and an internet connection might make a difference.  I agreed, but tried not to focus on these minor technicalities, and instead would draw the conversation back to the bigger picture of working in Fiji.

The big picture did little to answer the reoccurring question of "Yeah, but what will you be doing?"  As it ends up - a little bit of everything.  And in lieu of the broken big picture that did very little to answer the question before, here are a series of small pictures that should better approximate my life on Vorovoro.  Choose five to ten of the small sentence fragment snapshots below and you''ve got a typical day.

* Waking up in a coconut-frond thatched hut shaded by wind-blown trees and backed up by a 20 foot stone cliff and looking out the 9 " x 3'' window ten yards down the beach to the ocean.
* Disguising a quick walk to the compost toilets as a casual morning stroll while dodging chickens that have been awake since 4am.
* Checking automated emails received on a Blackberry mobile to see if there have been any server crashes overnight.
* Sitting down with a dozen other tribe members and discussing our dislike of the non-biting yet ubiquitously annoying ants over one of our five daily meals (being a British operation, there are two tea times during the day + 3 regular meals)
* Frantically looking for and finding my sandals that I haven''t worn in 3 days as the boat into town threatens to leave me behind.
* Hunkered down trying to read the last Harry Potter book on a 10 foot boat powered by a 40hp engine for thirty minute commute into Labasa where power and internet can be found.
* Walking through town during lunch, trying to decide which greasy Chinese restaurant to eat at while trying to blend in amongst the throngs of Fijians and Indo-Fijians on the sidewalks (which are equally congested with people as the streets are with cars)
* Heading to the only internet cafe after packing my computer and change of clothes into my bag as we''re informed that the boardroom at the hotel today won''t be at our disposal.
* Biting my tongue while listening to the cab driver (5 minute ride ~$1.50 FJD) espouse the benefits of polygamy, the majesty of the local HIbiscus Fair, and then ask me if I had change smaller than the $2 bill I''d given him, then waiting by the side of the road for another cab to break the $2 bill for change.
* Taking pictures - [lots and lots of pictures](http://flickr.com/people/fightinjoe)
* Meeting new arrivals, taking them into the market to buy a bundle of yagona roots as a token gift for the chief, explaining how a sarong is called a sulu in Fiji, and carting luggage to the jetty to watch the tide go out and wait for boat.
* Taking off my shirt, hopping in the boat, and getting settled to read my book, looking up when we reach the mouth of the river and can see Vorovoro 15 minutes away from us halfway between the horizon.
* Gardening, picking up trash, gathering firewood, washing dishes, foraging for flowers and leaves for our meke (tribal dance) outfits, raking leaves, bathing in the sea, brushing my teeth on the edge of the ocean from water in water bottle, watching the phosphorescence light up with little blips of purple as the waves disturb the water in the middle of the night
* Watching the slow sweeping of the Milky Way across the sky while trying to mentally match up the phases of the moon with the tides for tomorrow (high tide in the morning was perfect for a morning bath, while in the evening you''d be refreshed for dinner)
* Sitting around the fire or kava bowl, legs falling asleep, chatting with friends, listening to the singing of the local Fijians relaxing after a long day of work.', '<p>Before heading to Fiji to work with <a href="http://www.tribewanted.com">Tribewanted</a>, I got a lot of questions, the main one being &#8220;WHAT? ! ? !&#8221;  After the dust settled from my original announcement, however, the questions became a bit more articulate. &#8220;Where will you be?&#8221;  &#8220;How long will you be there?&#8221;  &#8220;What will you be doing?&#8221;  &#8220;Yeah, but what will you be doing?&#8221;</p>


	<p>Before departing it was difficult to correctly answer the last question.  Often, when people asked what I&#8217;d be doing, I&#8217;d describe typical IT work and how it usually maroons professionals in an island chain of cubicles, each it&#8217;s own private island.  So if I was building websites and changing the face of the internet, it didn&#8217;t much matter whether I was on a virtual island or a real one.  Some pointed out that the lack of power and an internet connection might make a difference.  I agreed, but tried not to focus on these minor technicalities, and instead would draw the conversation back to the bigger picture of working in Fiji.</p>


	<p>The big picture did little to answer the reoccurring question of &#8220;Yeah, but what will you be doing?&#8221;  As it ends up &#8211; a little bit of everything.  And in lieu of the broken big picture that did very little to answer the question before, here are a series of small pictures that should better approximate my life on Vorovoro.  Choose five to ten of the small sentence fragment snapshots below and you&#8217;ve got a typical day.</p>


	<ul>
	<li>Waking up in a coconut-frond thatched hut shaded by wind-blown trees and backed up by a 20 foot stone cliff and looking out the 9 &#8221; x 3&#8217; window ten yards down the beach to the ocean.</li>
		<li>Disguising a quick walk to the compost toilets as a casual morning stroll while dodging chickens that have been awake since 4am.</li>
		<li>Checking automated emails received on a Blackberry mobile to see if there have been any server crashes overnight.</li>
		<li>Sitting down with a dozen other tribe members and discussing our dislike of the non-biting yet ubiquitously annoying ants over one of our five daily meals (being a British operation, there are two tea times during the day + 3 regular meals)</li>
		<li>Frantically looking for and finding my sandals that I haven&#8217;t worn in 3 days as the boat into town threatens to leave me behind.</li>
		<li>Hunkered down trying to read the last Harry Potter book on a 10 foot boat powered by a 40hp engine for thirty minute commute into Labasa where power and internet can be found.</li>
		<li>Walking through town during lunch, trying to decide which greasy Chinese restaurant to eat at while trying to blend in amongst the throngs of Fijians and Indo-Fijians on the sidewalks (which are equally congested with people as the streets are with cars)</li>
		<li>Heading to the only internet cafe after packing my computer and change of clothes into my bag as we&#8217;re informed that the boardroom at the hotel today won&#8217;t be at our disposal.</li>
		<li>Biting my tongue while listening to the cab driver (5 minute ride ~$1.50 <span class="caps">FJD</span>) espouse the benefits of polygamy, the majesty of the local HIbiscus Fair, and then ask me if I had change smaller than the $2 bill I&#8217;d given him, then waiting by the side of the road for another cab to break the $2 bill for change.</li>
		<li>Taking pictures &#8211; <a href="http://flickr.com/people/fightinjoe">lots and lots of pictures</a></li>
		<li>Meeting new arrivals, taking them into the market to buy a bundle of yagona roots as a token gift for the chief, explaining how a sarong is called a sulu in Fiji, and carting luggage to the jetty to watch the tide go out and wait for boat.</li>
		<li>Taking off my shirt, hopping in the boat, and getting settled to read my book, looking up when we reach the mouth of the river and can see Vorovoro 15 minutes away from us halfway between the horizon.</li>
		<li>Gardening, picking up trash, gathering firewood, washing dishes, foraging for flowers and leaves for our meke (tribal dance) outfits, raking leaves, bathing in the sea, brushing my teeth on the edge of the ocean from water in water bottle, watching the phosphorescence light up with little blips of purple as the waves disturb the water in the middle of the night</li>
		<li>Watching the slow sweeping of the Milky Way across the sky while trying to mentally match up the phases of the moon with the tides for tomorrow (high tide in the morning was perfect for a morning bath, while in the evening you&#8217;d be refreshed for dinner)</li>
		<li>Sitting around the fire or kava bowl, legs falling asleep, chatting with friends, listening to the singing of the local Fijians relaxing after a long day of work.</li>
	</ul>', '2007-10-27 12:13:18+01', '2008-03-11 11:51:24+00', 2007, 10, NULL, '2007-12-31 15:00:00+00', 1, NULL, '2007-10-27 12:13:18+01');
INSERT INTO blogs VALUES (7, 'Bear Hunting', 'bear_hunting', '<p>The City of Vancouver has been slowly placing around the city "Spirit Bears."  They are approximately 7'' tall, made of fiberglass, and all painted and decorated differently.  They live all over BC with a concentration of about 50 in the city and will be auctioned off for charity in October.<p>
<p><p>
<p>Masayo and I decided to go on a bear hunt this weekend to see how many we could find.  It took us about 3 hours to track down 23 different bears.  In the photo gallery there is a sample of 9 of them.<p>
<p><p>
<p>Evidently not all of the bears have been placed around the city.  BatBear, for example, is still in hiding, and corners where there are supposed to be multiple bears are vacant.<p>
<p><p>
<p>There''s also about ten that are out of the downtown core.  I''ve never hunted bears by bicycle before, but it should be interesting.<p>
<p><p>
<p>After the hunt, Masayo and I celebrated our long day with a long evening in front of television reruns.  We''ve been re-watching Lost in preparation for the season finale.  I thought it would be appropriate to celebrate our successful day with some Jelly Belly beans.  I decided to race Lost, since it takes me an average of 1 minute to savour one jelly bean, and there were 50 different flavors.<p>
<p><p>
<p>In the end, the jelly beans won.  I felt sick and fell asleep half way through the second episode.  Hard to believe that something as small as a bean (well, 50 of them) was strong enough to fell the mighty bear hunter.', '<p>The City of Vancouver has been slowly placing around the city &#8220;Spirit Bears.&#8221;  They are approximately 7&#8217; tall, made of fiberglass, and all painted and decorated differently.  They live all over BC with a concentration of about 50 in the city and will be auctioned off for charity in October.<p>
<p><p>
<p>Masayo and I decided to go on a bear hunt this weekend to see how many we could find.  It took us about 3 hours to track down 23 different bears.  In the photo gallery there is a sample of 9 of them.<p>
<p><p>
<p>Evidently not all of the bears have been placed around the city.  BatBear, for example, is still in hiding, and corners where there are supposed to be multiple bears are vacant.<p>
<p><p>
<p>There&#8217;s also about ten that are out of the downtown core.  I&#8217;ve never hunted bears by bicycle before, but it should be interesting.<p>
<p><p>
<p>After the hunt, Masayo and I celebrated our long day with a long evening in front of television reruns.  We&#8217;ve been re-watching Lost in preparation for the season finale.  I thought it would be appropriate to celebrate our successful day with some Jelly Belly beans.  I decided to race Lost, since it takes me an average of 1 minute to savour one jelly bean, and there were 50 different flavors.<p>
<p><p>
<p>In the end, the jelly beans won.  I felt sick and fell asleep half way through the second episode.  Hard to believe that something as small as a bean (well, 50 of them) was strong enough to fell the mighty bear hunter.', '2006-05-22 07:57:42+01', '2008-03-11 11:51:23+00', 2006, 5, NULL, NULL, 1, NULL, '2006-05-22 07:57:42+01');
INSERT INTO blogs VALUES (9, 'Full Circle', 'full_circle', '<p>Six months ago I was sleeping on the floor.  The living room was the only room in my apartment for the first month that wasn''t fuming.  When I was painting everything white, the windows were all opened and the ventelation was on high in the bathrooms and the kitchen.  Still, the bedrooms were inhabitable, and thus were closed to the world.<p>
<p><p>
<p>A month was all it took for me to get fed up with painting and assemble my bed for the first full, good nights rest I''d had in a month.  It took another five months for the painting to get finished.<p>
<p><p>
<p>To celebrate six months I bought my first couch.  Ever.  Owning a sofa is like a right of passage into adulthood.  It''s nice and cozy and should last me up until I start to show signs of grumpyness and territorialism when I demand my own recliner that I have to share with no one.<p>
<p><p>
<p>In the back of my mind, though, I''ve been asking what would Tyler Durden do?  The third floor is hardly high enough to trow stuff out the window.  So I''ve decided that just the way that some crazy people collect cats, I''ll collect chairs.  Across three rooms I''ve got 15 chairs.  Musical chairs anyone?  ', '<p>Six months ago I was sleeping on the floor.  The living room was the only room in my apartment for the first month that wasn&#8217;t fuming.  When I was painting everything white, the windows were all opened and the ventelation was on high in the bathrooms and the kitchen.  Still, the bedrooms were inhabitable, and thus were closed to the world.<p>
<p><p>
<p>A month was all it took for me to get fed up with painting and assemble my bed for the first full, good nights rest I&#8217;d had in a month.  It took another five months for the painting to get finished.<p>
<p><p>
<p>To celebrate six months I bought my first couch.  Ever.  Owning a sofa is like a right of passage into adulthood.  It&#8217;s nice and cozy and should last me up until I start to show signs of grumpyness and territorialism when I demand my own recliner that I have to share with no one.<p>
<p><p>
<p>In the back of my mind, though, I&#8217;ve been asking what would Tyler Durden do?  The third floor is hardly high enough to trow stuff out the window.  So I&#8217;ve decided that just the way that some crazy people collect cats, I&#8217;ll collect chairs.  Across three rooms I&#8217;ve got 15 chairs.  Musical chairs anyone?', '2006-03-08 21:50:15+00', '2008-03-11 11:51:23+00', 2006, 3, NULL, NULL, 1, NULL, '2006-03-08 21:50:15+00');
INSERT INTO blogs VALUES (13, 'More Pictures!', 'more_pictures!', '<p>Well, not yet, but there will be soon.<p>
<p><p>
<p>I''ve recently ported the backend of my website from PHP to Ruby, and the future is looking bright!  I''ve now got a new way to manage photos and albums, and soon I''ll have a new way for allowing easy access to all of it.<p>
<p><p>
<p>And since pictures are worth a thousand words, this means you won''t have to slog through my meandering posts before you get to the goodies!<p>
<p><p>
<p>As you''ll notice, there are still some unfinished portions of the site.  My hope is that the rough edges will provide motivation for me to be more proactive in updating my site.  Here''s hoping for the best!  Enjoy!', '<p>Well, not yet, but there will be soon.<p>
<p><p>
<p>I&#8217;ve recently ported the backend of my website from <span class="caps">PHP</span> to Ruby, and the future is looking bright!  I&#8217;ve now got a new way to manage photos and albums, and soon I&#8217;ll have a new way for allowing easy access to all of it.<p>
<p><p>
<p>And since pictures are worth a thousand words, this means you won&#8217;t have to slog through my meandering posts before you get to the goodies!<p>
<p><p>
<p>As you&#8217;ll notice, there are still some unfinished portions of the site.  My hope is that the rough edges will provide motivation for me to be more proactive in updating my site.  Here&#8217;s hoping for the best!  Enjoy!', '2005-04-03 22:36:31+01', '2008-03-11 11:51:23+00', 2005, 4, NULL, NULL, 1, NULL, '2005-04-03 22:36:31+01');
INSERT INTO blogs VALUES (18, 'City of Glass', 'city_of_glass', '<p>The best book that you can read if you want to get a feel for the city of Vancouver, BC, is <span style="text-decoration: underline;">City of Glass</span> by Douglas Copland.  Most travel guides will tell you the places to eat or the best walks through the city but neglect teaching the reader about the city''s heart and soul.  <span style="text-decoration: underline;">City of Glass</span> picks up where the travel guides leave off.</p><p>My experience is currently somewhere in between these two types of books.  I''m slowly learning where NOT to eat, while at the same time starting to understand the tick tock of the town.  The neatest thing to observer, though, is myself easily becoming acustomed to the rhythm of the city.</p><p>Rain, for instance, doesn''t seem to phase me, or anyone else for that matter.  In fact, it is much better than the other alternative throughout the rest of Canada - the frozen dezert winds that cut your face and snows that bury your car.  I''m also learning how to enjoyably get lost riding public transportation.  It only took being yelled at three times before I learned the ropes.  Now, getting lost in the sea of people downtown, or in the forests of preserved parks around town is second nature.</p><p>The only challenge now is distance.  Two hours time difference is nothing, but flying Southwest all day to get home might take its toll.  At least international flights play bad movies to help you fall asleep.  I suppose the only fair solution is to have everyone visit me instead!  Consider yourself invited.', '<p>The best book that you can read if you want to get a feel for the city of Vancouver, BC, is <span style="text-decoration: underline;">City of Glass</span> by Douglas Copland.  Most travel guides will tell you the places to eat or the best walks through the city but neglect teaching the reader about the city&#8217;s heart and soul.  <span style="text-decoration: underline;">City of Glass</span> picks up where the travel guides leave off.</p><p>My experience is currently somewhere in between these two types of books.  I&#8217;m slowly learning where <span class="caps">NOT</span> to eat, while at the same time starting to understand the tick tock of the town.  The neatest thing to observer, though, is myself easily becoming acustomed to the rhythm of the city.</p><p>Rain, for instance, doesn&#8217;t seem to phase me, or anyone else for that matter.  In fact, it is much better than the other alternative throughout the rest of Canada &#8211; the frozen dezert winds that cut your face and snows that bury your car.  I&#8217;m also learning how to enjoyably get lost riding public transportation.  It only took being yelled at three times before I learned the ropes.  Now, getting lost in the sea of people downtown, or in the forests of preserved parks around town is second nature.</p><p>The only challenge now is distance.  Two hours time difference is nothing, but flying Southwest all day to get home might take its toll.  At least international flights play bad movies to help you fall asleep.  I suppose the only fair solution is to have everyone visit me instead!  Consider yourself invited.', '2004-08-28 08:36:26+01', '2008-03-11 11:51:23+00', 2004, 8, NULL, NULL, 1, NULL, '2004-08-28 08:36:26+01');
INSERT INTO blogs VALUES (19, 'Flashbacks', 'flashbacks', '<p><p>I wonder what it is like to have your life flash before your eyes.  What do you see?  How do those images get chosen?  Is it a biased version of your life?  Or is it completely detached?  What perspective do you see it from: 1st person, 3rd person, or bird''s eye?</p><p>I had the opportunity to experience something similar: landing in Nagoya.  As we flew into the airport, I got a birds eye view of my more distinct memories from living in Japan.</p><p>The outskirts of the city are green dominoes of rice patties scattered about with mountains in the background.  Right angles abound, yet it is hard to find a straight line that runs past more than three fields.  I could see grandmothers precariously riding bicycles across the mounds of dirt that separated the fields and remembered when I was looking for a shortcut and ended up on my motorcycle on a foot-wide dirt mound between two flooded rice fields.  </p><p>From the plane, I noticed houses grouped together extremely close, with no yard space, despite the abundance of land.  It was almost as if they were mimicking the style of the suburbs we were coming upon.  The bullet train passing on the tracks below us signaled that we had arrived within the geographical boundaries of the city, which was confirmed by the lights that were slowly coming on in the dusk.</p><p>In the twilight, the cars had turned on their lights while the houses had not.  This illuminated the arteries of the city, winding in strange ways that hinted at since-demolished old temples or fields that from 50 years ago when no building stood taller than two stories.  Pachinko parlors with their epileptic lighting danced like points on a techtonic connect-the-dots.</p><p>From several thousand feet, all suburbs look alike.  We flew over the planetarium in Otto-mura where I first met my closest North American neighbor, the ferris wheel I rode with a friend not realizing the implications of doing so in Japanese culture, the theme park Masayo always forced me to come up with creative reasons not to go to, and the closed driving course where I flunked my first driving test.</p><p>Now that most of my friends in Japan have gone home, and Masayo and I are about to go to Vancouver, Japan is more sounds, tastes, smells, and old memories than flashy new experiences.  In a country so technologically advanced, it is strange to feel so rooted to the past.</p>', '<p><p>I wonder what it is like to have your life flash before your eyes.  What do you see?  How do those images get chosen?  Is it a biased version of your life?  Or is it completely detached?  What perspective do you see it from: 1st person, 3rd person, or bird&#8217;s eye?</p><p>I had the opportunity to experience something similar: landing in Nagoya.  As we flew into the airport, I got a birds eye view of my more distinct memories from living in Japan.</p><p>The outskirts of the city are green dominoes of rice patties scattered about with mountains in the background.  Right angles abound, yet it is hard to find a straight line that runs past more than three fields.  I could see grandmothers precariously riding bicycles across the mounds of dirt that separated the fields and remembered when I was looking for a shortcut and ended up on my motorcycle on a foot-wide dirt mound between two flooded rice fields.  </p><p>From the plane, I noticed houses grouped together extremely close, with no yard space, despite the abundance of land.  It was almost as if they were mimicking the style of the suburbs we were coming upon.  The bullet train passing on the tracks below us signaled that we had arrived within the geographical boundaries of the city, which was confirmed by the lights that were slowly coming on in the dusk.</p><p>In the twilight, the cars had turned on their lights while the houses had not.  This illuminated the arteries of the city, winding in strange ways that hinted at since-demolished old temples or fields that from 50 years ago when no building stood taller than two stories.  Pachinko parlors with their epileptic lighting danced like points on a techtonic connect-the-dots.</p><p>From several thousand feet, all suburbs look alike.  We flew over the planetarium in Otto-mura where I first met my closest North American neighbor, the ferris wheel I rode with a friend not realizing the implications of doing so in Japanese culture, the theme park Masayo always forced me to come up with creative reasons not to go to, and the closed driving course where I flunked my first driving test.</p><p>Now that most of my friends in Japan have gone home, and Masayo and I are about to go to Vancouver, Japan is more sounds, tastes, smells, and old memories than flashy new experiences.  In a country so technologically advanced, it is strange to feel so rooted to the past.</p>', '2004-08-03 18:41:43+01', '2008-03-11 11:51:23+00', 2004, 8, NULL, NULL, 1, NULL, '2004-08-03 18:41:43+01');
INSERT INTO blogs VALUES (26, 'No Sir, Don''t Mean Maybe', 'no_sir,_don''t_mean_maybe', '<p>Most people get their experience saying "No" raising kids.  I have recently gotten mine shopping.  Oddly enough, it always seems to come when I am contemplating a purchase.  But that isn''t what it is said in response to.</p><p>Fellow customers, confused by my conservative fashion and air of confidence, have been mistaking me recently for a sales clerk.  Today I wasn''t a clerk at Staples, yesterday I wasn''t a clerk at Barnes & Noble, and a week ago I wasn''t a clerk at Circuit City.  </p><p>After being a minority for two years, I have become used to being judged by my appearance.  And I got used to the behind-the-back stares that I could see reflected in train windows and out of the corner of my eyes.  But I rarely if ever caught someone staring directly at me. Now back in the states, I sometimes forget that thigns are different and will blatantly stare back at people who are glancing in my direction.  </p><p>The time I wasn''t a clerk at Circuit City, shopping for a hard drive, a woman walks into the store staring directly at me. So I stare back.  She cocks an eyebrow and I curl my lip.  She says something inaudable and I ignore her.  Then, more loudly, she says "Do you work here?"  This being the moment that I have been practicing for, I say "No."  Then she says, "No, really. Do you work here?"</p><p>When I asked a friend what it was about the word "No" they didn''t understand, they said "Nothing.  It is you I don''t understand."  So maybe part of the problem is that I am too ambiguous.  For example, I was scopin'' out the hipster scene at a friend''s art show last week.  I was sippin'' my wine, appreciating the art, struttin'' my finest mod threads, yet at the same time, all I could think about was how difficult the artwork must be to dust after you have had it for several years.</p><p>Now is decision time, though.  I either need to take a stand in a way that says "No" before people even ask the question, or I need to unambiguously decide to be ambiguous.  A decision, even one not to make a decision, is better than nothing at all.', '<p>Most people get their experience saying &#8220;No&#8221; raising kids.  I have recently gotten mine shopping.  Oddly enough, it always seems to come when I am contemplating a purchase.  But that isn&#8217;t what it is said in response to.</p><p>Fellow customers, confused by my conservative fashion and air of confidence, have been mistaking me recently for a sales clerk.  Today I wasn&#8217;t a clerk at Staples, yesterday I wasn&#8217;t a clerk at Barnes &#38; Noble, and a week ago I wasn&#8217;t a clerk at Circuit City.  </p><p>After being a minority for two years, I have become used to being judged by my appearance.  And I got used to the behind-the-back stares that I could see reflected in train windows and out of the corner of my eyes.  But I rarely if ever caught someone staring directly at me. Now back in the states, I sometimes forget that thigns are different and will blatantly stare back at people who are glancing in my direction.  </p><p>The time I wasn&#8217;t a clerk at Circuit City, shopping for a hard drive, a woman walks into the store staring directly at me. So I stare back.  She cocks an eyebrow and I curl my lip.  She says something inaudable and I ignore her.  Then, more loudly, she says &#8220;Do you work here?&#8221;  This being the moment that I have been practicing for, I say &#8220;No.&#8221;  Then she says, &#8220;No, really. Do you work here?&#8221;</p><p>When I asked a friend what it was about the word &#8220;No&#8221; they didn&#8217;t understand, they said &#8220;Nothing.  It is you I don&#8217;t understand.&#8221;  So maybe part of the problem is that I am too ambiguous.  For example, I was scopin&#8217; out the hipster scene at a friend&#8217;s art show last week.  I was sippin&#8217; my wine, appreciating the art, struttin&#8217; my finest mod threads, yet at the same time, all I could think about was how difficult the artwork must be to dust after you have had it for several years.</p><p>Now is decision time, though.  I either need to take a stand in a way that says &#8220;No&#8221; before people even ask the question, or I need to unambiguously decide to be ambiguous.  A decision, even one not to make a decision, is better than nothing at all.', '2003-12-09 11:45:16+00', '2008-03-11 11:51:23+00', 2003, 12, NULL, NULL, 1, NULL, '2003-12-09 11:45:16+00');
INSERT INTO blogs VALUES (31, 'Getting Primative', 'getting_primative', '<p>I escaped. My bags are packed, my goodbyes have been said, and now for two weeks I am in Okinawa with Masayo enjoying possibly my last summer vacation. But one can only lounge in the sun, scuba dive, sight see, and eat delicious food so much. So to fill those empty gaps, Masayo and I have been talking to one another.<p>After having solved all of the worlds problems, discussed the meaning of life, and gossipped about all the people we know, the only thing left to talk about was our feelings. Specifically, our feelings concerning primate movies. </p><p>A: "I don''t understand how anyone can enjoy primate movies." <br>M: "Even ''Trouble Monkey''?" <br>A: "What?" <br>M: "And what about ''Basil''; that monkey is so smart! He can even fly an airplane!" </p><p>My girlfriend likes primate movies. The knowledge of some things is impossible to prepare for. </p><p>Speaking of preparation, all you peeps in America, <a href="http://wired.com/news/technology/0,1282,59979-2,00.html">get ready </a> for the latest Japanese onslaught. Hopefully this will help the reverse culture shock. I just need to raise $750 first. </p>', '<p>I escaped. My bags are packed, my goodbyes have been said, and now for two weeks I am in Okinawa with Masayo enjoying possibly my last summer vacation. But one can only lounge in the sun, scuba dive, sight see, and eat delicious food so much. So to fill those empty gaps, Masayo and I have been talking to one another.<p>After having solved all of the worlds problems, discussed the meaning of life, and gossipped about all the people we know, the only thing left to talk about was our feelings. Specifically, our feelings concerning primate movies. </p><p>A: &#8220;I don&#8217;t understand how anyone can enjoy primate movies.&#8221; <br>M: &#8220;Even &#8216;Trouble Monkey&#8217;?&#8221; <br>A: &#8220;What?&#8221; <br>M: &#8220;And what about &#8216;Basil&#8217;; that monkey is so smart! He can even fly an airplane!&#8221; </p><p>My girlfriend likes primate movies. The knowledge of some things is impossible to prepare for. </p><p>Speaking of preparation, all you peeps in America, <a href="http://wired.com/news/technology/0,1282,59979-2,00.html">get ready </a> for the latest Japanese onslaught. Hopefully this will help the reverse culture shock. I just need to raise $750 first. </p>', '2003-08-12 20:48:50+01', '2008-03-11 11:51:24+00', 2003, 8, NULL, NULL, 1, NULL, '2003-08-12 20:48:50+01');
INSERT INTO blogs VALUES (40, 'Money for nothing', 'money-for-nothing', 'Money commands no respect in Japan. Or at least any from the banks. I doubt that any country could make it more difficult to exchange money for goods and services than Japan, with a majority of the responsibility resting on the banks.

First, credit cards are a rarity in Japan. The tourist destinations have them, but supermakets, department stores, gas stations, and the trains all turn their back to plastic. On the surface, the people don''t trust credit cards, but underneat, it is a rigid banking system unwilling to cater to customers that is stunting the use of credit cards in the mainstream. Banks try to put up a front of being modern by having ATMs installed all over the place, but they often have worse hours than banks, opening around 9 and closing at 5 if you are lucky, and charging extra fees for weekend and after-hours transactions. 

Second, in Japan there is no such thing as a personal check. If you are giving money as a gift, you buy a fancy envelope to put the money in. If you are ordering something, you use a bank transfer. But you can only make a transfer between the hours of 9 and 3

the local branch of my bank wouldn''t process my bank transfer (only until 2:00), and I would get the same response after 3:00 from the other branch that is 15 minutes away. So I went to the post office (which is also a savings and loan bank) to see if the
', '<p>Money commands no respect in Japan. Or at least any from the banks. I doubt that any country could make it more difficult to exchange money for goods and services than Japan, with a majority of the responsibility resting on the banks.</p>


	<p>First, credit cards are a rarity in Japan. The tourist destinations have them, but supermakets, department stores, gas stations, and the trains all turn their back to plastic. On the surface, the people don&#8217;t trust credit cards, but underneat, it is a rigid banking system unwilling to cater to customers that is stunting the use of credit cards in the mainstream. Banks try to put up a front of being modern by having ATMs installed all over the place, but they often have worse hours than banks, opening around 9 and closing at 5 if you are lucky, and charging extra fees for weekend and after-hours transactions.</p>


	<p>Second, in Japan there is no such thing as a personal check. If you are giving money as a gift, you buy a fancy envelope to put the money in. If you are ordering something, you use a bank transfer. But you can only make a transfer between the hours of 9 and 3</p>


	<p>the local branch of my bank wouldn&#8217;t process my bank transfer (only until 2:00), and I would get the same response after 3:00 from the other branch that is 15 minutes away. So I went to the post office (which is also a savings and loan bank) to see if the</p>', '2003-02-12 16:17:09+00', '2008-03-11 11:51:24+00', 2003, 2, NULL, '2007-12-31 15:00:00+00', 1, NULL, '2003-02-12 16:17:09+00');
INSERT INTO blogs VALUES (36, 'Now For My 2 Word Review of New Zealand:', 'now_for_my_2_word_review_of_new_zealand:', '<p>GO THERE. Great roads. Great people. Great country. The north island of NZ is must be about the size of Maine. And yet it contains just about every geograpical feature of the US. Rocky beaches and fine sand beaches. Volcanoes and snow topped mountains. High desert and rolling hills. Large cities from the future, small towns from the past, and a thoroughly lovely population living in the present. There are about 17 people per square km in NZ, about 4 million total, so it had a feeling of driving through the midwest usually ? small quaint towns surrounded by farmland. Except the farmland is more varied and inhabited by 60 million sheep, which I much prefer to cows or buffallo.<p>I toured New Zealand on a blue 2002 Yamaha XT600 with side panniers for my trip. In US dollars, I rented the bike for about $40 - $50 a day. Pretty reasonable, at least by Japanese standards! But low considering that all four of the rental shop''s new XTs have been dropped this year. But not by me! Driving on the left indeed felt like home, though I am more accustomed to monkey sightings than hobbit sightings.  </p>', '<p><span class="caps">GO THERE</span>. Great roads. Great people. Great country. The north island of NZ is must be about the size of Maine. And yet it contains just about every geograpical feature of the US. Rocky beaches and fine sand beaches. Volcanoes and snow topped mountains. High desert and rolling hills. Large cities from the future, small towns from the past, and a thoroughly lovely population living in the present. There are about 17 people per square km in NZ, about 4 million total, so it had a feeling of driving through the midwest usually ? small quaint towns surrounded by farmland. Except the farmland is more varied and inhabited by 60 million sheep, which I much prefer to cows or buffallo.<p>I toured New Zealand on a blue 2002 Yamaha <span class="caps">XT600</span> with side panniers for my trip. In US dollars, I rented the bike for about $40 &#8211; $50 a day. Pretty reasonable, at least by Japanese standards! But low considering that all four of the rental shop&#8217;s new XTs have been dropped this year. But not by me! Driving on the left indeed felt like home, though I am more accustomed to monkey sightings than hobbit sightings.  </p>', '2003-04-07 23:57:29+01', '2008-03-11 11:51:24+00', 2003, 4, NULL, NULL, 1, NULL, '2003-04-07 23:57:29+01');
INSERT INTO blogs VALUES (38, 'South of the Border', 'south_of_the_border', '<p>Enough with this long winter in Japan; I am heading south to New', '<p>Enough with this long winter in Japan; I am heading south to New', '2003-03-23 04:29:10+00', '2008-03-11 11:51:24+00', 2003, 3, NULL, NULL, 1, NULL, '2003-03-23 04:29:10+00');
INSERT INTO blogs VALUES (39, 'Clarity', 'clarity', '<p>Ever wonder why the person who snores the loudest is always the first to fall asleep? Or the person who sings the worst always sings the loudest? Or in the case of teaching English, why the student with the wrong answer is always the first to answer? I asked one of my third-year English students last week what his name was. His answer: "Shhh. It''s secret."<p>So maybe that is the answer to the above riddles. But recently, I have been noticing similar idiosyncracies among my students, primarily because a third of them will be graduating this weekend. </p><p>The school year in Japan ends with March and begins again with April, with a nice two week holiday inbetween (New Zealand, here I come!). In preparation for graduation, we have been so busy that we haven''t even had time for classes! So as I sit in the teachers'' office while the kids go home early, I find my mind dwelling on the soon-to-be graduates I have taught for the past year and a half. </p><p>More so than any other aspect, it is their hair that I remember (perhaps because of the metamorphasis of my hair here in Japan). I once questioned a friend, "Is it wrong to give a student a bad grade based on their hair cut?" In my classes, I don''t teach, Hiroko and Jiro, I teach Debbie Gibson and Mrs. Cleaver. I teach James Brown and Don King. Punky Brewster. I swear the 1950''s Beatles are even in one of my classes. Thankfully, Ted Copple is not an English student of mine. </p>', '<p>Ever wonder why the person who snores the loudest is always the first to fall asleep? Or the person who sings the worst always sings the loudest? Or in the case of teaching English, why the student with the wrong answer is always the first to answer? I asked one of my third-year English students last week what his name was. His answer: &#8220;Shhh. It&#8217;s secret.&#8221;<p>So maybe that is the answer to the above riddles. But recently, I have been noticing similar idiosyncracies among my students, primarily because a third of them will be graduating this weekend. </p><p>The school year in Japan ends with March and begins again with April, with a nice two week holiday inbetween (New Zealand, here I come!). In preparation for graduation, we have been so busy that we haven&#8217;t even had time for classes! So as I sit in the teachers&#8217; office while the kids go home early, I find my mind dwelling on the soon-to-be graduates I have taught for the past year and a half. </p><p>More so than any other aspect, it is their hair that I remember (perhaps because of the metamorphasis of my hair here in Japan). I once questioned a friend, &#8220;Is it wrong to give a student a bad grade based on their hair cut?&#8221; In my classes, I don&#8217;t teach, Hiroko and Jiro, I teach Debbie Gibson and Mrs. Cleaver. I teach James Brown and Don King. Punky Brewster. I swear the 1950&#8217;s Beatles are even in one of my classes. Thankfully, Ted Copple is not an English student of mine. </p>', '2003-03-14 03:48:46+00', '2008-03-11 11:51:24+00', 2003, 3, NULL, NULL, 1, NULL, '2003-03-14 03:48:46+00');
INSERT INTO blogs VALUES (58, 'Janken Oi!', 'janken_oi!', '<p>Beer has long been the cause of and solution to all of life''s problems. But now there is a new solution. A craze that has been brewing in the hot and sultry volcanic island of Japan promises to end worldwide conflict and solve the most difficult of situations.<p><strong>Jannken </strong>, the revolutionary problem solving method, may look like the children''s game ''Rock, Paper, Scissors,'' but in fact it is much more sophisticated. For starters, its name is different. Notice the elegant simplicity of its name, the way the carefully chosen consonants envelop the tender yet powerful vowels at the center of the name. Furthermore, this game isn''t just for infants and pre-pubesents. Adults can even play <strong>Janken </strong><p>The true power and magnificance of <strong>Janken </strong>, though, lie in its universal acceptance as a valid and respected decision maker. Much like the Magic 8 Ball and the plucking of flower petals, <strong>Janken </strong> is infalable in its decision making process. Thus, due to the universal truth powering <strong>Janken </strong>, us mere mortals cannot protest it and only hope that we aren''t blinded by living in such proximity to such galactic understanding. </p><p>Imagine, now all of life''s pesky problems are easily solvable. What movie do you go see? <strong>Janken </strong>! Who is elected president? <strong>Janken </strong>! Should <strong>Janken </strong> be the ultimate and only deciding factor for all decisions, whether personal or global? <strong>Janken </strong>! </p>', '<p>Beer has long been the cause of and solution to all of life&#8217;s problems. But now there is a new solution. A craze that has been brewing in the hot and sultry volcanic island of Japan promises to end worldwide conflict and solve the most difficult of situations.<p><strong>Jannken </strong>, the revolutionary problem solving method, may look like the children&#8217;s game &#8216;Rock, Paper, Scissors,&#8217; but in fact it is much more sophisticated. For starters, its name is different. Notice the elegant simplicity of its name, the way the carefully chosen consonants envelop the tender yet powerful vowels at the center of the name. Furthermore, this game isn&#8217;t just for infants and pre-pubesents. Adults can even play <strong>Janken </strong><p>The true power and magnificance of <strong>Janken </strong>, though, lie in its universal acceptance as a valid and respected decision maker. Much like the Magic 8 Ball and the plucking of flower petals, <strong>Janken </strong> is infalable in its decision making process. Thus, due to the universal truth powering <strong>Janken </strong>, us mere mortals cannot protest it and only hope that we aren&#8217;t blinded by living in such proximity to such galactic understanding. </p><p>Imagine, now all of life&#8217;s pesky problems are easily solvable. What movie do you go see? <strong>Janken </strong>! Who is elected president? <strong>Janken </strong>! Should <strong>Janken </strong> be the ultimate and only deciding factor for all decisions, whether personal or global? <strong>Janken </strong>! </p>', '2002-05-15 04:15:02+01', '2008-03-11 11:51:24+00', 2002, 5, NULL, NULL, 1, NULL, '2002-05-15 04:15:02+01');
INSERT INTO blogs VALUES (60, 'All the leaves are brown...', 'all_the_leaves_are_brown...', '<p>Updates abound as I have started mucking around with PHP scripts on my web site. Symbolically, I have also changed the color from blue to brown.<p>The biggest change that you should notice is the additions of a <a href="http://www.brinkster.com/links.php">Link page </a>. Check it out. Some file extensions have also changed from .html to .php, but if you always view my page through the index.html frames page, you should notice no problem. </p><p>Currently, this site is optimized for Internet Explorer 5+. Netscape 4+ is just too buggy and inconsistent. I do hope to add support, though, for text browsers in the future, while updating my guestbook, journal, and the color scheme. <a href="http://www.brinkster.com/contact.pl">Let me know what you think! </a></p>', '<p>Updates abound as I have started mucking around with <span class="caps">PHP</span> scripts on my web site. Symbolically, I have also changed the color from blue to brown.<p>The biggest change that you should notice is the additions of a <a href="http://www.brinkster.com/links.php">Link page </a>. Check it out. Some file extensions have also changed from .html to .php, but if you always view my page through the index.html frames page, you should notice no problem. </p><p>Currently, this site is optimized for Internet Explorer 5+. Netscape 4+ is just too buggy and inconsistent. I do hope to add support, though, for text browsers in the future, while updating my guestbook, journal, and the color scheme. <a href="http://www.brinkster.com/contact.pl">Let me know what you think! </a></p>', '2002-04-23 15:08:31+01', '2008-03-11 11:51:24+00', 2002, 4, NULL, NULL, 1, NULL, '2002-04-23 15:08:31+01');
INSERT INTO blogs VALUES (64, 'Essentials 2', 'essentials_2', '<p>The fun at the post office doesn''t stop at the ATM machine. The post office in Japan deals with more than just loot and letters. The post office also serves as specialist in kitchen essentials.<p>Why, just the other day, after depositing 1/7th of my salery, to show their appreciation, my friendly neighborhood post master didn''t give me a sucker or even a doggie biscut, but rather a roll of celophane. This was a bit awkward, though, because it was a step up from the Christmas present they gave me - a dish sponge. </p><p>It did bring back fond memories of the gift that they gave me to welcome me to town - a wrapped box of rubber bands. Not just any rubber bands, mind you, but official post office rubber bands with the post office mascot on the box, reminding you for all of your mail, money, and kitchen essentials to turn to the post office (as if there is another option). </p><p>These aren''t just surplus items that the postmother needed to get rid of; these are officially liscensed goods that bring advertising into the dining room of every Japanese household. And into your family room (they also have pens and pencils). And into your study (they also have notepads). And into your bathroom (they also have adhesive bandages). Who knows where they will stop? Personally, I am looking forward to their special lingerie Spring ''02 collection. </p>', '<p>The fun at the post office doesn&#8217;t stop at the <span class="caps">ATM</span> machine. The post office in Japan deals with more than just loot and letters. The post office also serves as specialist in kitchen essentials.<p>Why, just the other day, after depositing 1/7th of my salery, to show their appreciation, my friendly neighborhood post master didn&#8217;t give me a sucker or even a doggie biscut, but rather a roll of celophane. This was a bit awkward, though, because it was a step up from the Christmas present they gave me &#8211; a dish sponge. </p><p>It did bring back fond memories of the gift that they gave me to welcome me to town &#8211; a wrapped box of rubber bands. Not just any rubber bands, mind you, but official post office rubber bands with the post office mascot on the box, reminding you for all of your mail, money, and kitchen essentials to turn to the post office (as if there is another option). </p><p>These aren&#8217;t just surplus items that the postmother needed to get rid of; these are officially liscensed goods that bring advertising into the dining room of every Japanese household. And into your family room (they also have pens and pencils). And into your study (they also have notepads). And into your bathroom (they also have adhesive bandages). Who knows where they will stop? Personally, I am looking forward to their special lingerie Spring &#8216;02 collection. </p>', '2002-03-09 23:54:07+00', '2008-03-11 11:51:24+00', 2002, 3, NULL, NULL, 1, NULL, '2002-03-09 23:54:07+00');
INSERT INTO blogs VALUES (71, 'Judging Books', 'judging_books', '<p>According to popular belief, Japan lies in the western Pacific Ocean, east of China and Korea, surrounded on all sides by water. The truth, though, is quite far from these geographical misconcep', '<p>According to popular belief, Japan lies in the western Pacific Ocean, east of China and Korea, surrounded on all sides by water. The truth, though, is quite far from these geographical misconcep', '2001-10-03 22:59:27+01', '2008-03-11 11:51:24+00', 2001, 10, NULL, NULL, 1, NULL, '2001-10-03 22:59:27+01');
INSERT INTO blogs VALUES (72, 'Aftermath', 'aftermath', '<p>The sunny skies that we had all week long were an indication that some sense of normalcy is returning to life here after the blasts that were felt all around the world. That doesn''t necessarily mean that life in Japan is any less bizarre: the emphasis on social heirarchy, the backwards motivation for learning English, and the food all continue to seem strange to me even after one and a half months living here.<p>So while I am picking up on the language, the customs, and the pace of life, I think that my synthesis from American to Japanese is still quite a long way off. Although I did buy a cell phone this past weekend ... maybe the future is much closer than I expected!', '<p>The sunny skies that we had all week long were an indication that some sense of normalcy is returning to life here after the blasts that were felt all around the world. That doesn&#8217;t necessarily mean that life in Japan is any less bizarre: the emphasis on social heirarchy, the backwards motivation for learning English, and the food all continue to seem strange to me even after one and a half months living here.<p>So while I am picking up on the language, the customs, and the pace of life, I think that my synthesis from American to Japanese is still quite a long way off. Although I did buy a cell phone this past weekend &#8230; maybe the future is much closer than I expected!', '2001-09-20 18:10:13+01', '2008-03-11 11:51:24+00', 2001, 9, NULL, NULL, 1, NULL, '2001-09-20 18:10:13+01');
INSERT INTO blogs VALUES (75, 'Hide your daughters', 'hide_your_daughters', '<p>For those of you scared of the prospects of me teaching, you have only a few days left to pull your children out of public school. I start my stint as English teacher when school resumes next week after summer vacation.<p>My official position is that of an assistant language teacher, which means that I will be utilized in the class to do everything from pronouncing words correctly (complete with southern accent) to team-teaching lessons. I am at three different schools five days a week and will have just over 100 students begging me for mercy. I am suffering with them, though; nobody in my town speaks English!</p>', '<p>For those of you scared of the prospects of me teaching, you have only a few days left to pull your children out of public school. I start my stint as English teacher when school resumes next week after summer vacation.<p>My official position is that of an assistant language teacher, which means that I will be utilized in the class to do everything from pronouncing words correctly (complete with southern accent) to team-teaching lessons. I am at three different schools five days a week and will have just over 100 students begging me for mercy. I am suffering with them, though; nobody in my town speaks English!</p>', '2001-08-29 18:49:50+01', '2008-03-11 11:51:24+00', 2001, 8, NULL, NULL, 1, NULL, '2001-08-29 18:49:50+01');
INSERT INTO blogs VALUES (81, 'Neo-Japanese', 'neo-japanese', 'I finish all of my sentences in text-book Japanese out of habit.  My exclamations sound like the guttural mumblings of a old and grey Osaka fish monger, while my stuttering when trying to find the right word sounds like a Japanese valley girl.  Being immersed in the local Okinawa dialect doesn''t help much, either.  So I''ve given up on trying to blend in with any common vernacular and started to redefine my own.

Most of it is based on weak puns, simple rhymes, and alliteration.  But it tends to do a better job of describing the local life around here than standard words and phrases.  The two current favorites are "bikuri baba" and "jiko jiji."  ''Bikuri'' means surprise, and ''baba'' is a diminutive for grandmothers.  ''Jiko'' means accident and ''jiji'' is a diminutive for grandfathers.  Both terms were lovingly coined as I nearly drove over two senior jay walkers the other day, but what made them stick was the sight out of the back window of our apartment.

The empty lots around our apartment don''t stay empty for long; the tropical weather and frequent rains make sure of that.  Thus, to fight back the ever creeping jungle, a local bikuri baba has taken it upon herself to weed whack her family''s empty lot to sculpted perfection.  But the bikuri in the situation is that the baba is hunchbacked, wears a checkered kitchen apron, and the weed whacker has a circular saw blade attached where the nylon string would normally go.  Maybe a better name would be grandma Rambo.

The local jiko jijis aren''t much better.  Though they''re not usually working in the fields, they all seem to have a bicycle (called a mama chariot) that is at least as old as they are.  To watch jiji ride such a bicycle, you''d believe he was battling typhoon-force cross winds.  Weaving back and forth, he covers more lateral ground than he does moving forward.  Which wouldn''t be a problem if he weren''t riding perilously on the side of the street.

Do senior citizens on the island have a death wish?  Or do they just enjoy cheating death?  Okinawans are known for their longevity, and until recently the oldest living person was an Okinawan bikuri baba.  Sometimes I wonder what they''re thinking, and wonder if they know what nicknames I''ve given them.  And then I try to imagine what nicknames they''ve given me.', '<p>I finish all of my sentences in text-book Japanese out of habit.  My exclamations sound like the guttural mumblings of a old and grey Osaka fish monger, while my stuttering when trying to find the right word sounds like a Japanese valley girl.  Being immersed in the local Okinawa dialect doesn&#8217;t help much, either.  So I&#8217;ve given up on trying to blend in with any common vernacular and started to redefine my own.</p>


	<p>Most of it is based on weak puns, simple rhymes, and alliteration.  But it tends to do a better job of describing the local life around here than standard words and phrases.  The two current favorites are &#8220;bikuri baba&#8221; and &#8220;jiko jiji.&#8221;  &#8216;Bikuri&#8217; means surprise, and &#8216;baba&#8217; is a diminutive for grandmothers.  &#8216;Jiko&#8217; means accident and &#8216;jiji&#8217; is a diminutive for grandfathers.  Both terms were lovingly coined as I nearly drove over two senior jay walkers the other day, but what made them stick was the sight out of the back window of our apartment.</p>


	<p>The empty lots around our apartment don&#8217;t stay empty for long; the tropical weather and frequent rains make sure of that.  Thus, to fight back the ever creeping jungle, a local bikuri baba has taken it upon herself to weed whack her family&#8217;s empty lot to sculpted perfection.  But the bikuri in the situation is that the baba is hunchbacked, wears a checkered kitchen apron, and the weed whacker has a circular saw blade attached where the nylon string would normally go.  Maybe a better name would be grandma Rambo.</p>


	<p>The local jiko jijis aren&#8217;t much better.  Though they&#8217;re not usually working in the fields, they all seem to have a bicycle (called a mama chariot) that is at least as old as they are.  To watch jiji ride such a bicycle, you&#8217;d believe he was battling typhoon-force cross winds.  Weaving back and forth, he covers more lateral ground than he does moving forward.  Which wouldn&#8217;t be a problem if he weren&#8217;t riding perilously on the side of the street.</p>


	<p>Do senior citizens on the island have a death wish?  Or do they just enjoy cheating death?  Okinawans are known for their longevity, and until recently the oldest living person was an Okinawan bikuri baba.  Sometimes I wonder what they&#8217;re thinking, and wonder if they know what nicknames I&#8217;ve given them.  And then I try to imagine what nicknames they&#8217;ve given me.</p>', '2007-04-17 06:21:53+01', '2008-03-11 11:51:24+00', 2007, 4, NULL, NULL, 1, NULL, '2007-04-17 06:21:53+01');
INSERT INTO blogs VALUES (82, 'Close and Open', 'close-and-open', 'Everything seems to be coming to a close all at once, and opening back up all at the same time!  Isn''t it curious how spring does that?

As <a href="http://livingcode.org/entry/announcing_kinzin.html">blogged</a> <a href="http://www.mynameiskate.ca/2007/04/and_were_live_k.html">elsewhere</a>, the latest foray into Web 2.0 social networking sites, <a href="http://kinzin.com">Kinzin.com</a>, launched last week.  For me, this is significant for sevaral reasons:

<ol>
<li>Kinzin doesn''t create a new social network; it enhances the ones you''ve already got.  With a focus on family, this is great for those like me who ran away from home to join the circus, but still want to keep in touch and up to date with relatives back home.</li>

<li>Kinzin is a gateway drug; with a central focus on privacy and security, plus an intuitave UI designed for those young and old alike, Kinzin isn''t just for Generation Xers.  It''s been built from the bottom up for everyone from Baby Huey to Grandpa Dewey.</li>

<li>I''ve been anticipating Kinzin for the past 11 months.  Why?  Because I''ve been working with a talented team of designers, programmers, fire breathers, and lion tamers to build, test, and refine Kinzin for it''s 1.0 release.
</ol>

Working so long and hard on Kinzin, it''s hard to believe that it''s finally been released.  I''d been working so intently on my portion of Kinzin that I hadn''t actually taken the time to sign up for an account!  Seeing all of it come together was really fulfilling, especially now that I can share it with my family and let them know what''s been keeping me so busy that I can''t return their emails or phone calls!

Depending on how you count, I''ve either been working 4 years or 6 months towards the other project that''s been monopolizing all of my time: my wedding.  Now that the euphoria of releasing Kinzin has settled, it''s time for me to get excited again, because my parents are arriving with my brother in less than two days, and my wedding is in a week!  If you''re interested in reading more about it while brushing up on your Japanese, my fiance has been blogging about our planning experience <a href="http://aaronmasayo.ti-da.net">on our wedding blog</a>.

It feels good to complete these things that I''ve worked so hard towards over the last few months, but what is even more exciting are the new projects we''ll be opening come May.  Exciting times!', '<p>Everything seems to be coming to a close all at once, and opening back up all at the same time!  Isn&#8217;t it curious how spring does that?</p>


	<p>As <a href="http://livingcode.org/entry/announcing_kinzin.html">blogged</a> <a href="http://www.mynameiskate.ca/2007/04/and_were_live_k.html">elsewhere</a>, the latest foray into Web 2.0 social networking sites, <a href="http://kinzin.com">Kinzin.com</a>, launched last week.  For me, this is significant for sevaral reasons:</p>


<ol>
<li>Kinzin doesn&#8217;t create a new social network; it enhances the ones you&#8217;ve already got.  With a focus on family, this is great for those like me who ran away from home to join the circus, but still want to keep in touch and up to date with relatives back home.</li>

<li>Kinzin is a gateway drug; with a central focus on privacy and security, plus an intuitave UI designed for those young and old alike, Kinzin isn&#8217;t just for Generation Xers.  It&#8217;s been built from the bottom up for everyone from Baby Huey to Grandpa Dewey.</li>

<li>I&#8217;ve been anticipating Kinzin for the past 11 months.  Why?  Because I&#8217;ve been working with a talented team of designers, programmers, fire breathers, and lion tamers to build, test, and refine Kinzin for it&#8217;s 1.0 release.
</ol>

	<p>Working so long and hard on Kinzin, it&#8217;s hard to believe that it&#8217;s finally been released.  I&#8217;d been working so intently on my portion of Kinzin that I hadn&#8217;t actually taken the time to sign up for an account!  Seeing all of it come together was really fulfilling, especially now that I can share it with my family and let them know what&#8217;s been keeping me so busy that I can&#8217;t return their emails or phone calls!</p>


	<p>Depending on how you count, I&#8217;ve either been working 4 years or 6 months towards the other project that&#8217;s been monopolizing all of my time: my wedding.  Now that the euphoria of releasing Kinzin has settled, it&#8217;s time for me to get excited again, because my parents are arriving with my brother in less than two days, and my wedding is in a week!  If you&#8217;re interested in reading more about it while brushing up on your Japanese, my fiance has been blogging about our planning experience <a href="http://aaronmasayo.ti-da.net">on our wedding blog</a>.</p>


	<p>It feels good to complete these things that I&#8217;ve worked so hard towards over the last few months, but what is even more exciting are the new projects we&#8217;ll be opening come May.  Exciting times!</p>', '2007-04-20 08:07:39+01', '2008-03-11 11:51:24+00', 2007, 4, NULL, NULL, 1, NULL, '2007-04-20 08:07:39+01');
INSERT INTO blogs VALUES (83, 'Bite your lip', 'bite-your-lip', 'When I was comforting M over a year ago when she was upset by someone who had disappointed her, I told her, "Don''t worry about it, we''re all just human, and all humans make mistakes."  Except I was speaking Japanese.  Bad Japanese.  And instead of saying ''human,'' I said ''carrot.''  We are all just carrots, and all carrots make mistakes.

Not a big deal, since there were only the two of us as witnesses.  But not this weekend, when there were 70 people at <a href="http://flickr.com/photos/fightinjoe">our wedding</a>.

It was my bright idea that we should write our own vows separately and then speak them to one another in Japanese during the English ceremony.  I spoke mine first, reciting them mostly from memory, sometimes referring to my cheat sheet for words I''d forgotten.  Masayo listened intently, tearing up at the right spots, looking deep into my eyes.  My words crescendoed, and I promised my love to M every time I whispered into her ears or shouted from the rooftops that I love her.

I looked M in the eyes expecting a huge response of gratitude, but instead I was met with a look of shock.  It turns out that I had mis-copied the pronunciation of ears and said ''chichiyaku'' instead of ''sasayaku.''  Which means, "every time I whisper to your breasts or shout from the rooftops..."

By then it was too late for anyone to object to the wedding.  M proceeded with her vows and the ceremony continued.  Afterwards, the nervousness I''d felt on stage had started to dissipate.  I figured that our guests could see how nervous I had been, so when they asked me "Are you still nervous?" I told them that I was fine now.

I remained fine until I realized that I wasn''t being asked about my nervousness, but was being told that the ceremony had touched the guests.  I had mistaken ''kandousuru'' with ''kinchousuru'', so people telling me that they were touched, and I was telling them not to worry because I felt better already!

Looking back on the situation, it seems that people might have been talking about my vows when they said they were touched.  Given my faux pas, though, it might have been they were trying to say that they didn''t feel touched, but rather violated.  That might explain why my response of essentially "don''t worry, it gets better" left the guests quiet after talking to me, awkwardly waiting for their opportunity to escape.', '<p>When I was comforting M over a year ago when she was upset by someone who had disappointed her, I told her, &#8220;Don&#8217;t worry about it, we&#8217;re all just human, and all humans make mistakes.&#8221;  Except I was speaking Japanese.  Bad Japanese.  And instead of saying &#8216;human,&#8217; I said &#8216;carrot.&#8217;  We are all just carrots, and all carrots make mistakes.</p>


	<p>Not a big deal, since there were only the two of us as witnesses.  But not this weekend, when there were 70 people at <a href="http://flickr.com/photos/fightinjoe">our wedding</a>.</p>


	<p>It was my bright idea that we should write our own vows separately and then speak them to one another in Japanese during the English ceremony.  I spoke mine first, reciting them mostly from memory, sometimes referring to my cheat sheet for words I&#8217;d forgotten.  Masayo listened intently, tearing up at the right spots, looking deep into my eyes.  My words crescendoed, and I promised my love to M every time I whispered into her ears or shouted from the rooftops that I love her.</p>


	<p>I looked M in the eyes expecting a huge response of gratitude, but instead I was met with a look of shock.  It turns out that I had mis-copied the pronunciation of ears and said &#8216;chichiyaku&#8217; instead of &#8216;sasayaku.&#8217;  Which means, &#8220;every time I whisper to your breasts or shout from the rooftops&#8230;&#8221;</p>


	<p>By then it was too late for anyone to object to the wedding.  M proceeded with her vows and the ceremony continued.  Afterwards, the nervousness I&#8217;d felt on stage had started to dissipate.  I figured that our guests could see how nervous I had been, so when they asked me &#8220;Are you still nervous?&#8221; I told them that I was fine now.</p>


	<p>I remained fine until I realized that I wasn&#8217;t being asked about my nervousness, but was being told that the ceremony had touched the guests.  I had mistaken &#8216;kandousuru&#8217; with &#8216;kinchousuru&#8217;, so people telling me that they were touched, and I was telling them not to worry because I felt better already!</p>


	<p>Looking back on the situation, it seems that people might have been talking about my vows when they said they were touched.  Given my faux pas, though, it might have been they were trying to say that they didn&#8217;t feel touched, but rather violated.  That might explain why my response of essentially &#8220;don&#8217;t worry, it gets better&#8221; left the guests quiet after talking to me, awkwardly waiting for their opportunity to escape.</p>', '2007-05-02 08:49:15+01', '2008-03-11 11:51:24+00', 2007, 5, NULL, NULL, 1, NULL, '2007-05-02 08:49:15+01');
INSERT INTO blogs VALUES (16, 'Costumed', 'costumed', '<p><p>What would Bruce Springsteen, a tennis pro, a red neck, a Bavarian yodeler, or a pilot do if they moved to Canada and needed a costume idea for Halloween?  Certainly they would look no further than their local stationary store which, as guaranteed by Canadain law, will have more than enough picture postcards of the fabled Canadian Mountie to base an authentic design on.</p><p>There is only one problem.  A picture postcard is as close as one can get to the Mountie costume north of the 49th parallel.</p><p>I started my search for the mythical Mountie costume referring to it as a Royal Canadian Mounted Police (RCMP) uniform, only to find out that the tassled and badge-spangled fitted red jacket, riding pants, knee-high boots, and dimpled hat comprised the ceremonial costume.  The typical RCMP uniform actually more closely resembles a hybrid police/SWAT uniform.</p><p>After being shuffled around from one army surplus store to another, I was directed to several desperate second-hand stores, one of which tried to convince me that I could tailor a maroon velvet blazer and navy band pants into the costume.</p><p>The costume store was no help, and almost kicked me out for suggesting that, just as the "naughty French maid" and "sexy police officer" are popular costumes among America''s deviants, there is bound to be a "sexy Mountie" equivalent for northern neredowells.</p><p>The first piece of the costume that I found was at a hat store that had two versions of the dimpled Canadian sombrero: one that was $125 and another for $250.  That was cheaper, though, than the woman who claimed that the complete uniform that she nicked from an estate sale was pricele$$.  I pleaded with her to let me borrow it, and then when she refused, to tell me where I could find one of my own.  She played hard ball, but when I asked if I would have to go to the states to find the constume, she conceded and said that yes, I probably would.</p><p>Remind me again what I came up here for?</p>', '<p><p>What would Bruce Springsteen, a tennis pro, a red neck, a Bavarian yodeler, or a pilot do if they moved to Canada and needed a costume idea for Halloween?  Certainly they would look no further than their local stationary store which, as guaranteed by Canadain law, will have more than enough picture postcards of the fabled Canadian Mountie to base an authentic design on.</p><p>There is only one problem.  A picture postcard is as close as one can get to the Mountie costume north of the 49th parallel.</p><p>I started my search for the mythical Mountie costume referring to it as a Royal Canadian Mounted Police (RCMP) uniform, only to find out that the tassled and badge-spangled fitted red jacket, riding pants, knee-high boots, and dimpled hat comprised the ceremonial costume.  The typical <span class="caps">RCMP</span> uniform actually more closely resembles a hybrid police/SWAT uniform.</p><p>After being shuffled around from one army surplus store to another, I was directed to several desperate second-hand stores, one of which tried to convince me that I could tailor a maroon velvet blazer and navy band pants into the costume.</p><p>The costume store was no help, and almost kicked me out for suggesting that, just as the &#8220;naughty French maid&#8221; and &#8220;sexy police officer&#8221; are popular costumes among America&#8217;s deviants, there is bound to be a &#8220;sexy Mountie&#8221; equivalent for northern neredowells.</p><p>The first piece of the costume that I found was at a hat store that had two versions of the dimpled Canadian sombrero: one that was $125 and another for $250.  That was cheaper, though, than the woman who claimed that the complete uniform that she nicked from an estate sale was pricele$$.  I pleaded with her to let me borrow it, and then when she refused, to tell me where I could find one of my own.  She played hard ball, but when I asked if I would have to go to the states to find the constume, she conceded and said that yes, I probably would.</p><p>Remind me again what I came up here for?</p>', '2004-11-06 10:39:59+00', '2008-03-11 11:51:23+00', 2004, 11, NULL, NULL, 1, NULL, '2004-11-06 10:39:59+00');
INSERT INTO blogs VALUES (54, 'Fluency Report', 'fluency_report', '<p>It appears as if I am going to have to repraise my earlier prediction that my students would be fluent by August of 2002/. / I c:ou:ld claim that it was a typo and that I instead meant to say ''by August of 3002 my students would be fluent,'' but then I would have to change the meaning of the word fluency so that it was defined on lack of mistakes rather than correctness (thus allowing one who never speaks a word of a language to be considered fluent, a classification needed for my students who, despite Japan''s world-leading life expectancy, will be nothing but dirt in the ground, unable to utter anything resembling a word, by the turn of the next century).No, it seems that I was a long way off in my prediction. Today, my students bent space and time to screw up the English grammar I had been teaching them for the past month. We start off easy, learning the present progressive ( .. be doing ... ), then move to the past progressive ( .. was doing ... ), and then teach the kids to talk about the future ( .. be going to ... ). Today, when asked to write a sentence, 20% of the class made sentences similar to one of the better students in class, which read "I will sleep yesterday." This afternoon, I had students making plans to play baseball last weekend and eat breakfast this morning. </p>This would be acceptable if it had been the first time that this material was visited. But today was a review of material that we finished a month ago! My students, bless their hearts, were trying to make amends for their scholastic sins of the past. In what seemed to be a blatant apology, one student phrased the needs of the class best by saying "We are going to study English last month." </p>', '<p>It appears as if I am going to have to repraise my earlier prediction that my students would be fluent by August of 2002/. / I c:ou:ld claim that it was a typo and that I instead meant to say &#8216;by August of 3002 my students would be fluent,&#8217; but then I would have to change the meaning of the word fluency so that it was defined on lack of mistakes rather than correctness (thus allowing one who never speaks a word of a language to be considered fluent, a classification needed for my students who, despite Japan&#8217;s world-leading life expectancy, will be nothing but dirt in the ground, unable to utter anything resembling a word, by the turn of the next century).No, it seems that I was a long way off in my prediction. Today, my students bent space and time to screw up the English grammar I had been teaching them for the past month. We start off easy, learning the present progressive ( .. be doing &#8230; ), then move to the past progressive ( .. was doing &#8230; ), and then teach the kids to talk about the future ( .. be going to &#8230; ). Today, when asked to write a sentence, 20% of the class made sentences similar to one of the better students in class, which read &#8220;I will sleep yesterday.&#8221; This afternoon, I had students making plans to play baseball last weekend and eat breakfast this morning. </p>This would be acceptable if it had been the first time that this material was visited. But today was a review of material that we finished a month ago! My students, bless their hearts, were trying to make amends for their scholastic sins of the past. In what seemed to be a blatant apology, one student phrased the needs of the class best by saying &#8220;We are going to study English last month.&#8221; </p>', '2002-07-16 05:18:18+01', '2008-03-11 11:51:24+00', 2002, 7, NULL, NULL, 1, NULL, '2002-07-16 05:18:18+01');
INSERT INTO blogs VALUES (66, 'Cupid''s not Japanese', 'cupid''s_not_japanese', '<p>The celebrations of Valentine''s Day were overshadowed by the jubilation that ensued after I officially signed a one-year extension (good until 8/2003/) /to m:y :contract for a cool 3.6 million yen. This came as dismal news to the NY Yankee''s, though, who were hoping to take me away from Japan in a speculative move based on Seattle Mariner Ichiro''s performance as MVP last year. In the end, though, they wanted me to spend a year in the minors, but I wasn''t about to associate with all of those raw-fish-and-fermented-soy-bean-eating rapscallions in New York, so I have decided to stay and associate with them here in Japan.<p>But it isn''t the food, or the money, or even the stock options that is keeping me in Japan. It is manifest destiny. Hopefully, by teaching English over here in Japan, I will be able to make the world a bit more accessible to the loud, overweight, and borish tourist, allowing Western egocentrism to finish its expansion west. </p><p>Actually, it was difficult to find a reason not to stay. The only reason I didn''t want to stay was because of my job, which is easily loathable. But then I realized that it isn''t the words that I teach that are important, but rather the sentences and paragraphs that keep meaning between their words that are important. So while I don''t live for the three hours of class that I have a day, I do try to make the most of the free time that I have to talk with teachers, play with my students, and share my culture and perspective with anybody who will listen. Maybe Japan won''t be fluent by the time I do leave, but at least the feathers of the status quo will be ruffled enough to make people critically think about where they are and where they are going. </p><p>And hopefully I will realize the same about myself along the way. </p>', '<p>The celebrations of Valentine&#8217;s Day were overshadowed by the jubilation that ensued after I officially signed a one-year extension (good until 8/2003/) /to m:y :contract for a cool 3.6 million yen. This came as dismal news to the NY Yankee&#8217;s, though, who were hoping to take me away from Japan in a speculative move based on Seattle Mariner Ichiro&#8217;s performance as <span class="caps">MVP</span> last year. In the end, though, they wanted me to spend a year in the minors, but I wasn&#8217;t about to associate with all of those raw-fish-and-fermented-soy-bean-eating rapscallions in New York, so I have decided to stay and associate with them here in Japan.<p>But it isn&#8217;t the food, or the money, or even the stock options that is keeping me in Japan. It is manifest destiny. Hopefully, by teaching English over here in Japan, I will be able to make the world a bit more accessible to the loud, overweight, and borish tourist, allowing Western egocentrism to finish its expansion west. </p><p>Actually, it was difficult to find a reason not to stay. The only reason I didn&#8217;t want to stay was because of my job, which is easily loathable. But then I realized that it isn&#8217;t the words that I teach that are important, but rather the sentences and paragraphs that keep meaning between their words that are important. So while I don&#8217;t live for the three hours of class that I have a day, I do try to make the most of the free time that I have to talk with teachers, play with my students, and share my culture and perspective with anybody who will listen. Maybe Japan won&#8217;t be fluent by the time I do leave, but at least the feathers of the status quo will be ruffled enough to make people critically think about where they are and where they are going. </p><p>And hopefully I will realize the same about myself along the way. </p>', '2002-02-17 17:05:41+00', '2008-03-11 11:51:24+00', 2002, 2, NULL, NULL, 1, NULL, '2002-02-17 17:05:41+00');
INSERT INTO blogs VALUES (6, 'Cocky', 'cocky', '<p>The weather''s been cocky recently.  High after surprising us with some early May sunshine, Mother Nature has retracted any peace offering that was on the plate and has been flaunting her dominance over those of us affected by seasonal depression.<p>
<p><p>
<p>Today, though, after three weeks, a huge package of sunshine was delivered to our front door.  I woke up this morning thinking I was in heaven it was so bright outside.<p>
<p><p>
<p>The sunlight was taken with a grain of salt by move Vancouverites.  One ray of sunlight in February is enough to inspire half the population to wear shorts and tank tops outside, but a cloudless morning in May raises more eyebrows than skirts.  The reason: in February, everyone wants to be an optomist, but by May everyone is a sceptic or cynic.<p>
<p><p>
<p>So instead of shorts, people in Vancouver brought out their ugly t-shirts.  It was the overtly cocky ones that caught my attention.  There was the chain-smoking woman on the corner with wrinkled skin and ash colored hair wearing the t-shirt that said "Want to know what the world''s greatest grandma looks like? You''re looking at her!"  Then there was portly student in the elevator wearing the shirt that said "Forget it ''cause you''ll never get it".<p>
<p><p>
<p>Que finger snap, snap, snap.  And hold your breath until August, the only dependable month in Vancouver.', '<p>The weather&#8217;s been cocky recently.  High after surprising us with some early May sunshine, Mother Nature has retracted any peace offering that was on the plate and has been flaunting her dominance over those of us affected by seasonal depression.<p>
<p><p>
<p>Today, though, after three weeks, a huge package of sunshine was delivered to our front door.  I woke up this morning thinking I was in heaven it was so bright outside.<p>
<p><p>
<p>The sunlight was taken with a grain of salt by move Vancouverites.  One ray of sunlight in February is enough to inspire half the population to wear shorts and tank tops outside, but a cloudless morning in May raises more eyebrows than skirts.  The reason: in February, everyone wants to be an optomist, but by May everyone is a sceptic or cynic.<p>
<p><p>
<p>So instead of shorts, people in Vancouver brought out their ugly t-shirts.  It was the overtly cocky ones that caught my attention.  There was the chain-smoking woman on the corner with wrinkled skin and ash colored hair wearing the t-shirt that said &#8220;Want to know what the world&#8217;s greatest grandma looks like? You&#8217;re looking at her!&#8221;  Then there was portly student in the elevator wearing the shirt that said &#8220;Forget it &#8216;cause you&#8217;ll never get it&#8221;.<p>
<p><p>
<p>Que finger snap, snap, snap.  And hold your breath until August, the only dependable month in Vancouver.', '2006-05-30 14:09:44+01', '2008-03-11 11:51:23+00', 2006, 5, NULL, NULL, 1, NULL, '2006-05-30 14:09:44+01');
INSERT INTO blogs VALUES (8, 'Arguements', 'arguements', 'I''ve been getting in quite a few arguements recently.

The first was with my taste buds.  I''ve never been a big fan of sour cream.  But in the past week I''ve prepared two dishes with sour cream playing a large role in the production.

Yesterday I had a discussion with a coworker about whether when dolphins yawn, if they yawn with their mouths or with their blow hole.  Then we started arguing whether or not dolphins can breathe through their mouths.  I vote no.

With tax season in full bloom, my financial allergies have almost knocked me out of action.  I find that I spend more time trying to concieve of how I''ll defend myself if I ever get audited than actually preparing my returns correctly.

I argued with my body the other night that it wasn''t time for bed at 10:30.  I lost.', '<p>I&#8217;ve been getting in quite a few arguements recently.</p>


	<p>The first was with my taste buds.  I&#8217;ve never been a big fan of sour cream.  But in the past week I&#8217;ve prepared two dishes with sour cream playing a large role in the production.</p>


	<p>Yesterday I had a discussion with a coworker about whether when dolphins yawn, if they yawn with their mouths or with their blow hole.  Then we started arguing whether or not dolphins can breathe through their mouths.  I vote no.</p>


	<p>With tax season in full bloom, my financial allergies have almost knocked me out of action.  I find that I spend more time trying to concieve of how I&#8217;ll defend myself if I ever get audited than actually preparing my returns correctly.</p>


	<p>I argued with my body the other night that it wasn&#8217;t time for bed at 10:30.  I lost.</p>', '2006-04-08 13:20:19+01', '2008-03-11 11:51:23+00', 2006, 4, NULL, NULL, 1, NULL, '2006-04-08 13:20:19+01');
INSERT INTO blogs VALUES (10, 'Darn Swedes', 'darn_swedes', '<p>Part of the alure of Vancouver it the alure of internationalism.  Nobody is really "from" Vancouver.    Everybody is from somewhere else.  Even the people who were born and raised here have a diverse cultural background; the only two native Vancouverites I know have an native Asian mother and a native European father.  And while maybe 1/3 of them are from elsewhere in Canada, most come from outside of the country.<p>
<p><p>
<p>In coming to Vancouver, most of the things that they''ve brought with them are common place.  What is interesting is the recommendations, pride, and stereotypes that they bring with them, especially in relation to manufactured products.<p>
<p><p>
<p>Most people seem to be biased towards Sweden when it comes to products.  Volvos are the safest cars because they are from Sweden.  Duxiana beds are the most comfortable because they''re from Sweden.  How can you not be a fan of Sweden, though, in a city that has two Ikeas?  Somehow, though, I fell sorry for Norway and Finland.  What are they good for?<p>
<p><p>
<p>Others that I''ve met throw their loyalty towards less obvious causes.  Germany, for example, gets praise for its washers, dryers, and laundry detergent.  (In a strange twist, it is more trendy to have a non-German European luxury automobile, and make up for it with German appliances in the home.)  And according to the saleswoman, they also make good vacuum cleaners (an arguement based soley on price, where "good" means "expensive"). <p>
<p><p>
<p>It starts to stretch it a bit, though, when you''re told that the Persian food that you''re eating is the best you can get because the Hispanic owner made the chili sause using a recipe his grandmother taught him while growing up in Mexico.  This is the status quo in Vancouver, though, where the majority of Japanese restaurants are owned by Chinese families.<p>
<p><p>
<p>The one universal thing that everyone here seems to be able to agree upon is that nothing good is coming out of the United States.  Even using Apple''s iPod as a counter point raises guffaws that point out that while it''s "desiged in Cupertino," it''s "manufactured in China."', '<p>Part of the alure of Vancouver it the alure of internationalism.  Nobody is really &#8220;from&#8221; Vancouver.    Everybody is from somewhere else.  Even the people who were born and raised here have a diverse cultural background; the only two native Vancouverites I know have an native Asian mother and a native European father.  And while maybe 1/3 of them are from elsewhere in Canada, most come from outside of the country.<p>
<p><p>
<p>In coming to Vancouver, most of the things that they&#8217;ve brought with them are common place.  What is interesting is the recommendations, pride, and stereotypes that they bring with them, especially in relation to manufactured products.<p>
<p><p>
<p>Most people seem to be biased towards Sweden when it comes to products.  Volvos are the safest cars because they are from Sweden.  Duxiana beds are the most comfortable because they&#8217;re from Sweden.  How can you not be a fan of Sweden, though, in a city that has two Ikeas?  Somehow, though, I fell sorry for Norway and Finland.  What are they good for?<p>
<p><p>
<p>Others that I&#8217;ve met throw their loyalty towards less obvious causes.  Germany, for example, gets praise for its washers, dryers, and laundry detergent.  (In a strange twist, it is more trendy to have a non-German European luxury automobile, and make up for it with German appliances in the home.)  And according to the saleswoman, they also make good vacuum cleaners (an arguement based soley on price, where &#8220;good&#8221; means &#8220;expensive&#8221;). <p>
<p><p>
<p>It starts to stretch it a bit, though, when you&#8217;re told that the Persian food that you&#8217;re eating is the best you can get because the Hispanic owner made the chili sause using a recipe his grandmother taught him while growing up in Mexico.  This is the status quo in Vancouver, though, where the majority of Japanese restaurants are owned by Chinese families.<p>
<p><p>
<p>The one universal thing that everyone here seems to be able to agree upon is that nothing good is coming out of the United States.  Even using Apple&#8217;s iPod as a counter point raises guffaws that point out that while it&#8217;s &#8220;desiged in Cupertino,&#8221; it&#8217;s &#8220;manufactured in China.&#8221;', '2005-10-19 22:47:21+01', '2008-03-11 11:51:23+00', 2005, 10, NULL, NULL, 1, NULL, '2005-10-19 22:47:21+01');
INSERT INTO blogs VALUES (12, 'Regifting', 'regifting', '<p>I figure that photos are probably one of the best gifts to regift.  New photos are always exciting and old ones are always sentimental, even if you weren''t there.  I''ve collected some of the pictures that I''ve taken in and around Vancouver over the last six months and put them on display to share with y''all.<p>
<p><p>
<p>There is always the problem of what to give the person who has everything.  But what if you are a country?  What do you give the country that already has everything?<p>
<p><p>
<p>France was smart and chipped in early with the Statue of Liberty.  But that put the pressure on Japan.  In 1912 Japan was probably feeling stuck; a large sculpture had already been done; there were no cute pandas native to Japan to give away.  All they had were some "nematoad infested cherry trees":http://www.nps.gov/nacc/cherry/history.htm that had to be burned.  Eventually a healthy batch made it.<p>
<p><p>
<p>I wonder if there is any rivalry between countries when gift giving is concerned.  I overheard two people talking the other day; one said to the other, "regardless of how much you spend on your engagement ring, I''m going to double it when I buy mine." Do the Czeck Republic and Slovakia try to one-up each other when bribing European Union officials? Does the US give cartons of Phillip Morris only to be bested by Canada''s humador of Cubans?<p>
<p><p>
<p>Until these questions are answered, I''ve decided to suspend my diplomatic gift giving.  Instead, I''ll strictly deal with gift receiving.', '<p>I figure that photos are probably one of the best gifts to regift.  New photos are always exciting and old ones are always sentimental, even if you weren&#8217;t there.  I&#8217;ve collected some of the pictures that I&#8217;ve taken in and around Vancouver over the last six months and put them on display to share with y&#8217;all.<p>
<p><p>
<p>There is always the problem of what to give the person who has everything.  But what if you are a country?  What do you give the country that already has everything?<p>
<p><p>
<p>France was smart and chipped in early with the Statue of Liberty.  But that put the pressure on Japan.  In 1912 Japan was probably feeling stuck; a large sculpture had already been done; there were no cute pandas native to Japan to give away.  All they had were some <a href="http://www.nps.gov/nacc/cherry/history.htm">nematoad infested cherry trees</a> that had to be burned.  Eventually a healthy batch made it.<p>
<p><p>
<p>I wonder if there is any rivalry between countries when gift giving is concerned.  I overheard two people talking the other day; one said to the other, &#8220;regardless of how much you spend on your engagement ring, I&#8217;m going to double it when I buy mine.&#8221; Do the Czeck Republic and Slovakia try to one-up each other when bribing European Union officials? Does the US give cartons of Phillip Morris only to be bested by Canada&#8217;s humador of Cubans?<p>
<p><p>
<p>Until these questions are answered, I&#8217;ve decided to suspend my diplomatic gift giving.  Instead, I&#8217;ll strictly deal with gift receiving.', '2005-04-11 21:53:28+01', '2008-03-11 11:51:23+00', 2005, 4, NULL, NULL, 1, NULL, '2005-04-11 21:53:28+01');
INSERT INTO blogs VALUES (14, 'Ted Leo and the Pharmacists', 'ted_leo_and_the_pharmacists', '<p><p>I had no idea <a href="http://tinyurl.com/4qawl">how close my new office is to Richard''s on Richards</a>.  I saw <strong>TedLeo and the Pharmacists</strong> there tonight for a special Valentine''s Dayshow. Too bad my Valentine wasn''t there. That just meant I had to rockextra hard.</p><p>One of the opening bands, <strong>The Joggers</strong> fromPortland, OR, were really tight. I think they had preassigned to oneanother different decades, and then dressed accordingly. There was NewWave 80''s, Post-Grunge 90''s Mod, Late 80''s Kid In 4th Grade Who LikesFighter Planes, and Beer Gut (which is ageless).All together, eye and ear candy. I picked up their album and am hopingthey sound half as good recorded as they do live</p><p>Ted Leo definitely deserves to be headlining his own band. Hisbass player Dave and drummer Chris hadn''t shaved since the 70''s (Ithink there is a video on iTunes for Me and Mia, if you want to see foryourself), but Ted was pretty tight. Which made sense when he startedreferring to his hardcore roots.</p><p>The crowd was pretty lively but there were a few meatheads thatwere trying to throw their weight around. One, flapping his elbows inmy face, was trying to jiggle and clap his way over me. I was losing mybalance, but instead of stepping backwards, I grabbed onto his arm andthen started patting it in tune with his claps. That ambiguous tensiondefused the situation and he didn''t bother me the rest of the night.</p><p>Ted sang a few songs by himself right before the encore, andthen when he and the band came back he invited anyone in the audiencewith percussion instruments to come on stage and play with him. Somehipsters got up on stage and started jangling keys, which inspired adrunk girl at the front of the stage to start clinking her emptyglasses together. She broke them and cut her lip at the same time. Tostop the bleeding, she decided to get up on stage and start dancingwith everyone. The encore ended and she got shepharded backstage, withthe clapping meathead screaming into the microphone, "Thank you, TedLeo! Thank you!"', '<p><p>I had no idea <a href="http://tinyurl.com/4qawl">how close my new office is to Richard&#8217;s on Richards</a>.  I saw <strong>TedLeo and the Pharmacists</strong> there tonight for a special Valentine&#8217;s Dayshow. Too bad my Valentine wasn&#8217;t there. That just meant I had to rockextra hard.</p><p>One of the opening bands, <strong>The Joggers</strong> fromPortland, OR, were really tight. I think they had preassigned to oneanother different decades, and then dressed accordingly. There was NewWave 80&#8217;s, Post-Grunge 90&#8217;s Mod, Late 80&#8217;s Kid In 4th Grade Who LikesFighter Planes, and Beer Gut (which is ageless).All together, eye and ear candy. I picked up their album and am hopingthey sound half as good recorded as they do live</p><p>Ted Leo definitely deserves to be headlining his own band. Hisbass player Dave and drummer Chris hadn&#8217;t shaved since the 70&#8217;s (Ithink there is a video on iTunes for Me and Mia, if you want to see foryourself), but Ted was pretty tight. Which made sense when he startedreferring to his hardcore roots.</p><p>The crowd was pretty lively but there were a few meatheads thatwere trying to throw their weight around. One, flapping his elbows inmy face, was trying to jiggle and clap his way over me. I was losing mybalance, but instead of stepping backwards, I grabbed onto his arm andthen started patting it in tune with his claps. That ambiguous tensiondefused the situation and he didn&#8217;t bother me the rest of the night.</p><p>Ted sang a few songs by himself right before the encore, andthen when he and the band came back he invited anyone in the audiencewith percussion instruments to come on stage and play with him. Somehipsters got up on stage and started jangling keys, which inspired adrunk girl at the front of the stage to start clinking her emptyglasses together. She broke them and cut her lip at the same time. Tostop the bleeding, she decided to get up on stage and start dancingwith everyone. The encore ended and she got shepharded backstage, withthe clapping meathead screaming into the microphone, &#8220;Thank you, TedLeo! Thank you!&#8221;', '2005-02-14 18:42:50+00', '2008-03-11 11:51:23+00', 2005, 2, NULL, NULL, 1, NULL, '2005-02-14 18:42:50+00');
INSERT INTO blogs VALUES (21, 'Redesign', 'redesign', '<p>I wish the walls in my apartment were as easy to rearrange as this layout.</p><p>I''m feeling springtime fresh and wanted to reflect it online.  Thus the change.  This past week I have really thawed out after hibernating for the past few months.  It is as if I was just going through the motions; then, all of the sudden, I woke up.</p><p>The alarm that woke up up was a concert by Bela Fleck and the Flectones.  I heard they were coming to town this spring back in November, so I decided to buy a ticket in advance.  I spent the next few months counting the days until the concert.  In January, I could hardly wait four more months until the May 1st show.  In March, waiting 2 months seemed nearly impossible.</p><p>Then, while eating dinner with my family on the 11th of May, the skies parted and a beam of enlightenment struck me dead in the middle of my forehead: I had missed the show, and hadn''t realized it until 10 days later!</p><p>Though I had woken up, I was groggy and wanted to go back to sleep under a warm blanket of blissful ignorance.  Frisbee practice that night was terrible; my pool playing two nights later was inexcusable; my work ethic throughout the week was dismal.</p><p>By Friday the grogginess finally began to evaporate, due partially to the heat in the office with a broken air conditioner.  Come Friday night, I had shed nearly all remnants of my cocoon.  Today, nobody''s going to bring me down.</p><p>Go ahead, <a href="contact.php">I dare you to try</a> to knock this kite out of the sky.  Let me know what you think about the redesign.  Constructive criticism is welcome.', '<p>I wish the walls in my apartment were as easy to rearrange as this layout.</p><p>I&#8217;m feeling springtime fresh and wanted to reflect it online.  Thus the change.  This past week I have really thawed out after hibernating for the past few months.  It is as if I was just going through the motions; then, all of the sudden, I woke up.</p><p>The alarm that woke up up was a concert by Bela Fleck and the Flectones.  I heard they were coming to town this spring back in November, so I decided to buy a ticket in advance.  I spent the next few months counting the days until the concert.  In January, I could hardly wait four more months until the May 1st show.  In March, waiting 2 months seemed nearly impossible.</p><p>Then, while eating dinner with my family on the 11th of May, the skies parted and a beam of enlightenment struck me dead in the middle of my forehead: I had missed the show, and hadn&#8217;t realized it until 10 days later!</p><p>Though I had woken up, I was groggy and wanted to go back to sleep under a warm blanket of blissful ignorance.  Frisbee practice that night was terrible; my pool playing two nights later was inexcusable; my work ethic throughout the week was dismal.</p><p>By Friday the grogginess finally began to evaporate, due partially to the heat in the office with a broken air conditioner.  Come Friday night, I had shed nearly all remnants of my cocoon.  Today, nobody&#8217;s going to bring me down.</p><p>Go ahead, <a href="contact.php">I dare you to try</a> to knock this kite out of the sky.  Let me know what you think about the redesign.  Constructive criticism is welcome.', '2004-05-15 01:09:23+01', '2008-03-11 11:51:23+00', 2004, 5, NULL, NULL, 1, NULL, '2004-05-15 01:09:23+01');
INSERT INTO blogs VALUES (29, 'Seconds', 'seconds', '<p>I helped myself to seconds this past week.  68,4000 seconds heading west, 406,800 seconds in Japan, and 54,000 seconds coming back to the southeast.  It was my second time to return to Japan, and to celebrate the occassion, I came in second in a Halloween costume constest.</p><p>I saw Finding Nemo twice on the plane, had two seats to myself on the way home, and got about two seconds of sleep.  So I had some time to put together my two cents.  I decided that thematic puns are a bad idea for a reoccuring joke.  And I realized one of the things that I miss the most from Japan.  The peace and quiet.</p><p>I just finished reading LULLABY by Chuck Palahniuk, in which he talks about the noiseaholics and the quiteaphobics.  Perhpas he would like Japan. It is so much easier to tune things out when they are in a different language. Televisions, grandmothers, security warnings, they all just fade into the background.  I used to long for the day when I could understand the conversation happening next to me on the train or the morning Monday meeting at school.  Now I relish it.</p><p>Who goes on a five day overseas visit to be quiet, though?  Obviously me, since I didn''t get to yak it up with my buddies, didn''t visit Tenkawa, and didn''t teach any English classes.  I did get to see my Bonny, though for five days of peaceful sweet nothings and quiet pillow talk.</p><p>Being back came naturally.  My Japanese was back in full swing by the second day.  I didn''t bat an eye when we encountered huge mushrooms in the middle of a shopping arcade.  And I hardly noticed the shouting waiters, obnoxious store clerks, talking cars, blaring Pachinko parlors, musical stop lights, chirpy school girls, sub-woofing cars, and noisy throngs of people.  Just thinking about it makes me miss being foreign. Audible ignorance is bliss.', '<p>I helped myself to seconds this past week.  68,4000 seconds heading west, 406,800 seconds in Japan, and 54,000 seconds coming back to the southeast.  It was my second time to return to Japan, and to celebrate the occassion, I came in second in a Halloween costume constest.</p><p>I saw Finding Nemo twice on the plane, had two seats to myself on the way home, and got about two seconds of sleep.  So I had some time to put together my two cents.  I decided that thematic puns are a bad idea for a reoccuring joke.  And I realized one of the things that I miss the most from Japan.  The peace and quiet.</p><p>I just finished reading <span class="caps">LULLABY</span> by Chuck Palahniuk, in which he talks about the noiseaholics and the quiteaphobics.  Perhpas he would like Japan. It is so much easier to tune things out when they are in a different language. Televisions, grandmothers, security warnings, they all just fade into the background.  I used to long for the day when I could understand the conversation happening next to me on the train or the morning Monday meeting at school.  Now I relish it.</p><p>Who goes on a five day overseas visit to be quiet, though?  Obviously me, since I didn&#8217;t get to yak it up with my buddies, didn&#8217;t visit Tenkawa, and didn&#8217;t teach any English classes.  I did get to see my Bonny, though for five days of peaceful sweet nothings and quiet pillow talk.</p><p>Being back came naturally.  My Japanese was back in full swing by the second day.  I didn&#8217;t bat an eye when we encountered huge mushrooms in the middle of a shopping arcade.  And I hardly noticed the shouting waiters, obnoxious store clerks, talking cars, blaring Pachinko parlors, musical stop lights, chirpy school girls, sub-woofing cars, and noisy throngs of people.  Just thinking about it makes me miss being foreign. Audible ignorance is bliss.', '2003-11-01 15:06:26+00', '2008-03-11 11:51:23+00', 2003, 11, NULL, NULL, 1, NULL, '2003-11-01 15:06:26+00');
INSERT INTO blogs VALUES (33, 'Where all the time goes', 'where_all_the_time_goes', '<p>The onsen (natural hot spa) near my house is old fashioned and traditional, blending into the hillside and surrounding forest. The two clerks who work behind the desk are polite and soft-spoken, which sets the tone for the gender-segregated wooden-indoor and stone-outdoor baths which have been the cornerstone of Japanese society and hygene for centuries. But a new employee threatens to change all of this.<p>In a step towards modernization, the onsen has purchased a ticket vending machine. This machine lives next to the counter where the two clerks work, or rather, used to work. Now, instead of engaging the customers in conversation and selling tickets and bath towels, their new job description is to stand behind the counter and silently take the tickets from the customers. </p><p>Machines have been taking away socially rewarding jobs in Japan, replacing them with isolated menial tasks. At the onsen the two clerks have turned into ticket turnstyles. Open-kitchen restaurant cooks have been turned into food processors by similar ticketing machines. "Greeters" at supermarkets and shoping malls have become parking lot traffic directors by machines that now shout general greetings customers. And for what purpose? </p><p>The steralization of society, you propose? Actually, the real purpose of the machines is to give people more time to get to the airport. Why? Because if you are a celebrity fanatic, there is no place better than Narita International Airport to get your kicks in. </p><p>David Beckam, husband of Posh Spice, British soccer posterboy, arrived in Tokyo yesterday and was greeted by 1000+ screaming, crying, and fainting fans. It looked like an old Beatles or Beach Boys concert where a brief glance from one of the pretty boys could make you lightheaded and weak in the knees. How do I know this? Because there was a 10 minute special on Beckam''s 10 second walk out of customs on the morning news. And ever since that new vending machine replaced (liberated?) me as an English teacher, I have been able to pursue more important things. Like becoming a loitering airport fanboy. </p>', '<p>The onsen (natural hot spa) near my house is old fashioned and traditional, blending into the hillside and surrounding forest. The two clerks who work behind the desk are polite and soft-spoken, which sets the tone for the gender-segregated wooden-indoor and stone-outdoor baths which have been the cornerstone of Japanese society and hygene for centuries. But a new employee threatens to change all of this.<p>In a step towards modernization, the onsen has purchased a ticket vending machine. This machine lives next to the counter where the two clerks work, or rather, used to work. Now, instead of engaging the customers in conversation and selling tickets and bath towels, their new job description is to stand behind the counter and silently take the tickets from the customers. </p><p>Machines have been taking away socially rewarding jobs in Japan, replacing them with isolated menial tasks. At the onsen the two clerks have turned into ticket turnstyles. Open-kitchen restaurant cooks have been turned into food processors by similar ticketing machines. &#8220;Greeters&#8221; at supermarkets and shoping malls have become parking lot traffic directors by machines that now shout general greetings customers. And for what purpose? </p><p>The steralization of society, you propose? Actually, the real purpose of the machines is to give people more time to get to the airport. Why? Because if you are a celebrity fanatic, there is no place better than Narita International Airport to get your kicks in. </p><p>David Beckam, husband of Posh Spice, British soccer posterboy, arrived in Tokyo yesterday and was greeted by 1000+ screaming, crying, and fainting fans. It looked like an old Beatles or Beach Boys concert where a brief glance from one of the pretty boys could make you lightheaded and weak in the knees. How do I know this? Because there was a 10 minute special on Beckam&#8217;s 10 second walk out of customs on the morning news. And ever since that new vending machine replaced (liberated?) me as an English teacher, I have been able to pursue more important things. Like becoming a loitering airport fanboy. </p>', '2003-06-18 10:55:35+01', '2008-03-11 11:51:24+00', 2003, 6, NULL, NULL, 1, NULL, '2003-06-18 10:55:35+01');
INSERT INTO blogs VALUES (51, 'Motivational Challenges', 'motivational_challenges', '<p>Last year the challenge was to challenge myself. This year finding motivation to motivate myself and others is the name of the game.<p>The good news is that I have found success (to some extent, at least). After the shock of the passing of summer vacation and the birth of the new semester evaporated after the first week back on the job, I found that motivating myself was much easier than I though. I became giddy with planning and organizing and have even foregone talking with my buddies about girls in order to discuss how to become a better teacher. </p><p>Better teachers means better students, so motivation with my students, generally, hasn''t been a problem either. The barrier lies instead with apathetic teachers who seem to be better trained in brick laying than teaching as evidenced by the brick wall they have been constructing in the middle of my motivational super highway. </p><p>Perhaps I am dealing too much with metaphors and spending too much time updating my web site. Time to return to my plan: lesson planning! </p></td>', '<p>Last year the challenge was to challenge myself. This year finding motivation to motivate myself and others is the name of the game.<p>The good news is that I have found success (to some extent, at least). After the shock of the passing of summer vacation and the birth of the new semester evaporated after the first week back on the job, I found that motivating myself was much easier than I though. I became giddy with planning and organizing and have even foregone talking with my buddies about girls in order to discuss how to become a better teacher. </p><p>Better teachers means better students, so motivation with my students, generally, hasn&#8217;t been a problem either. The barrier lies instead with apathetic teachers who seem to be better trained in brick laying than teaching as evidenced by the brick wall they have been constructing in the middle of my motivational super highway. </p><p>Perhaps I am dealing too much with metaphors and spending too much time updating my web site. Time to return to my plan: lesson planning! </p></td>', '2002-09-12 01:48:55+01', '2008-03-11 11:51:24+00', 2002, 9, NULL, NULL, 1, NULL, '2002-09-12 01:48:55+01');
INSERT INTO blogs VALUES (59, 'Road Bumps', 'road_bumps', '<p>Congrats to all who found that by clicking on the ''home'' link above, you could read my journal entries that currently aren''t being displayed on page load. Sorry for the confusion; should be working properly.<p>It isn''t that I have been loafing about, though. I have been touring Japan with a brave soul from the states, Christine, who not only traveled for a week by herself, but also spent three nights sleeping on my apartment floor! That takes guts. Together we toured Nara prefecture and then hit Tokyo to see what buildings taller than two stories looked like. Thanks to a Japanese holiday, we weren''t confronted by any large crowds (instead of the typical 3 million people passing through Shinjuku on a daily basis, I would assume that there were only 2 million when we went). And thanks to Chritine''s contacts, we got to meet some very interesting and engaging people around Tokyo. Strange how friendship makes an 8 hour journey seem completly reasonable (while a bad night-train journey home makes 8 hours feel like an eternity). </p>', '<p>Congrats to all who found that by clicking on the &#8216;home&#8217; link above, you could read my journal entries that currently aren&#8217;t being displayed on page load. Sorry for the confusion; should be working properly.<p>It isn&#8217;t that I have been loafing about, though. I have been touring Japan with a brave soul from the states, Christine, who not only traveled for a week by herself, but also spent three nights sleeping on my apartment floor! That takes guts. Together we toured Nara prefecture and then hit Tokyo to see what buildings taller than two stories looked like. Thanks to a Japanese holiday, we weren&#8217;t confronted by any large crowds (instead of the typical 3 million people passing through Shinjuku on a daily basis, I would assume that there were only 2 million when we went). And thanks to Chritine&#8217;s contacts, we got to meet some very interesting and engaging people around Tokyo. Strange how friendship makes an 8 hour journey seem completly reasonable (while a bad night-train journey home makes 8 hours feel like an eternity). </p>', '2002-05-07 15:11:54+01', '2008-03-11 11:51:24+00', 2002, 5, NULL, NULL, 1, NULL, '2002-05-07 15:11:54+01');
INSERT INTO blogs VALUES (62, '''Rents', '''rents', '<p>Just a quick note from the road. The parents and brother arrived safe and sound last weekend in Tokyo where I was fashionably late to pick them up. Since then we have traveled from Kanto to Kansai and seen everything in between. It has been a trip dedicated more to Japanese fabric than culture, though, with a stop in Nagoya for a quilt convention and a day spent visiting fabric stores throughout Kyoto. Tomorrow we return to Tokyo and will then go our separate ways on Sunday.<p>The overall verdict, though, is that the rural life beats the crowded city life hands down. My parents nearly choked on the hospitality that my neighbors and friends showed them during their three days in Tenkawa. In two days, though, it will be tears of sorrow that they are choking on as they leave their precious first born behind in the savage South East Pacific for another year and a half. </p>', '<p>Just a quick note from the road. The parents and brother arrived safe and sound last weekend in Tokyo where I was fashionably late to pick them up. Since then we have traveled from Kanto to Kansai and seen everything in between. It has been a trip dedicated more to Japanese fabric than culture, though, with a stop in Nagoya for a quilt convention and a day spent visiting fabric stores throughout Kyoto. Tomorrow we return to Tokyo and will then go our separate ways on Sunday.<p>The overall verdict, though, is that the rural life beats the crowded city life hands down. My parents nearly choked on the hospitality that my neighbors and friends showed them during their three days in Tenkawa. In two days, though, it will be tears of sorrow that they are choking on as they leave their precious first born behind in the savage South East Pacific for another year and a half. </p>', '2002-03-28 19:04:15+00', '2008-03-11 11:51:24+00', 2002, 3, NULL, NULL, 1, NULL, '2002-03-28 19:04:15+00');
INSERT INTO blogs VALUES (63, 'Graduation', 'graduation', '<p>I was reminded again this weekend why I was content with leaving my scholastic career where I did when I matriculated into the real world of 9 to 5 jobs, fast cars, and faster women (or at least one of the three). Reason one: no more standardized tests. Reason two: no more long graduations to sit through. But as I was quickly reminded, neither "reason" is that easy to get away from.<p>Even though only fifteen students graduated at this weekend''s ceremonies, the event managed to take almost two hours. The little time that was spent on handing out the diplomas was made up for by lenghty and long winded speeches given by the wise men of the town in monotone and incomprehensable Japanese. I managed to stay awake, though, despite the students, parents, graduates, and teachers falling asleep around me. Sleeping in public in Japan has been elevated to an art form by the emphasis on procedure in Japan. Ceremonies must have speeches, classes must have lectures, office workers must have long commutes, and everyone must be busy. This doesn''t mean, however, that the speeches must say anything, the classes must teach anything, or the workers must actually produce anything. Quite the contrary, the importance is in the means, not the ends. Which means that, quite literally, that after years and years of practice, the stereotypical Japanese person can carry out their daily routine in their sleep. </p><p>So graduation made me feel like an insomniac. It also made me feel like I got off the bus at the wrong stop. Standing in the midst of a gymnasium full of Japanese singing their national anthem and bowing to their flag, the last thing I expected to hear during the issuing of the diplomas was "Yesterday." </p><p>The shock when the graduates stood and exited the gymnasium wasn''t that they were walking in step with "Hey Jude" that was playing in the background, but rather that the whole even was over. When asked later how it was by teachers, I couln''t remember the words for "painful" or "excruciating," so I settled of "interesting," but in mumbling my answer, actually said "delicious." Interesting, indeed. </p>', '<p>I was reminded again this weekend why I was content with leaving my scholastic career where I did when I matriculated into the real world of 9 to 5 jobs, fast cars, and faster women (or at least one of the three). Reason one: no more standardized tests. Reason two: no more long graduations to sit through. But as I was quickly reminded, neither &#8220;reason&#8221; is that easy to get away from.<p>Even though only fifteen students graduated at this weekend&#8217;s ceremonies, the event managed to take almost two hours. The little time that was spent on handing out the diplomas was made up for by lenghty and long winded speeches given by the wise men of the town in monotone and incomprehensable Japanese. I managed to stay awake, though, despite the students, parents, graduates, and teachers falling asleep around me. Sleeping in public in Japan has been elevated to an art form by the emphasis on procedure in Japan. Ceremonies must have speeches, classes must have lectures, office workers must have long commutes, and everyone must be busy. This doesn&#8217;t mean, however, that the speeches must say anything, the classes must teach anything, or the workers must actually produce anything. Quite the contrary, the importance is in the means, not the ends. Which means that, quite literally, that after years and years of practice, the stereotypical Japanese person can carry out their daily routine in their sleep. </p><p>So graduation made me feel like an insomniac. It also made me feel like I got off the bus at the wrong stop. Standing in the midst of a gymnasium full of Japanese singing their national anthem and bowing to their flag, the last thing I expected to hear during the issuing of the diplomas was &#8220;Yesterday.&#8221; </p><p>The shock when the graduates stood and exited the gymnasium wasn&#8217;t that they were walking in step with &#8220;Hey Jude&#8221; that was playing in the background, but rather that the whole even was over. When asked later how it was by teachers, I couln&#8217;t remember the words for &#8220;painful&#8221; or &#8220;excruciating,&#8221; so I settled of &#8220;interesting,&#8221; but in mumbling my answer, actually said &#8220;delicious.&#8221; Interesting, indeed. </p>', '2002-03-16 23:48:36+00', '2008-03-11 11:51:24+00', 2002, 3, NULL, NULL, 1, NULL, '2002-03-16 23:48:36+00');
INSERT INTO blogs VALUES (76, 'Can you say "Mizu?"', 'can_you_say_"mizu?"', '<p>That is Japanese for water, and we have seen quite a bit of it over the past 36 hours. Typhoon 11 landed onshore Monday night and has been dousing Tenkawa with constant rain since then. The harsh winds usually associated with typhoons were absent, but were made up for by the rainfall; the river outside of my apartment rose between 5 and 10 feet. The mountains here are pretty steep, though, so while a lot of water was channeled through the river, the town actually sits about 20 - 30 feet above the river.<p>Otherwise, life is surprisingly normal for such a foreign country. If only words could explain it; you have to see it for yourself! The name of the town is Tenkawa, and I am in the middle of Nara prefecture, which borders Osaka on the east. </p>', '<p>That is Japanese for water, and we have seen quite a bit of it over the past 36 hours. Typhoon 11 landed onshore Monday night and has been dousing Tenkawa with constant rain since then. The harsh winds usually associated with typhoons were absent, but were made up for by the rainfall; the river outside of my apartment rose between 5 and 10 feet. The mountains here are pretty steep, though, so while a lot of water was channeled through the river, the town actually sits about 20 &#8211; 30 feet above the river.<p>Otherwise, life is surprisingly normal for such a foreign country. If only words could explain it; you have to see it for yourself! The name of the town is Tenkawa, and I am in the middle of Nara prefecture, which borders Osaka on the east. </p>', '2001-08-21 23:19:18+01', '2008-03-11 11:51:24+00', 2001, 8, NULL, NULL, 1, NULL, '2001-08-21 23:19:18+01');
INSERT INTO blogs VALUES (93, 'Traveling New Zealand', 'traveling-new-zealand', '', NULL, '2007-11-14 00:39:53+00', '2008-03-11 11:51:24+00', 2007, 11, NULL, '2008-12-31 00:00:00+00', 6, NULL, NULL);
INSERT INTO blogs VALUES (92, 'Traveling Fiji', 'traveling-fiji', '', NULL, '2007-11-14 00:37:46+00', '2008-03-11 11:51:24+00', 2007, 11, NULL, '2008-12-31 00:00:00+00', 6, NULL, NULL);
INSERT INTO blogs VALUES (91, 'Using Unix', 'using-unix', '', NULL, '2007-11-14 00:36:36+00', '2008-03-11 11:51:24+00', 2007, 11, NULL, '2008-12-31 00:00:00+00', 7, NULL, NULL);
INSERT INTO blogs VALUES (86, 'Plone vs. Rails', 'plone-vs-rails', 'Common benefits
* active user community
* Not written in PHP

Plone

- Benefits
* internationalization
* authentication
* role-base permissions
* products provide complete functional packages that are easy to deploy - provides GUI functionality
* object-relational database

- Detractions
* GUI customization
* Required to learn Python + Plone/Zope
* Only easily versionable if certain development practices are followed
* No strong focus on testing

Rails
* deployment tools
* strong focus on testing
* plugins provide functional packages that are easy to deploy - provides programming functionality

- Detractions
* must roll own authentication
* no production-ready GUI for free
* Many hoops to jump through for Unicode support

Plone is better for a site that is 80% standard, where the 20% that is custom you want to reuse across other sites in the future.

Rails is better for a site that is 20% standard, with concepts but not interactions that you want to reuse across other sites in the future.', 'Common benefits
	<ul>
	<li>active user community</li>
		<li>Not written in <span class="caps">PHP</span></li>
	</ul>


	<p>Plone</p>


- Benefits
	<ul>
	<li>internationalization</li>
		<li>authentication</li>
		<li>role-base permissions</li>
		<li>products provide complete functional packages that are easy to deploy &#8211; provides <span class="caps">GUI</span> functionality</li>
		<li>object-relational database</li>
	</ul>


- Detractions
	<ul>
	<li><span class="caps">GUI</span> customization</li>
		<li>Required to learn Python + Plone/Zope</li>
		<li>Only easily versionable if certain development practices are followed</li>
		<li>No strong focus on testing</li>
	</ul>


Rails
	<ul>
	<li>deployment tools</li>
		<li>strong focus on testing</li>
		<li>plugins provide functional packages that are easy to deploy &#8211; provides programming functionality</li>
	</ul>


- Detractions
	<ul>
	<li>must roll own authentication</li>
		<li>no production-ready <span class="caps">GUI</span> for free</li>
		<li>Many hoops to jump through for Unicode support</li>
	</ul>


	<p>Plone is better for a site that is 80% standard, where the 20% that is custom you want to reuse across other sites in the future.</p>


	<p>Rails is better for a site that is 20% standard, with concepts but not interactions that you want to reuse across other sites in the future.</p>', '2007-06-06 14:47:51+01', '2008-03-11 11:51:24+00', 2007, 6, NULL, '2008-12-31 00:00:00+00', 7, NULL, NULL);
INSERT INTO blogs VALUES (85, 'Unicode in Rails', 'unicode-in-rails', 'Internationalization: http://manuals.rubyonrails.com/read/chapter/105

Unicode support via plugin: http://julik.textdriven.com/svn/tools/rails_plugins/unicode_hacks/UNICODE_PRIMER

How to use Unicode strings: http://wiki.rubyonrails.com/rails/pages/HowToUseUnicodeStrings

Another how-to: http://ruphus.com/blog/2005/06/23/getting-unicode-mysql-and-rails-to-cooperate/', '<p>Internationalization: http://manuals.rubyonrails.com/read/chapter/105</p>


	<p>Unicode support via plugin: http://julik.textdriven.com/svn/tools/rails_plugins/unicode_hacks/UNICODE_PRIMER</p>


	<p>How to use Unicode strings: http://wiki.rubyonrails.com/rails/pages/HowToUseUnicodeStrings</p>


	<p>Another how-to: http://ruphus.com/blog/2005/06/23/getting-unicode-mysql-and-rails-to-cooperate/</p>', '2007-06-06 14:40:22+01', '2008-03-11 11:51:24+00', 2007, 6, NULL, '2008-12-31 00:00:00+00', 7, NULL, NULL);
INSERT INTO blogs VALUES (90, 'Name calling', 'name-calling', 'As a way of helping people understand my cross-cultural engagement and move to Japan 9 months before our wedding, I liked to refer to myself as a mail-order groom.  But now that we''re in New Zealand thanks to my wife''s working holiday visa, I think it''s much easier to think of me as a ''trophy husband.''

You wouldn''t know it by looking at me, however.  I don''t carry around a man-purse stuffed with a pure-bred lap dog.  Instead, I spend my days deep in though, contemplating the depths of married life, for example, by trying to comprehend the paradox of pet names (if you''re my baby, and I''m your baby, then how does that work?).

She does let me out of the apartment on occassion.  This ', '<p>As a way of helping people understand my cross-cultural engagement and move to Japan 9 months before our wedding, I liked to refer to myself as a mail-order groom.  But now that we&#8217;re in New Zealand thanks to my wife&#8217;s working holiday visa, I think it&#8217;s much easier to think of me as a &#8216;trophy husband.&#8217;</p>


	<p>You wouldn&#8217;t know it by looking at me, however.  I don&#8217;t carry around a man-purse stuffed with a pure-bred lap dog.  Instead, I spend my days deep in though, contemplating the depths of married life, for example, by trying to comprehend the paradox of pet names (if you&#8217;re my baby, and I&#8217;m your baby, then how does that work?).</p>


	<p>She does let me out of the apartment on occassion.  This</p>', '2007-11-11 23:56:34+00', '2008-03-11 11:51:24+00', 2007, 11, NULL, '2008-01-01 00:00:00+00', 1, NULL, NULL);
INSERT INTO blogs VALUES (80, 'Testing Mailing with Mocks', 'testing-with-mocks', 'Ruby as a language provides two facilities that, when used together, makes it easy to ensure that your code is doing what its supposed to.  The first is the [[Unit Test][http://www.ruby-doc.org/stdlib/libdoc/test/unit/rdoc/index.html]] library that is part of Ruby''s [[http://www.ruby-doc.org/stdlib/][stdlib]].  The other is the ability to 

http://wiki.rubyonrails.org/rails/pages/HowToTestActionMailersAndControllers

http://manuals.rubyonrails.com/read/chapter/64', '<p>Ruby as a language provides two facilities that, when used together, makes it easy to ensure that your code is doing what its supposed to.  The first is the [<a href="http://www.ruby-doc.org/stdlib/libdoc/test/unit/rdoc/index.html">Unit Test</a>] library that is part of Ruby&#8217;s [<a href="stdlib">http://www.ruby-doc.org/stdlib/</a>].  The other is the ability to</p>


	<p>http://wiki.rubyonrails.org/rails/pages/HowToTestActionMailersAndControllers</p>


	<p>http://manuals.rubyonrails.com/read/chapter/64</p>', '2007-01-23 23:38:17+00', '2008-03-23 07:15:49+00', 2007, 1, NULL, '2008-01-01 00:00:00+00', 1, NULL, NULL);
INSERT INTO blogs VALUES (97, 'Parts, Builder, and Caching', 'parts-builder-and-caching', '"Rails":http://www.rubyonrails.com is clever.  "Merb":http://www.merbivore.com is smart.

Case in point: Components / Cells / Parts.  The goal: to be able to extract generic view code for ease of use across the whole application.  This doesn''t work well in Rails; "Mike on Tech explains why here.":http://mikepence.wordpress.com/2008/03/16/cells-bring-clean-re-use-to-your-rails-views/

The solution in Rails to this problem is clever: using the "Engines plugin":http://rails-engines.org/ (which hack Rails to make it easy to specify controller, view, and model code in a plugin), extend Rails to support "cells":http://cells.rubyforge.org/ in an efficient manner.

*UPDATE* Looks like Cells no longer has the "Engines dependency":http://mikepence.wordpress.com/2008/03/22/removing-the-engines-dependency-from-cells/.

The solution in Merb is smart: build the framework from the beginning to support components (called Parts).

h3. Parts

From the "source":http://github.com/wycats/merb-more/tree/master/merb-parts/lib/merb-parts/part_controller.rb :

<pre><code>
# A Merb::PartController is a light weight way to share logic and templates
# amongst controllers.  
# Merb::PartControllers work just like Merb::controller.  
# There is a filter stack, layouts (if needed) all the render functions,
# and url generation.  
#
# Cookies, params, and even the request object are shared with the web controller
</code></pre>

To start using Parts in Merb, generate a new Parts controller

<pre><code>
$ merb-gen part_controller generic
# => exists  app
# => exists  app/helpers
# => exists  app/parts
# => exists  app/parts/views
# => create  app/parts/views/generic_part
# => create  app/helpers/generic_part_helper.rb
# => create  app/parts/generic_part.rb
# => create  app/parts/views/generic_part/index.html.erb
</code></pre>

To enable parts, include merb-parts as a dependancy in config/init.rb.  Make sure that the merb-parts gem is installed (it''s installed with merb-more).

<pre><code>
# config/init.rb
dependency( "merb-parts")
</code></pre>

Each part will correspond to an action in a part controller.  To create a menu part:

Add the #menu action to app/parts/generic_part.rb

<pre><code>
# app/parts/generic_part.rb
def menu
  render
end
</code></pre>

Create the menu part view

<pre><code>
# app/parts/views/generic_part/menu.html.erb
<ul>
  <li><a href="http://www.google.com">Google</a></li>
  <% params[:menu_items].each do |name, link| %>
    <li><a href="<%= link %>"><%= name %></a></li>
  <% end %>
</ul>
</code></pre>

Reference the part in your regular controller views.  Any additional hash values are included in the params hash available to part controller actions.

<pre><code>
# app/views/blogs/index.html.erb
...
<%= part( GenericPart => :menu, :menu_items => { :yahoo => ''http://www.yahoo.com'' } ) %>
</code></pre>

h3. Builder

Builder is the same as XmlBuilder in Rails.  It is a templating engine that makes it easy to write XML.

In Rails, access to the XmlBuilder object is made available to templates ending in .rxml.  In Merb, this is how make a Builder template:

Inlude merb-builder as a dependency in config/init.rb.  Make sure that the merb-builder gem is installed (it''s installed with merb-more).

<pre><code>
# config/init.rb
dependency( "merb-buidler" )
</code></pre>
Create your template with the .builder suffix.  This template will have access to the xml object used by Builder.

<pre><code>
# app/views/blogs/index.xml.builder
xml.posts do
  for post in @posts
    xml.post do
      xml.id post.id
    end
  end
end
</code></pre>

h3. Caching

Caching is similarly turned on in Merb.  Merb supports page, action, fragment, and object caching.  Merb also supports the following cache stores: Database (ActiveRecord, DataMapper, and Sequel support), filesystem, memory, and memcache.

The "merb-cache Readme":http://github.com/wycats/merb-more/tree/master/merb-cache has examples for cache usage and configuration.

One gotcha is that at the time of this writing, disabling caching does not turn off page caching.  To enable turning off the page cache, see "this fix.":http://github.com/fightinjoe/merb-more/commit/feaed59155bc9d762176914802284a46a0cf50db', '<p><a href="http://www.rubyonrails.com">Rails</a> is clever.  <a href="http://www.merbivore.com">Merb</a> is smart.</p>


	<p>Case in point: Components / Cells / Parts.  The goal: to be able to extract generic view code for ease of use across the whole application.  This doesn&#8217;t work well in Rails; <a href="http://mikepence.wordpress.com/2008/03/16/cells-bring-clean-re-use-to-your-rails-views/">Mike on Tech explains why here.</a></p>


	<p>The solution in Rails to this problem is clever: using the <a href="http://rails-engines.org/">Engines plugin</a> (which hack Rails to make it easy to specify controller, view, and model code in a plugin), extend Rails to support <a href="http://cells.rubyforge.org/">cells</a> in an efficient manner.</p>


	<p><strong><span class="caps">UPDATE</span></strong> Looks like Cells no longer has the <a href="http://mikepence.wordpress.com/2008/03/22/removing-the-engines-dependency-from-cells/">Engines dependency</a>.</p>


	<p>The solution in Merb is smart: build the framework from the beginning to support components (called Parts).</p>


	<h3>Parts</h3>


	<p>From the <a href="http://github.com/wycats/merb-more/tree/master/merb-parts/lib/merb-parts/part_controller.rb">source</a> :</p>


<pre><code>
# A Merb::PartController is a light weight way to share logic and templates
# amongst controllers.  
# Merb::PartControllers work just like Merb::controller.  
# There is a filter stack, layouts (if needed) all the render functions,
# and url generation.  
#
# Cookies, params, and even the request object are shared with the web controller
</code></pre>

	<p>To start using Parts in Merb, generate a new Parts controller</p>


<pre><code>
$ merb-gen part_controller generic
# =&gt; exists  app
# =&gt; exists  app/helpers
# =&gt; exists  app/parts
# =&gt; exists  app/parts/views
# =&gt; create  app/parts/views/generic_part
# =&gt; create  app/helpers/generic_part_helper.rb
# =&gt; create  app/parts/generic_part.rb
# =&gt; create  app/parts/views/generic_part/index.html.erb
</code></pre>

	<p>To enable parts, include merb-parts as a dependancy in config/init.rb.  Make sure that the merb-parts gem is installed (it&#8217;s installed with merb-more).</p>


<pre><code>
# config/init.rb
dependency( "merb-parts")
</code></pre>

	<p>Each part will correspond to an action in a part controller.  To create a menu part:</p>


	<p>Add the #menu action to app/parts/generic_part.rb</p>


<pre><code>
# app/parts/generic_part.rb
def menu
  render
end
</code></pre>

	<p>Create the menu part view</p>


<pre><code>
# app/parts/views/generic_part/menu.html.erb
&lt;ul&gt;
  &lt;li&gt;&lt;a href="http://www.google.com"&gt;Google&lt;/a&gt;&lt;/li&gt;
  &lt;% params[:menu_items].each do |name, link| %&gt;
    &lt;li&gt;&lt;a href="&lt;%= link %&gt;"&gt;&lt;%= name %&gt;&lt;/a&gt;&lt;/li&gt;
  &lt;% end %&gt;
&lt;/ul&gt;
</code></pre>

	<p>Reference the part in your regular controller views.  Any additional hash values are included in the params hash available to part controller actions.</p>


<pre><code>
# app/views/blogs/index.html.erb
...
&lt;%= part( GenericPart =&gt; :menu, :menu_items =&gt; { :yahoo =&gt; ''http://www.yahoo.com'' } ) %&gt;
</code></pre>

	<h3>Builder</h3>


	<p>Builder is the same as XmlBuilder in Rails.  It is a templating engine that makes it easy to write <span class="caps">XML</span>.</p>


	<p>In Rails, access to the XmlBuilder object is made available to templates ending in .rxml.  In Merb, this is how make a Builder template:</p>


	<p>Inlude merb-builder as a dependency in config/init.rb.  Make sure that the merb-builder gem is installed (it&#8217;s installed with merb-more).</p>


<pre><code>
# config/init.rb
dependency( "merb-buidler" )
</code></pre>
Create your template with the .builder suffix.  This template will have access to the xml object used by Builder.

<pre><code>
# app/views/blogs/index.xml.builder
xml.posts do
  for post in @posts
    xml.post do
      xml.id post.id
    end
  end
end
</code></pre>

	<h3>Caching</h3>


	<p>Caching is similarly turned on in Merb.  Merb supports page, action, fragment, and object caching.  Merb also supports the following cache stores: Database (ActiveRecord, DataMapper, and Sequel support), filesystem, memory, and memcache.</p>


	<p>The <a href="http://github.com/wycats/merb-more/tree/master/merb-cache">merb-cache Readme</a> has examples for cache usage and configuration.</p>


	<p>One gotcha is that at the time of this writing, disabling caching does not turn off page caching.  To enable turning off the page cache, see <a href="http://github.com/fightinjoe/merb-more/commit/feaed59155bc9d762176914802284a46a0cf50db">this fix.</a></p>', '2008-03-23 07:05:54+00', '2008-03-23 11:50:37+00', 2008, 3, NULL, '2008-04-06 00:00:00+01', 8, NULL, '2008-03-23 07:05:53+00');
INSERT INTO blogs VALUES (98, 'Changing RESTful URL mappings', 'changing-restful-url-mappings', 'REST is a style of representing web resources.  Rails has popularized the RESTful style, interpreting it into a full set of url patterns and request methods.  These patterns have become convention.  I''ve got a problem with these conventions.

My issue is when problems arrive when creating or updating a resource.  Consider the following scenario for creating a new comment:

# *GET: /comment/new* is opened, displaying the form for creating a comment
# *POST: /comment* is called when the empty form is accidentally submitted
# The comment is not saved because of a validation error, but...
# the request is not redirected because the error information would be lost, so...
# the *comment/new* view is rendered, but the url is */comment*
# Should the page be manually refreshed, a different page will display

In this situation, the view corresponds to the action, but the URL doesn''t.

It would be better, instead if:

# The *CREATE* action mapped to the *POST: resource/new* method/url pattern.
# The *UPDATE* action mapped to the *PUT: resource/_id_/edit* method/url pattern.

The cool thing is, if you''re using Merb, it''s easy to disagree.  But first it''s good to know about Merb''s routing.

Merb''s routing is Rails-inspired, so much of it will appear the same, especially regarding RESTful resources:

# Merb supports namespaces
# Merb supports both "#resource":http://merbivore.com/documentation/merb-core/0.9.1/index.html?a=M000758&name=resource and "#resources":http://merbivore.com/documentation/merb-core/0.9.1/index.html?a=M000757&name=resources, for specifying either singleton or collection resource
# Merb''s names routes in the same way as Rails (though they''re exposed through the "#url":http://merbivore.com/documentation/merb-core/0.9.1/index.html?a=M000646&name=url method instead of as magic methods)

For specific examples, sometimes it''s quicker to "browse the codebase":http://github.com/wycats/merb-core/tree/master/lib/merb-core/dispatch/router/behavior.rb than it is to troll through the docs.

Merb''s routing code is different from Rails, though, in that there is much less magic happening.  That makes it easy to change the way it behaves in order to customize the RESTful URL mappings.

The mappings are in "merb-core/lib/merb-core/dispatch/router/behavior.rb":http://github.com/wycats/merb-core/tree/master/lib/merb-core/dispatch/router/behavior.rb and are a simple set of regular expressions.  Adding the alternate behavior described above is as easy as swapping a few regular expressions:

<pre><code>
Behavior.new({ :path => %r[^/?(.:format)?$],     :method => :post },   { :action => "create" },  parent),
#...
Behavior.new({ :path => %r[^/:id(.:format)?$],   :method => :put },    { :action => "update" },  parent),
</code></pre>

... becomes ...

<pre><code>
Behavior.new({ :path => %r[^/new(.:format)?$],         :method => :post },   { :action => "create" },  parent),
# ...
Behavior.new({ :path => %r[^/:id[;/]edit(.:format)?$], :method => :put },    { :action => "update" },  parent),
</code></pre>

Extract these changes into a "separate file":http://pastie.caboo.se/private/d9uothverwor0jjyk0oweg and then include them in init.rb to override Merb''s default behavior.  Easy!

Resources:

# "Building Web Services the REST Way":http://www.xfront.com/REST-Web-Services.html
# Inspiration from an old discussion with "Paul Prescod":http://www.prescod.net', '<p><span class="caps">REST</span> is a style of representing web resources.  Rails has popularized the RESTful style, interpreting it into a full set of url patterns and request methods.  These patterns have become convention.  I&#8217;ve got a problem with these conventions.</p>


	<p>My issue is when problems arrive when creating or updating a resource.  Consider the following scenario for creating a new comment:</p>


	<ol>
	<li><strong><span class="caps">GET</span>: /comment/new</strong> is opened, displaying the form for creating a comment</li>
		<li><strong><span class="caps">POST</span>: /comment</strong> is called when the empty form is accidentally submitted</li>
		<li>The comment is not saved because of a validation error, but&#8230;</li>
		<li>the request is not redirected because the error information would be lost, so&#8230;</li>
		<li>the <strong>comment/new</strong> view is rendered, but the url is <strong>/comment</strong></li>
		<li>Should the page be manually refreshed, a different page will display</li>
	</ol>


	<p>In this situation, the view corresponds to the action, but the <span class="caps">URL</span> doesn&#8217;t.</p>


	<p>It would be better, instead if:</p>


	<ol>
	<li>The <strong><span class="caps">CREATE</span></strong> action mapped to the <strong><span class="caps">POST</span>: resource/new</strong> method/url pattern.</li>
		<li>The <strong><span class="caps">UPDATE</span></strong> action mapped to the <strong><span class="caps">PUT</span>: resource/<em>id</em>/edit</strong> method/url pattern.</li>
	</ol>


	<p>The cool thing is, if you&#8217;re using Merb, it&#8217;s easy to disagree.  But first it&#8217;s good to know about Merb&#8217;s routing.</p>


	<p>Merb&#8217;s routing is Rails-inspired, so much of it will appear the same, especially regarding RESTful resources:</p>


	<ol>
	<li>Merb supports namespaces</li>
		<li>Merb supports both <a href="http://merbivore.com/documentation/merb-core/0.9.1/index.html?a=M000758&#38;name=resource">#resource</a> and <a href="http://merbivore.com/documentation/merb-core/0.9.1/index.html?a=M000757&#38;name=resources">#resources</a>, for specifying either singleton or collection resource</li>
		<li>Merb&#8217;s names routes in the same way as Rails (though they&#8217;re exposed through the <a href="http://merbivore.com/documentation/merb-core/0.9.1/index.html?a=M000646&#38;name=url">#url</a> method instead of as magic methods)</li>
	</ol>


	<p>For specific examples, sometimes it&#8217;s quicker to <a href="http://github.com/wycats/merb-core/tree/master/lib/merb-core/dispatch/router/behavior.rb">browse the codebase</a> than it is to troll through the docs.</p>


	<p>Merb&#8217;s routing code is different from Rails, though, in that there is much less magic happening.  That makes it easy to change the way it behaves in order to customize the RESTful <span class="caps">URL</span> mappings.</p>


	<p>The mappings are in <a href="http://github.com/wycats/merb-core/tree/master/lib/merb-core/dispatch/router/behavior.rb">merb-core/lib/merb-core/dispatch/router/behavior.rb</a> and are a simple set of regular expressions.  Adding the alternate behavior described above is as easy as swapping a few regular expressions:</p>


<pre><code>
Behavior.new({ :path =&gt; %r[^/?(.:format)?$],     :method =&gt; :post },   { :action =&gt; "create" },  parent),
#...
Behavior.new({ :path =&gt; %r[^/:id(.:format)?$],   :method =&gt; :put },    { :action =&gt; "update" },  parent),
</code></pre>

	<p>... becomes &#8230;</p>


<pre><code>
Behavior.new({ :path =&gt; %r[^/new(.:format)?$],         :method =&gt; :post },   { :action =&gt; "create" },  parent),
# ...
Behavior.new({ :path =&gt; %r[^/:id[;/]edit(.:format)?$], :method =&gt; :put },    { :action =&gt; "update" },  parent),
</code></pre>

	<p>Extract these changes into a <a href="http://pastie.caboo.se/private/d9uothverwor0jjyk0oweg">separate file</a> and then include them in init.rb to override Merb&#8217;s default behavior.  Easy!</p>


	<p>Resources:</p>


	<ol>
	<li><a href="http://www.xfront.com/REST-Web-Services.html">Building Web Services the <span class="caps">REST</span> Way</a></li>
		<li>Inspiration from an old discussion with <a href="http://www.prescod.net">Paul Prescod</a></li>
	</ol>', '2008-03-24 11:55:36+00', '2008-03-24 11:56:39+00', 2008, 3, NULL, '2008-04-07 00:00:00+01', 8, NULL, '2008-03-24 11:55:36+00');
INSERT INTO blogs VALUES (101, 'Apples and Oranges', 'apples-and-oranges', 'Never stop learning, or so they say.  With the cost of a post-graduate degree or returning for a higher education, they might as well say "never stop paying for student loans."

When schooling was public, learning was easy.  Once graduated, it doesn''t come so easy.  First, it requires a proactive attitude.  Next, it requires some discrimination to find good teachers; i.e. CNN and Fox News aren''t exactly ideal teachers.  Finally, it requires a lot of patience.

I''ve been trying to pick up a few new skills recently, most of which run parallel to my line of work - web app development.  The problem is that while I have a generic knowledge base regarding programming, on top of that I have very specific knowledge of my preferred "programming language":http://www.ruby-lang.org/ and "web framework":http://www.rubyonrails.com.  When shifting to a different language or framework, I don''t need to rebuild my base - I just need to translate my specific knowledge.

Learning many things is like this.  If experience is the best teacher, being able to relate new knowledge to previous experience has to be a second-best option.  In this vein, I''m trying something new - I''m trying to collect knowledge I have, and then as I learn new things, I want to what I know into what I learned.

Thus, I''ve spawned "Vs.":http://vs.fightinjoe.com, a web app that is supposed to make comparisons easy.  It''s still a work in progress, but it''s given me quite a few opportunities to play with different design ideas, new programming tools and techniques, and unique attitudes towards learning.

Right now the site is clearly only serving one person - myself.  It''s available for public viewing, but closed for contribution.  My hope is that I can open it up in the near future for anyone to use.

It would be cool to use the site for things like comparing languages, or even dialects of the same language; for comparing products, foods, recipes; for comparing theories, philosophies, etc.

So with that goal in mind, what do you want to compare?  Is the project worthwhile?  Can this be a better way to learn, or just another silly web app?', '<p>Never stop learning, or so they say.  With the cost of a post-graduate degree or returning for a higher education, they might as well say &#8220;never stop paying for student loans.&#8221;</p>


	<p>When schooling was public, learning was easy.  Once graduated, it doesn&#8217;t come so easy.  First, it requires a proactive attitude.  Next, it requires some discrimination to find good teachers; i.e. <span class="caps">CNN</span> and Fox News aren&#8217;t exactly ideal teachers.  Finally, it requires a lot of patience.</p>


	<p>I&#8217;ve been trying to pick up a few new skills recently, most of which run parallel to my line of work &#8211; web app development.  The problem is that while I have a generic knowledge base regarding programming, on top of that I have very specific knowledge of my preferred <a href="http://www.ruby-lang.org/">programming language</a> and <a href="http://www.rubyonrails.com">web framework</a>.  When shifting to a different language or framework, I don&#8217;t need to rebuild my base &#8211; I just need to translate my specific knowledge.</p>


	<p>Learning many things is like this.  If experience is the best teacher, being able to relate new knowledge to previous experience has to be a second-best option.  In this vein, I&#8217;m trying something new &#8211; I&#8217;m trying to collect knowledge I have, and then as I learn new things, I want to what I know into what I learned.</p>


	<p>Thus, I&#8217;ve spawned <a href="http://vs.fightinjoe.com">Vs.</a>, a web app that is supposed to make comparisons easy.  It&#8217;s still a work in progress, but it&#8217;s given me quite a few opportunities to play with different design ideas, new programming tools and techniques, and unique attitudes towards learning.</p>


	<p>Right now the site is clearly only serving one person &#8211; myself.  It&#8217;s available for public viewing, but closed for contribution.  My hope is that I can open it up in the near future for anyone to use.</p>


	<p>It would be cool to use the site for things like comparing languages, or even dialects of the same language; for comparing products, foods, recipes; for comparing theories, philosophies, etc.</p>


	<p>So with that goal in mind, what do you want to compare?  Is the project worthwhile?  Can this be a better way to learn, or just another silly web app?</p>', '2008-04-13 14:18:39+01', '2008-04-13 14:18:39+01', 2008, 4, NULL, '2008-04-28 00:00:00+01', 1, NULL, '2008-04-13 14:18:39+01');
INSERT INTO blogs VALUES (102, 'CSS + Table Headers', 'css-table-headers', 'I ran across a unique CSS problem today:

bq. How do you style an <tt>HTML table</tt> so that the<tt>thead</tt> is always floating at the top and it can gracefully accommodate heights and widths greater than the size of the window?

h2. Here''s the setup:

A quick disclaimer: I haven''t tested any of this yet in IE.

Within my "Vs.":http://vs.fightinjoe.com project, I have a table that is a collection of 400px-wide columns buffered by columns on either side.  The buffers are there to ensure that the 400px-wide columns appear in the middle of the screen.

To ensure that the buffers work as expected, I''ve had to do the following:

# make sure that any content in the left buffer is duplicated in the right buffer - different content seems to throw off the calculation of the column''s size
# specified a width of 50% both buffers
# specified a min-width of 130px for both buffers

h2. Here''s the approach:

Using <tt>position: fixed</tt> applied to the <tt>thead</tt> works unless there is horizontal scrolling, in which case it stays fixed while the rest of the content moves.

Styling the <tt>tbody</tt> is another option.  Using <tt>position:absolute</tt>, we can specify "dynamic dimensions":http://www.alistapart.com/articles/conflictingabsolutepositions for the <tt>tbody</tt>; setting <tt>overflow</tt> to <tt>auto</tt> we can then have "only the content scroll while the headings stay in place":http://www.imaputz.com/cssStuff/bigFourVersion.html.

[code lang="css"]
tbody {
  /* override display: table which doesn''t respect
      conflicting absolute positions */
  display: block;
  position: absolute;
  top: 50px;
  bottom: 20px;
  width: 100%;
  overflow: auto;
}
[/code]

This solves the main problem, but leaves a problem when there is scrolling:

# The vertical scrollbar bumps the content 16px, so the <tt>tbody</tt> no longer aligns perfectly with the <tt>thead</tt>.
# The extra width of the vertical scrollbar induces a horizontal scrollbar

The solution is to "turn off the horizontal scrollbar":http://www.webdeveloper.com/forum/showthread.php?t=163210, turn on the vertical scrollbar, and bump the <tt>thead</tt> by 16px.

[code lang="css"]
tbody {
  overflow: scroll;
  overflow-y: scroll;
  overflow-x: hidden;
  overflow: -moz-scrollbars-vertical;
}

thead {
  margin-right: 16px;
}
[/code]

And it works!  You can see it in action by doing any comparison at http://vs.fightinjoe.com.  Check out the source to see how the stylesheet does it''s magic.

h2. Resources

My first inclination that this was possible was the proof-of-concept: "Pure CSS Scrollable Table with Fixed Header":http://www.imaputz.com/cssStuff/bigFourVersion.html

This jogged my memory about the A List Apart article about fluid layouts with "Conflicting Absolute Positions":http://www.alistapart.com/articles/conflictingabsolutepositions.

I finally got some help with the scrollbars from this "Web Developers Forum Thread":http://www.webdeveloper.com/forum/showthread.php?t=163210.', '<p>I ran across a unique <span class="caps">CSS</span> problem today:</p>


	<blockquote>
		<p>How do you style an <tt><span class="caps">HTML</span> table</tt> so that the<tt>thead</tt> is always floating at the top and it can gracefully accommodate heights and widths greater than the size of the window?</p>
	</blockquote>


	<h2>Here&#8217;s the setup:</h2>


	<p>A quick disclaimer: I haven&#8217;t tested any of this yet in IE.</p>


	<p>Within my <a href="http://vs.fightinjoe.com">Vs.</a> project, I have a table that is a collection of 400px-wide columns buffered by columns on either side.  The buffers are there to ensure that the 400px-wide columns appear in the middle of the screen.</p>


	<p>To ensure that the buffers work as expected, I&#8217;ve had to do the following:</p>


	<ol>
	<li>make sure that any content in the left buffer is duplicated in the right buffer &#8211; different content seems to throw off the calculation of the column&#8217;s size</li>
		<li>specified a width of 50% both buffers</li>
		<li>specified a min-width of 130px for both buffers</li>
	</ol>


	<h2>Here&#8217;s the approach:</h2>


	<p>Using <tt>position: fixed</tt> applied to the <tt>thead</tt> works unless there is horizontal scrolling, in which case it stays fixed while the rest of the content moves.</p>


	<p>Styling the <tt>tbody</tt> is another option.  Using <tt>position:absolute</tt>, we can specify <a href="http://www.alistapart.com/articles/conflictingabsolutepositions">dynamic dimensions</a> for the <tt>tbody</tt>; setting <tt>overflow</tt> to <tt>auto</tt> we can then have <a href="http://www.imaputz.com/cssStuff/bigFourVersion.html">only the content scroll while the headings stay in place</a>.</p>


	<p><pre style="overflow: hidden;"><code class="line_number" style="float: left; margin-right: 1em">&nbsp;1
&nbsp;2
&nbsp;3
&nbsp;4
&nbsp;5
&nbsp;6
&nbsp;7
&nbsp;8
&nbsp;9
10</code><code>tbody {
&nbsp;&nbsp;/* override display: table which doesn''t respect
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;conflicting absolute positions */
&nbsp;&nbsp;display: block;
&nbsp;&nbsp;position: absolute;
&nbsp;&nbsp;top: 50px;
&nbsp;&nbsp;bottom: 20px;
&nbsp;&nbsp;width: 100%;
&nbsp;&nbsp;overflow: auto;
}
</code></pre></p>


	<p>This solves the main problem, but leaves a problem when there is scrolling:</p>


	<ol>
	<li>The vertical scrollbar bumps the content 16px, so the <tt>tbody</tt> no longer aligns perfectly with the <tt>thead</tt>.</li>
		<li>The extra width of the vertical scrollbar induces a horizontal scrollbar</li>
	</ol>


	<p>The solution is to <a href="http://www.webdeveloper.com/forum/showthread.php?t=163210">turn off the horizontal scrollbar</a>, turn on the vertical scrollbar, and bump the <tt>thead</tt> by 16px.</p>


	<p><pre style="overflow: hidden;"><code class="line_number" style="float: left; margin-right: 1em">&nbsp;1
&nbsp;2
&nbsp;3
&nbsp;4
&nbsp;5
&nbsp;6
&nbsp;7
&nbsp;8
&nbsp;9
10</code><code>tbody {
&nbsp;&nbsp;overflow: scroll;
&nbsp;&nbsp;overflow-y: scroll;
&nbsp;&nbsp;overflow-x: hidden;
&nbsp;&nbsp;overflow: -moz-scrollbars-vertical;
}

thead {
&nbsp;&nbsp;margin-right: 16px;
}
</code></pre></p>


	<p>And it works!  You can see it in action by doing any comparison at http://vs.fightinjoe.com.  Check out the source to see how the stylesheet does it&#8217;s magic.</p>


	<h2>Resources</h2>


	<p>My first inclination that this was possible was the proof-of-concept: <a href="http://www.imaputz.com/cssStuff/bigFourVersion.html">Pure <span class="caps">CSS</span> Scrollable Table with Fixed Header</a></p>


	<p>This jogged my memory about the A List Apart article about fluid layouts with <a href="http://www.alistapart.com/articles/conflictingabsolutepositions">Conflicting Absolute Positions</a>.</p>


	<p>I finally got some help with the scrollbars from this <a href="http://www.webdeveloper.com/forum/showthread.php?t=163210">Web Developers Forum Thread</a>.</p>', '2008-04-15 13:14:38+01', '2008-04-15 13:14:38+01', 2008, 4, NULL, '2008-04-29 00:00:00+01', 8, NULL, NULL);
INSERT INTO blogs VALUES (103, 'Distributed MVC', 'distributed-mvc', '"Rails":http://www.rubyonrails.com literally interprets the MVC structure in the /app directory with the <tt>models</tt>, <tt>views</tt>, and <tt>controllers</tt> directories.  These directories are essential to how Rails runs, as it eschews configuration for the context that these directories and their files provide.

"Merb":http://www.merbivore.com follows suit; all default Merb apps respect the MVC structure Rails pioneered.  But Merb allows the defaults to be overwritten, allowing for open interpretation of MVC''s physical structure.

<tt>merb-gen app</tt> supports the default, flat, and very-flat app generation.  And in the <tt>init.rb</tt> file, a custom directory structure can be setup; see the "inline docs on the bootloader":http://github.com/wycats/merb-core/tree/master/lib/merb-core/bootloader.rb, line 144, for more details.

But what if static customization of the MVC structure isn''t enough?  What if you need dynamic customization?

h2. Customizing custom

Encapsulated functionality is a perfect example of why the MVC file structure needs might need to be customized.  What if you want the same functionality in multiple applications?  Authentication, for example?  There is a "great generator":http://hassox.blogspot.com/2008/02/merbful-authentication-initial-merb-09.html that will solve this problem.  But what if you want a self-contained gem you can use in any application with only one ''dependency'' line?

The Rails answer to this is to use "Engines":http://rails-engines.org/ - a plugin that extends Rails to make it easy for plugins to access and extend Rails'' MVC setup.

So where are Engines for Merb?  They''re included in <tt>merb-core</tt> for free!

Engines basically gives the ability to register new models, controllers, views, and routes.  How is this done in Merb?

h2. Merb Controllers

When Merb needs a controller, it doesn''t look in a direction - it looks at Merb::Controller, the class from which all controllers must be descendants. And the reason why they must be descendants?  Because inheritance is how Merb tracks the controllers.

On line 25 of "merb_controller.rb":http://github.com/wycats/merb-core/tree/master/lib/merb-core/controller/merb_controller.rb
there is this neat little trick:

[code lang="ruby"]
def inherited(klass)
  _subclasses << klass.to_s
  self._template_root = Merb.dir_for(:view) unless self._template_root
  super
end
[/code]

When Merb is started, all of the controllers are loaded, and as each one is loaded, it''s class name is saved in the class accessor <tt>_subclasses</tt>.  Then, when a request is "dispatched":http://github.com/wycats/merb-core/tree/master/lib/merb-core/dispatch/dispatcher.rb (line 51), the requested controller is looked up in the same array.

So how does one add a dynamic controller to Merb?  By loading a class that inherits from Merb::Controller.  This is as simple as <tt>require ''myController''</tt>.

h2. Merb Views

Merb views are handled in a unique way - when Merb is started, all views are compiled into methods on their respective controller.  So adding new views takes more than just specifying a new file to look for.

Merb::Controller uses the instance method <tt>_template_location</tt> to resolve which views to load.  Override this method in a controller and view path can be specified.  For example, this is how a flat Merb app specifies a custom view folder:

[code lang="ruby"]
def _template_location(action, type = nil, controller = controller_name)
  controller == "layout" ? "layout.#{action}.#{type}" : "#{action}.#{type}"
end
[/code]

The only ''gotcha'' here is that +_template_location+ is scoped to the view directory.  To get around this, one only needs to engineer a way to back out of the directory:

[code lang="ruby"]
def _template_location(action, type = nil, controller = controller_name)
  undo   = Merb.load_paths[:view].first.gsub(%r{[^/]+}, ''..'')
  prefix = File.dirname(__FILE__)
  file   = controller == "layout" ? "layout.#{action}.#{type}" : "#{action}.#{type}"
  File.join( ''.'', undo, prefix, ''views'', file )
end
[/code]

The above code changes the view directory to be relative to the current file, not the pre-specified +view+ root.

h2. Merb models

Models in Merb are treated like any regular library.  Just as with controllers, if a model has been loaded, Merb will have access to it.

h2. Merb routes

Merb routes can be extended at any time with Merb::Router.append and Merb::Router.prepend:

[code lang="ruby"]
Merb::Router.prepend do |r|
  r.match(''/'').to(:controller => ''blogs'', :action =>''index'')
  r.resources :axes
#  r.default_routes
end
[/code]

Make sure not to call Merb::Router.prepare as it will destroy all previously created routes.

h2. Putting it all together

Knowing how to load all of the pieces, it''s an easy step to encapsulate everything together into a Merb gem.  Using +merb-gen plugin myGem+ to create the framework for packing together your funcationality, toss your files into the lib directory and set the gem to properly include your files and set your roots when included.

For an example of how it all fits together, "take a look at MeX":http://github.com/fightinjoe/mex, a Gem that provides plug-and-play exception logging to any Merb app.', '<p><a href="http://www.rubyonrails.com">Rails</a> literally interprets the <span class="caps">MVC</span> structure in the /app directory with the <tt>models</tt>, <tt>views</tt>, and <tt>controllers</tt> directories.  These directories are essential to how Rails runs, as it eschews configuration for the context that these directories and their files provide.</p>


	<p><a href="http://www.merbivore.com">Merb</a> follows suit; all default Merb apps respect the <span class="caps">MVC</span> structure Rails pioneered.  But Merb allows the defaults to be overwritten, allowing for open interpretation of <span class="caps">MVC</span>&#8217;s physical structure.</p>


	<p><tt>merb-gen app</tt> supports the default, flat, and very-flat app generation.  And in the <tt>init.rb</tt> file, a custom directory structure can be setup; see the <a href="http://github.com/wycats/merb-core/tree/master/lib/merb-core/bootloader.rb">inline docs on the bootloader</a>, line 144, for more details.</p>


	<p>But what if static customization of the <span class="caps">MVC</span> structure isn&#8217;t enough?  What if you need dynamic customization?</p>


	<h2>Customizing custom</h2>


	<p>Encapsulated functionality is a perfect example of why the <span class="caps">MVC</span> file structure needs might need to be customized.  What if you want the same functionality in multiple applications?  Authentication, for example?  There is a <a href="http://hassox.blogspot.com/2008/02/merbful-authentication-initial-merb-09.html">great generator</a> that will solve this problem.  But what if you want a self-contained gem you can use in any application with only one &#8216;dependency&#8217; line?</p>


	<p>The Rails answer to this is to use <a href="http://rails-engines.org/">Engines</a> &#8211; a plugin that extends Rails to make it easy for plugins to access and extend Rails&#8217; <span class="caps">MVC</span> setup.</p>


	<p>So where are Engines for Merb?  They&#8217;re included in <tt>merb-core</tt> for free!</p>


	<p>Engines basically gives the ability to register new models, controllers, views, and routes.  How is this done in Merb?</p>


	<h2>Merb Controllers</h2>


	<p>When Merb needs a controller, it doesn&#8217;t look in a direction &#8211; it looks at Merb::Controller, the class from which all controllers must be descendants. And the reason why they must be descendants?  Because inheritance is how Merb tracks the controllers.</p>


	<p>On line 25 of <a href="http://github.com/wycats/merb-core/tree/master/lib/merb-core/controller/merb_controller.rb">merb_controller.rb</a>
there is this neat little trick:</p>


	<p><pre style="overflow: hidden;"><code class="line_number" style="float: left; margin-right: 1em">1
2
3
4
5</code><code><span class="keyword">def </span><span class="method">inherited</span><span class="punct">(</span><span class="ident">klass</span><span class="punct">)</span>
&nbsp;&nbsp;<span class="ident">_subclasses</span> <span class="punct">&lt;&lt;</span> <span class="ident">klass</span><span class="punct">.</span><span class="ident">to_s</span>
&nbsp;&nbsp;<span class="constant">self</span><span class="punct">.</span><span class="ident">_template_root</span> <span class="punct">=</span> <span class="constant">Merb</span><span class="punct">.</span><span class="ident">dir_for</span><span class="punct">(</span><span class="symbol">:view</span><span class="punct">)</span> <span class="keyword">unless</span> <span class="constant">self</span><span class="punct">.</span><span class="ident">_template_root</span>
&nbsp;&nbsp;<span class="keyword">super</span>
<span class="keyword">end</span>
</code></pre></p>


	<p>When Merb is started, all of the controllers are loaded, and as each one is loaded, it&#8217;s class name is saved in the class accessor <tt>_subclasses</tt>.  Then, when a request is <a href="http://github.com/wycats/merb-core/tree/master/lib/merb-core/dispatch/dispatcher.rb">dispatched</a> (line 51), the requested controller is looked up in the same array.</p>


	<p>So how does one add a dynamic controller to Merb?  By loading a class that inherits from Merb::Controller.  This is as simple as <tt>require &#8216;myController&#8217;</tt>.</p>


	<h2>Merb Views</h2>


	<p>Merb views are handled in a unique way &#8211; when Merb is started, all views are compiled into methods on their respective controller.  So adding new views takes more than just specifying a new file to look for.</p>


	<p>Merb::Controller uses the instance method <tt>_template_location</tt> to resolve which views to load.  Override this method in a controller and view path can be specified.  For example, this is how a flat Merb app specifies a custom view folder:</p>


	<p><pre style="overflow: hidden;"><code class="line_number" style="float: left; margin-right: 1em">1
2
3</code><code><span class="keyword">def </span><span class="method">_template_location</span><span class="punct">(</span><span class="ident">action</span><span class="punct">,</span> <span class="ident">type</span> <span class="punct">=</span> <span class="constant">nil</span><span class="punct">,</span> <span class="ident">controller</span> <span class="punct">=</span> <span class="ident">controller_name</span><span class="punct">)</span>
&nbsp;&nbsp;<span class="ident">controller</span> <span class="punct">==</span> <span class="punct">&quot;</span><span class="string">layout</span><span class="punct">&quot;</span> <span class="punct">?</span> <span class="punct">&quot;</span><span class="string">layout.<span class="expr">#{action}</span>.<span class="expr">#{type}</span></span><span class="punct">&quot;</span> <span class="punct">:</span> <span class="punct">&quot;</span><span class="string"><span class="expr">#{action}</span>.<span class="expr">#{type}</span></span><span class="punct">&quot;</span>
<span class="keyword">end</span>
</code></pre></p>


	<p>The only &#8216;gotcha&#8217; here is that <ins>_template_location</ins> is scoped to the view directory.  To get around this, one only needs to engineer a way to back out of the directory:</p>


	<p><pre style="overflow: hidden;"><code class="line_number" style="float: left; margin-right: 1em">1
2
3
4
5
6</code><code><span class="keyword">def </span><span class="method">_template_location</span><span class="punct">(</span><span class="ident">action</span><span class="punct">,</span> <span class="ident">type</span> <span class="punct">=</span> <span class="constant">nil</span><span class="punct">,</span> <span class="ident">controller</span> <span class="punct">=</span> <span class="ident">controller_name</span><span class="punct">)</span>
&nbsp;&nbsp;<span class="ident">undo</span>   <span class="punct">=</span> <span class="constant">Merb</span><span class="punct">.</span><span class="ident">load_paths</span><span class="punct">[</span><span class="symbol">:view</span><span class="punct">].</span><span class="ident">first</span><span class="punct">.</span><span class="ident">gsub</span><span class="punct">(%r{</span><span class="regex">[^/]+</span><span class="punct">},</span> <span class="punct">''</span><span class="string">..</span><span class="punct">'')</span>
&nbsp;&nbsp;<span class="ident">prefix</span> <span class="punct">=</span> <span class="constant">File</span><span class="punct">.</span><span class="ident">dirname</span><span class="punct">(</span><span class="constant">__FILE__</span><span class="punct">)</span>
&nbsp;&nbsp;<span class="ident">file</span>   <span class="punct">=</span> <span class="ident">controller</span> <span class="punct">==</span> <span class="punct">&quot;</span><span class="string">layout</span><span class="punct">&quot;</span> <span class="punct">?</span> <span class="punct">&quot;</span><span class="string">layout.<span class="expr">#{action}</span>.<span class="expr">#{type}</span></span><span class="punct">&quot;</span> <span class="punct">:</span> <span class="punct">&quot;</span><span class="string"><span class="expr">#{action}</span>.<span class="expr">#{type}</span></span><span class="punct">&quot;</span>
&nbsp;&nbsp;<span class="constant">File</span><span class="punct">.</span><span class="ident">join</span><span class="punct">(</span> <span class="punct">''</span><span class="string">.</span><span class="punct">'',</span> <span class="ident">undo</span><span class="punct">,</span> <span class="ident">prefix</span><span class="punct">,</span> <span class="punct">''</span><span class="string">views</span><span class="punct">'',</span> <span class="ident">file</span> <span class="punct">)</span>
<span class="keyword">end</span>
</code></pre></p>


	<p>The above code changes the view directory to be relative to the current file, not the pre-specified <ins>view</ins> root.</p>


	<h2>Merb models</h2>


	<p>Models in Merb are treated like any regular library.  Just as with controllers, if a model has been loaded, Merb will have access to it.</p>


	<h2>Merb routes</h2>


	<p>Merb routes can be extended at any time with Merb::Router.append and Merb::Router.prepend:</p>


	<p><pre style="overflow: hidden;"><code class="line_number" style="float: left; margin-right: 1em">1
2
3
4
5</code><code><span class="constant">Merb</span><span class="punct">::</span><span class="constant">Router</span><span class="punct">.</span><span class="ident">prepend</span> <span class="keyword">do</span> <span class="punct">|</span><span class="ident">r</span><span class="punct">|</span>
&nbsp;&nbsp;<span class="ident">r</span><span class="punct">.</span><span class="ident">match</span><span class="punct">(''</span><span class="string">/</span><span class="punct">'').</span><span class="ident">to</span><span class="punct">(</span><span class="symbol">:controller</span> <span class="punct">=&gt;</span> <span class="punct">''</span><span class="string">blogs</span><span class="punct">'',</span> <span class="symbol">:action</span> <span class="punct">=&gt;''</span><span class="string">index</span><span class="punct">'')</span>
&nbsp;&nbsp;<span class="ident">r</span><span class="punct">.</span><span class="ident">resources</span> <span class="symbol">:axes</span>
<span class="comment">#  r.default_routes</span>
<span class="keyword">end</span>
</code></pre></p>


	<p>Make sure not to call Merb::Router.prepare as it will destroy all previously created routes.</p>


	<h2>Putting it all together</h2>


	<p>Knowing how to load all of the pieces, it&#8217;s an easy step to encapsulate everything together into a Merb gem.  Using <ins>merb-gen plugin myGem</ins> to create the framework for packing together your funcationality, toss your files into the lib directory and set the gem to properly include your files and set your roots when included.</p>


	<p>For an example of how it all fits together, <a href="http://github.com/fightinjoe/mex">take a look at MeX</a>, a Gem that provides plug-and-play exception logging to any Merb app.</p>', '2008-04-15 13:45:08+01', '2008-04-18 15:51:25+01', 2008, 4, NULL, '2008-05-01 00:00:00+01', 8, NULL, '2008-04-18 15:51:24+01');
INSERT INTO blogs VALUES (100, 'Projects', 'projects', 'The following are a few projects that I''ve developed:

h3. "Fightinjoe.com":http://fightinjoe.com

If you''re reading this, you''ve already seen this project.  A "wise man":http://nubyonrails.com/articles/about-this-blog-memcached once said, "every beginning Rails developer should
write their own blog software."

This is my attempt at doing things differently; it is not only my first "Merb":http://merbivore.com project, but it is also my first "jQuery":http://jquery.com + "DataMapper":http://datamapper.org + "PostgreSQL":http://postgresql.org + "Vlad":http://rubyhitsquad.com/Vlad_the_Deployer.html project.

This project is "open-sourced at GitHub":http://github.com/fightinjoe/fightinjoe-merb-blog/tree.

h3. "Vs.":http://vs.fightinjoe.com

My first Merb project quickly spun off two additional projects.  With a large knowledge of "Ruby on Rails"http://rubyonrails.com and the mainstream stack it utilizes, I knew what I needed to do to build my first Merb blog.  What I didn''t know was how.

I didn''t need a Merb tutorial, I needed a Rails-to-Merb translator.  I couldn''tfind one, so I built one.

The goal: expedite the translation of knowledge between two subjects in the same discipline. In other words, make it easier than ever to reinvent the wheel.

Right now in version 0.1 it is closed source and closed to outside contributors.  My goal is to change this in upcoming releases.

h3. "Merb AutoScaffold":http://fightinjoe.com/2008/4/scaffolds-for-free

I woke up this morning with a bright idea - make scaffolding easy and automatic for any Merb app via a simple Gem.  6 hours later merb_autoscaffold was up and running locally providing all the functionality that Rails scaffolds have to offer.

The goal is to grow this not just into a robust scaffolding solution, but also to have it work together with MeX as a proof-of-concept of how easy it is to compartmentalize and distribute functionality in Merb.

Fork and contribute to "Merb AutoScaffolding on GitHub":https://github.com/fightinjoe/merb-autoscaffold/tree.

h3. "MeX":http://github.com/fightinjoe/mex

My first Merb project also necessitated an exception tracker.  But with all of these new projects springing up, I was torn between developing a plugin that could be dropped into any app, or a centralized web service that any app could talk to.

I decided on the latter and used it as an excuse to create my first flat Merb app: MeX (Merb eXception).

Drawing heavily on the "exception_logger":http://github.com/defunkt/exception_logger/tree/master Rails plugin, MeX has been rewritten to work with Merb, DataMapper, and jQuery.

Version 0.1.0 is out now, which provides the same functionality that exception logger provides, except in a stand-alone form.  Future versions will add authentication as well as the ability to use the app as a plugin inside of a Merb app or as a Ruby Gem for easy deployment!

The project is "open-sourced on GitHub":http://github.com/fightinjoe/mex.

h3. "Tribewanted.com":http://www.tribewanted.com

I''ve also had the pleasure of working for Tribewanted to redesign and re-engineer their web presence.  The experience was one-of-a-kind, with me spending three months with the project on an island in Fiji with no electricity or running water.  

I never thought my commute to work would be a 30 minute boat ride across the ocean and up a river to a small sugar plantation town.  Working locally with Tribewanted, however, was a huge benefit for being involved with the community, and has made my continued remote work that much more productive.

h3. "Kinzin.com":http://kinzin.com

Kinzin is a place online for families - a safe harbor for sharing stories and pictures and staying in touch.  While I haven''t been involved in the recent iterations of Kinzin, I was responsible for the first alpha release and helped with the development of the subsequent two beta releases.

With Kinzin, I had the pleasure to work with a sharp and specialized team, which was a great opportunity for me to forego being a jack of all trades and focus on being a master of one.  I was responsible not only for much of the engineering of the internals of the site, but also for several plugins and Rails extensions we developed internally to aid development, testing, and general usage.', '<p>The following are a few projects that I&#8217;ve developed:</p>


	<h3><a href="http://fightinjoe.com">Fightinjoe.com</a></h3>


	<p>If you&#8217;re reading this, you&#8217;ve already seen this project.  A <a href="http://nubyonrails.com/articles/about-this-blog-memcached">wise man</a> once said, &#8220;every beginning Rails developer should
write their own blog software.&#8221;</p>


	<p>This is my attempt at doing things differently; it is not only my first <a href="http://merbivore.com">Merb</a> project, but it is also my first <a href="http://jquery.com">jQuery</a> + <a href="http://datamapper.org">DataMapper</a> + <a href="http://postgresql.org">PostgreSQL</a> + <a href="http://rubyhitsquad.com/Vlad_the_Deployer.html">Vlad</a> project.</p>


	<p>This project is <a href="http://github.com/fightinjoe/fightinjoe-merb-blog/tree">open-sourced at GitHub</a>.</p>


	<h3><a href="http://vs.fightinjoe.com">Vs.</a></h3>


	<p>My first Merb project quickly spun off two additional projects.  With a large knowledge of &#8220;Ruby on Rails&#8221;http://rubyonrails.com and the mainstream stack it utilizes, I knew what I needed to do to build my first Merb blog.  What I didn&#8217;t know was how.</p>


	<p>I didn&#8217;t need a Merb tutorial, I needed a Rails-to-Merb translator.  I couldn&#8217;tfind one, so I built one.</p>


	<p>The goal: expedite the translation of knowledge between two subjects in the same discipline. In other words, make it easier than ever to reinvent the wheel.</p>


	<p>Right now in version 0.1 it is closed source and closed to outside contributors.  My goal is to change this in upcoming releases.</p>


	<h3><a href="http://fightinjoe.com/2008/4/scaffolds-for-free">Merb AutoScaffold</a></h3>


	<p>I woke up this morning with a bright idea &#8211; make scaffolding easy and automatic for any Merb app via a simple Gem.  6 hours later merb_autoscaffold was up and running locally providing all the functionality that Rails scaffolds have to offer.</p>


	<p>The goal is to grow this not just into a robust scaffolding solution, but also to have it work together with MeX as a proof-of-concept of how easy it is to compartmentalize and distribute functionality in Merb.</p>


	<p>Fork and contribute to <a href="https://github.com/fightinjoe/merb-autoscaffold/tree">Merb AutoScaffolding on GitHub</a>.</p>


	<h3><a href="http://github.com/fightinjoe/mex">MeX</a></h3>


	<p>My first Merb project also necessitated an exception tracker.  But with all of these new projects springing up, I was torn between developing a plugin that could be dropped into any app, or a centralized web service that any app could talk to.</p>


	<p>I decided on the latter and used it as an excuse to create my first flat Merb app: MeX (Merb eXception).</p>


	<p>Drawing heavily on the <a href="http://github.com/defunkt/exception_logger/tree/master">exception_logger</a> Rails plugin, MeX has been rewritten to work with Merb, DataMapper, and jQuery.</p>


	<p>Version 0.1.0 is out now, which provides the same functionality that exception logger provides, except in a stand-alone form.  Future versions will add authentication as well as the ability to use the app as a plugin inside of a Merb app or as a Ruby Gem for easy deployment!</p>


	<p>The project is <a href="http://github.com/fightinjoe/mex">open-sourced on GitHub</a>.</p>


	<h3><a href="http://www.tribewanted.com">Tribewanted.com</a></h3>


	<p>I&#8217;ve also had the pleasure of working for Tribewanted to redesign and re-engineer their web presence.  The experience was one-of-a-kind, with me spending three months with the project on an island in Fiji with no electricity or running water.</p>


	<p>I never thought my commute to work would be a 30 minute boat ride across the ocean and up a river to a small sugar plantation town.  Working locally with Tribewanted, however, was a huge benefit for being involved with the community, and has made my continued remote work that much more productive.</p>


	<h3><a href="http://kinzin.com">Kinzin.com</a></h3>


	<p>Kinzin is a place online for families &#8211; a safe harbor for sharing stories and pictures and staying in touch.  While I haven&#8217;t been involved in the recent iterations of Kinzin, I was responsible for the first alpha release and helped with the development of the subsequent two beta releases.</p>


	<p>With Kinzin, I had the pleasure to work with a sharp and specialized team, which was a great opportunity for me to forego being a jack of all trades and focus on being a master of one.  I was responsible not only for much of the engineering of the internals of the site, but also for several plugins and Rails extensions we developed internally to aid development, testing, and general usage.</p>', '2008-04-13 13:58:57+01', '2008-04-25 12:26:14+01', 2008, 4, NULL, '2008-01-01 00:00:00+00', 9, NULL, '2008-04-13 13:58:57+01');
INSERT INTO blogs VALUES (99, 'Aaron Wheeler', 'aaron-wheeler', 'I''m a "freelance web application developer":http://www.workingwithrails.com/person/7482-aaron-wheeler with almost 10 years of experience.  I have a math and computer science background and currently live in Japan.

My main interest is in creative forms of communication.  I use this interest as an excuse to pursue my programming career, arts and crafts pastimes, "photography money-sink":http://flickr.com/photos/fightinjoe, and world travels.  When I''m all out of excuses, I like playing "Ultimate Frisbee":http://throwlife.com/, cycling, and "cooking":http://www.opensourcefood.com/people/fightinjoe/ (when my "wife":http://masayowheeler.com lets me).

<a href="http://www.linkedin.com/in/fightinjoe" ><img src="http://www.linkedin.com/img/webpromo/btn_viewmy_160x33.gif" width="160" height="33" border="0" alt="View Aaron Wheeler''s profile on LinkedIn"></a>
', '<p>I&#8217;m a <a href="http://www.workingwithrails.com/person/7482-aaron-wheeler">freelance web application developer</a> with almost 10 years of experience.  I have a math and computer science background and currently live in Japan.</p>


	<p>My main interest is in creative forms of communication.  I use this interest as an excuse to pursue my programming career, arts and crafts pastimes, <a href="http://flickr.com/photos/fightinjoe">photography money-sink</a>, and world travels.  When I&#8217;m all out of excuses, I like playing <a href="http://throwlife.com/">Ultimate Frisbee</a>, cycling, and <a href="http://www.opensourcefood.com/people/fightinjoe/">cooking</a> (when my <a href="http://masayowheeler.com">wife</a> lets me).</p>


	<p><a href="http://www.linkedin.com/in/fightinjoe" ><img src="http://www.linkedin.com/img/webpromo/btn_viewmy_160x33.gif" width="160" height="33" border="0" alt="View Aaron Wheeler''s profile on LinkedIn"></a></p>', '2008-04-13 13:27:29+01', '2008-04-26 00:23:27+01', 2008, 4, NULL, '2008-01-01 00:00:00+00', 9, NULL, '2008-04-13 13:27:29+01');
INSERT INTO blogs VALUES (104, 'Scaffolds for free', 'scaffolds-for-free', 'One of the novel concepts introduced to the mainstream by Ruby on Rails was that of scaffolding.

Using as many acronyms as possible, the idea was that to "DRY":http://en.wikipedia.org/wiki/Don''t_repeat_yourself with "CRUD":http://en.wikipedia.org/wiki/Create,_read,_update_and_delete functionality.  Rails achieved this with the helper method "#scaffold":http://wiki.rubyonrails.org/rails/pages/Scaffold.

"Django":http://www.djangoproject.com/, among other web frameworks, realized that specifying +#scaffold+ at the beginning of cookie-cutter controllers isn''t exactly DRY.  Nor is implementing an authentication and user management system.  Django, for one, offers a nice, modular "Admin interface":http://www.djangobook.com/en/beta/chapter06/ that can be turned on with a few lines of code.

Doing this in Rails isn''t easy.  "Rails Engines":http://rails-engines.org/ make it possible, but it''s still an extra step.

"Merb":http://merbivore.com, on the other hand, does play nice, though not obviously.

Building on the "work I did with distributed MVC":http://fightinjoe.com/2008/4/distributed-mvc, as well as the "proof-of-concept exception logger MeX":http://github.com/fightinjoe/mex, I took a look into creating a Merb Plugin / Gem that will automatically provide scaffolding for free for all models in a Merb app.

h3. Merb AutoScaffold

The result is "Merb AutoScaffold":http://github.com/fightinjoe/merb-autoscaffold.  Install the gem, require it in your app, and you''ll have scaffolding by default.

Here''s the way it works:

# Find all of the models
# For each model, create or extend it''s controller
# For each controller, add CRUD actions that don''t already exist

This is pretty straight forward, and made even more simple with some helpful Merb methods.

For one, Merb keeps track of load paths with +Merb.dir_for+.  Also, the Merb::Controller#_template_location makes it easy to hijack where templates are loaded from.

The trickiest part with the gem is making sure to give precedence to parts of the application that already exist - you don''t want scaffolding to override locally defined methods.

*Update* - April 27 - It ends up that it''s nice to keep the admin interface separate from the regular interface.  Thus, AutoScaffolds have been updated to be namespaced.  So, for example, when AutoScaffolds creates a controller for the Blog model, it will create Scaffold::Blogs < Application so as not to conflict with already existing controllers.  Likewise, this will map to the /scaffolds/blogs path by default, though the route namespace can be configured in init.rb.

Right now the gem is at a 0.1.0 release.  It could look a lot prettier, have better support for ID and Date fields, and ideally will have support for associations in the future.  But for the time being, it''s as pretty at +merb-gen resource+''s scaffolds, and gets the job done.  Who could ask for more?

*UPDATE* - April 27th - 0.1.2 has just been released, bringing with it support for associations, merbivore.com-type styling, namespacing, and pagination (in edge). Once tests are complete, version 0.2 should be ready for release as a full-fledged gem!
', '<p>One of the novel concepts introduced to the mainstream by Ruby on Rails was that of scaffolding.</p>


	<p>Using as many acronyms as possible, the idea was that to <a href="http://en.wikipedia.org/wiki/Don''t_repeat_yourself"><span class="caps">DRY</span></a> with <a href="http://en.wikipedia.org/wiki/Create,_read,_update_and_delete"><span class="caps">CRUD</span></a> functionality.  Rails achieved this with the helper method <a href="http://wiki.rubyonrails.org/rails/pages/Scaffold">#scaffold</a>.</p>


	<p><a href="http://www.djangoproject.com/">Django</a>, among other web frameworks, realized that specifying <ins>#scaffold</ins> at the beginning of cookie-cutter controllers isn&#8217;t exactly <span class="caps">DRY</span>.  Nor is implementing an authentication and user management system.  Django, for one, offers a nice, modular <a href="http://www.djangobook.com/en/beta/chapter06/">Admin interface</a> that can be turned on with a few lines of code.</p>


	<p>Doing this in Rails isn&#8217;t easy.  <a href="http://rails-engines.org/">Rails Engines</a> make it possible, but it&#8217;s still an extra step.</p>


	<p><a href="http://merbivore.com">Merb</a>, on the other hand, does play nice, though not obviously.</p>


	<p>Building on the <a href="http://fightinjoe.com/2008/4/distributed-mvc">work I did with distributed <span class="caps">MVC</span></a>, as well as the <a href="http://github.com/fightinjoe/mex">proof-of-concept exception logger MeX</a>, I took a look into creating a Merb Plugin / Gem that will automatically provide scaffolding for free for all models in a Merb app.</p>


	<h3>Merb AutoScaffold</h3>


	<p>The result is <a href="http://github.com/fightinjoe/merb-autoscaffold">Merb AutoScaffold</a>.  Install the gem, require it in your app, and you&#8217;ll have scaffolding by default.</p>


	<p>Here&#8217;s the way it works:</p>


	<ol>
	<li>Find all of the models</li>
		<li>For each model, create or extend it&#8217;s controller</li>
		<li>For each controller, add <span class="caps">CRUD</span> actions that don&#8217;t already exist</li>
	</ol>


	<p>This is pretty straight forward, and made even more simple with some helpful Merb methods.</p>


	<p>For one, Merb keeps track of load paths with <ins>Merb.dir_for</ins>.  Also, the Merb::Controller#_template_location makes it easy to hijack where templates are loaded from.</p>


	<p>The trickiest part with the gem is making sure to give precedence to parts of the application that already exist &#8211; you don&#8217;t want scaffolding to override locally defined methods.</p>


	<p><strong>Update</strong> &#8211; April 27 &#8211; It ends up that it&#8217;s nice to keep the admin interface separate from the regular interface.  Thus, AutoScaffolds have been updated to be namespaced.  So, for example, when AutoScaffolds creates a controller for the Blog model, it will create Scaffold::Blogs &lt; Application so as not to conflict with already existing controllers.  Likewise, this will map to the /scaffolds/blogs path by default, though the route namespace can be configured in init.rb.</p>


	<p>Right now the gem is at a 0.1.0 release.  It could look a lot prettier, have better support for ID and Date fields, and ideally will have support for associations in the future.  But for the time being, it&#8217;s as pretty at <ins>merb-gen resource</ins>&#8217;s scaffolds, and gets the job done.  Who could ask for more?</p>


	<p><strong><span class="caps">UPDATE</span></strong> &#8211; April 27th &#8211; 0.1.2 has just been released, bringing with it support for associations, merbivore.com-type styling, namespacing, and pagination (in edge). Once tests are complete, version 0.2 should be ready for release as a full-fledged gem!</p>', '2008-04-25 08:32:08+01', '2008-04-27 00:46:54+01', 2008, 4, NULL, '2008-05-25 00:00:00+01', 8, NULL, '2008-04-25 08:32:08+01');
INSERT INTO blogs VALUES (94, 'Traveling Japan', 'traveling-japan', 'Want to travel Japan?  Here''s a broad starting point.

h2. Arriving in Japan + Getting around the regions

There are two major international airports in Japan.  The largest is Narita (NRT), which is outside Tokyo.  The newest is Kansai (KIX) which is on a manmade island in Osaka Bay.

The Shinkansen, Japan''s bullet train, links the major points of interest in Japan, running from north of Tokyo through the capital past Mt. Fuji to Kyoto, Osaka, and further southwest to Hiroshima and points beyond.  Trains run frequently (every 20 minutes or so) but tickets can be as expensive as flying.  A JR Rail Pass is a good value, especially when getting around Tokyo and traveling by Shinkansen.

h3. Kantou / Tokyo / Narita (NRT)

Narita handles almost purely international flights.  Domestic flights for Tokyo are through Haneda.

Narita is not in Tokyo; it is in the neighboring prefecture Chiba.  Thus, it takes a bus or train ride to get into Tokyo, which usually lasts an hour or so.  If you''ve got a transfer to a domestic flight out of Haneda, make sure to budget at least two hours between landing and departing.

h3. Kansai / Osaka / KIX

Kansai International Airport (KIX) handles international and domestic flights.  The older Osaka airport, Itami, continues to handle some domestic flights as well as short-distance international flights.

KIX theoretically serves the whole Kansai region, but is about an hour south of central Osaka, which makes it 2 hours away from Kobe and Kyoto.

Kansai is a hodge-podge of different train companies that seem to differ by prefecture (and are useless in Kyoto, which you can get to but can''t get around by train).  A good map and pocket change is a better way to travel than with a rail pass in Kansai.

h3. Hiroshima and Kyushu

I''ve never been, but these places aren''t close to Kyoto or Tokyo.  A few extra days in the capital or cultural center of Japan are worth more than a long round trip and single night in Hiroshima.

h3. Hokkaido and Okinawa

The extreme north and south of Japan are definitely worth the visit, but are journeys in and of themselves.  There are many package deals that tour companies such as JTB sell to both places, which make it easy to get a round trip flight, hotel, and rental car, which you''ll definitely need to get around both places.

h2. Tokyo

Tokyo is the capital of Japan.  The emperor has a nice spread that''s semi-off-limits, and the government has a very tall building with a free observation deck.  But what''s most interesting is at the street level and the distinct microcosms that erupt at each station along the central green loop line (JR Yamanote-sen).  Highlights along the way are:

* *Ginza* - expensive shopping district.  Japan''s trophy wives congregate here to show off their new Gucci hand bags.  You''ll notice them because they all have long straight black hair - a rarity in other parts of Tokyo.
* *Ueno* - there''s a great park here with cherry blossoms that are gorgeous in the spring time.  There''s also a zoo and a statue of a samurai walking his dog and museums.
* *Akihaibara* - this is the tech district of Tokyo.  New and old electronics can be found in niche stores.  The Maid Cafes are also interesting sub cultures to visit.
* *Shinjuku* - One of the busiest stations in the world - it processes over 3 million people a day.  There are two parts to this district, which are literally separated by the train tracks. The west side is home to the tallest buildings in Tokyo, including the aforementioned government twin towers with the free observation deck (you can see Mt. Fuji on a clear day).  The east side is the red light district of Tokyo which is full of cabaret and host clubs, capsule hotels, panty vending machines, and all of the fetish frivolities Japan is stereotyped for.
* *Harajuku* - there is a bridge close to the entrance to the neighboring park where all of the cos-play freakers hang out, especially on Saturday.
* *Shibuya* - the famous crosswalk from Lost In Translation is here, along with some large department stores.
* *Ropongi* - clubbing, clubbing, clubbing, and a giant spider statue outside of the newly completed Ropongi Hills.

Other places that come highly recommended are Asakusa for a traditional feel, the fish market in the morning, the NHK studios, and Studio Ghibli''s theme park (home of Totoro).

It''s easy to spend 3 - 5 days in Tokyo and not run out of things to do or places to see.  A lot of the charm of Tokyo is getting lost in the city and being surprised by what you find.

h2. Osaka / Kyoto / Kobe / Nara

The only thing that Tokyo doesn''t have to offer (at least in large quantity) is traditional Japanese culture.  For that, Kansai is the place to be.

*Kyoto* is like Prague - a very well preserved slice of culture from several hundred years ago.  There are enough temples and shrines and museums and world heritage sites to keep you busy for at least a full week, though two or three nights is probably sufficient.

Getting around Kyoto is most easily done on foot or by bicycle.  Just north of Kyoto station is a Muji department store that rents bicycles for a reasonable price.  With a bicycle and a map of the city, you can easily schedule your day by randomly choosing three sights to see and leisurely making your way around to each.  If your random number generator is broken, check out Ginkakuji (the golden temple) and Kiyomizu (the temple up on the hill).  The river that runs through Kyoto has wide banks on either side that are also good for cycling.

*Nara* doesn''t get much publicity, but Nara Koen (Nara park) is a nice afternoon with it''s domesticated deer that roam about freely as well as a huge bronze Buddha.  Horyuji temple which is close by is the oldest wooden structure in the world and worth a visit as well.

*Osaka* is good for shopping, but in the end is just another big city.  Spend your time in Tokyo and Kyoto.  If you make it to *Kobe*, the large population of foreigners makes for good eating, and supposedly the city is good for shoe shopping as well.

h2. Okinawa and Hokkaido

*Okinawa* is Japan''s Hawaii, except that the islands were formed from coral, not volcanic activity.  This makes for gorgeous diving and snorkeling, strangely shaped islands, white sand beaches, and poor surfing.  The main island, also called Okinawa, is most beautiful about and hour north of Naha, the capital, in Onnason.  Another 30 minutes further north is Nago, which has a world class aquarium.

If time permits, the outlying island are even more rewarding.  Miyako is a flight away, but there are ferries that run between Okinawa and Tonaki and Tokashiki, two smaller outlying islands that offer a unique slice of Okinawa culture, which is an interesting slice of asian influences, the longest life expectancy in the world, an abundance of pork, their own brand of alcohol (awamori), and a quiet seaside lifestyle.

Make sure to enjoy a cold mug of Orion beer while in town, Okinawa''s native beer.

*Hokkaido* is much more of a melting pot, having been colonized by people from all over Japan over 100 years ago.  If you go to Hokkaido, you have to indulge in the onsens there, or natural hot spas.  They come in all sizes: big and small, developed and naturally occurring, one-man baths beside a river, holes you dig yourself in the beach of a lake with volcanic activity below it, seasize baths only accessible at low tide; the list goes on.

The seafood in Hokkaido is also the best in all of Japan, with specialties like giant crab and sea urchin (uni).  Enjoy with Sapporo, the local beer that''s famously exported around the world.

h2. Summary

Here''s a few recommended schedules for getting around Japan:

* 4 days or less - Just Tokyo should be sufficient.  You''ll spend at least a day traveling to Kyoto and getting situated, so traveling might not be worth it.
* 7 days or less - Tokyo and Kyoto should be sufficient; you definitely won''t be bored, and there will be plenty left over for your next trip to Japan!
* 7 days - alternately, you could spend this time nicely in Okinawa or Hokkaido for 3 - 4 nights and the rest of your time in Tokyo.
* 10 days - Tokyo and Kyoto will be easy.  From Kyoto, you can also take day trips to Nara (highly recommended), Osaka, and Kobe (equally recommended).
* 14 days - Use your JR rail pass to go everywhere the Shinkansen goes and let the train system show you around Japan.  Ideally, Tokyo through Kyoto on to Hiroshima.

Happy travels!', '<p>Want to travel Japan?  Here&#8217;s a broad starting point.</p>


	<h2>Arriving in Japan + Getting around the regions</h2>


	<p>There are two major international airports in Japan.  The largest is Narita (NRT), which is outside Tokyo.  The newest is Kansai (KIX) which is on a manmade island in Osaka Bay.</p>


	<p>The Shinkansen, Japan&#8217;s bullet train, links the major points of interest in Japan, running from north of Tokyo through the capital past Mt. Fuji to Kyoto, Osaka, and further southwest to Hiroshima and points beyond.  Trains run frequently (every 20 minutes or so) but tickets can be as expensive as flying.  <span class="caps">A JR</span> Rail Pass is a good value, especially when getting around Tokyo and traveling by Shinkansen.</p>


	<h3>Kantou / Tokyo / Narita (NRT)</h3>


	<p>Narita handles almost purely international flights.  Domestic flights for Tokyo are through Haneda.</p>


	<p>Narita is not in Tokyo; it is in the neighboring prefecture Chiba.  Thus, it takes a bus or train ride to get into Tokyo, which usually lasts an hour or so.  If you&#8217;ve got a transfer to a domestic flight out of Haneda, make sure to budget at least two hours between landing and departing.</p>


	<h3>Kansai / Osaka / <span class="caps">KIX</span></h3>


	<p>Kansai International Airport (KIX) handles international and domestic flights.  The older Osaka airport, Itami, continues to handle some domestic flights as well as short-distance international flights.</p>


	<p><span class="caps">KIX</span> theoretically serves the whole Kansai region, but is about an hour south of central Osaka, which makes it 2 hours away from Kobe and Kyoto.</p>


	<p>Kansai is a hodge-podge of different train companies that seem to differ by prefecture (and are useless in Kyoto, which you can get to but can&#8217;t get around by train).  A good map and pocket change is a better way to travel than with a rail pass in Kansai.</p>


	<h3>Hiroshima and Kyushu</h3>


	<p>I&#8217;ve never been, but these places aren&#8217;t close to Kyoto or Tokyo.  A few extra days in the capital or cultural center of Japan are worth more than a long round trip and single night in Hiroshima.</p>


	<h3>Hokkaido and Okinawa</h3>


	<p>The extreme north and south of Japan are definitely worth the visit, but are journeys in and of themselves.  There are many package deals that tour companies such as <span class="caps">JTB</span> sell to both places, which make it easy to get a round trip flight, hotel, and rental car, which you&#8217;ll definitely need to get around both places.</p>


	<h2>Tokyo</h2>


	<p>Tokyo is the capital of Japan.  The emperor has a nice spread that&#8217;s semi-off-limits, and the government has a very tall building with a free observation deck.  But what&#8217;s most interesting is at the street level and the distinct microcosms that erupt at each station along the central green loop line (JR Yamanote-sen).  Highlights along the way are:</p>


	<ul>
	<li><strong>Ginza</strong> &#8211; expensive shopping district.  Japan&#8217;s trophy wives congregate here to show off their new Gucci hand bags.  You&#8217;ll notice them because they all have long straight black hair &#8211; a rarity in other parts of Tokyo.</li>
		<li><strong>Ueno</strong> &#8211; there&#8217;s a great park here with cherry blossoms that are gorgeous in the spring time.  There&#8217;s also a zoo and a statue of a samurai walking his dog and museums.</li>
		<li><strong>Akihaibara</strong> &#8211; this is the tech district of Tokyo.  New and old electronics can be found in niche stores.  The Maid Cafes are also interesting sub cultures to visit.</li>
		<li><strong>Shinjuku</strong> &#8211; One of the busiest stations in the world &#8211; it processes over 3 million people a day.  There are two parts to this district, which are literally separated by the train tracks. The west side is home to the tallest buildings in Tokyo, including the aforementioned government twin towers with the free observation deck (you can see Mt. Fuji on a clear day).  The east side is the red light district of Tokyo which is full of cabaret and host clubs, capsule hotels, panty vending machines, and all of the fetish frivolities Japan is stereotyped for.</li>
		<li><strong>Harajuku</strong> &#8211; there is a bridge close to the entrance to the neighboring park where all of the cos-play freakers hang out, especially on Saturday.</li>
		<li><strong>Shibuya</strong> &#8211; the famous crosswalk from Lost In Translation is here, along with some large department stores.</li>
		<li><strong>Ropongi</strong> &#8211; clubbing, clubbing, clubbing, and a giant spider statue outside of the newly completed Ropongi Hills.</li>
	</ul>


	<p>Other places that come highly recommended are Asakusa for a traditional feel, the fish market in the morning, the <span class="caps">NHK</span> studios, and Studio Ghibli&#8217;s theme park (home of Totoro).</p>


	<p>It&#8217;s easy to spend 3 &#8211; 5 days in Tokyo and not run out of things to do or places to see.  A lot of the charm of Tokyo is getting lost in the city and being surprised by what you find.</p>


	<h2>Osaka / Kyoto / Kobe / Nara</h2>


	<p>The only thing that Tokyo doesn&#8217;t have to offer (at least in large quantity) is traditional Japanese culture.  For that, Kansai is the place to be.</p>


	<p><strong>Kyoto</strong> is like Prague &#8211; a very well preserved slice of culture from several hundred years ago.  There are enough temples and shrines and museums and world heritage sites to keep you busy for at least a full week, though two or three nights is probably sufficient.</p>


	<p>Getting around Kyoto is most easily done on foot or by bicycle.  Just north of Kyoto station is a Muji department store that rents bicycles for a reasonable price.  With a bicycle and a map of the city, you can easily schedule your day by randomly choosing three sights to see and leisurely making your way around to each.  If your random number generator is broken, check out Ginkakuji (the golden temple) and Kiyomizu (the temple up on the hill).  The river that runs through Kyoto has wide banks on either side that are also good for cycling.</p>


	<p><strong>Nara</strong> doesn&#8217;t get much publicity, but Nara Koen (Nara park) is a nice afternoon with it&#8217;s domesticated deer that roam about freely as well as a huge bronze Buddha.  Horyuji temple which is close by is the oldest wooden structure in the world and worth a visit as well.</p>


	<p><strong>Osaka</strong> is good for shopping, but in the end is just another big city.  Spend your time in Tokyo and Kyoto.  If you make it to <strong>Kobe</strong>, the large population of foreigners makes for good eating, and supposedly the city is good for shoe shopping as well.</p>


	<h2>Okinawa and Hokkaido</h2>


	<p><strong>Okinawa</strong> is Japan&#8217;s Hawaii, except that the islands were formed from coral, not volcanic activity.  This makes for gorgeous diving and snorkeling, strangely shaped islands, white sand beaches, and poor surfing.  The main island, also called Okinawa, is most beautiful about and hour north of Naha, the capital, in Onnason.  Another 30 minutes further north is Nago, which has a world class aquarium.</p>


	<p>If time permits, the outlying island are even more rewarding.  Miyako is a flight away, but there are ferries that run between Okinawa and Tonaki and Tokashiki, two smaller outlying islands that offer a unique slice of Okinawa culture, which is an interesting slice of asian influences, the longest life expectancy in the world, an abundance of pork, their own brand of alcohol (awamori), and a quiet seaside lifestyle.</p>


	<p>Make sure to enjoy a cold mug of Orion beer while in town, Okinawa&#8217;s native beer.</p>


	<p><strong>Hokkaido</strong> is much more of a melting pot, having been colonized by people from all over Japan over 100 years ago.  If you go to Hokkaido, you have to indulge in the onsens there, or natural hot spas.  They come in all sizes: big and small, developed and naturally occurring, one-man baths beside a river, holes you dig yourself in the beach of a lake with volcanic activity below it, seasize baths only accessible at low tide; the list goes on.</p>


	<p>The seafood in Hokkaido is also the best in all of Japan, with specialties like giant crab and sea urchin (uni).  Enjoy with Sapporo, the local beer that&#8217;s famously exported around the world.</p>


	<h2>Summary</h2>


	<p>Here&#8217;s a few recommended schedules for getting around Japan:</p>


	<ul>
	<li>4 days or less &#8211; Just Tokyo should be sufficient.  You&#8217;ll spend at least a day traveling to Kyoto and getting situated, so traveling might not be worth it.</li>
		<li>7 days or less &#8211; Tokyo and Kyoto should be sufficient; you definitely won&#8217;t be bored, and there will be plenty left over for your next trip to Japan!</li>
		<li>7 days &#8211; alternately, you could spend this time nicely in Okinawa or Hokkaido for 3 &#8211; 4 nights and the rest of your time in Tokyo.</li>
		<li>10 days &#8211; Tokyo and Kyoto will be easy.  From Kyoto, you can also take day trips to Nara (highly recommended), Osaka, and Kobe (equally recommended).</li>
		<li>14 days &#8211; Use your JR rail pass to go everywhere the Shinkansen goes and let the train system show you around Japan.  Ideally, Tokyo through Kyoto on to Hiroshima.</li>
	</ul>


	<p>Happy travels!</p>', '2007-11-14 00:40:19+00', '2008-05-25 08:46:47+01', 2007, 11, NULL, '2012-06-14 00:00:00+01', 6, NULL, '2008-05-25 08:46:47+01');
INSERT INTO blogs VALUES (105, 'Keeping up with Merb', 'keeping-up-with-merb', 'It used to be that every time you blinked, there was a new Ruby framework being released: first Camping, then Merb, then Sinatra.  The equivalent this season is point releases of Merb.  Working its way to a 1.0 release in the middle of October, Merb is on a biweekly schedule, steadily working its way up from 0.9.3 to 1.0 over the past two months.

Each release has brought a host of new toys and welcome refinements to the framework, which make new projects a joy to start.  The tradeoff is the nightmare created for supporting "legacy" Merb apps, where "legacy" with respect to the current release schedule means "more than two weeks old."

Anyone who has tried to upgrade a Merb installation recently has quickly run into this nightmare: a seemingly endless chain of difficult-to-trace RubyGem dependency errors, broken framework freezing solutions, and the inability to run two apps on two different versions of Merb off the same Gems repository side-by-side.

What follows over the next few blog posts is less a solution and more a band-aid to the problem.  It should be good enough to help troubleshoot upgrade issues, provide a footing for getting a old Merb app (0.9.2 - 0.9.3) upgraded to edge (0,9,8 currently), and help you hold your breath until 1.0 is releases and these legacy issues fade away.

With me being a band-aid salesman and not a real doctor, I''ll provide plenty of complaints, some suggestions, and more than likely very little in the way of actual solutions (patches, bug reports, etc.)  Hopefully someone more clever than I will be able to see through our mysery to a proper, long term solution.

Here''s what is going to be discussed:

# The nature of the problem: RubyGems, their dependencies, and the conflicts that arrise
# Merb''s approach to solving the problem: freezing gems
# Protecting your currently functioning Merb apps: how to make sure that upgrading one app doesn''t foobar your others.
# Upgrading a Merb app: freezing Merb and upgrading a Merb app.', '<p>It used to be that every time you blinked, there was a new Ruby framework being released: first Camping, then Merb, then Sinatra.  The equivalent this season is point releases of Merb.  Working its way to a 1.0 release in the middle of October, Merb is on a biweekly schedule, steadily working its way up from 0.9.3 to 1.0 over the past two months.</p>


	<p>Each release has brought a host of new toys and welcome refinements to the framework, which make new projects a joy to start.  The tradeoff is the nightmare created for supporting &#8220;legacy&#8221; Merb apps, where &#8220;legacy&#8221; with respect to the current release schedule means &#8220;more than two weeks old.&#8221;</p>


	<p>Anyone who has tried to upgrade a Merb installation recently has quickly run into this nightmare: a seemingly endless chain of difficult-to-trace RubyGem dependency errors, broken framework freezing solutions, and the inability to run two apps on two different versions of Merb off the same Gems repository side-by-side.</p>


	<p>What follows over the next few blog posts is less a solution and more a band-aid to the problem.  It should be good enough to help troubleshoot upgrade issues, provide a footing for getting a old Merb app (0.9.2 &#8211; 0.9.3) upgraded to edge (0,9,8 currently), and help you hold your breath until 1.0 is releases and these legacy issues fade away.</p>


	<p>With me being a band-aid salesman and not a real doctor, I&#8217;ll provide plenty of complaints, some suggestions, and more than likely very little in the way of actual solutions (patches, bug reports, etc.)  Hopefully someone more clever than I will be able to see through our mysery to a proper, long term solution.</p>


	<p>Here&#8217;s what is going to be discussed:</p>


	<ol>
	<li>The nature of the problem: RubyGems, their dependencies, and the conflicts that arrise</li>
		<li>Merb&#8217;s approach to solving the problem: freezing gems</li>
		<li>Protecting your currently functioning Merb apps: how to make sure that upgrading one app doesn&#8217;t foobar your others.</li>
		<li>Upgrading a Merb app: freezing Merb and upgrading a Merb app.</li>
	</ol>', NULL, NULL, 2008, 10, NULL, NULL, 8, NULL, '2008-10-09 12:41:15+01');
INSERT INTO blogs VALUES (106, 'Keeping up with Merb - root of the problem', 'keeping-up-with-merb-root-of-the-problem', '== History

Ruby on Rails, which started the fad of creating your own Ruby framework, grew out of the needs demanded daily of the framework.  Email support, HTML helpers, caching, web services, and a long list of other non-essential features got tossed into Rails as it matured from it''s original 0.7 release to 1.0.  These features made the framework a more robust, one-size-fits-all solution, but also slowed down performance.

Merb, like many of the other Ruby frameworks, was developed as the antithesis to the bloat Rails represented.  Designed to be a quick and streamlined framework, it did just that up to version 0.5.  But these slim frameworks only go so far; eventually most projects will need caching or html helpers.

In a jump from version 0.5 to 0.9, Merb sought to solve this problem by breaking the framework apart into the essential framework core and individual plugins that could be installed as needed.  In order to ease the distribution, versioning, and dependency issues associated with Ruby on Rails plugins, Merb, in a clever why-didn''t-I-think-of-that move, standardized all plugins as RubyGems.

== Root of the problem

Any non-essential functionality was moved into a gem / plugin of it''s own.  Very quickly, the number of plugins ballooned.  Additionally, the slim-core-with-supporting-plugins structure was also adopted by Merb''s ORM partner in crime, DataMapper.  With the core framework, additional plugins, and core dependencies (e.g. mongrel, hpricot, etc.), it wasn''t uncommon for a Merb app to have several dozen (and sometimes as much as 50 or 60) gem dependencies.

Getting a Merb app up and running in the beginning wasn''t too difficult; just install the required gems and get started.  But problems arose when a new point release of Merb came out.  The problems became more apparent especially when upgrading from a pre 0.9.3 release of Merb to a post 0.9.4 release*.  The problem often looked like this:

[code]
Gem::Exception: can''t activate merb-core (= 0.9.3, runtime), already activated merb-core-0.9.2
  from /opt/local/lib/ruby/site_ruby/1.8/rubygems.rb:142:in `activate''
  from /opt/local/lib/ruby/site_ruby/1.8/rubygems.rb:49:in `gem''
  from (irb):2
[/code]

Though, often, it wasn''t the merb-core gem but rather a more obscure gem (like extlib or data_objets).

This problem is easy to recreate from irb:

[code]
$ gem list merb-core

*** LOCAL GEMS ***

merb-core (0.9.3, 0.9.2)
$ # as you can see, I''ve got merb-core 0.9.2 and 0.9.3 installed locally
$ irb
>> require ''rubygems''
   => false
>> gem ''merb-core'', ''=0.9.2'' # require merb-core version 0.9.2
   => true
>> gem ''merb-core'', ''=0.9.3'' # require merb-core version 0.9.3
   => Gem::Exception: can''t activate merb-core (= 0.9.3, runtime), already activated merb-core-0.9.2
[/code]

The problem is how gem dependencies are specified within the plugins themselves.  You can see these requirements within the gem''s Rakefile.  Sometimes exact versions are required; when there is a conflict, the "already activated" error will arise.  Other times any version greater than a certain release (e.g. >=0.9.2) requirements will conflicts with the gem version that''s already been loaded.  ZenSpider has an [informative post|http://blog.zenspider.com/2008/10/rubygems-howto-preventing-cata.html] about how gem version requirements can break when new gems aren''t backwards compatible, and provides a tutorial for how to avoid the problem going forward.

== Downward spiral of broken upgrades

This problem usually springs up when a new Merb app is released beside a legacy Merb app.  To support the new app, the gems are updated; the new app is installed; the new app boots perfectly, and the multitudes rejoice.  But once the old app is rebooted, problems arise.  Gem conflict after gem conflict halts the rebooting of the legacy app; frantic efforts to uninstall new gems leads amazement and frustration at trying to cope with the 50+ gems that have been updated; cursing ensues as gem requirements with non-standard names (e.g. extlib) elusively hide and continue to cause problems; eventually, stability is restored to the legacy app, while the new app remains where it was to begin with - non-bootable and unusable.

If you do get caught in this downward spiral of trying to undo all of your good intentions, here are a few tips:

# If you''re reading this beforehand, backup your gem repository.  You can find it''s location by typing $ gem env and backing up the "installation directory" (possibly looks something like /opt/local/lib/ruby/gems/1.8).
# If you''re reading this afterwards and have TimeMachine running on your Mac, then you can easily restore your gem directory and not worry about trying to uninstall the gems you don''t need
# If you don''t have a backup of your gem directory, the easiest way to find the gems you need to uninstall is to search by version number.  Say your legacy app runs on Merb 0.9.2, but your new app wants to run on 0.9.8.  If you''ve upgraded all the gems but need to get back to what your legacy app wants, do $ gem list | grep 0.9.8.  That will quickly find new gems that were installed.  From there, you can uninstall a gem with the command $ gem uninstall gem_name --version 0.9.8.  It''s a good idea to search for all gems with point releases between 0.9.2 and 0.9.8 to make sure that other gems (e.g. datamapper) with lesser version numbers weren''t installed as well.

Once you''ve re-established the status-quo, it''s time to understand how Merb has historically dealt with this problem, and what new options are being proposed currently.', 'History

	<p>Ruby on Rails, which started the fad of creating your own Ruby framework, grew out of the needs demanded daily of the framework.  Email support, HTML helpers, caching, web services, and a long list of other non-essential features got tossed into Rails as it matured from it''s original 0.7 release to 1.0.  These features made the framework a more robust, one-size-fits-all solution, but also slowed down performance.</p>


	<p>Merb, like many of the other Ruby frameworks, was developed as the antithesis to the bloat Rails represented.  Designed to be a quick and streamlined framework, it did just that up to version 0.5.  But these slim frameworks only go so far; eventually most projects will need caching or html helpers.</p>


	<p>In a jump from version 0.5 to 0.9, Merb sought to solve this problem by breaking the framework apart into the essential framework core and individual plugins that could be installed as needed.  In order to ease the distribution, versioning, and dependency issues associated with Ruby on Rails plugins, Merb, in a clever why-didn''t-I-think-of-that move, standardized all plugins as RubyGems.</p>


 Root of the problem

	<p>Any non-essential functionality was moved into a gem / plugin of it&#8217;s own.  Very quickly, the number of plugins ballooned.  Additionally, the slim-core-with-supporting-plugins structure was also adopted by Merb&#8217;s <span class="caps">ORM</span> partner in crime, DataMapper.  With the core framework, additional plugins, and core dependencies (e.g. mongrel, hpricot, etc.), it wasn&#8217;t uncommon for a Merb app to have several dozen (and sometimes as much as 50 or 60) gem dependencies.</p>


	<p>Getting a Merb app up and running in the beginning wasn&#8217;t too difficult; just install the required gems and get started.  But problems arose when a new point release of Merb came out.  The problems became more apparent especially when upgrading from a pre 0.9.3 release of Merb to a post 0.9.4 release*.  The problem often looked like this:</p>


	<p>[code]
Gem::Exception: can''t activate merb-core (= 0.9.3, runtime), already activated merb-core-0.9.2
  from /opt/local/lib/ruby/site_ruby/1.8/rubygems.rb:142:in `activate''
  from /opt/local/lib/ruby/site_ruby/1.8/rubygems.rb:49:in `gem''
  from (irb):2
[/code]</p>


	<p>Though, often, it wasn&#8217;t the merb-core gem but rather a more obscure gem (like extlib or data_objets).</p>


	<p>This problem is easy to recreate from irb:</p>


	<p>[code]
$ gem list merb-core

*** LOCAL GEMS ***

merb-core (0.9.3, 0.9.2)
$ # as you can see, I''ve got merb-core 0.9.2 and 0.9.3 installed locally
$ irb
>> require ''rubygems''
   => false
>> gem ''merb-core'', ''=0.9.2'' # require merb-core version 0.9.2
   => true
>> gem ''merb-core'', ''=0.9.3'' # require merb-core version 0.9.3
   => Gem::Exception: can''t activate merb-core (= 0.9.3, runtime), already activated merb-core-0.9.2
[/code]</p>


	<p>The problem is how gem dependencies are specified within the plugins themselves.  You can see these requirements within the gem&#8217;s Rakefile.  Sometimes exact versions are required; when there is a conflict, the &#8220;already activated&#8221; error will arise.  Other times any version greater than a certain release (e.g. &gt;=0.9.2) requirements will conflicts with the gem version that&#8217;s already been loaded.  ZenSpider has an [informative post|http://blog.zenspider.com/2008/10/rubygems-howto-preventing-cata.html] about how gem version requirements can break when new gems aren&#8217;t backwards compatible, and provides a tutorial for how to avoid the problem going forward.</p>


	<p>== Downward spiral of broken upgrades</p>


	<p>This problem usually springs up when a new Merb app is released beside a legacy Merb app.  To support the new app, the gems are updated; the new app is installed; the new app boots perfectly, and the multitudes rejoice.  But once the old app is rebooted, problems arise.  Gem conflict after gem conflict halts the rebooting of the legacy app; frantic efforts to uninstall new gems leads amazement and frustration at trying to cope with the 50+ gems that have been updated; cursing ensues as gem requirements with non-standard names (e.g. extlib) elusively hide and continue to cause problems; eventually, stability is restored to the legacy app, while the new app remains where it was to begin with &#8211; non-bootable and unusable.</p>


	<p>If you do get caught in this downward spiral of trying to undo all of your good intentions, here are a few tips:</p>


	<ol>
	<li>If you&#8217;re reading this beforehand, backup your gem repository.  You can find it&#8217;s location by typing $ gem env and backing up the &#8220;installation directory&#8221; (possibly looks something like /opt/local/lib/ruby/gems/1.8).</li>
		<li>If you&#8217;re reading this afterwards and have TimeMachine running on your Mac, then you can easily restore your gem directory and not worry about trying to uninstall the gems you don&#8217;t need</li>
		<li>If you don&#8217;t have a backup of your gem directory, the easiest way to find the gems you need to uninstall is to search by version number.  Say your legacy app runs on Merb 0.9.2, but your new app wants to run on 0.9.8.  If you&#8217;ve upgraded all the gems but need to get back to what your legacy app wants, do $ gem list | grep 0.9.8.  That will quickly find new gems that were installed.  From there, you can uninstall a gem with the command $ gem uninstall gem_name&#8212;version 0.9.8.  It&#8217;s a good idea to search for all gems with point releases between 0.9.2 and 0.9.8 to make sure that other gems (e.g. datamapper) with lesser version numbers weren&#8217;t installed as well.</li>
	</ol>


	<p>Once you&#8217;ve re-established the status-quo, it&#8217;s time to understand how Merb has historically dealt with this problem, and what new options are being proposed currently.</p>', NULL, NULL, 2008, 10, NULL, NULL, 8, NULL, NULL);
INSERT INTO blogs VALUES (107, 'Keeping up with Merb - Merb''s Solution', 'keeping-up-with-merb-merbs-solution', '== Merb''s solution

The issue of binding a web application to a specific framework version is one that''s been dealt with most notably with Ruby on Rails.  The Rails solution has been simple: include a version of the framework''s source within the app.  Called "freezing", this dumps the source code into the Rails'' vendor directory.

The Merb solution is similar, but has two parts.  The first is a freezing of all gems (both framework and plugins) into the gems directory.  The second is a custom binary that augments the load directory for RubyGems so that frozen gems are looked up and loaded before system-installed gems.

In the early days of Merb, the gem merb_freezer provided this support.  The gem added some rake tasks to make it easy to freeze the framework and installed a system-wide binary (frozen-merb) that would load the local gems when run.  The problem with this is that it requires the merb_freezer gem to be installed system-wide to work, which didn''t solve the versioning issue*.

Recently, a new approach to gem freezing has come about.  In the new approach, a script instead of a gem handles the task of freezing gems.  In the process, a copy of the merb binary is created local to the app to allow the frozen version of the app to be run:

[code]
$ bin/merb -e production
[/code]

In the new approach, Thor, a system-wide Rake-replacing task runner, is used to run the freezing scripts, which can be installed locally or globally.  Thor is used for other tasks as well, including keeping git repositories of framework gems up-to-date.

There is a fundamental problem with the Merb gem-freezing scheme, however.  Sometimes, gem installations result in the creation and installation of binaries.  For example, merb-core will install the merb binary.  Unless the local development environemnt is the same as the deployment environment, freezing binaries can be dangerous, as a binary compiled for one system more than likely will not run on another.  Sometimes it''s as simple as the shebang being wrong (as with merb-core); other times it''s the compilation of C code that causes the issue (as with HPricot).', '<p>== Merb&#8217;s solution</p>


	<p>The issue of binding a web application to a specific framework version is one that&#8217;s been dealt with most notably with Ruby on Rails.  The Rails solution has been simple: include a version of the framework&#8217;s source within the app.  Called &#8220;freezing&#8221;, this dumps the source code into the Rails&#8217; vendor directory.</p>


	<p>The Merb solution is similar, but has two parts.  The first is a freezing of all gems (both framework and plugins) into the gems directory.  The second is a custom binary that augments the load directory for RubyGems so that frozen gems are looked up and loaded before system-installed gems.</p>


	<p>In the early days of Merb, the gem merb_freezer provided this support.  The gem added some rake tasks to make it easy to freeze the framework and installed a system-wide binary (frozen-merb) that would load the local gems when run.  The problem with this is that it requires the merb_freezer gem to be installed system-wide to work, which didn&#8217;t solve the versioning issue*.</p>


	<p>Recently, a new approach to gem freezing has come about.  In the new approach, a script instead of a gem handles the task of freezing gems.  In the process, a copy of the merb binary is created local to the app to allow the frozen version of the app to be run:</p>


	<p>[code]
$ bin/merb -e production
[/code]</p>


	<p>In the new approach, Thor, a system-wide Rake-replacing task runner, is used to run the freezing scripts, which can be installed locally or globally.  Thor is used for other tasks as well, including keeping git repositories of framework gems up-to-date.</p>


	<p>There is a fundamental problem with the Merb gem-freezing scheme, however.  Sometimes, gem installations result in the creation and installation of binaries.  For example, merb-core will install the merb binary.  Unless the local development environemnt is the same as the deployment environment, freezing binaries can be dangerous, as a binary compiled for one system more than likely will not run on another.  Sometimes it&#8217;s as simple as the shebang being wrong (as with merb-core); other times it&#8217;s the compilation of C code that causes the issue (as with HPricot).</p>', NULL, NULL, 2008, 10, NULL, NULL, 8, NULL, NULL);
INSERT INTO blogs VALUES (108, 'Merb caching DataMapper', 'merb-caching-datamapper', 'Strange the evolution of Merb: copy what Rails does; reinvent how Rails does it; assimilate into Rails.  Hopefully Rails will become as easy to hack as Merb is currently.

Case in point: Merb::Cache.  It''s first iteration was nearly a direct clone of Rails caching, complete with fragment, action, and page caching.  Then the core team had to get clever and reinvent the wheel.  While a little half baked, it provides a foundation for constructing almost any type of cache, and is ripe for documentation!

There are several hurdles to get over to start using Merb::Cache:

# It isn''t intuitive.  Or at least not for someone who is used to the Rails way.  Fortunately, all of it doesn''t have to make sense in order be useful.
# It doesn''t play well with DataMapper.  Or rather DataMapper doesn''t play nice, unless dm-core edge is used.
# It doesn''t work out of the box.  The file cache, in particular, doesn''t do anything to serialize what is being cached, and no strategy is provided to do the work.

<strong>Preparation:</strong>

Working backwards, these hurdles are easy to clear.  First, create a new strategy to serialize what is being cached.  Using the gzip_store as a model, it''s easy to create a marshal_store that uses Marshal.dump and Marshal.load to serialize and deserialize any data that is being cached.  This file can be placed in the lib folder for safe-keeping.

<script src="http://gist.github.com/43245.js"></script>

<strong>Setup:</strong>

Merb::Cache should be included in the Merb stack.  If not, make sure that there is a dependency set for merb-cache.  At the same time, add a dependency for dm-serializer (from dm-more); this is required to serialize DataMapper objects.

[code]
# somewhere in the init.rb or dependencies.rb file
dependency merb-cache
dependency dm-serializer
[/code]

It is easiest to configure Merb::Cache in an after_app_loads block in each environment file, since the caching schemes across environments will differ.  Production will use a file cache store, while the other environments will use an adhoc store which does nothing.

[code]
# in config/environments/production.rb
Merb::BootLoader.after_app_loads do
  require ''lib/marshal_store''

  Merb::Cache.setup do
    # FYI, you can check whether a cache store has been setup with
    # Merb::Cache.stores.has_key?(:file_cache)
    register(:base_cache, Merb::Cache::FileStore, :dir => "tmp")
    register(:file_cache, Merb::Cache::MarshalStore[:base_cache])
  end
end
[/code]

[code]
Merb::BootLoader.after_app_loads do
  Merb::Cache.setup do
    register(:file_cache, Merb::Cache::AdhocStore.new)
  end
end
[/code]

Caching can now easily be used wherever needed:

[code]
# for example, in a controller or model
cache = Merb::Cache[:file_cache]
keys  = [''users'',params]

if cache.exists?( *keys )
  @users = cache.read( *keys )
else
  cache.write( keys.first, @users = User.all, keys.last )
end
[/code]

NOTE: the cache will have to be expired manually, since the file cache does not support time-based expiration.

[code]
Merb::Cache[:file_cache].delete( *keys )
[/code]

<strong>Conclusion:</strong>

This solution should keep you warm and toasty for the next 6 months until Merb 2 / Rails 3 comes out.  In the meantime, let''s get behind a Franken-source project we can all believe in: the integrity of ActiveRecord and the concept of DataMapper (ActiveDataRecordMapper?  ActivataRecapper?)', '<p>Strange the evolution of Merb: copy what Rails does; reinvent how Rails does it; assimilate into Rails.  Hopefully Rails will become as easy to hack as Merb is currently.</p>


	<p>Case in point: Merb::Cache.  It&#8217;s first iteration was nearly a direct clone of Rails caching, complete with fragment, action, and page caching.  Then the core team had to get clever and reinvent the wheel.  While a little half baked, it provides a foundation for constructing almost any type of cache, and is ripe for documentation!</p>


	<p>There are several hurdles to get over to start using Merb::Cache:</p>


	<ol>
	<li>It isn&#8217;t intuitive.  Or at least not for someone who is used to the Rails way.  Fortunately, all of it doesn&#8217;t have to make sense in order be useful.</li>
		<li>It doesn&#8217;t play well with DataMapper.  Or rather DataMapper doesn&#8217;t play nice, unless dm-core edge is used.</li>
		<li>It doesn&#8217;t work out of the box.  The file cache, in particular, doesn&#8217;t do anything to serialize what is being cached, and no strategy is provided to do the work.</li>
	</ol>


	<p><strong>Preparation:</strong></p>


	<p>Working backwards, these hurdles are easy to clear.  First, create a new strategy to serialize what is being cached.  Using the gzip_store as a model, it&#8217;s easy to create a marshal_store that uses Marshal.dump and Marshal.load to serialize and deserialize any data that is being cached.  This file can be placed in the lib folder for safe-keeping.</p>


<script src="http://gist.github.com/43245.js"></script>

	<p><strong>Setup:</strong></p>


	<p>Merb::Cache should be included in the Merb stack.  If not, make sure that there is a dependency set for merb-cache.  At the same time, add a dependency for dm-serializer (from dm-more); this is required to serialize DataMapper objects.</p>


	<p>[code]
# somewhere in the init.rb or dependencies.rb file
dependency merb-cache
dependency dm-serializer
[/code]</p>


	<p>It is easiest to configure Merb::Cache in an after_app_loads block in each environment file, since the caching schemes across environments will differ.  Production will use a file cache store, while the other environments will use an adhoc store which does nothing.</p>


	<p>[code]
# in config/environments/production.rb
Merb::BootLoader.after_app_loads do
  require ''lib/marshal_store''

  Merb::Cache.setup do
    # FYI, you can check whether a cache store has been setup with
    # Merb::Cache.stores.has_key?(:file_cache)
    register(:base_cache, Merb::Cache::FileStore, :dir => "tmp")
    register(:file_cache, Merb::Cache::MarshalStore[:base_cache])
  end
end
[/code]</p>


	<p>[code]
Merb::BootLoader.after_app_loads do
  Merb::Cache.setup do
    register(:file_cache, Merb::Cache::AdhocStore.new)
  end
end
[/code]</p>


	<p>Caching can now easily be used wherever needed:</p>


	<p>[code]
# for example, in a controller or model
cache = Merb::Cache[:file_cache]
keys  = [''users'',params]

if cache.exists?( *keys )
  @users = cache.read( *keys )
else
  cache.write( keys.first, @users = User.all, keys.last )
end
[/code]</p>


	<p><span class="caps">NOTE</span>: the cache will have to be expired manually, since the file cache does not support time-based expiration.</p>


	<p>[code]
Merb::Cache[:file_cache].delete( *keys )
[/code]</p>


	<p><strong>Conclusion:</strong></p>


	<p>This solution should keep you warm and toasty for the next 6 months until Merb 2 / Rails 3 comes out.  In the meantime, let&#8217;s get behind a Franken-source project we can all believe in: the integrity of ActiveRecord and the concept of DataMapper (ActiveDataRecordMapper?  ActivataRecapper?)</p>', NULL, NULL, 2009, 1, NULL, NULL, 8, NULL, '2009-01-05 03:16:29+00');
INSERT INTO blogs VALUES (109, 'Free iPhone App Ideas', 'free-iphone-app-ideas', 'Free iPhone App ideas:

*iScale* - tells a person''s weight by having him place the iPhone on the ground and standing on it.

*tempSafe* - protect your baby by checking the temperature of the bathwater by submersing the iPhone the tub.  Paid version also works as an oven meat thermometer.

*breath-I-lizer* - place iPhone into each alcoholic drink you order.  The app records each drink, the time, and the alcohol content of the drink.  Paired with *iScale*, the app determines your blood alcohol level and whether it''s safe for you to drive or not.

*accu-weather* - leave the iPhone outside and it reports if it is precipitating or not.

*iGrate* - cheese-grating app.  Displays a picture of a cheese grater with instructions on how to grate cheese against the microphone.  Not to be used as a razor or fingernail clipper or callus file or emory board.


', '<p>Free iPhone App ideas:</p>


	<p><strong>iScale</strong> &#8211; tells a person&#8217;s weight by having him place the iPhone on the ground and standing on it.</p>


	<p><strong>tempSafe</strong> &#8211; protect your baby by checking the temperature of the bathwater by submersing the iPhone the tub.  Paid version also works as an oven meat thermometer.</p>


	<p><strong>breath-I-lizer</strong> &#8211; place iPhone into each alcoholic drink you order.  The app records each drink, the time, and the alcohol content of the drink.  Paired with <strong>iScale</strong>, the app determines your blood alcohol level and whether it&#8217;s safe for you to drive or not.</p>


	<p><strong>accu-weather</strong> &#8211; leave the iPhone outside and it reports if it is precipitating or not.</p>


	<p><strong>iGrate</strong> &#8211; cheese-grating app.  Displays a picture of a cheese grater with instructions on how to grate cheese against the microphone.  Not to be used as a razor or fingernail clipper or callus file or emory board.</p>', NULL, NULL, 2009, 4, NULL, NULL, 1, NULL, '2009-04-06 06:47:36+01');
INSERT INTO blogs VALUES (110, 'Visiting Vancouver ', 'visiting-vancouver-', 'Heading up to Vancouver?  Here''s a broad starting point.  If you prefer a narrow starting point, I''ve also got a <a href="http://search.yahoo.com/searchpad/shared/d7b706265faecc1096a9094edff164c8">few notes for reference</a>.

<h2>Arriving and getting around Vancouver</h2>

Vancouver has a great bus system.  The busses are quiet and clean, the drivers are courteous, and you can get just about anywhere.  The bus from the airport heads strait up Granville Street right into the city and takes 30 - 45 minutes.  You can pre-purchase bus tickets at most convenience stores, or when you board the bus.  The bus will either scan your ticket or issue you one (if you pay with cash).  Hold onto it - it will work as your transfer for as long as it''s valid.  There are different fare zones, but unless you head out east you don''t have to worry about them.

There is also the Sky Train, an elevated rail system that runs east-west from the city out to Burnaby, though it''s being extended south to the airport for the 2010 Olympics.

Vancouver is also very bike-able.  The town is small enough that it never takes long to get anywhere.  Unless you''re headed out to UBC, Vancouver isn''t too hilly, either.  Stay along the coast if you want flat terrain.

<h2>Downtown</h2>

Downtown Vancouver is a peninsula that sticks out from the main land up towards North Vancouver, and is home to countless sky-scraping condominiums and more than 50,000 residents.  On the northern tip is Stanley Park.

The skyline of downtown Vancouver is very impressive, but what always shocked me was how much was dedicated to living and how little was dedicated to business.  I''ve no idea where all of the people work, especially since the service industry is the largest employer downtown.

Downtown has pockets of excitement.  Davie Street runs just inland and is the gay district of Vancouver. Check out Stepho''s for abundant and affordable Greek food, and hang out along the beach on English Bay to people watch.  The southern bit is called Yale Town and is where the yuppies and trophy wives hang out.  Most anywhere on Hamilton St. is good to eat, and the waterfront is a great place to catch a water taxi to Granville Island.  Gastown is the oldest part of Vancouver and has some nice quaint shops in-between the tourist traps.  Steamworks Brew Pub has interesting seasonal brews and is good for a pint or two.  Heading east of Gastown gets you into the raw inner city of Hastings Street.  Canadians say it''s dangerous there, but most people will leave you alone.  On the east side of Hastings is China Town, but most of Vancouver''s Chinese population lives south of the city in Richmond, so China Town is a little under-whelming.

During a sunny day, one of the best things to do downtown is to rent bicycles and ride around Stanley Park.  It''s an hour - 90 minute ride around the route that hugs the coast, and there are also paths going into the middle of the park.  It''s got great views of everything and is a great way to escape the city.  There are plenty of places to rent bikes in the West End.  If you''ve got the time, you can ride around the whole downtown peninsula, which is also well worth it.

If you prefer to walk, start out at the public library on Robson and Hamilton and then walk northwest on Georgia.  The Vancouver Art Gallery is nice, especially if they''ve got a local artist''s show going on, and then after the Art Gallery Georgia St. is good for window shopping.

At nighttime, all the action is on Granville St.  If you like music, the Commodore is an awesome venue and can accommodate maybe 750 - 1000 people.  There are smaller holes-in-the-wall that also have a lot of class.  It doesn''t look like much from the outside, but Richards on Richards is one of the best venues in the city if good music is playing.

<h2>South of Downtown</h2>

If you do make it out of downtown, you''ll enter Kitsilano first.  To live in Kitsilano, I believe there is actually a requirement that you wear yoga pants (Lulu Lemon is the preferred local brand) or are pushing a baby stroller.  To visit, though anyone can come.  The best parts of "Kits" are along the water: Kitsilano Beach on the east end, and Jericho Beach on the western end.  By bicycle, take the Burrard St. Bridge to get to Kits and then ride along the waterfront.  There are plenty of busses to take, too.

If you make it all the way west and make it up the hill, you''ll hit the University of British Columbia (UBC).  They''ve got a nice rose garden, and tucked away on the western end is a few hundred stairs that take you down to Wreck Beach, the only nude beach in Vancouver.  Be forewarned - only the people you don''t want to see naked actually go nude on this beach.

There isn''t much to catch your interest east of Kits except for Granville Island.  It''s another tourist trip, but is more palatable as it''s populated by local artists, a farmers market, and half of the seagulls that live in the city.  In the evening there are theatres that have shows on Granville Island, and there''s usually always something artsy going on.

If you do head further south on Granville St., VanDusen Botanical Garden is nice, especially in the evenings during the winter holiday season when it''s all lit up.

<h2>North Vancouver</h2>

If you seek more nature than you can get at Stanley Park, then head north.  There are quite a few places to get out and enjoy the outdoors.  Grouse Mountain is one popular destination, and there are two ways to the top.  There is a gondola, which is picturesque, but expensive.  And there is the Grouse Grind.  It takes at least an hour of non-stop climbing to get to the top of the 1800 ft. climb.  Make sure to take water if you go.  The locals call it Nature''s Stairmaster, but also works as Nature''s Matchmaker; if you''re single, it''s a great place to meet other hot and sweaty singles.  The top of Grouse has skiing in the winter (when there''s snow), two great restaurants (get there early to get a good seat), a spectacular view of the city (and a great but distant view of the fireworks if you''re there during the Festival of Lights), and a variety of outdoor activities for families.  One way tickets on the gondola can be purchased for those who climb to the top.

Capilano Suspension Bridge can be fun as well.  They also have a "treetop adventure" which makes you feel like an Ewok, but it''s pricy to get in.  For a similar outdoors romp, Lynn Valley is free, less crowded, and just as beautiful.  But there are no Ewoks.  To really get away from things, head north from the city, then east to Deep Cove.  This quaint town has great bed and breakfasts and is also good for kayaking.

And if you go north and want to keep going, the Sea to Sky highway to Whistler is a gorgeous drive, and Whistler is a fun and very self-explanatory town both in the summer and winter.

<h2>When to go, where to stay</h2>

Vancouver summers are the best in the world.  They are mild, with temps in the high 70s during the day and 50s at night.  There is always a nice breeze from the ocean which keeps the bugs away, and the sun doesn''t set until 10pm which makes the days really long.  August is typically the best month, and summer doesn''t usually last more than 8 weeks.  May and June are typically wet, as are January and February.  Winters have been freakish the past few years, but they typically are a cold form of mild with thick fogs and temperatures above freezing.

Staying downtown anywhere close to Burrard St. or Georgia St. is a safe bet.  If you stay outside of downtown, it will probably be a bed and breakfast.  You don''t need a car to get around unless you have places to visit that the bus doesn''t go to frequently.  Before you go, check out City of Glass by Douglas Coupland.  It''s the book he put together as a travel guide for his friends who kept coming to visit him in the city.', '<p>Heading up to Vancouver?  Here&#8217;s a broad starting point.  If you prefer a narrow starting point, I&#8217;ve also got a <a href="http://search.yahoo.com/searchpad/shared/d7b706265faecc1096a9094edff164c8">few notes for reference</a>.</p>


<h2>Arriving and getting around Vancouver</h2>

	<p>Vancouver has a great bus system.  The busses are quiet and clean, the drivers are courteous, and you can get just about anywhere.  The bus from the airport heads strait up Granville Street right into the city and takes 30 &#8211; 45 minutes.  You can pre-purchase bus tickets at most convenience stores, or when you board the bus.  The bus will either scan your ticket or issue you one (if you pay with cash).  Hold onto it &#8211; it will work as your transfer for as long as it&#8217;s valid.  There are different fare zones, but unless you head out east you don&#8217;t have to worry about them.</p>


	<p>There is also the Sky Train, an elevated rail system that runs east-west from the city out to Burnaby, though it&#8217;s being extended south to the airport for the 2010 Olympics.</p>


	<p>Vancouver is also very bike-able.  The town is small enough that it never takes long to get anywhere.  Unless you&#8217;re headed out to <span class="caps">UBC</span>, Vancouver isn&#8217;t too hilly, either.  Stay along the coast if you want flat terrain.</p>


<h2>Downtown</h2>

	<p>Downtown Vancouver is a peninsula that sticks out from the main land up towards North Vancouver, and is home to countless sky-scraping condominiums and more than 50,000 residents.  On the northern tip is Stanley Park.</p>


	<p>The skyline of downtown Vancouver is very impressive, but what always shocked me was how much was dedicated to living and how little was dedicated to business.  I&#8217;ve no idea where all of the people work, especially since the service industry is the largest employer downtown.</p>


	<p>Downtown has pockets of excitement.  Davie Street runs just inland and is the gay district of Vancouver. Check out Stepho&#8217;s for abundant and affordable Greek food, and hang out along the beach on English Bay to people watch.  The southern bit is called Yale Town and is where the yuppies and trophy wives hang out.  Most anywhere on Hamilton St. is good to eat, and the waterfront is a great place to catch a water taxi to Granville Island.  Gastown is the oldest part of Vancouver and has some nice quaint shops in-between the tourist traps.  Steamworks Brew Pub has interesting seasonal brews and is good for a pint or two.  Heading east of Gastown gets you into the raw inner city of Hastings Street.  Canadians say it&#8217;s dangerous there, but most people will leave you alone.  On the east side of Hastings is China Town, but most of Vancouver&#8217;s Chinese population lives south of the city in Richmond, so China Town is a little under-whelming.</p>


	<p>During a sunny day, one of the best things to do downtown is to rent bicycles and ride around Stanley Park.  It&#8217;s an hour &#8211; 90 minute ride around the route that hugs the coast, and there are also paths going into the middle of the park.  It&#8217;s got great views of everything and is a great way to escape the city.  There are plenty of places to rent bikes in the West End.  If you&#8217;ve got the time, you can ride around the whole downtown peninsula, which is also well worth it.</p>


	<p>If you prefer to walk, start out at the public library on Robson and Hamilton and then walk northwest on Georgia.  The Vancouver Art Gallery is nice, especially if they&#8217;ve got a local artist&#8217;s show going on, and then after the Art Gallery Georgia St. is good for window shopping.</p>


	<p>At nighttime, all the action is on Granville St.  If you like music, the Commodore is an awesome venue and can accommodate maybe 750 &#8211; 1000 people.  There are smaller holes-in-the-wall that also have a lot of class.  It doesn&#8217;t look like much from the outside, but Richards on Richards is one of the best venues in the city if good music is playing.</p>


<h2>South of Downtown</h2>

	<p>If you do make it out of downtown, you&#8217;ll enter Kitsilano first.  To live in Kitsilano, I believe there is actually a requirement that you wear yoga pants (Lulu Lemon is the preferred local brand) or are pushing a baby stroller.  To visit, though anyone can come.  The best parts of &#8220;Kits&#8221; are along the water: Kitsilano Beach on the east end, and Jericho Beach on the western end.  By bicycle, take the Burrard St. Bridge to get to Kits and then ride along the waterfront.  There are plenty of busses to take, too.</p>


	<p>If you make it all the way west and make it up the hill, you&#8217;ll hit the University of British Columbia (UBC).  They&#8217;ve got a nice rose garden, and tucked away on the western end is a few hundred stairs that take you down to Wreck Beach, the only nude beach in Vancouver.  Be forewarned &#8211; only the people you don&#8217;t want to see naked actually go nude on this beach.</p>


	<p>There isn&#8217;t much to catch your interest east of Kits except for Granville Island.  It&#8217;s another tourist trip, but is more palatable as it&#8217;s populated by local artists, a farmers market, and half of the seagulls that live in the city.  In the evening there are theatres that have shows on Granville Island, and there&#8217;s usually always something artsy going on.</p>


	<p>If you do head further south on Granville St., VanDusen Botanical Garden is nice, especially in the evenings during the winter holiday season when it&#8217;s all lit up.</p>


<h2>North Vancouver</h2>

	<p>If you seek more nature than you can get at Stanley Park, then head north.  There are quite a few places to get out and enjoy the outdoors.  Grouse Mountain is one popular destination, and there are two ways to the top.  There is a gondola, which is picturesque, but expensive.  And there is the Grouse Grind.  It takes at least an hour of non-stop climbing to get to the top of the 1800 ft. climb.  Make sure to take water if you go.  The locals call it Nature&#8217;s Stairmaster, but also works as Nature&#8217;s Matchmaker; if you&#8217;re single, it&#8217;s a great place to meet other hot and sweaty singles.  The top of Grouse has skiing in the winter (when there&#8217;s snow), two great restaurants (get there early to get a good seat), a spectacular view of the city (and a great but distant view of the fireworks if you&#8217;re there during the Festival of Lights), and a variety of outdoor activities for families.  One way tickets on the gondola can be purchased for those who climb to the top.</p>


	<p>Capilano Suspension Bridge can be fun as well.  They also have a &#8220;treetop adventure&#8221; which makes you feel like an Ewok, but it&#8217;s pricy to get in.  For a similar outdoors romp, Lynn Valley is free, less crowded, and just as beautiful.  But there are no Ewoks.  To really get away from things, head north from the city, then east to Deep Cove.  This quaint town has great bed and breakfasts and is also good for kayaking.</p>


	<p>And if you go north and want to keep going, the Sea to Sky highway to Whistler is a gorgeous drive, and Whistler is a fun and very self-explanatory town both in the summer and winter.</p>


<h2>When to go, where to stay</h2>

	<p>Vancouver summers are the best in the world.  They are mild, with temps in the high 70s during the day and 50s at night.  There is always a nice breeze from the ocean which keeps the bugs away, and the sun doesn&#8217;t set until 10pm which makes the days really long.  August is typically the best month, and summer doesn&#8217;t usually last more than 8 weeks.  May and June are typically wet, as are January and February.  Winters have been freakish the past few years, but they typically are a cold form of mild with thick fogs and temperatures above freezing.</p>


	<p>Staying downtown anywhere close to Burrard St. or Georgia St. is a safe bet.  If you stay outside of downtown, it will probably be a bed and breakfast.  You don&#8217;t need a car to get around unless you have places to visit that the bus doesn&#8217;t go to frequently.  Before you go, check out City of Glass by Douglas Coupland.  It&#8217;s the book he put together as a travel guide for his friends who kept coming to visit him in the city.</p>', NULL, NULL, 2009, 7, NULL, NULL, 6, NULL, '2009-07-21 06:30:24+01');
INSERT INTO blogs VALUES (111, 'Stop-over in San Francisco', 'stopover-in-san-francisco', 'San Francisco is the most stereotyped city in America.  To figure out how European, gay, left-wing, hi-tech, earthquake-prone, and geologically perverse the city, you''ll have to visit yourself!

h2. Arriving and getting around San Francisco

There are three airports that service the Bay Area: Oakland (OAK), San Jose (SJC), and San Francisco (SFO), and Southwest services all three.  SFO is the most convenient to the city - the BART (subway) runs to the airport every 30 minutes and will deliver you in the heart of the city in about 45 minutes.  There are busses from OAK to a BART terminal, but it''s on the east side of the bay and will take 1:30 on public transportation.  SJC is impossible by public transportation.  Driving times for SFO, OAK, and SJC are about 25 minutes, 35 minutes, and 60 minutes respectively, with times potentially doubling during rush hour traffic.

Driving in San Francisco sucks.  Parking is impossible to find, and costs and arm and a leg when you do find it.  Busses are very convenient, and the city isn''t that bad to walk as long as you know which hilly streets to avoid.  There are busses and trollies in San Francisco (MUNI, $2 for a 2 hour transfer anywhere in the city).  The BART is best for getting into and out of the city.  There are a few stops underneath Mission St. heading north, then under Market St. heading east out of the city to the east bay.

Busses have bicycle racks, which makes bicycling a good way to get around San Francisco.  Cycling across the Golden Gate Bridge also isn''t too hard, which can be a fun way to get out of the city.

h2. The city

San Francisco is made up of many small neighborhoods which all have their own unique feel.  If you divide San Francisco geographically into three columns (coast - edge of Golden Gate Park - Van Ness St. - bay), then the west-most part of SF is very residential.  The center column, especially from Divisadero to Van Ness, is where much of San Francisco''s unique flavor comes from.  The eastern block is mostly downtown and post-industrial.  You can''t go wrong if you stick to streets around Van Ness and Mission St.  Here are a few neighborhoods in San Francisco that are worth checking out.

h2. The Marina

On the northern tip of San Francisco is the Marina.  The food is good, the beach is near, and the wine bars are abundant.  It''s great for a day when it''s sunny and the breeze isn''t too strong.  Chestnut St. runs east-west through the Marina, and it''s where you want to stay if you''re looking to spend money or eat food.  It''s got a great old-neighborhood feel, with the butcher and baker on the corner, but conveniently has an Apple Store in the middle of it so that you can check your email on your way to a wine sampling or a movie at a local theatre.

When you''ve had enough commercialism, head north to the beach and walk west towards Chrissy Field.  A long walk on the beach can be nice to exercise the legs, or a visit to the Exploratorium to exercise the mind.

For a full day in the Marina, spend your morning having a late breakfast on Chestnut street, then grabbing sandwiches at Blue Barn for a picnic at Ft. Mason (or whatever the name is of the fort that is just below the Golden Gate Bridge).  On the walk back, stop by the Yoda fountain on the Lucasarts campus in the Presido, then spend the afternoon at the Exploratorium.  Finish with dinner at A16, the best italian in the city, with an awesome wine selection to boot.

h2. Golden Gate Park

Though it''s nowhere near Golden Gate Bridge, the park is equally beautiful, especially on weekends when JFK Dr. is closed to motor vehicles.  A bicycle is a great way to get around the park.  You''ll want to have a bus help you get there, however.

The de Young art museum gets many good shows throughout the year and is good for spending 90 minutes to 2 hours at.  The Academy of Science is a wonderful natural history museum with a living roof and indoor tropical rain forest.  It''s easy to spend three hours there, especially on Thursday nights at the beginning of the month when the museum is open late for adults (alcohol is served).

Museums are good indoor activities.  Outdoors, the ground between the two museums is nice, as is the neighboring Japanese Tea Garden.  For a full day adventure, plan on seeing at least one of the museums, picnicking outside, then going to the Tea Garden for some nature photography.  Once done, hop on your bicycle and head west to the northwest corner and check out the Dutch windmill and tulip garden.  Finish the day combing the beach.  First head south, then back north along the beach.  On the north end up the hill are a few seaside restaurants that are good for dining.

h2. The Mission / Castro

The Castro is San Francisco''s gay district.  There is a huge gay pride flag in the middle of the neighborhood right next to the Castro theatre.  But other than a lot of mens fashion stores, most of the Castro is residential and up on a hill.  It''s a good place to walk around, watch the people, and enjoy the vibe.  Starting a day here can be nice, as all the walking the rest of the day is downhill!

Walking down from the Castro, Mission Dolores Park has a great view of the city that is far enough removed from downtown to preserve it''s quaint feeling.  In the summer there is a soapbox derby that runs down Dolores St.  On any sunny day, half of the city will be sunbathing in the park.

As you walk east, the demographic turns from gay to hipster to hispanic to blue collar.   Valencia Street has many art galleries that cater to San Francisco''s starving artist population, with some very good art to be found. Two blocks to the east along Mission St. the hispanic community has taken over, which means lots of good food and a very vibrant street culture.  As you get to Van Ness St., San Francisco''s industrial past starts to become apparent.  Protero Hill can be nice and quaint, but for the most part there isn''t anything of interest east of South Van Ness.

Any day spent walking up and down Valencia and Mission St. always feels fulfilling.  Check out the map below for a walking tour suggestion.

h2. Shopping

If you want to shop, there are a few places that are a must.  Haight-Ashbury (along Haight St.) is roughly 10 blocks of delicious storefronts with a heavy community influence, sometimes hippie, sometimes, hipster, sometimes hispanic, but always funky and fresh.  Start on the western side of Haight St. just after the end of Golden Gate park and walk east.  This is upper Haight, which leads into Lower Haight after a brief residential intermission.

Walking east through Haight-Ashbury will lead you to the southern tip of Hayes Valley. Walk north to Hayes St., especially around the center of the neighborhood by Octavia St.  This neighborhood is quite tiny, but very good for window shopping as well as snacking.

Finish up your shopping tour by hitting Union Square where all the big name stores and brands are.  Just watch out for the mob of people.  Taking the bus here is easier than walking, though walking along Market St. can be interesting, as you''ll have to run the gauntlet of porn emporiums and run down buildings before getting to Union Square.

h2. The Water

If you like the water, or being near it, there are a few things that will help you indulge.  Alcatraz is a tourist destination, but far from a tourist trap.  The Parks Service runs it well and it has an interesting and rich history that is well preserved.  You can get to Alcatraz by departing from just east of Pier 39, which is a true tourist trap, but one worth visiting at least once.

If you want to get out of the city, you can rent bicycles around Pier 39 and then head out to the Golden Gate Bridge.  Cross the bridge and work your way up the eastern coast to Sausalito, a small town great for docking your yacht at.  You can also catch the best fish and chips in the area here.  There are ferries that depart on a regular basis that will take you from Sausalito back to around Pier 39.

h2. The Map

Though far from complete, here is a map of the area with different highlights marked to give a sense of the city.

http://maps.google.com/maps/ms?ie=UTF&msa=0&msid=106261184402795841120.00047c2c579bc9ba86093
', '<p>San Francisco is the most stereotyped city in America.  To figure out how European, gay, left-wing, hi-tech, earthquake-prone, and geologically perverse the city, you&#8217;ll have to visit yourself!</p>


	<h2>Arriving and getting around San Francisco</h2>


	<p>There are three airports that service the Bay Area: Oakland (OAK), San Jose (SJC), and San Francisco (SFO), and Southwest services all three.  <span class="caps">SFO</span> is the most convenient to the city &#8211; the <span class="caps">BART</span> (subway) runs to the airport every 30 minutes and will deliver you in the heart of the city in about 45 minutes.  There are busses from <span class="caps">OAK</span> to a <span class="caps">BART</span> terminal, but it&#8217;s on the east side of the bay and will take 1:30 on public transportation.  <span class="caps">SJC</span> is impossible by public transportation.  Driving times for <span class="caps">SFO</span>, OAK, and <span class="caps">SJC</span> are about 25 minutes, 35 minutes, and 60 minutes respectively, with times potentially doubling during rush hour traffic.</p>


	<p>Driving in San Francisco sucks.  Parking is impossible to find, and costs and arm and a leg when you do find it.  Busses are very convenient, and the city isn&#8217;t that bad to walk as long as you know which hilly streets to avoid.  There are busses and trollies in San Francisco (MUNI, $2 for a 2 hour transfer anywhere in the city).  The <span class="caps">BART</span> is best for getting into and out of the city.  There are a few stops underneath Mission St. heading north, then under Market St. heading east out of the city to the east bay.</p>


	<p>Busses have bicycle racks, which makes bicycling a good way to get around San Francisco.  Cycling across the Golden Gate Bridge also isn&#8217;t too hard, which can be a fun way to get out of the city.</p>


	<h2>The city</h2>


	<p>San Francisco is made up of many small neighborhoods which all have their own unique feel.  If you divide San Francisco geographically into three columns (coast &#8211; edge of Golden Gate Park &#8211; Van Ness St. &#8211; bay), then the west-most part of SF is very residential.  The center column, especially from Divisadero to Van Ness, is where much of San Francisco&#8217;s unique flavor comes from.  The eastern block is mostly downtown and post-industrial.  You can&#8217;t go wrong if you stick to streets around Van Ness and Mission St.  Here are a few neighborhoods in San Francisco that are worth checking out.</p>


	<h2>The Marina</h2>


	<p>On the northern tip of San Francisco is the Marina.  The food is good, the beach is near, and the wine bars are abundant.  It&#8217;s great for a day when it&#8217;s sunny and the breeze isn&#8217;t too strong.  Chestnut St. runs east-west through the Marina, and it&#8217;s where you want to stay if you&#8217;re looking to spend money or eat food.  It&#8217;s got a great old-neighborhood feel, with the butcher and baker on the corner, but conveniently has an Apple Store in the middle of it so that you can check your email on your way to a wine sampling or a movie at a local theatre.</p>


	<p>When you&#8217;ve had enough commercialism, head north to the beach and walk west towards Chrissy Field.  A long walk on the beach can be nice to exercise the legs, or a visit to the Exploratorium to exercise the mind.</p>


	<p>For a full day in the Marina, spend your morning having a late breakfast on Chestnut street, then grabbing sandwiches at Blue Barn for a picnic at Ft. Mason (or whatever the name is of the fort that is just below the Golden Gate Bridge).  On the walk back, stop by the Yoda fountain on the Lucasarts campus in the Presido, then spend the afternoon at the Exploratorium.  Finish with dinner at <span class="caps">A16</span>, the best italian in the city, with an awesome wine selection to boot.</p>


	<h2>Golden Gate Park</h2>


	<p>Though it&#8217;s nowhere near Golden Gate Bridge, the park is equally beautiful, especially on weekends when <span class="caps">JFK</span> Dr. is closed to motor vehicles.  A bicycle is a great way to get around the park.  You&#8217;ll want to have a bus help you get there, however.</p>


	<p>The de Young art museum gets many good shows throughout the year and is good for spending 90 minutes to 2 hours at.  The Academy of Science is a wonderful natural history museum with a living roof and indoor tropical rain forest.  It&#8217;s easy to spend three hours there, especially on Thursday nights at the beginning of the month when the museum is open late for adults (alcohol is served).</p>


	<p>Museums are good indoor activities.  Outdoors, the ground between the two museums is nice, as is the neighboring Japanese Tea Garden.  For a full day adventure, plan on seeing at least one of the museums, picnicking outside, then going to the Tea Garden for some nature photography.  Once done, hop on your bicycle and head west to the northwest corner and check out the Dutch windmill and tulip garden.  Finish the day combing the beach.  First head south, then back north along the beach.  On the north end up the hill are a few seaside restaurants that are good for dining.</p>


	<h2>The Mission / Castro</h2>


	<p>The Castro is San Francisco&#8217;s gay district.  There is a huge gay pride flag in the middle of the neighborhood right next to the Castro theatre.  But other than a lot of mens fashion stores, most of the Castro is residential and up on a hill.  It&#8217;s a good place to walk around, watch the people, and enjoy the vibe.  Starting a day here can be nice, as all the walking the rest of the day is downhill!</p>


	<p>Walking down from the Castro, Mission Dolores Park has a great view of the city that is far enough removed from downtown to preserve it&#8217;s quaint feeling.  In the summer there is a soapbox derby that runs down Dolores St.  On any sunny day, half of the city will be sunbathing in the park.</p>


	<p>As you walk east, the demographic turns from gay to hipster to hispanic to blue collar.   Valencia Street has many art galleries that cater to San Francisco&#8217;s starving artist population, with some very good art to be found. Two blocks to the east along Mission St. the hispanic community has taken over, which means lots of good food and a very vibrant street culture.  As you get to Van Ness St., San Francisco&#8217;s industrial past starts to become apparent.  Protero Hill can be nice and quaint, but for the most part there isn&#8217;t anything of interest east of South Van Ness.</p>


	<p>Any day spent walking up and down Valencia and Mission St. always feels fulfilling.  Check out the map below for a walking tour suggestion.</p>


	<h2>Shopping</h2>


	<p>If you want to shop, there are a few places that are a must.  Haight-Ashbury (along Haight St.) is roughly 10 blocks of delicious storefronts with a heavy community influence, sometimes hippie, sometimes, hipster, sometimes hispanic, but always funky and fresh.  Start on the western side of Haight St. just after the end of Golden Gate park and walk east.  This is upper Haight, which leads into Lower Haight after a brief residential intermission.</p>


	<p>Walking east through Haight-Ashbury will lead you to the southern tip of Hayes Valley. Walk north to Hayes St., especially around the center of the neighborhood by Octavia St.  This neighborhood is quite tiny, but very good for window shopping as well as snacking.</p>


	<p>Finish up your shopping tour by hitting Union Square where all the big name stores and brands are.  Just watch out for the mob of people.  Taking the bus here is easier than walking, though walking along Market St. can be interesting, as you&#8217;ll have to run the gauntlet of porn emporiums and run down buildings before getting to Union Square.</p>


	<h2>The Water</h2>


	<p>If you like the water, or being near it, there are a few things that will help you indulge.  Alcatraz is a tourist destination, but far from a tourist trap.  The Parks Service runs it well and it has an interesting and rich history that is well preserved.  You can get to Alcatraz by departing from just east of Pier 39, which is a true tourist trap, but one worth visiting at least once.</p>


	<p>If you want to get out of the city, you can rent bicycles around Pier 39 and then head out to the Golden Gate Bridge.  Cross the bridge and work your way up the eastern coast to Sausalito, a small town great for docking your yacht at.  You can also catch the best fish and chips in the area here.  There are ferries that depart on a regular basis that will take you from Sausalito back to around Pier 39.</p>


	<h2>The Map</h2>


	<p>Though far from complete, here is a map of the area with different highlights marked to give a sense of the city.</p>


	<p>http://maps.google.com/maps/ms?ie=UTF&#38;msa=0&#38;msid=106261184402795841120.00047c2c579bc9ba86093</p>', NULL, NULL, 2010, 1, NULL, NULL, 6, NULL, '2010-01-02 12:14:03+00');


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categories VALUES (1, 'Home');
INSERT INTO categories VALUES (6, 'Travel');
INSERT INTO categories VALUES (7, 'Try');
INSERT INTO categories VALUES (9, 'About');
INSERT INTO categories VALUES (8, 'Merb + Rails');


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO comments VALUES (1, 'This is my first comment - will it get mailed?', '2008-03-13 13:22:35+00', 'Aaron Wheeler', 'aaron@fightinjoe.com', 'http://www.fightinjoe.com', NULL);
INSERT INTO comments VALUES (2, 'This is my first comment - will it get mailed?', '2008-03-13 13:36:31+00', 'Aaron Wheeler', 'aaron@fightinjoe.com', 'http://www.fightinjoe.com', NULL);
INSERT INTO comments VALUES (3, 'This is my first comment - will it get mailed?', '2008-03-13 13:41:40+00', 'Aaron Wheeler', 'aaron@fightinjoe.com', 'http://www.fightinjoe.com', NULL);
INSERT INTO comments VALUES (4, 'This is my first comment - will it get mailed?', '2008-03-13 13:43:01+00', 'Aaron Wheeler', 'aaron@fightinjoe.com', 'http://www.fightinjoe.com', NULL);
INSERT INTO comments VALUES (5, 'Your blogs/writing here are no longer in a language I understand.  Where are you?', '2008-03-23 08:23:18+00', 'Virginia Rector', 'rector@guam.net', '', 97);
INSERT INTO comments VALUES (6, 'D------ifficult stuff!! Now I know what''s in your brain when you are getting excited in front of your computer. Good work!', '2008-03-24 16:12:12+00', 'Mayo', '', 'http://masayokusumi.ti-da.net', 98);
INSERT INTO comments VALUES (7, 'It is broken?I can not see your website good on my windows.Maybe you are gonna work on this tonight instead of watching boring movies?!', '2008-04-03 11:42:19+01', 'Masayo', '', '', 98);
INSERT INTO comments VALUES (8, 'Just a test to make sure that comments and the RSS feed are working properly.
', '2008-04-20 00:02:30+01', 'Aaron Wheeler', 'aaron@fightinjoe.com', 'http://fightinjoe.com', NULL);
INSERT INTO comments VALUES (9, 'Well, I want to compare competing political candidates without all of the opinion & sound bite & slant (your CNN & FOXnews mention reminded me what I most recently am disillusioned with them over, political coverage). I just want to keep track of the "facts" (platforms, foibles, lies, stunts, experiences, etc.) in a side-by-side "pro vs con" manner. Whatcha think?

P.S. I would have posted this semi-sarcastic suggestion much earlier, but I just realized that I needed to re-subscribe to your re-written blog to start getting new posts.', '2008-04-23 23:46:17+01', 'Josh Murphy', 'joshmurphy@gmail.com', 'experienceokinawa.com', 101);
INSERT INTO comments VALUES (10, 'hey aaron,
where are you these days?  still on a very small island with slow (no?) internet?  

i''m staying put in brattleboro, vt, for one more school year, which officially makes this my longest stay anywhere since bates.  crazy, i know, which is probably why i''m taking off for a summer out west...

i hope you''re well
ali', '2008-04-26 23:06:46+01', 'ali', 'alimaynard@care2.com', '', NULL);
INSERT INTO comments VALUES (11, 'aaron, i have no clue what the content of this post is about.  but i wanted to say hi.  i was catching up on kuro''s blog & noticed your comment about the baby being cuter than a carebear.  

we just launched a little blog.  

i hope everything is going great for you & masayo!

<3 tammy & jamie', '2008-04-27 06:52:36+01', 'tammy harper', 'tamaradean@gmail.com', 'www.theinklingnetwork.com', 104);
INSERT INTO comments VALUES (12, 'Hi - installing your gem now.  Thanks, looks like just what I needed this afternoon.  See you''re from Vancouver - or at least worked here for a while - and an ultimate player too.  Hope you''re finding lots of people to play with in JP.', '2008-05-15 00:01:09+01', 'Ben Nevile', 'ben@mainsocial.com', 'http://mainsocial.com', 104);
INSERT INTO comments VALUES (13, 'Oh yeah, the whole reason I was leaving a comment was to let you know that I listed your plugin on the merb wiki.  http://wiki.merbivore.com/pages/plugins', '2008-05-15 00:01:57+01', 'Ben Nevile', 'ben@mainsocial.com', 'http://mainsocial.com', 104);
INSERT INTO comments VALUES (14, 'Hi,

I just wanted to let you know that I just released merb-xtras at http://github.com/fabien/merb-xtras/tree/master

It something I was planning to write for ages and it brings together some of the ideas behind Rails Engines, Radiant Extensions and how Django approaches this. 

Just last week I''ve came accross your article and thought: sure, Merb makes this quite easy, but wouldn''t it be nice to have some structured approach that taps into the BootLoader? So I set to work on merb-xtras, which eventually got a generator too.

Kind regards,

Fabien / loob2', '2008-05-19 20:03:46+01', 'Fabien Franzen', 'info@atelierfabien.be', '', NULL);
INSERT INTO comments VALUES (15, 'Hello Aaron,

My name is Josh O''Brien of Adept Group Japan in Akasaka. I work as a career development  consultant in the Tokyo IT market, specialized in emerging technologies. I am currently working with a Japanese Venture company that specializes in web based video effects and editing services and solutions, currently looking for a web developer to manage, build and develop customized visual effects and solutions for this company. Please let me know if you are interested in such an opportunity.  I look forward to your reply.

Best Regards,
Josh O''Brien
josh@adept-grp.com

', '2008-05-26 09:20:56+01', 'Josh O''Brien', 'josh@adept-grp.com', '', NULL);
INSERT INTO comments VALUES (16, 'Hi Aaron,

Came back to your site to check out your photos. Okinawa looks so nice and warm! We had 4 inches of snow last thursday. Plus a tornado. In the same day. It was wierd. How''s married life? I''m enjoying my "living with my boyfriend with separate bedrooms" life very much. I am too much of a sprawler and blanket hog to share a bed with anyone, even a kingsize.
I should be leaving Laramie in December and will have 5 months to kill till charles graduates, so maybe I''ll come visit you in Okinawa?

hope to hear from you soon,

Kimberly', '2008-05-29 23:18:32+01', 'Kimberly', 'kgarvie@uwyo.edu', '', NULL);
INSERT INTO comments VALUES (17, 'aaron, is this supposed to be updated to datamapper 0.9?', '2008-05-30 14:21:13+01', 'arol', 'arol.the@gmail.com', '', 104);
INSERT INTO comments VALUES (18, 'hey, aaron, your site looks bad in opera', '2008-05-30 14:22:40+01', 'arol', 'arol.the@gmail.com', '', 104);
INSERT INTO comments VALUES (19, 'Dear Aaron,

Good Afternoon, my name is Robert Keyworth and I work for Propel Consulting, an Executive Search Company based in Tokyo.
Currently, one of our partner companies has a contract position at an investment bank in Tokyo for a Ruby on Rails developer. I came across your resume on Linked in and I think you could be very suitable for this opportunity. 

Please let me know if you would be interested in this opportunity and I look forward to hearing from you soon. 

Best Regards,
 
Robert Keyworth

Partner
Propel Consulting
Tel: 03-3541-2449
Fax: 03-3541-2442
Mobile: 090-9975-6700
robert@propel.jp
http://www.propel.jp
', '2008-06-02 09:38:14+01', 'Robert Keyworth', 'robert@propel.jp', 'http://www.propel.jp', NULL);
INSERT INTO comments VALUES (20, 'Hello.  I want to try this out, but am unable to get it working.  I don''t think I understand it.  After specifying dependency ''merb_autoscaffold'' in my init.rb, you say navigate to /scaffolds, but there is no scaffolds controller?? I''ve also used merb-gen for models and resources, but don''t see any "automatic" behavior I was hoping for.  Any help? Thanks!', '2008-06-25 23:53:58+01', 'Andy', 'andyatkinson@gmail.com', '', 104);
INSERT INTO comments VALUES (21, 'In case it ate my comment....

Hello.  I want to try this out, but am unable to get it working.  I don''t think I understand it.  After specifying dependency ''merb_autoscaffold'' in my init.rb, you say navigate to /scaffolds, but there is no scaffolds controller?? I''ve also used merb-gen for models and resources, but don''t see any "automatic" behavior I was hoping for.  Any help? Thanks!
', '2008-06-25 23:54:18+01', 'Andy', 'andyatkinson@gmail.com', '', NULL);
INSERT INTO comments VALUES (22, 'You''re so amazing for doing this. I''m sending all my friends who keep asking to this website!', '2008-07-08 12:35:37+01', 'Kay', 'k.naito82@gmail.com', '', 94);
INSERT INTO comments VALUES (23, 'Hello tiendung, i am sam.Looking for a freelancer to work for me on a full time or part time basis.

If you are interested mail me back, with your last projects, resume and sample code,so that we can further discuss about pay and working hours.


Regards
Sampatrik', '2008-07-09 12:38:08+01', 'sampatrik', 'sampatrik08@gmail.com', '', NULL);
INSERT INTO comments VALUES (24, 'uxx5Fq qv8032ry07vdd91vdsv0ylv7y4', '2008-07-22 19:11:06+01', 'bill', 'bill', 'bill', NULL);
INSERT INTO comments VALUES (25, 'irv57b qv8032ry07vdd91vdsv0ylv7y4', '2008-07-23 03:48:40+01', 'bill', 'bill', 'bill', NULL);
INSERT INTO comments VALUES (26, 'merb autoscaffold...

looks cool, I want to try this out.
Quick question... does Merb have a good answer to the authentication and user management problem? You mentioned that that Django solves
this well. (I''ve never used Django, only rails).

cheers,

dru

', '2008-08-08 05:51:52+01', 'Dru Nelson', 'drudru@gmail.com', 'http://www.xxeo.com/', NULL);
INSERT INTO comments VALUES (27, 'phDWAZ  <a href="http://rdbueilbeaes.com/">rdbueilbeaes</a>, [url=http://mlilewrybvjk.com/]mlilewrybvjk[/url], [link=http://dtjfkvjmbwcm.com/]dtjfkvjmbwcm[/link], http://urkjpwtcaeao.com/', '2008-08-10 16:42:56+01', 'dmbijdrgf', 'dmbijdrgf', 'dmbijdrgf', NULL);
INSERT INTO comments VALUES (28, 'yww6De  <a href="http://cwkwpmpnbfpw.com/">cwkwpmpnbfpw</a>, [url=http://rdmkkvcnjvgs.com/]rdmkkvcnjvgs[/url], [link=http://qwkxhcoxoesx.com/]qwkxhcoxoesx[/link], http://akfeauumjnis.com/', '2008-08-17 20:34:48+01', 'usozdlyswhu', 'usozdlyswhu', 'usozdlyswhu', NULL);
INSERT INTO comments VALUES (29, 'HUH? Is anyone supposed to understand any of that.  Ok, so here is a question, where in the world are you all?', NULL, 'Virginia Rector', 'rector@guam.net', 'http://web.me.com/rectors/Site/The_Rectors.html', 105);
INSERT INTO comments VALUES (30, 'Thanks a lot Aaron!  I''m looking forward to exploring Vancouver!

Jack', NULL, 'Jack Whaley', 'flathatjack@gmail.com', '', 110);


--
-- Data for Name: logged_exceptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO logged_exceptions VALUES (5, 'no_method_error', 'blogs', 'index', 'undefined method `url_with_host'' for #<Blogs:0x2addaaa824f8>', '--- 
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:514:in `method_missing''
- /var/www/apps/fightinjoe/releases/20080322231349/app/views/blogs/index.rss.haml:12:in `__var__www__apps__fightinjoe__releases__20080322231349__app__views__blogs__index_rss_haml''
- /var/www/apps/fightinjoe/releases/20080322231349/app/views/blogs/index.rss.haml:9:in `each''
- /var/www/apps/fightinjoe/releases/20080322231349/app/views/blogs/index.rss.haml:9:in `__var__www__apps__fightinjoe__releases__20080322231349__app__views__blogs__index_rss_haml''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/mixins/render.rb:68:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/mixins/render.rb:68:in `render''
- /var/www/apps/fightinjoe/releases/20080322231349/app/controllers/blogs.rb:24:in `index''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/merb_controller.rb:180:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:65:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: rss
action: index
controller: blogs
', NULL, NULL, '2008-03-22 23:58:19+00');
INSERT INTO logged_exceptions VALUES (6, 'no_method_error', 'blogs', 'index', 'undefined method `url_with_host'' for #<Blogs:0x2addaaa26770>', '--- 
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:514:in `method_missing''
- /var/www/apps/fightinjoe/releases/20080322231349/app/views/blogs/index.rss.haml:12:in `__var__www__apps__fightinjoe__releases__20080322231349__app__views__blogs__index_rss_haml''
- /var/www/apps/fightinjoe/releases/20080322231349/app/views/blogs/index.rss.haml:9:in `each''
- /var/www/apps/fightinjoe/releases/20080322231349/app/views/blogs/index.rss.haml:9:in `__var__www__apps__fightinjoe__releases__20080322231349__app__views__blogs__index_rss_haml''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/mixins/render.rb:68:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/mixins/render.rb:68:in `render''
- /var/www/apps/fightinjoe/releases/20080322231349/app/controllers/blogs.rb:24:in `index''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/merb_controller.rb:180:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:65:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: rss
action: index
controller: blogs
', NULL, NULL, '2008-03-22 23:58:59+00');
INSERT INTO logged_exceptions VALUES (7, 'no_method_error', 'blogs', 'index', 'undefined method `url_with_host'' for #<Blogs:0x2addaa89ca58>', '--- 
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:514:in `method_missing''
- /var/www/apps/fightinjoe/releases/20080322231349/app/views/blogs/index.rss.haml:12:in `__var__www__apps__fightinjoe__releases__20080322231349__app__views__blogs__index_rss_haml''
- /var/www/apps/fightinjoe/releases/20080322231349/app/views/blogs/index.rss.haml:9:in `each''
- /var/www/apps/fightinjoe/releases/20080322231349/app/views/blogs/index.rss.haml:9:in `__var__www__apps__fightinjoe__releases__20080322231349__app__views__blogs__index_rss_haml''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/mixins/render.rb:68:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/mixins/render.rb:68:in `render''
- /var/www/apps/fightinjoe/releases/20080322231349/app/controllers/blogs.rb:24:in `index''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/merb_controller.rb:180:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:65:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- 
flash: !map:MerbHasFlash::FlashHash {}

', '--- !map:Mash 
format: rss
action: index
controller: blogs
', NULL, NULL, '2008-03-23 00:01:40+00');
INSERT INTO logged_exceptions VALUES (8, 'no_method_error', 'blogs', 'index', 'undefined method `url_with_host'' for #<Blogs:0x2addaa670e00>', '--- 
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:514:in `method_missing''
- /var/www/apps/fightinjoe/releases/20080322231349/app/views/blogs/index.rss.haml:12:in `__var__www__apps__fightinjoe__releases__20080322231349__app__views__blogs__index_rss_haml''
- /var/www/apps/fightinjoe/releases/20080322231349/app/views/blogs/index.rss.haml:9:in `each''
- /var/www/apps/fightinjoe/releases/20080322231349/app/views/blogs/index.rss.haml:9:in `__var__www__apps__fightinjoe__releases__20080322231349__app__views__blogs__index_rss_haml''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/mixins/render.rb:68:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/mixins/render.rb:68:in `render''
- /var/www/apps/fightinjoe/releases/20080322231349/app/controllers/blogs.rb:24:in `index''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/merb_controller.rb:180:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:65:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- 
flash: !map:MerbHasFlash::FlashHash {}

', '--- !map:Mash 
format: rss
action: index
controller: blogs
', NULL, NULL, '2008-03-23 00:11:51+00');
INSERT INTO logged_exceptions VALUES (9, 'no_method_error', 'blogs', 'index', 'undefined method `each'' for true:TrueClass', '--- 
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/mappings/conditions.rb:16:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/mappings/table.rb:50:in `new''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/mappings/table.rb:50:in `conditions''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/mappings/table.rb:165:in `count''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:56:in `count''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:321:in `count''
- /var/www/apps/fightinjoe/releases/20080323045052/app/models/blog.rb:63:in `count_for''
- /var/www/apps/fightinjoe/releases/20080323045052/app/models/blog.rb:51:in `paginate_for''
- /var/www/apps/fightinjoe/releases/20080323045052/app/controllers/blogs.rb:21:in `index''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/merb_controller.rb:180:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:65:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- 
:user: 1
:return_to: 
flash: !map:MerbHasFlash::FlashHash {}

', '--- !map:Mash 
format: 
action: index
controller: blogs
', NULL, NULL, '2008-03-25 13:56:24+00');
INSERT INTO logged_exceptions VALUES (10, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080323045052/app/controllers/blogs.rb:81:in `find_blog''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:250:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:250:in `_call_filters''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:247:in `each''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:247:in `_call_filters''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:203:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:201:in `catch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:201:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/merb_controller.rb:180:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:65:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-03-27 21:45:10+00');
INSERT INTO logged_exceptions VALUES (11, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "stdlib"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''stdlib'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080323045052/app/controllers/blogs.rb:81:in `find_blog''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:250:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:250:in `_call_filters''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:247:in `each''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:247:in `_call_filters''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:203:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:201:in `catch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:201:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/merb_controller.rb:180:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:65:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: 
action: show
id: stdlib
controller: blogs
', NULL, NULL, '2008-03-27 21:48:50+00');
INSERT INTO logged_exceptions VALUES (12, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "stdlib"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''stdlib'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080323045052/app/controllers/blogs.rb:81:in `find_blog''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:250:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:250:in `_call_filters''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:247:in `each''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:247:in `_call_filters''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:203:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:201:in `catch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:201:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/merb_controller.rb:180:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:65:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: 
action: show
id: stdlib
controller: blogs
', NULL, NULL, '2008-03-28 19:20:15+00');
INSERT INTO logged_exceptions VALUES (13, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "stdlib"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''stdlib'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080323045052/app/controllers/blogs.rb:81:in `find_blog''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:250:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:250:in `_call_filters''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:247:in `each''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:247:in `_call_filters''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:203:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:201:in `catch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:201:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/merb_controller.rb:180:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:65:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: 
action: show
id: stdlib
controller: blogs
', NULL, NULL, '2008-03-29 05:15:52+00');
INSERT INTO logged_exceptions VALUES (14, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "stdlib"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''stdlib'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080323045052/app/controllers/blogs.rb:81:in `find_blog''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:250:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:250:in `_call_filters''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:247:in `each''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:247:in `_call_filters''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:203:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:201:in `catch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:201:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/merb_controller.rb:180:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:65:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: 
action: show
id: stdlib
controller: blogs
', NULL, NULL, '2008-03-29 17:47:56+00');
INSERT INTO logged_exceptions VALUES (15, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "stdlib"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''stdlib'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080323045052/app/controllers/blogs.rb:81:in `find_blog''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:250:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:250:in `_call_filters''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:247:in `each''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:247:in `_call_filters''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:203:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:201:in `catch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:201:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/merb_controller.rb:180:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:65:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: 
action: show
id: stdlib
controller: blogs
', NULL, NULL, '2008-04-03 05:36:06+01');
INSERT INTO logged_exceptions VALUES (16, 'runtime_error', NULL, NULL, 'Unknown REQUEST_METHOD: CONNECT', '--- 
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/request.rb:47:in `method''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/router.rb:71:in `match''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:32:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash {}

', NULL, NULL, '2008-04-13 10:03:21+01');
INSERT INTO logged_exceptions VALUES (17, 'runtime_error', NULL, NULL, 'Unknown REQUEST_METHOD: CONNECT', '--- 
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/request.rb:47:in `method''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/router.rb:71:in `match''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:32:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash {}

', NULL, NULL, '2008-04-13 10:03:22+01');
INSERT INTO logged_exceptions VALUES (18, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080323045052/app/controllers/blogs.rb:81:in `find_blog''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:250:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:250:in `_call_filters''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:247:in `each''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:247:in `_call_filters''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:203:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:201:in `catch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:201:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/merb_controller.rb:180:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:65:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-04-13 12:32:23+01');
INSERT INTO logged_exceptions VALUES (19, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "stdlib"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''stdlib'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080323045052/app/controllers/blogs.rb:81:in `find_blog''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:250:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:250:in `_call_filters''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:247:in `each''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:247:in `_call_filters''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:203:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:201:in `catch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/abstract_controller.rb:201:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/controller/merb_controller.rb:180:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:98:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/dispatch/dispatcher.rb:65:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.1/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: 
action: show
id: stdlib
controller: blogs
', NULL, NULL, '2008-04-13 12:34:39+01');
INSERT INTO logged_exceptions VALUES (20, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080413120443/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080413120443/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-04-27 09:29:29+01');
INSERT INTO logged_exceptions VALUES (21, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080413120443/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080413120443/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-04-27 21:39:06+01');
INSERT INTO logged_exceptions VALUES (22, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080413120443/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080413120443/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-04-28 04:47:22+01');
INSERT INTO logged_exceptions VALUES (23, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "stdlib"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''stdlib'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: 
action: show
id: stdlib
controller: blogs
', NULL, NULL, '2008-05-04 22:43:59+01');
INSERT INTO logged_exceptions VALUES (24, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-05-05 03:46:25+01');
INSERT INTO logged_exceptions VALUES (25, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "stdlib"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''stdlib'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: 
action: show
id: stdlib
controller: blogs
', NULL, NULL, '2008-05-05 10:15:34+01');
INSERT INTO logged_exceptions VALUES (26, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-05-05 10:31:07+01');
INSERT INTO logged_exceptions VALUES (27, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-05-05 17:19:13+01');
INSERT INTO logged_exceptions VALUES (28, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "stdlib"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''stdlib'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: 
action: show
id: stdlib
controller: blogs
', NULL, NULL, '2008-05-05 17:19:24+01');
INSERT INTO logged_exceptions VALUES (29, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-05-06 05:33:59+01');
INSERT INTO logged_exceptions VALUES (30, 'runtime_error', NULL, NULL, 'Unknown REQUEST_METHOD: CONNECT', '--- 
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/request.rb:47:in `method''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/router.rb:71:in `match''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:31:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash {}

', NULL, NULL, '2008-05-16 08:49:42+01');
INSERT INTO logged_exceptions VALUES (31, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-06-01 08:12:48+01');
INSERT INTO logged_exceptions VALUES (32, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-06-01 19:17:57+01');
INSERT INTO logged_exceptions VALUES (33, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-06-01 19:18:08+01');
INSERT INTO logged_exceptions VALUES (34, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-06-02 02:02:55+01');
INSERT INTO logged_exceptions VALUES (35, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-06-02 02:03:06+01');
INSERT INTO logged_exceptions VALUES (36, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-06-02 08:44:59+01');
INSERT INTO logged_exceptions VALUES (37, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-06-02 09:00:00+01');
INSERT INTO logged_exceptions VALUES (38, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-06-02 16:10:57+01');
INSERT INTO logged_exceptions VALUES (39, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "stdlib"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''stdlib'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: 
action: show
id: stdlib
controller: blogs
', NULL, NULL, '2008-06-09 08:17:43+01');
INSERT INTO logged_exceptions VALUES (40, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "stdlib"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''stdlib'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: 
action: show
id: stdlib
controller: blogs
', NULL, NULL, '2008-06-09 20:23:07+01');
INSERT INTO logged_exceptions VALUES (41, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "stdlib"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''stdlib'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: 
action: show
id: stdlib
controller: blogs
', NULL, NULL, '2008-06-10 03:08:21+01');
INSERT INTO logged_exceptions VALUES (42, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "xmlrpc"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''xmlrpc'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: xmlrpc
controller: blogs
', NULL, NULL, '2008-07-07 00:37:26+01');
INSERT INTO logged_exceptions VALUES (43, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "stdlib"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''stdlib'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: 
action: show
id: stdlib
controller: blogs
', NULL, NULL, '2008-07-14 18:03:20+01');
INSERT INTO logged_exceptions VALUES (44, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "stdlib"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''stdlib'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: 
action: show
id: stdlib
controller: blogs
', NULL, NULL, '2008-07-15 03:34:21+01');
INSERT INTO logged_exceptions VALUES (45, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "stdlib"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''stdlib'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: 
action: show
id: stdlib
controller: blogs
', NULL, NULL, '2008-07-15 10:41:04+01');
INSERT INTO logged_exceptions VALUES (46, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "stdlib"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''stdlib'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: 
action: show
id: stdlib
controller: blogs
', NULL, NULL, '2008-07-15 17:38:27+01');
INSERT INTO logged_exceptions VALUES (47, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-07-25 00:36:16+01');
INSERT INTO logged_exceptions VALUES (48, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-07-25 06:32:24+01');
INSERT INTO logged_exceptions VALUES (49, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-07-25 11:03:01+01');
INSERT INTO logged_exceptions VALUES (50, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-07-25 17:31:44+01');
INSERT INTO logged_exceptions VALUES (51, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-07-25 17:31:54+01');
INSERT INTO logged_exceptions VALUES (52, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-07-26 00:07:35+01');
INSERT INTO logged_exceptions VALUES (53, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-07-26 00:22:36+01');
INSERT INTO logged_exceptions VALUES (54, 'data_object::query_error', 'blogs', 'show', 'Your query failed.
ERROR:  invalid input syntax for integer: "contact"
QUERY: "SELECT "id", "title", "path_title", "body_html", "created_at", "updated_at", "published_at", "year", "month", "comments_expire_at", "user_id", "category_id" FROM "blogs" WHERE ("id" = ''contact'')"', '--- 
- /usr/lib/ruby/gems/1.8/gems/do_postgres-0.2.3/lib/do_postgres.rb:162:in `execute_reader''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:219:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/support/connection_pool.rb:67:in `hold''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:82:in `connection''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/sql/commands/load_command.rb:216:in `call''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/adapters/data_object_adapter.rb:345:in `load''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/context.rb:44:in `first''
- /usr/lib/ruby/gems/1.8/gems/datamapper-0.3.0/lib/data_mapper/persistence.rb:300:in `first''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:39:in `find_blog''
- /var/www/apps/fightinjoe/releases/20080501072534/app/controllers/blogs.rb:25:in `show''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `send''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:228:in `_call_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/abstract_controller.rb:209:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/controller/merb_controller.rb:175:in `_dispatch''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `synchronize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:120:in `dispatch_action''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/dispatch/dispatcher.rb:66:in `handle''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/application.rb:37:in `call_without_sass''
- /usr/lib/ruby/gems/1.8/gems/haml-1.8.2/lib/sass/plugin/merb.rb:30:in `call''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/handler/mongrel.rb:72:in `process''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:159:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `each''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:158:in `process_client''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:285:in `run''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `initialize''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `new''
- /usr/lib/ruby/gems/1.8/gems/mongrel-1.1.3/lib/mongrel.rb:268:in `run''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/rack/adapter/mongrel.rb:21:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:116:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `fork''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:97:in `daemonize''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:28:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `upto''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core/server.rb:24:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/lib/merb-core.rb:29:in `start''
- /usr/lib/ruby/gems/1.8/gems/merb-core-0.9.2/bin/merb:8
- /usr/bin/merb:19:in `load''
- /usr/bin/merb:19
', NULL, '--- {}

', '--- !map:Mash 
format: php
action: show
id: contact
controller: blogs
', NULL, NULL, '2008-07-26 06:36:35+01');


--
-- Data for Name: testers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users VALUES (1, 'fightinjoe', 'aaron@fightinjoe.com', '283cf8f1e9a76b0bdf7be019c53a3e2c9091d7a1', 'eb784fc5e26435710320ebbacf8fac434a108345', NULL, NULL, '2008-03-11 14:13:02+00', '2008-03-16 14:44:24+00');


--
-- Name: blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: logged_exceptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY logged_exceptions
    ADD CONSTRAINT logged_exceptions_pkey PRIMARY KEY (id);


--
-- Name: testers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY testers
    ADD CONSTRAINT testers_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

