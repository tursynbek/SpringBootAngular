PGDMP     (    -                z            postgres    14.0    14.0     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    13754    postgres    DATABASE     i   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Kazakhstan.1251';
    DROP DATABASE postgres;
                postgres    false            ?           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3326            ?            1259    16573    student    TABLE     ?   CREATE TABLE public.student (
    id bigint NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    grade integer NOT NULL
);
    DROP TABLE public.student;
       public         heap    postgres    false            ?            1259    16581    student_id_seq    SEQUENCE     w   CREATE SEQUENCE public.student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.student_id_seq;
       public          postgres    false    216                        0    0    student_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;
          public          postgres    false    217            h           2604    16582 
   student id    DEFAULT     h   ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);
 9   ALTER TABLE public.student ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            ?          0    16573    student 
   TABLE DATA           9   COPY public.student (id, name, email, grade) FROM stdin;
    public          postgres    false    216   7                  0    0    student_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.student_id_seq', 11, true);
          public          postgres    false    217            k           2606    16580    student student_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.student DROP CONSTRAINT student_pk;
       public            postgres    false    216            i           1259    16578    student_id_uindex    INDEX     J   CREATE UNIQUE INDEX student_id_uindex ON public.student USING btree (id);
 %   DROP INDEX public.student_id_uindex;
       public            postgres    false    216            ?   Y   x?3?t,?M??L?????9z????&\F???Ey?E??`
IΘ˄?)1??3	H??1?t???S?--??L???S+??f\1z\\\ ?#R     