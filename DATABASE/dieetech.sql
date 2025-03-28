PGDMP     :    %                {           dieetech    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16451    dieetech    DATABASE     {   CREATE DATABASE dieetech WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Italian_Italy.1252';
    DROP DATABASE dieetech;
                postgres    false            �            1259    16486    immagini    TABLE     �   CREATE TABLE public.immagini (
    id integer NOT NULL,
    descrizione character varying(255),
    nome_file character varying(255),
    percorso character varying(500)
);
    DROP TABLE public.immagini;
       public         heap    postgres    false            �            1259    16485    immagini_id_seq    SEQUENCE     �   CREATE SEQUENCE public.immagini_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.immagini_id_seq;
       public          postgres    false    218                       0    0    immagini_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.immagini_id_seq OWNED BY public.immagini.id;
          public          postgres    false    217            �            1259    16458    prodotti    TABLE     !  CREATE TABLE public.prodotti (
    id integer NOT NULL,
    nome character varying(50),
    descrizione character varying(1000),
    software character varying(100),
    prezzo double precision,
    quantita integer,
    utente_id character varying(20),
    foto character varying(200)
);
    DROP TABLE public.prodotti;
       public         heap    postgres    false            �            1259    16457    prodotti_id_seq    SEQUENCE     �   CREATE SEQUENCE public.prodotti_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.prodotti_id_seq;
       public          postgres    false    216                       0    0    prodotti_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.prodotti_id_seq OWNED BY public.prodotti.id;
          public          postgres    false    215            �            1259    16452    utenti    TABLE       CREATE TABLE public.utenti (
    username character varying(20) NOT NULL,
    pass character varying(20),
    nome character varying(50),
    cognome character varying(50),
    email character varying(50),
    citta character varying(50),
    foto character varying(200)
);
    DROP TABLE public.utenti;
       public         heap    postgres    false            o           2604    16489    immagini id    DEFAULT     j   ALTER TABLE ONLY public.immagini ALTER COLUMN id SET DEFAULT nextval('public.immagini_id_seq'::regclass);
 :   ALTER TABLE public.immagini ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            n           2604    16461    prodotti id    DEFAULT     j   ALTER TABLE ONLY public.prodotti ALTER COLUMN id SET DEFAULT nextval('public.prodotti_id_seq'::regclass);
 :   ALTER TABLE public.prodotti ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            	          0    16486    immagini 
   TABLE DATA           H   COPY public.immagini (id, descrizione, nome_file, percorso) FROM stdin;
    public          postgres    false    218   '                 0    16458    prodotti 
   TABLE DATA           f   COPY public.prodotti (id, nome, descrizione, software, prezzo, quantita, utente_id, foto) FROM stdin;
    public          postgres    false    216   D                 0    16452    utenti 
   TABLE DATA           S   COPY public.utenti (username, pass, nome, cognome, email, citta, foto) FROM stdin;
    public          postgres    false    214                     0    0    immagini_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.immagini_id_seq', 1, false);
          public          postgres    false    217                       0    0    prodotti_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.prodotti_id_seq', 6, true);
          public          postgres    false    215            u           2606    16493    immagini immagini_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.immagini
    ADD CONSTRAINT immagini_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.immagini DROP CONSTRAINT immagini_pkey;
       public            postgres    false    218            s           2606    16465    prodotti prodotti_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.prodotti
    ADD CONSTRAINT prodotti_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.prodotti DROP CONSTRAINT prodotti_pkey;
       public            postgres    false    216            q           2606    16456    utenti utenti_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.utenti
    ADD CONSTRAINT utenti_pkey PRIMARY KEY (username);
 <   ALTER TABLE ONLY public.utenti DROP CONSTRAINT utenti_pkey;
       public            postgres    false    214            v           2606    16466     prodotti prodotti_utente_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.prodotti
    ADD CONSTRAINT prodotti_utente_id_fkey FOREIGN KEY (utente_id) REFERENCES public.utenti(username) ON UPDATE CASCADE;
 J   ALTER TABLE ONLY public.prodotti DROP CONSTRAINT prodotti_utente_id_fkey;
       public          postgres    false    3185    214    216            	      x������ � �         �  x�}��n�0���������r���h�`i��"s*[4$�������
dw���T�>l?�`�#���zr�y�JCE���Z�����[�#E���=jk�a��j�jO��X�e�\��Z�YQc�H�-9��=^3��-ڤP�P]s0��[2����a��u�{b��N�� ���	ovy�(���`�W����|���,���&s��f����ǈ�,���� ���b�7Ah�p�J������0� ��' Q̌����6B�$�vՐ)A�(Dl4�<(����j��<�6����WGrO�膌g!���Un��+2��AN�H5������[@��{:���l����T:m�Zm�(J��c-&¦Ȳ�mp0N~���������/�0]fi6x۴�Ϩa�ݮ�\ůA(7�<�ԭ�N2��3��������,G��u6)�$I~��)         �   x�m��J�0���)z\/�Ttuo��eA�'A�$�#iR���7�.H/���1��p� ��v*��"(�p΃!kG�ےF8O���KsԹ�n�3vq�T%���:Q[2Y������D����J|�<�����o�3��;M���+PަD��gΕ�C��rY>�]˼������x��w�R�9�O�P<a"O�?��X�� �+e�)c���X�Gt�p��z�ڶ�;��Q
!~�`�}     