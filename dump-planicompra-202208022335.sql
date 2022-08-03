--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

-- Started on 2022-08-02 23:35:18 -04

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
-- TOC entry 7 (class 2615 OID 20249)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3341 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 20250)
-- Name: accion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accion (
    id_accion integer NOT NULL,
    descripcion text,
    idpoa integer,
    idgerencia integer,
    id_tipo integer,
    poderacion bigint,
    fechainicio date,
    fechafin date,
    servicio character varying,
    unidadmedida character varying,
    enero bigint,
    febrero bigint,
    marzo bigint,
    abril bigint,
    mayo bigint,
    junio bigint,
    julio bigint,
    agosto bigint,
    septiembre bigint,
    octubre bigint,
    noviembre bigint,
    diciembre bigint
);


ALTER TABLE public.accion OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 20256)
-- Name: actividades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actividades (
    idactividad integer NOT NULL,
    idaccionespecifica integer,
    descripcion text,
    id_poa integer,
    id_tipo integer,
    id_gerencia integer,
    unidadmedida character varying,
    enero bigint,
    febrero bigint,
    marzo bigint,
    abril bigint,
    mayo bigint,
    junio bigint,
    julio bigint,
    agosto bigint,
    septiembre bigint,
    octubre bigint,
    noviembre bigint,
    diciembre bigint
);


ALTER TABLE public.actividades OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 20262)
-- Name: actividades_idactividad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actividades_idactividad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actividades_idactividad_seq OWNER TO postgres;

--
-- TOC entry 3342 (class 0 OID 0)
-- Dependencies: 204
-- Name: actividades_idactividad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actividades_idactividad_seq OWNED BY public.actividades.idactividad;


--
-- TOC entry 205 (class 1259 OID 20264)
-- Name: auth_assignment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_assignment (
    item_name character varying(64) NOT NULL,
    user_id character varying(64) NOT NULL,
    created_at integer
);


ALTER TABLE public.auth_assignment OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 20267)
-- Name: auth_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_item (
    name character varying(64) NOT NULL,
    type smallint NOT NULL,
    description text,
    rule_name character varying(64),
    data bytea,
    created_at integer,
    updated_at integer
);


ALTER TABLE public.auth_item OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 20273)
-- Name: auth_item_child; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_item_child (
    parent character varying(64) NOT NULL,
    child character varying(64) NOT NULL
);


ALTER TABLE public.auth_item_child OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 20276)
-- Name: auth_rule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_rule (
    name character varying(64) NOT NULL,
    data bytea,
    created_at integer,
    updated_at integer
);


ALTER TABLE public.auth_rule OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 20282)
-- Name: poa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.poa (
    idpoa integer NOT NULL,
    descripcion text,
    objetivo text,
    monto_asignado numeric,
    nombre_apellido text,
    id_tipo integer,
    idvisibilidad integer,
    id_gerencia integer
);


ALTER TABLE public.poa OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 20288)
-- Name: proyecto_idproyecto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proyecto_idproyecto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_idproyecto_seq OWNER TO postgres;

--
-- TOC entry 3343 (class 0 OID 0)
-- Dependencies: 210
-- Name: proyecto_idproyecto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proyecto_idproyecto_seq OWNED BY public.poa.idpoa;


--
-- TOC entry 211 (class 1259 OID 20290)
-- Name: basecalculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basecalculo (
    id_plan integer DEFAULT nextval('public.proyecto_idproyecto_seq'::regclass) NOT NULL,
    id_poa integer,
    id_accion integer,
    id_actividad integer,
    id_producto integer,
    id_medida integer,
    cantidad integer,
    monto_total character varying,
    id_gerencia integer,
    fecha date,
    id_partida integer,
    id_generica integer,
    id_especifico integer,
    costo character varying,
    id_usuario integer,
    iva character varying,
    total_iva character varying,
    iva_monto character varying,
    fecha_h date,
    id_moneda integer,
    n_dias integer,
    fecha_i date,
    fecha_f date,
    estatus boolean,
    enero character varying,
    febrero character varying,
    marzo character varying,
    abril character varying,
    mayo character varying,
    junio character varying,
    julio character varying,
    agosto character varying,
    septiembre character varying,
    octubre character varying,
    noviembre character varying,
    diciembre character varying,
    ponderacion numeric(50,0),
    id_tipo character varying
);


ALTER TABLE public.basecalculo OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 20297)
-- Name: calendario_id_calendario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calendario_id_calendario_seq
    START WITH 138
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calendario_id_calendario_seq OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 20299)
-- Name: costo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.costo (
    idcosto integer NOT NULL,
    costo numeric(30,2),
    idproducto integer,
    idmedida integer
);


ALTER TABLE public.costo OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 20302)
-- Name: costo_idcosto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.costo_idcosto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.costo_idcosto_seq OWNER TO postgres;

--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 214
-- Name: costo_idcosto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.costo_idcosto_seq OWNED BY public.costo.idcosto;


--
-- TOC entry 215 (class 1259 OID 20304)
-- Name: especifico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.especifico (
    id_especifico integer NOT NULL,
    id_generico integer,
    codigo character varying(15),
    descripcion text
);


ALTER TABLE public.especifico OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 20310)
-- Name: generico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.generico (
    id_generico integer NOT NULL,
    codigo character varying(15),
    descripcion text,
    id_partida integer
);


ALTER TABLE public.generico OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 20316)
-- Name: generica_id_generica_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.generica_id_generica_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.generica_id_generica_seq OWNER TO postgres;

--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 217
-- Name: generica_id_generica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.generica_id_generica_seq OWNED BY public.generico.id_generico;


--
-- TOC entry 218 (class 1259 OID 20318)
-- Name: gerencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gerencia (
    id_gerencia integer NOT NULL,
    gerencia text,
    mostrar boolean DEFAULT true
);


ALTER TABLE public.gerencia OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 20325)
-- Name: id_accion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_accion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_accion_id_seq OWNER TO postgres;

--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 219
-- Name: id_accion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_accion_id_seq OWNED BY public.accion.id_accion;


--
-- TOC entry 220 (class 1259 OID 20327)
-- Name: id_gerencia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_gerencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_gerencia_id_seq OWNER TO postgres;

--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 220
-- Name: id_gerencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_gerencia_id_seq OWNED BY public.gerencia.id_gerencia;


--
-- TOC entry 221 (class 1259 OID 20329)
-- Name: iva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iva (
    id_iva integer NOT NULL,
    iva integer
);


ALTER TABLE public.iva OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 20332)
-- Name: iva_id_iva_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.iva_id_iva_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iva_id_iva_seq OWNER TO postgres;

--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 222
-- Name: iva_id_iva_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.iva_id_iva_seq OWNED BY public.iva.id_iva;


--
-- TOC entry 223 (class 1259 OID 20334)
-- Name: medida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medida (
    idmedida integer NOT NULL,
    medida text
);


ALTER TABLE public.medida OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 20340)
-- Name: medida_idmedida_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medida_idmedida_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medida_idmedida_seq OWNER TO postgres;

--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 224
-- Name: medida_idmedida_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medida_idmedida_seq OWNED BY public.medida.idmedida;


--
-- TOC entry 247 (class 1259 OID 20665)
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    parent integer,
    route character varying(255),
    "order" integer,
    data character varying,
    icon character varying
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 20663)
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_seq OWNER TO postgres;

--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 246
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_id_seq OWNED BY public.menu.id;


--
-- TOC entry 225 (class 1259 OID 20342)
-- Name: migration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migration (
    version character varying(180) NOT NULL,
    apply_time integer
);


ALTER TABLE public.migration OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 20345)
-- Name: moneda_id_moneda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moneda_id_moneda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE public.moneda_id_moneda_seq OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 20347)
-- Name: tbl_partida_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_partida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_partida_id_seq OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 20349)
-- Name: partida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partida (
    id integer DEFAULT nextval('public.tbl_partida_id_seq'::regclass) NOT NULL,
    codigo character varying(15),
    descripcion text
);


ALTER TABLE public.partida OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 20356)
-- Name: perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perfil (
    id_perfil integer NOT NULL,
    descripcion text
);


ALTER TABLE public.perfil OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 20362)
-- Name: plan_basecalculo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plan_basecalculo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plan_basecalculo_seq OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 20364)
-- Name: tbl_presu_partida_id_partida_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_presu_partida_id_partida_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_presu_partida_id_partida_seq OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 20366)
-- Name: presu_partida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presu_partida (
    id_partida integer DEFAULT nextval('public.tbl_presu_partida_id_partida_seq'::regclass) NOT NULL,
    descripcion text,
    codigo character varying(15),
    id_presupuesto integer
);


ALTER TABLE public.presu_partida OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 20373)
-- Name: tbl_presupuesto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_presupuesto (
    id_presupuesto integer NOT NULL,
    presupuesto numeric(30,2),
    id_plan integer,
    fecha date
);


ALTER TABLE public.tbl_presupuesto OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 20376)
-- Name: presupusto_id_presupuesto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presupusto_id_presupuesto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presupusto_id_presupuesto_seq OWNER TO postgres;

--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 234
-- Name: presupusto_id_presupuesto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.presupusto_id_presupuesto_seq OWNED BY public.tbl_presupuesto.id_presupuesto;


--
-- TOC entry 235 (class 1259 OID 20378)
-- Name: requerimiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requerimiento (
    idproducto integer NOT NULL,
    producto character varying,
    idmedida integer,
    idespecifico integer,
    iva integer
);


ALTER TABLE public.requerimiento OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 20384)
-- Name: producto_idproducto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_idproducto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_idproducto_seq OWNER TO postgres;

--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 236
-- Name: producto_idproducto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_idproducto_seq OWNED BY public.requerimiento.idproducto;


--
-- TOC entry 237 (class 1259 OID 20386)
-- Name: tbl_especifico_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_especifico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_especifico_id_seq OWNER TO postgres;

--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 237
-- Name: tbl_especifico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_especifico_id_seq OWNED BY public.especifico.id_especifico;


--
-- TOC entry 238 (class 1259 OID 20388)
-- Name: tbl_subespecifico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_subespecifico (
    id integer NOT NULL,
    id_especifico integer,
    codigo character varying(15),
    descripcion text
);


ALTER TABLE public.tbl_subespecifico OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 20394)
-- Name: tbl_subespecifico_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_subespecifico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_subespecifico_id_seq OWNER TO postgres;

--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 239
-- Name: tbl_subespecifico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_subespecifico_id_seq OWNED BY public.tbl_subespecifico.id;


--
-- TOC entry 240 (class 1259 OID 20396)
-- Name: tipo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo (
    id_tipo integer NOT NULL,
    tipo text
);


ALTER TABLE public.tipo OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 20402)
-- Name: tipo_id_tipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_id_tipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_id_tipo_seq OWNER TO postgres;

--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 241
-- Name: tipo_id_tipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_id_tipo_seq OWNED BY public.tipo.id_tipo;


--
-- TOC entry 242 (class 1259 OID 20404)
-- Name: tipo_moneda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_moneda (
    id_moneda integer DEFAULT nextval('public.moneda_id_moneda_seq'::regclass) NOT NULL,
    descripcion text
);


ALTER TABLE public.tipo_moneda OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 20700)
-- Name: unidad_medida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unidad_medida (
    id integer NOT NULL,
    unidadmedida character varying,
    total bigint,
    enero bigint,
    febrero bigint,
    marzo bigint,
    abril bigint,
    mayo bigint,
    junio bigint,
    julio bigint,
    agosto bigint,
    septiembre bigint,
    octubre bigint,
    noviembre bigint,
    diciembre bigint,
    id_actividad bigint
);


ALTER TABLE public.unidad_medida OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 20698)
-- Name: unidad_medida_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unidad_medida_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_medida_id_seq OWNER TO postgres;

--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 250
-- Name: unidad_medida_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unidad_medida_id_seq OWNED BY public.unidad_medida.id;


--
-- TOC entry 249 (class 1259 OID 20681)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(32) NOT NULL,
    auth_key character varying(32) NOT NULL,
    password_hash character varying(255) NOT NULL,
    password_reset_token character varying(255),
    email character varying(255) NOT NULL,
    status smallint DEFAULT 10 NOT NULL,
    created_at integer NOT NULL,
    updated_at integer NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 20679)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 248
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 243 (class 1259 OID 20411)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    username character varying(100),
    password character varying(100),
    id_perfil integer,
    id_gerencia integer,
    nombre character varying(50),
    apellido character varying(50),
    cedula integer,
    cargo character varying(100),
    correo character varying(100),
    status integer,
    auth_key character varying(100),
    id integer NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 20417)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 244
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id;


--
-- TOC entry 245 (class 1259 OID 20419)
-- Name: visibilidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visibilidad (
    id_visibilidad integer NOT NULL,
    "descripción" text
);


ALTER TABLE public.visibilidad OWNER TO postgres;

--
-- TOC entry 3044 (class 2604 OID 20425)
-- Name: accion id_accion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accion ALTER COLUMN id_accion SET DEFAULT nextval('public.id_accion_id_seq'::regclass);


--
-- TOC entry 3045 (class 2604 OID 20426)
-- Name: actividades idactividad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actividades ALTER COLUMN idactividad SET DEFAULT nextval('public.actividades_idactividad_seq'::regclass);


--
-- TOC entry 3048 (class 2604 OID 20427)
-- Name: costo idcosto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.costo ALTER COLUMN idcosto SET DEFAULT nextval('public.costo_idcosto_seq'::regclass);


--
-- TOC entry 3049 (class 2604 OID 20428)
-- Name: especifico id_especifico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especifico ALTER COLUMN id_especifico SET DEFAULT nextval('public.tbl_especifico_id_seq'::regclass);


--
-- TOC entry 3050 (class 2604 OID 20429)
-- Name: generico id_generico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.generico ALTER COLUMN id_generico SET DEFAULT nextval('public.generica_id_generica_seq'::regclass);


--
-- TOC entry 3052 (class 2604 OID 20430)
-- Name: gerencia id_gerencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gerencia ALTER COLUMN id_gerencia SET DEFAULT nextval('public.id_gerencia_id_seq'::regclass);


--
-- TOC entry 3053 (class 2604 OID 20431)
-- Name: iva id_iva; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iva ALTER COLUMN id_iva SET DEFAULT nextval('public.iva_id_iva_seq'::regclass);


--
-- TOC entry 3054 (class 2604 OID 20432)
-- Name: medida idmedida; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medida ALTER COLUMN idmedida SET DEFAULT nextval('public.medida_idmedida_seq'::regclass);


--
-- TOC entry 3062 (class 2604 OID 20668)
-- Name: menu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu ALTER COLUMN id SET DEFAULT nextval('public.menu_id_seq'::regclass);


--
-- TOC entry 3046 (class 2604 OID 20433)
-- Name: poa idpoa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poa ALTER COLUMN idpoa SET DEFAULT nextval('public.proyecto_idproyecto_seq'::regclass);


--
-- TOC entry 3058 (class 2604 OID 20434)
-- Name: requerimiento idproducto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requerimiento ALTER COLUMN idproducto SET DEFAULT nextval('public.producto_idproducto_seq'::regclass);


--
-- TOC entry 3057 (class 2604 OID 20435)
-- Name: tbl_presupuesto id_presupuesto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_presupuesto ALTER COLUMN id_presupuesto SET DEFAULT nextval('public.presupusto_id_presupuesto_seq'::regclass);


--
-- TOC entry 3059 (class 2604 OID 20436)
-- Name: tbl_subespecifico id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_subespecifico ALTER COLUMN id SET DEFAULT nextval('public.tbl_subespecifico_id_seq'::regclass);


--
-- TOC entry 3065 (class 2604 OID 20703)
-- Name: unidad_medida id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidad_medida ALTER COLUMN id SET DEFAULT nextval('public.unidad_medida_id_seq'::regclass);


--
-- TOC entry 3063 (class 2604 OID 20684)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 3061 (class 2604 OID 20437)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- TOC entry 3286 (class 0 OID 20250)
-- Dependencies: 202
-- Data for Name: accion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.accion VALUES (44, 'ASIGNACIÓN Y CONTROL DE LOS RECURSOS PARA LOS GASTOS DE LOS TRABAJADORES (IO/IP)', 91, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.accion VALUES (45, 'APOYO INSTITUCIONAL A LAS ACCIONES ESPECIFICAS DE LOS PROYECTOS DEL ORGANISMO (IO/IP)', 92, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.accion VALUES (46, 'APOYO AL SECTOR PRIVADO EXTERNO (IP)', 92, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.accion VALUES (47, 'ASIGNACIÓN Y CONTROL DE LOS RECURSOS PARA GASTOS DE LOS PENSIONADOS Y JUBILADOS (IO/IP)', 93, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.accion VALUES (48, 'accion especifica 1', 94, 17, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.accion VALUES (49, 'acción especifica 2', 94, 17, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.accion VALUES (50, 'servicio de mantenimiento de servidores hp y cambio de disco duros danados', 94, 17, 2, 50, '2023-01-01', '2023-12-31', 'mantenimiento de servidores', 'servicio', 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.accion VALUES (51, 'Nombre de la acción especifica', 94, 17, 2, NULL, '2022-07-14', '2022-07-15', '', 'servicio', 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO public.accion VALUES (52, 'servicio de contratacion', 94, 17, 2, NULL, '2022-01-01', '2022-12-31', NULL, 'servicio', 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO public.accion VALUES (53, 'materiales de oficina', 97, 17, 2, NULL, '2022-01-01', '2022-12-31', NULL, 'servicio', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);


--
-- TOC entry 3287 (class 0 OID 20256)
-- Dependencies: 203
-- Data for Name: actividades; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.actividades VALUES (31, 50, 'cambio de memoria', 94, 2, 17, 'servicio', 1, 33, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.actividades VALUES (32, 50, 'mantenimiento', 94, 2, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.actividades VALUES (30, 48, 'cambio de memoria con 2 unidades de medida', 94, 2, 17, 'servicio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.actividades VALUES (33, 48, 'mantenimiento de carros', 94, 2, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.actividades VALUES (34, 48, 'contratacion', 94, 2, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.actividades VALUES (35, 53, 'compra de hojas', 97, 2, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 3289 (class 0 OID 20264)
-- Dependencies: 205
-- Data for Name: auth_assignment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_assignment VALUES ('superadministrador', '6', 1658256694);


--
-- TOC entry 3290 (class 0 OID 20267)
-- Dependencies: 206
-- Data for Name: auth_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_item VALUES ('superadministrador', 1, NULL, NULL, NULL, 1658255443, 1658255443);
INSERT INTO public.auth_item VALUES ('/admin/assignment/index', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/assignment/view', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/assignment/assign', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/assignment/revoke', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/assignment/*', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/default/index', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/default/*', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/menu/index', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/menu/view', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/menu/create', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/menu/update', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/menu/delete', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/menu/*', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/permission/index', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/permission/view', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/permission/create', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/permission/update', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/permission/delete', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/permission/assign', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/permission/get-users', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/permission/remove', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/permission/*', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/role/index', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/role/view', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/role/create', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/role/update', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/role/delete', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/role/assign', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/role/get-users', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/role/remove', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/role/*', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/route/index', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/route/create', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/route/assign', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/route/remove', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/route/refresh', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/route/*', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/rule/index', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/rule/view', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/rule/create', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/rule/update', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/rule/delete', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/rule/*', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/user/index', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/user/view', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/user/delete', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/user/login', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/user/logout', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/user/signup', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/user/request-password-reset', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/user/reset-password', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/user/change-password', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/user/activate', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/user/*', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/admin/*', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/debug/default/db-explain', 2, NULL, NULL, NULL, 1658259531, 1658259531);
INSERT INTO public.auth_item VALUES ('/debug/default/index', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/debug/default/view', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/debug/default/toolbar', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/debug/default/download-mail', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/debug/default/*', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/debug/user/set-identity', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/debug/user/reset-identity', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/debug/user/*', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/debug/*', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/gii/default/index', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/gii/default/view', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/gii/default/preview', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/gii/default/diff', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/gii/default/action', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/gii/default/*', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/gii/*', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/accion/index', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/accion/view', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/accion/create', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/accion/update', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/accion/delete', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/accion/poas', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/accion/*', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/actividades/index', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/actividades/view', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/actividades/create', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/actividades/update', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/actividades/delete', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/actividades/poas', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/actividades/accionespecif', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/actividades/*', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/basecalculo/index', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/basecalculo/view', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/basecalculo/create', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/basecalculo/update', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/basecalculo/delete', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/basecalculo/poas', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/basecalculo/accionespecif', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/basecalculo/actividades', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/basecalculo/medidas', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/basecalculo/costos', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/basecalculo/especificos', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/basecalculo/genericas', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/basecalculo/partidas', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/basecalculo/ivas', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/basecalculo/pdf', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/basecalculo/*', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/gerencia/index', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/gerencia/view', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/gerencia/create', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/gerencia/update', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/gerencia/delete', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/gerencia/*', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/iva/index', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/iva/view', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/iva/create', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/iva/update', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/iva/delete', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/iva/*', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/medida/index', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/medida/view', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/medida/create', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/medida/update', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/medida/delete', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/medida/*', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/poa/index', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/poa/view', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/poa/create', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/poa/update', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/poa/delete', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/poa/pdf', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/poa/pdf2', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/poa/pdfaccion', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/poa/pdfcompleto', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/poa/*', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/producto/index', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/producto/view', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/producto/create', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/producto/update', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/producto/delete', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/producto/*', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/requerimiento/index', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/requerimiento/view', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/requerimiento/create', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/requerimiento/update', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/requerimiento/delete', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/requerimiento/*', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/site/error', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/site/captcha', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/site/index', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/site/login', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/site/logout', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/site/contact', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/site/about', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/site/*', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/usuario/index', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/usuario/view', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/usuario/create', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/usuario/update', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/usuario/delete', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/usuario/*', 2, NULL, NULL, NULL, 1658259532, 1658259532);
INSERT INTO public.auth_item VALUES ('/*', 2, NULL, NULL, NULL, 1658259532, 1658259532);


--
-- TOC entry 3291 (class 0 OID 20273)
-- Dependencies: 207
-- Data for Name: auth_item_child; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_item_child VALUES ('superadministrador', '/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/accion/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/accion/create');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/accion/delete');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/accion/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/accion/poas');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/accion/update');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/accion/view');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/actividades/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/actividades/accionespecif');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/actividades/create');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/actividades/delete');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/actividades/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/actividades/poas');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/actividades/update');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/actividades/view');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/assignment/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/assignment/assign');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/assignment/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/assignment/revoke');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/assignment/view');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/default/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/default/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/menu/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/menu/create');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/menu/delete');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/menu/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/menu/update');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/menu/view');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/permission/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/permission/assign');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/permission/create');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/permission/delete');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/permission/get-users');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/permission/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/permission/remove');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/permission/update');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/permission/view');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/role/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/role/assign');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/role/create');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/role/delete');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/role/get-users');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/role/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/role/remove');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/role/update');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/role/view');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/route/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/route/assign');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/route/create');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/route/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/route/refresh');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/route/remove');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/rule/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/rule/create');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/rule/delete');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/rule/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/rule/update');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/rule/view');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/user/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/user/activate');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/user/change-password');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/user/delete');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/user/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/user/login');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/user/logout');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/user/request-password-reset');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/user/reset-password');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/user/signup');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/admin/user/view');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/basecalculo/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/basecalculo/accionespecif');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/basecalculo/actividades');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/basecalculo/costos');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/basecalculo/create');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/basecalculo/delete');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/basecalculo/especificos');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/basecalculo/genericas');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/basecalculo/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/basecalculo/ivas');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/basecalculo/medidas');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/basecalculo/partidas');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/basecalculo/pdf');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/basecalculo/poas');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/basecalculo/update');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/basecalculo/view');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/debug/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/debug/default/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/debug/default/db-explain');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/debug/default/download-mail');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/debug/default/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/debug/default/toolbar');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/debug/default/view');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/debug/user/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/debug/user/reset-identity');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/debug/user/set-identity');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/gerencia/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/gerencia/create');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/gerencia/delete');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/gerencia/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/gerencia/update');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/gerencia/view');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/gii/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/gii/default/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/gii/default/action');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/gii/default/diff');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/gii/default/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/gii/default/preview');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/gii/default/view');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/iva/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/iva/create');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/iva/delete');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/iva/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/iva/update');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/iva/view');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/medida/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/medida/create');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/medida/delete');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/medida/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/medida/update');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/medida/view');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/poa/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/poa/create');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/poa/delete');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/poa/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/poa/pdf');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/poa/pdf2');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/poa/pdfaccion');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/poa/pdfcompleto');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/poa/update');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/poa/view');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/producto/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/producto/create');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/producto/delete');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/producto/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/producto/update');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/producto/view');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/requerimiento/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/requerimiento/create');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/requerimiento/delete');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/requerimiento/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/requerimiento/update');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/requerimiento/view');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/site/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/site/about');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/site/captcha');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/site/contact');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/site/error');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/site/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/site/login');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/site/logout');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/usuario/*');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/usuario/create');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/usuario/delete');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/usuario/index');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/usuario/update');
INSERT INTO public.auth_item_child VALUES ('superadministrador', '/usuario/view');


--
-- TOC entry 3292 (class 0 OID 20276)
-- Dependencies: 208
-- Data for Name: auth_rule; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3295 (class 0 OID 20290)
-- Dependencies: 211
-- Data for Name: basecalculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.basecalculo VALUES (100, 94, 48, 30, 3818, 181, 2, '611.712.787.028', 17, NULL, 2, 14, 990, '305.856.393.514,20', 6, '16,00', '709.586.832.953', '97.874.045.925', NULL, NULL, NULL, NULL, NULL, true, '59.132.236.084', '59.132.236.079', '59.132.236.079', '59.132.236.079', '59.132.236.079', '59.132.236.079', '59.132.236.079', '59.132.236.079', '59.132.236.079', '59.132.236.079', '59.132.236.079', '59.132.236.079', NULL, '2');


--
-- TOC entry 3297 (class 0 OID 20299)
-- Dependencies: 213
-- Data for Name: costo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.costo VALUES (4888, 52414714.50, 4998, 179);
INSERT INTO public.costo VALUES (4912, 30000000.00, 5022, 179);
INSERT INTO public.costo VALUES (4936, 60000000.00, 5046, 179);
INSERT INTO public.costo VALUES (4725, 278400000.00, 4832, 179);
INSERT INTO public.costo VALUES (4326, 0.00, 4426, 179);
INSERT INTO public.costo VALUES (4748, 17325000.00, 4856, 182);
INSERT INTO public.costo VALUES (4383, 0.00, 4483, 217);
INSERT INTO public.costo VALUES (4421, 0.00, 4521, 179);
INSERT INTO public.costo VALUES (4458, 0.00, 4558, 179);
INSERT INTO public.costo VALUES (3001, 19500000.00, 3096, 179);
INSERT INTO public.costo VALUES (4501, 8250000.00, 4601, 179);
INSERT INTO public.costo VALUES (4103, 46200000.00, 4203, 179);
INSERT INTO public.costo VALUES (4553, 5700000.00, 4653, 179);
INSERT INTO public.costo VALUES (3009, 82500000.00, 3104, 179);
INSERT INTO public.costo VALUES (3830, 322500000.00, 3925, 179);
INSERT INTO public.costo VALUES (4771, 36300000.00, 4880, 179);
INSERT INTO public.costo VALUES (2868, 374985000.00, 2951, 179);
INSERT INTO public.costo VALUES (3936, 1170000.00, 4036, 179);
INSERT INTO public.costo VALUES (4143, 0.00, 4243, 179);
INSERT INTO public.costo VALUES (13, 6750000.00, 13, 139);
INSERT INTO public.costo VALUES (3006, 3540000.00, 3101, 179);
INSERT INTO public.costo VALUES (4865, 3000000000.00, 4975, 179);
INSERT INTO public.costo VALUES (4248, 12500000.00, 4348, 179);
INSERT INTO public.costo VALUES (3616, 12000000.00, 3711, 179);
INSERT INTO public.costo VALUES (4889, 43678928.75, 4999, 179);
INSERT INTO public.costo VALUES (4913, 3000000.00, 5023, 179);
INSERT INTO public.costo VALUES (4937, 60000000.00, 5047, 179);
INSERT INTO public.costo VALUES (3021, 11250000.00, 3116, 117);
INSERT INTO public.costo VALUES (3580, 6000000.00, 3675, 179);
INSERT INTO public.costo VALUES (3442, 20000000.00, 3537, 179);
INSERT INTO public.costo VALUES (4726, 139200000.00, 4833, 179);
INSERT INTO public.costo VALUES (4469, 13500000.00, 4569, 28);
INSERT INTO public.costo VALUES (3299, 399270000.00, 3394, 179);
INSERT INTO public.costo VALUES (4840, 14718375.00, 4949, 179);
INSERT INTO public.costo VALUES (4381, 0.00, 4481, 217);
INSERT INTO public.costo VALUES (4438, 118808250.00, 4538, 233);
INSERT INTO public.costo VALUES (4863, 1257594600.00, 4973, 179);
INSERT INTO public.costo VALUES (4528, 0.00, 4628, 179);
INSERT INTO public.costo VALUES (4611, 8700000.00, 4711, 179);
INSERT INTO public.costo VALUES (4311, 16500000.00, 4411, 179);
INSERT INTO public.costo VALUES (4012, 3750000.00, 4112, 163);
INSERT INTO public.costo VALUES (2622, 27825000.00, 2703, 28);
INSERT INTO public.costo VALUES (2958, 161700000.00, 3050, 179);
INSERT INTO public.costo VALUES (2863, 104250000.00, 2946, 179);
INSERT INTO public.costo VALUES (2994, 6000000.00, 3089, 146);
INSERT INTO public.costo VALUES (3871, 48600000.00, 3966, 179);
INSERT INTO public.costo VALUES (4496, 4492500.00, 4596, 28);
INSERT INTO public.costo VALUES (4213, 59478150.00, 4313, 179);
INSERT INTO public.costo VALUES (2995, 27000000.00, 3090, 146);
INSERT INTO public.costo VALUES (3003, 50562150.00, 3098, 179);
INSERT INTO public.costo VALUES (4601, 8700000.00, 4701, 146);
INSERT INTO public.costo VALUES (4364, 19500000.00, 4464, 179);
INSERT INTO public.costo VALUES (3882, 220950000.00, 3977, 179);
INSERT INTO public.costo VALUES (4617, 39900000.00, 4717, 227);
INSERT INTO public.costo VALUES (4680, 456750000.00, 4780, 179);
INSERT INTO public.costo VALUES (4866, 9500000.00, 4976, 179);
INSERT INTO public.costo VALUES (4668, 30000000.00, 4768, 136);
INSERT INTO public.costo VALUES (4890, 34943143.00, 5000, 179);
INSERT INTO public.costo VALUES (4914, 97500000.00, 5024, 179);
INSERT INTO public.costo VALUES (4938, 75000000.00, 5048, 179);
INSERT INTO public.costo VALUES (3134, 133000000.00, 3229, 181);
INSERT INTO public.costo VALUES (3948, 69000000.00, 4048, 227);
INSERT INTO public.costo VALUES (3812, 1200000.00, 3907, 179);
INSERT INTO public.costo VALUES (4681, 122400000.00, 4781, 179);
INSERT INTO public.costo VALUES (4727, 320000000.00, 4834, 179);
INSERT INTO public.costo VALUES (4704, 21489000.00, 4811, 179);
INSERT INTO public.costo VALUES (2954, 450000000.00, 3046, 181);
INSERT INTO public.costo VALUES (3013, 90000000.00, 3108, 181);
INSERT INTO public.costo VALUES (4059, 4050000.00, 4159, 179);
INSERT INTO public.costo VALUES (4492, 15270000.00, 4592, 230);
INSERT INTO public.costo VALUES (3018, 9750000.00, 3113, 179);
INSERT INTO public.costo VALUES (3934, 405000000.00, 4034, 179);
INSERT INTO public.costo VALUES (3897, 805379850.00, 3992, 179);
INSERT INTO public.costo VALUES (4125, 21307500.00, 4225, 227);
INSERT INTO public.costo VALUES (4607, 0.00, 4707, 179);
INSERT INTO public.costo VALUES (3960, 3750000.00, 4060, 162);
INSERT INTO public.costo VALUES (1084, 5700000.00, 1158, 30);
INSERT INTO public.costo VALUES (4035, 7650000.00, 4135, 28);
INSERT INTO public.costo VALUES (4418, 13218750.00, 4518, 179);
INSERT INTO public.costo VALUES (2891, 477275550.00, 2983, 179);
INSERT INTO public.costo VALUES (2919, 78000000.00, 3011, 182);
INSERT INTO public.costo VALUES (3155, 49140000.00, 3250, 179);
INSERT INTO public.costo VALUES (4891, 17471571.50, 5001, 179);
INSERT INTO public.costo VALUES (4939, 60000000.00, 5049, 179);
INSERT INTO public.costo VALUES (4867, 7000000.00, 4977, 179);
INSERT INTO public.costo VALUES (3137, 380000000.00, 3232, 181);
INSERT INTO public.costo VALUES (3136, 456000000.00, 3231, 181);
INSERT INTO public.costo VALUES (3135, 102600000.00, 3230, 181);
INSERT INTO public.costo VALUES (4682, 300000000.00, 4782, 179);
INSERT INTO public.costo VALUES (3154, 91500000.00, 3249, 179);
INSERT INTO public.costo VALUES (3160, 37500000.00, 3255, 193);
INSERT INTO public.costo VALUES (2870, 264000000.00, 2953, 179);
INSERT INTO public.costo VALUES (2871, 297000000.00, 2954, 179);
INSERT INTO public.costo VALUES (4705, 234900000.00, 4812, 179);
INSERT INTO public.costo VALUES (2872, 297000000.00, 2955, 179);
INSERT INTO public.costo VALUES (4630, 179987250.00, 4730, 179);
INSERT INTO public.costo VALUES (4728, 150336000.00, 4835, 179);
INSERT INTO public.costo VALUES (3346, 29250000.00, 3441, 179);
INSERT INTO public.costo VALUES (2890, 9615000.00, 2982, 146);
INSERT INTO public.costo VALUES (4968, 133.00, 5080, 217);
INSERT INTO public.costo VALUES (2691, 594000000.00, 2772, 179);
INSERT INTO public.costo VALUES (3450, 4500000.00, 3545, 179);
INSERT INTO public.costo VALUES (4328, 0.00, 4428, 179);
INSERT INTO public.costo VALUES (4385, 0.00, 4485, 217);
INSERT INTO public.costo VALUES (4749, 17325000.00, 4857, 182);
INSERT INTO public.costo VALUES (4772, 1650000.00, 4881, 179);
INSERT INTO public.costo VALUES (2887, 0.00, 2978, 28);
INSERT INTO public.costo VALUES (3451, 75000000.00, 3546, 179);
INSERT INTO public.costo VALUES (4841, 56801100.00, 4950, 179);
INSERT INTO public.costo VALUES (4795, 75000000.00, 4904, 179);
INSERT INTO public.costo VALUES (3570, 15000000.00, 3665, 179);
INSERT INTO public.costo VALUES (4892, 87357857.50, 5002, 179);
INSERT INTO public.costo VALUES (4940, 225000000.00, 5050, 179);
INSERT INTO public.costo VALUES (3592, 38100000.00, 3687, 179);
INSERT INTO public.costo VALUES (3594, 18450000.00, 3689, 179);
INSERT INTO public.costo VALUES (4190, 352610000.00, 4290, 179);
INSERT INTO public.costo VALUES (4706, 73080000.00, 4813, 179);
INSERT INTO public.costo VALUES (3458, 33750000.00, 3553, 179);
INSERT INTO public.costo VALUES (2904, 98250000.00, 2996, 182);
INSERT INTO public.costo VALUES (2901, 136500000.00, 2993, 179);
INSERT INTO public.costo VALUES (4295, 9450000.00, 4395, 179);
INSERT INTO public.costo VALUES (3002, 25188300.00, 3097, 179);
INSERT INTO public.costo VALUES (3165, 13350000.00, 3260, 193);
INSERT INTO public.costo VALUES (2955, 32550000.00, 3047, 179);
INSERT INTO public.costo VALUES (4683, 108000000000.00, 4789, 179);
INSERT INTO public.costo VALUES (3811, 24750000.00, 3906, 179);
INSERT INTO public.costo VALUES (4062, 47700000.00, 4162, 179);
INSERT INTO public.costo VALUES (4024, 3000000.00, 4124, 236);
INSERT INTO public.costo VALUES (3815, 25500000.00, 3910, 179);
INSERT INTO public.costo VALUES (3139, 90000000.00, 3234, 179);
INSERT INTO public.costo VALUES (3148, 20092500.00, 3243, 179);
INSERT INTO public.costo VALUES (4625, 285000000.00, 4725, 179);
INSERT INTO public.costo VALUES (3873, 132000000.00, 3968, 179);
INSERT INTO public.costo VALUES (4191, 12750000.00, 4291, 179);
INSERT INTO public.costo VALUES (4526, 0.00, 4626, 182);
INSERT INTO public.costo VALUES (4436, 0.00, 4536, 179);
INSERT INTO public.costo VALUES (4345, 315000000.00, 4445, 179);
INSERT INTO public.costo VALUES (3162, 27000000.00, 3257, 193);
INSERT INTO public.costo VALUES (3515, 184677000.00, 3610, 149);
INSERT INTO public.costo VALUES (2982, 0.00, 3077, 117);
INSERT INTO public.costo VALUES (4773, 3000000.00, 4882, 179);
INSERT INTO public.costo VALUES (3893, 975000000.00, 3988, 179);
INSERT INTO public.costo VALUES (3780, 825000.00, 3875, 179);
INSERT INTO public.costo VALUES (3977, 3810000.00, 4077, 5);
INSERT INTO public.costo VALUES (932, 6375000.00, 1005, 163);
INSERT INTO public.costo VALUES (3158, 114750000.00, 3253, 150);
INSERT INTO public.costo VALUES (3982, 6750000.00, 4082, 162);
INSERT INTO public.costo VALUES (3987, 8197500.00, 4087, 162);
INSERT INTO public.costo VALUES (3800, 4500000.00, 3895, 179);
INSERT INTO public.costo VALUES (2981, 4500000.00, 3076, 201);
INSERT INTO public.costo VALUES (4327, 0.00, 4427, 182);
INSERT INTO public.costo VALUES (4384, 0.00, 4484, 217);
INSERT INTO public.costo VALUES (2990, 97500000.00, 3085, 201);
INSERT INTO public.costo VALUES (3746, 0.00, 3841, 179);
INSERT INTO public.costo VALUES (4869, 3000000.00, 4979, 181);
INSERT INTO public.costo VALUES (3417, 6750000.00, 3512, 201);
INSERT INTO public.costo VALUES (4868, 5500000000.00, 4978, 179);
INSERT INTO public.costo VALUES (3437, 45900000.00, 3532, 179);
INSERT INTO public.costo VALUES (3431, 15000000.00, 3526, 201);
INSERT INTO public.costo VALUES (3575, 17500000.00, 3670, 179);
INSERT INTO public.costo VALUES (3578, 75000000.00, 3673, 179);
INSERT INTO public.costo VALUES (3424, 11750000.00, 3519, 117);
INSERT INTO public.costo VALUES (4893, 52414714.50, 5003, 179);
INSERT INTO public.costo VALUES (4941, 225000000.00, 5051, 179);
INSERT INTO public.costo VALUES (3420, 3000000.00, 3515, 179);
INSERT INTO public.costo VALUES (3422, 19500000.00, 3517, 179);
INSERT INTO public.costo VALUES (3908, 71408.16, 4003, 233);
INSERT INTO public.costo VALUES (4796, 623700000.00, 4905, 179);
INSERT INTO public.costo VALUES (3953, 8250000.00, 4053, 163);
INSERT INTO public.costo VALUES (4365, 307500000.00, 4465, 179);
INSERT INTO public.costo VALUES (2909, 0.00, 3001, 181);
INSERT INTO public.costo VALUES (3922, 0.00, 4017, 233);
INSERT INTO public.costo VALUES (4842, 6000000.00, 4951, 179);
INSERT INTO public.costo VALUES (2998, 36600000.00, 3093, 179);
INSERT INTO public.costo VALUES (3429, 0.00, 3524, 117);
INSERT INTO public.costo VALUES (3569, 12000000.00, 3664, 117);
INSERT INTO public.costo VALUES (4090, 0.00, 4190, 179);
INSERT INTO public.costo VALUES (2988, 180000000.00, 3083, 201);
INSERT INTO public.costo VALUES (4579, 0.00, 4679, 179);
INSERT INTO public.costo VALUES (3963, 5250000.00, 4063, 163);
INSERT INTO public.costo VALUES (3477, 6354600.00, 3572, 179);
INSERT INTO public.costo VALUES (420, 9329700.00, 482, 2);
INSERT INTO public.costo VALUES (3998, 30000000.00, 4098, 5);
INSERT INTO public.costo VALUES (2984, 75939150.00, 3079, 117);
INSERT INTO public.costo VALUES (2951, 225000000.00, 3043, 181);
INSERT INTO public.costo VALUES (3094, 1125000.00, 3189, 197);
INSERT INTO public.costo VALUES (2922, 159750000.00, 3014, 182);
INSERT INTO public.costo VALUES (2917, 277500000.00, 3009, 182);
INSERT INTO public.costo VALUES (2918, 102000000.00, 3010, 182);
INSERT INTO public.costo VALUES (3609, 24750000.00, 3704, 179);
INSERT INTO public.costo VALUES (3523, 27000000.00, 3618, 201);
INSERT INTO public.costo VALUES (3820, 16500000.00, 3915, 230);
INSERT INTO public.costo VALUES (4380, 12000000.00, 4480, 179);
INSERT INTO public.costo VALUES (4060, 3000000.00, 4160, 179);
INSERT INTO public.costo VALUES (3724, 267750000.00, 3819, 179);
INSERT INTO public.costo VALUES (3082, 5250000.00, 3177, 188);
INSERT INTO public.costo VALUES (4531, 52485000.00, 4631, 179);
INSERT INTO public.costo VALUES (4536, 90000000.00, 4636, 179);
INSERT INTO public.costo VALUES (2889, 131576850.00, 2981, 28);
INSERT INTO public.costo VALUES (3104, 15000000.00, 3199, 149);
INSERT INTO public.costo VALUES (4069, 114840000.00, 4169, 179);
INSERT INTO public.costo VALUES (4593, 1391250000.00, 4693, 179);
INSERT INTO public.costo VALUES (3735, 4500000.00, 3830, 179);
INSERT INTO public.costo VALUES (4774, 1650000.00, 4883, 179);
INSERT INTO public.costo VALUES (4797, 519750000.00, 4906, 179);
INSERT INTO public.costo VALUES (4580, 180000000.00, 4680, 179);
INSERT INTO public.costo VALUES (3723, 305856393514.20, 3818, 181);
INSERT INTO public.costo VALUES (3730, 8487279153.60, 3825, 181);
INSERT INTO public.costo VALUES (3323, 9719700.00, 3418, 179);
INSERT INTO public.costo VALUES (4843, 180000000.00, 4952, NULL);
INSERT INTO public.costo VALUES (3229, 21000000.00, 3324, 179);
INSERT INTO public.costo VALUES (3047, 0.00, 3142, 179);
INSERT INTO public.costo VALUES (3964, 3000000.00, 4064, 163);
INSERT INTO public.costo VALUES (4870, 9750000000.00, 4980, 181);
INSERT INTO public.costo VALUES (3425, 35000000.00, 3520, 201);
INSERT INTO public.costo VALUES (4918, 630000000.00, 5028, 179);
INSERT INTO public.costo VALUES (4942, 300000000.00, 5052, 179);
INSERT INTO public.costo VALUES (3284, 0.00, 3379, 181);
INSERT INTO public.costo VALUES (4685, 25500000.00, 4791, 179);
INSERT INTO public.costo VALUES (4708, 8800920000.00, 4815, 179);
INSERT INTO public.costo VALUES (3950, 9000000.00, 4050, 117);
INSERT INTO public.costo VALUES (3958, 4500000.00, 4058, 117);
INSERT INTO public.costo VALUES (3520, 3675000.00, 3615, 220);
INSERT INTO public.costo VALUES (3754, 29700000.00, 3849, 179);
INSERT INTO public.costo VALUES (3202, 75397500.00, 3297, 210);
INSERT INTO public.costo VALUES (3972, 7500000.00, 4072, 5);
INSERT INTO public.costo VALUES (4453, 11700000.00, 4553, 179);
INSERT INTO public.costo VALUES (3504, 10575000.00, 3599, 179);
INSERT INTO public.costo VALUES (3502, 23965200.00, 3597, 179);
INSERT INTO public.costo VALUES (4613, 134700000.00, 4713, 192);
INSERT INTO public.costo VALUES (3512, 184677000.00, 3607, 149);
INSERT INTO public.costo VALUES (3553, 81351000.00, 3648, 179);
INSERT INTO public.costo VALUES (3344, 268650000.00, 3439, 179);
INSERT INTO public.costo VALUES (3336, 108000000.00, 3431, 179);
INSERT INTO public.costo VALUES (3338, 97500000.00, 3433, 179);
INSERT INTO public.costo VALUES (3347, 67500000.00, 3442, 179);
INSERT INTO public.costo VALUES (3312, 101563350.00, 3407, 179);
INSERT INTO public.costo VALUES (3333, 139500000.00, 3428, 179);
INSERT INTO public.costo VALUES (3337, 139500000.00, 3432, 179);
INSERT INTO public.costo VALUES (3348, 139500000.00, 3443, 179);
INSERT INTO public.costo VALUES (3335, 139500000.00, 3430, 179);
INSERT INTO public.costo VALUES (2869, 374985000.00, 2952, 179);
INSERT INTO public.costo VALUES (3984, 9936000.00, 4084, 163);
INSERT INTO public.costo VALUES (4335, 1350000000.00, 4435, 179);
INSERT INTO public.costo VALUES (3351, 309129000.00, 3446, 179);
INSERT INTO public.costo VALUES (1776, 6000000.00, 1851, 36);
INSERT INTO public.costo VALUES (2934, 9727500.00, 3026, 179);
INSERT INTO public.costo VALUES (4426, 27600000.00, 4526, 179);
INSERT INTO public.costo VALUES (3168, 64332000.00, 3263, 179);
INSERT INTO public.costo VALUES (3128, 70765200.00, 3223, 136);
INSERT INTO public.costo VALUES (2614, 8250000.00, 2695, 88);
INSERT INTO public.costo VALUES (4011, 5250000.00, 4111, 162);
INSERT INTO public.costo VALUES (4871, 4500000000.00, 4981, 179);
INSERT INTO public.costo VALUES (3914, 3184941810.41, 4009, 233);
INSERT INTO public.costo VALUES (3915, 236116038.16, 4010, 233);
INSERT INTO public.costo VALUES (3597, 75000000.00, 3692, 179);
INSERT INTO public.costo VALUES (2946, 7500000.00, 3038, 179);
INSERT INTO public.costo VALUES (4437, 164455800.00, 4537, 179);
INSERT INTO public.costo VALUES (4686, 869700.00, 4792, 179);
INSERT INTO public.costo VALUES (4709, 365400000.00, 4816, 179);
INSERT INTO public.costo VALUES (4732, 37500000.00, 4839, 179);
INSERT INTO public.costo VALUES (3111, 6750000.00, 3206, 179);
INSERT INTO public.costo VALUES (2415, 18000000.00, 2491, 36);
INSERT INTO public.costo VALUES (4023, 15000000.00, 4123, 5);
INSERT INTO public.costo VALUES (3602, 675000.00, 3697, 179);
INSERT INTO public.costo VALUES (3069, 36000000.00, 3164, 179);
INSERT INTO public.costo VALUES (3118, 7500000.00, 3213, 5);
INSERT INTO public.costo VALUES (2886, 0.00, 2976, 135);
INSERT INTO public.costo VALUES (4729, 378000000.00, 4836, 179);
INSERT INTO public.costo VALUES (177, 15000000.00, 177, 150);
INSERT INTO public.costo VALUES (3955, 7500000.00, 4055, 5);
INSERT INTO public.costo VALUES (4775, 108900000.00, 4884, 179);
INSERT INTO public.costo VALUES (4844, 180000000.00, 4953, NULL);
INSERT INTO public.costo VALUES (3016, 1500000.00, 3111, 246);
INSERT INTO public.costo VALUES (3647, 26103552816.00, 3742, 181);
INSERT INTO public.costo VALUES (4821, 1291502889052.65, 4931, 233);
INSERT INTO public.costo VALUES (4502, 0.00, 4602, 179);
INSERT INTO public.costo VALUES (4634, 19050000.00, 4734, 179);
INSERT INTO public.costo VALUES (2580, 8437950.00, 2659, 179);
INSERT INTO public.costo VALUES (4554, 32250000.00, 4654, 179);
INSERT INTO public.costo VALUES (4552, 53850000.00, 4652, 179);
INSERT INTO public.costo VALUES (1138, 18000000.00, 1212, 36);
INSERT INTO public.costo VALUES (4629, 127500000.00, 4729, 179);
INSERT INTO public.costo VALUES (2867, 374985000.00, 2950, 179);
INSERT INTO public.costo VALUES (3980, 6375000.00, 4080, 163);
INSERT INTO public.costo VALUES (4465, 6780000.00, 4565, 28);
INSERT INTO public.costo VALUES (4040, 8250000.00, 4140, 28);
INSERT INTO public.costo VALUES (2882, 9000000.00, 2972, 179);
INSERT INTO public.costo VALUES (2522, 3300000.00, 2598, 163);
INSERT INTO public.costo VALUES (3993, 9329700.00, 4093, 163);
INSERT INTO public.costo VALUES (2977, 3780000.00, 3072, 179);
INSERT INTO public.costo VALUES (3023, 600000.00, 3118, 179);
INSERT INTO public.costo VALUES (2978, 19350000.00, 3073, 179);
INSERT INTO public.costo VALUES (4308, 3150000.00, 4408, 179);
INSERT INTO public.costo VALUES (3045, 5580000.00, 3140, 179);
INSERT INTO public.costo VALUES (4673, 11700000.00, 4773, 227);
INSERT INTO public.costo VALUES (4210, 9924900.00, 4310, 179);
INSERT INTO public.costo VALUES (3272, 684840000.00, 3367, 179);
INSERT INTO public.costo VALUES (3270, 379500000.00, 3365, 179);
INSERT INTO public.costo VALUES (3327, 633750000.00, 3422, 179);
INSERT INTO public.costo VALUES (3966, 4500000.00, 4066, 163);
INSERT INTO public.costo VALUES (3201, 248508000.00, 3296, 210);
INSERT INTO public.costo VALUES (4920, 2970000000.00, 5030, 179);
INSERT INTO public.costo VALUES (4944, 2025000000.00, 5054, 179);
INSERT INTO public.costo VALUES (3889, 13659000.00, 3984, 179);
INSERT INTO public.costo VALUES (3591, 45000000.00, 3686, 179);
INSERT INTO public.costo VALUES (3776, 1900000.00, 3871, 179);
INSERT INTO public.costo VALUES (3952, 3000000.00, 4052, 234);
INSERT INTO public.costo VALUES (3087, 4183500.00, 3182, 193);
INSERT INTO public.costo VALUES (3831, 30000000.00, 3926, 179);
INSERT INTO public.costo VALUES (4211, 4350000.00, 4311, 179);
INSERT INTO public.costo VALUES (4872, 10500000.00, 4982, 179);
INSERT INTO public.costo VALUES (3014, 21000000.00, 3109, 179);
INSERT INTO public.costo VALUES (3648, 2700000000.00, 3743, 181);
INSERT INTO public.costo VALUES (3605, 35000000.00, 3700, 179);
INSERT INTO public.costo VALUES (4896, 13000000.00, 5006, 179);
INSERT INTO public.costo VALUES (3843, 345000000.00, 3937, 179);
INSERT INTO public.costo VALUES (4120, 240000000.00, 4220, 179);
INSERT INTO public.costo VALUES (4511, 353100000.00, 4611, 179);
INSERT INTO public.costo VALUES (3039, 4500000.00, 3134, 135);
INSERT INTO public.costo VALUES (4033, 13200000.00, 4133, 28);
INSERT INTO public.costo VALUES (4454, 9375000.00, 4554, 179);
INSERT INTO public.costo VALUES (4684, 6225000.00, 4790, 179);
INSERT INTO public.costo VALUES (4707, 112143000.00, 4814, 179);
INSERT INTO public.costo VALUES (3840, 0.00, 3935, 179);
INSERT INTO public.costo VALUES (4730, 486000000.00, 4837, 225);
INSERT INTO public.costo VALUES (4753, 29535000.00, 4862, 179);
INSERT INTO public.costo VALUES (4776, 242550000.00, 4885, 179);
INSERT INTO public.costo VALUES (4799, 9000000.00, 4908, 201);
INSERT INTO public.costo VALUES (4845, 180000000.00, 4954, 247);
INSERT INTO public.costo VALUES (4519, 0.00, 4619, 148);
INSERT INTO public.costo VALUES (3088, 6750000.00, 3183, 193);
INSERT INTO public.costo VALUES (3778, 10071000.00, 3873, 179);
INSERT INTO public.costo VALUES (4036, 3750000.00, 4136, 28);
INSERT INTO public.costo VALUES (3989, 27528000.00, 4089, 5);
INSERT INTO public.costo VALUES (3997, 5382000.00, 4097, 163);
INSERT INTO public.costo VALUES (2933, 10488000.00, 3025, 179);
INSERT INTO public.costo VALUES (4621, 4872000.00, 4721, 192);
INSERT INTO public.costo VALUES (580, 8400000.00, 648, 61);
INSERT INTO public.costo VALUES (4309, 546822000.00, 4409, 179);
INSERT INTO public.costo VALUES (4488, 82500000.00, 4588, 146);
INSERT INTO public.costo VALUES (3083, 5250000.00, 3178, 188);
INSERT INTO public.costo VALUES (3199, 105000000.00, 3294, 210);
INSERT INTO public.costo VALUES (4148, 117000000.00, 4248, 179);
INSERT INTO public.costo VALUES (4670, 107998500.00, 4770, 136);
INSERT INTO public.costo VALUES (4731, 42000000.00, 4838, 179);
INSERT INTO public.costo VALUES (4897, 200000000.00, 5007, 179);
INSERT INTO public.costo VALUES (4945, 1140000000.00, 5055, 179);
INSERT INTO public.costo VALUES (3481, 1200000.00, 3576, 179);
INSERT INTO public.costo VALUES (3483, 3750000.00, 3578, 179);
INSERT INTO public.costo VALUES (2884, 5000000.00, 2974, 179);
INSERT INTO public.costo VALUES (2610, 11000000.00, 2691, 28);
INSERT INTO public.costo VALUES (3460, 13500000.00, 3555, 179);
INSERT INTO public.costo VALUES (4533, 134550000.00, 4633, 179);
INSERT INTO public.costo VALUES (4754, 29535000.00, 4863, 179);
INSERT INTO public.costo VALUES (2876, 12000000.00, 2959, 179);
INSERT INTO public.costo VALUES (3959, 3750000.00, 4059, 163);
INSERT INTO public.costo VALUES (4347, 117840000.00, 4447, 179);
INSERT INTO public.costo VALUES (4614, 52500000.00, 4714, 192);
INSERT INTO public.costo VALUES (3975, 15000000.00, 4075, 163);
INSERT INTO public.costo VALUES (4628, 147000000.00, 4728, 179);
INSERT INTO public.costo VALUES (4569, 8700000.00, 4669, 179);
INSERT INTO public.costo VALUES (3543, 27750000.00, 3638, 179);
INSERT INTO public.costo VALUES (3983, 6750000.00, 4083, 163);
INSERT INTO public.costo VALUES (3986, 7122000.00, 4086, 5);
INSERT INTO public.costo VALUES (2999, 10800000.00, 3094, 179);
INSERT INTO public.costo VALUES (4042, 72000000.00, 4142, 28);
INSERT INTO public.costo VALUES (3035, 57000000.00, 3130, 28);
INSERT INTO public.costo VALUES (2953, 32166000.00, 3045, 181);
INSERT INTO public.costo VALUES (3046, 1426410000.00, 3141, 179);
INSERT INTO public.costo VALUES (4014, 4050000.00, 4114, 5);
INSERT INTO public.costo VALUES (2897, 9750000.00, 2989, 179);
INSERT INTO public.costo VALUES (4800, 6076377000.00, 4909, 233);
INSERT INTO public.costo VALUES (3729, 1500000.00, 3824, 246);
INSERT INTO public.costo VALUES (4846, 180000000.00, 4955, 247);
INSERT INTO public.costo VALUES (3651, 5702235000.00, 3746, 181);
INSERT INTO public.costo VALUES (3764, 25507632000.00, 3859, 181);
INSERT INTO public.costo VALUES (4823, 2287860848662.20, 4930, 233);
INSERT INTO public.costo VALUES (3288, 1221411000.00, 3383, 179);
INSERT INTO public.costo VALUES (3324, 543075000.00, 3419, 179);
INSERT INTO public.costo VALUES (3433, 52500000.00, 3528, 179);
INSERT INTO public.costo VALUES (3894, 257400000.00, 3989, 179);
INSERT INTO public.costo VALUES (4456, 8055000.00, 4556, 179);
INSERT INTO public.costo VALUES (4567, 14700000.00, 4667, 179);
INSERT INTO public.costo VALUES (2586, 32382750.00, 2665, 28);
INSERT INTO public.costo VALUES (3849, 150000000.00, 3943, 179);
INSERT INTO public.costo VALUES (3795, 7500000.00, 3890, 179);
INSERT INTO public.costo VALUES (3463, 16483200.00, 3558, 179);
INSERT INTO public.costo VALUES (3040, 15000000.00, 3135, 135);
INSERT INTO public.costo VALUES (3931, 43485000.00, 4031, 227);
INSERT INTO public.costo VALUES (4626, 139500000.00, 4726, 179);
INSERT INTO public.costo VALUES (3978, 4875000.00, 4078, 5);
INSERT INTO public.costo VALUES (3410, 48900000.00, 3505, 148);
INSERT INTO public.costo VALUES (4001, 21300000.00, 4101, 239);
INSERT INTO public.costo VALUES (3465, 5250000.00, 3560, 179);
INSERT INTO public.costo VALUES (4624, 3000000.00, 4724, 179);
INSERT INTO public.costo VALUES (3182, 160830.00, 3277, 179);
INSERT INTO public.costo VALUES (3007, 349707000.00, 3102, 179);
INSERT INTO public.costo VALUES (3430, 8250000.00, 3525, 117);
INSERT INTO public.costo VALUES (2997, 22500000.00, 3092, 179);
INSERT INTO public.costo VALUES (4019, 27000000.00, 4119, 5);
INSERT INTO public.costo VALUES (4390, 3000000.00, 4490, 179);
INSERT INTO public.costo VALUES (4489, 4755000.00, 4589, 179);
INSERT INTO public.costo VALUES (3124, 79695000.00, 3219, 181);
INSERT INTO public.costo VALUES (4874, 3500000.00, 4984, 179);
INSERT INTO public.costo VALUES (3610, 19000000.00, 3705, 179);
INSERT INTO public.costo VALUES (4898, 15000000.00, 5008, 179);
INSERT INTO public.costo VALUES (4946, 3497282410.66, 5056, 181);
INSERT INTO public.costo VALUES (3726, 6500000.00, 3821, 179);
INSERT INTO public.costo VALUES (3454, 40000000.00, 3549, 179);
INSERT INTO public.costo VALUES (3487, 23000000.00, 3582, 179);
INSERT INTO public.costo VALUES (4389, 9900000.00, 4489, 179);
INSERT INTO public.costo VALUES (3498, 10440000.00, 3593, 179);
INSERT INTO public.costo VALUES (4161, 59478150.00, 4261, 179);
INSERT INTO public.costo VALUES (3461, 64500000.00, 3556, 179);
INSERT INTO public.costo VALUES (3485, 5550000.00, 3580, 179);
INSERT INTO public.costo VALUES (3343, 268650000.00, 3438, 179);
INSERT INTO public.costo VALUES (3320, 309993000.00, 3415, 179);
INSERT INTO public.costo VALUES (3066, 1626018300.00, 3161, 179);
INSERT INTO public.costo VALUES (3180, 66898500.00, 3275, 179);
INSERT INTO public.costo VALUES (4095, 204000000.00, 4195, 179);
INSERT INTO public.costo VALUES (2878, 37500000.00, 2964, 641);
INSERT INTO public.costo VALUES (3075, 16500000.00, 3170, 179);
INSERT INTO public.costo VALUES (4573, 308700000.00, 4673, 179);
INSERT INTO public.costo VALUES (4101, 50406600.00, 4201, 179);
INSERT INTO public.costo VALUES (3152, 10065000.00, 3247, 179);
INSERT INTO public.costo VALUES (4847, 180000000.00, 4956, 247);
INSERT INTO public.costo VALUES (4824, 3750000.00, 4933, 179);
INSERT INTO public.costo VALUES (4801, 182291310.00, 4910, 181);
INSERT INTO public.costo VALUES (3131, 15036192000.00, 3226, 181);
INSERT INTO public.costo VALUES (3801, 0.00, 3896, 179);
INSERT INTO public.costo VALUES (4455, 6000000.00, 4555, 179);
INSERT INTO public.costo VALUES (2923, 16500000.00, 3015, 179);
INSERT INTO public.costo VALUES (3253, 297000000.00, 3348, 179);
INSERT INTO public.costo VALUES (3254, 297000000.00, 3349, 179);
INSERT INTO public.costo VALUES (3255, 297000000.00, 3350, 179);
INSERT INTO public.costo VALUES (3222, 80112000.00, 3317, 226);
INSERT INTO public.costo VALUES (3438, 18435000.00, 3533, 179);
INSERT INTO public.costo VALUES (4457, 28876200.00, 4557, 179);
INSERT INTO public.costo VALUES (3215, 97500000.00, 3310, 179);
INSERT INTO public.costo VALUES (3988, 8197500.00, 4088, 163);
INSERT INTO public.costo VALUES (3992, 4212600.00, 4092, 234);
INSERT INTO public.costo VALUES (3281, 240150000.00, 3376, 179);
INSERT INTO public.costo VALUES (4000, 21300000.00, 4100, 163);
INSERT INTO public.costo VALUES (2961, 65235000.00, 3053, 181);
INSERT INTO public.costo VALUES (3091, 42900000.00, 3186, 193);
INSERT INTO public.costo VALUES (3095, 1125000.00, 3190, 198);
INSERT INTO public.costo VALUES (3096, 1125000.00, 3191, 199);
INSERT INTO public.costo VALUES (3098, 1125000.00, 3193, 200);
INSERT INTO public.costo VALUES (3122, 12750000.00, 3217, 205);
INSERT INTO public.costo VALUES (3300, 1754355000.00, 3395, 179);
INSERT INTO public.costo VALUES (4570, 12000000.00, 4670, 179);
INSERT INTO public.costo VALUES (3117, 13500000.00, 3212, 193);
INSERT INTO public.costo VALUES (3140, 592500000.00, 3235, 179);
INSERT INTO public.costo VALUES (3081, 3300000.00, 3176, 188);
INSERT INTO public.costo VALUES (3102, 10200000.00, 3197, 202);
INSERT INTO public.costo VALUES (3342, 161190000.00, 3437, 179);
INSERT INTO public.costo VALUES (3339, 341865000.00, 3434, 179);
INSERT INTO public.costo VALUES (4875, 37500000.00, 4985, 136);
INSERT INTO public.costo VALUES (4899, 10000000.00, 5009, 135);
INSERT INTO public.costo VALUES (4923, 45000000.00, 5033, 179);
INSERT INTO public.costo VALUES (4947, 9000000000.00, 5057, 181);
INSERT INTO public.costo VALUES (3455, 55000000.00, 3550, 179);
INSERT INTO public.costo VALUES (3867, 1000000000.00, 3962, 232);
INSERT INTO public.costo VALUES (4434, 9750000.00, 4534, 179);
INSERT INTO public.costo VALUES (3127, 138600000.00, 3222, 179);
INSERT INTO public.costo VALUES (3000, 10800000.00, 3095, 179);
INSERT INTO public.costo VALUES (4535, 38850000.00, 4635, 179);
INSERT INTO public.costo VALUES (4777, 32500000.00, 4886, 117);
INSERT INTO public.costo VALUES (4494, 32000.00, 4594, 179);
INSERT INTO public.costo VALUES (3113, 45000000.00, 3208, 201);
INSERT INTO public.costo VALUES (3010, 45000000.00, 3105, 183);
INSERT INTO public.costo VALUES (3541, 57793050.00, 3636, 193);
INSERT INTO public.costo VALUES (3538, 57808500.00, 3633, 193);
INSERT INTO public.costo VALUES (3194, 67500000.00, 3289, 148);
INSERT INTO public.costo VALUES (3192, 73350000.00, 3287, 148);
INSERT INTO public.costo VALUES (3106, 6300000.00, 3201, 149);
INSERT INTO public.costo VALUES (4530, 6000000.00, 4630, 179);
INSERT INTO public.costo VALUES (3745, 4500000.00, 3840, 28);
INSERT INTO public.costo VALUES (4268, 5250000.00, 4368, 228);
INSERT INTO public.costo VALUES (4687, 957000.00, 4793, 179);
INSERT INTO public.costo VALUES (4710, 51025500.00, 4817, 179);
INSERT INTO public.costo VALUES (4733, 30000000.00, 4840, 179);
INSERT INTO public.costo VALUES (4756, 27555000.00, 4865, 179);
INSERT INTO public.costo VALUES (4802, 3300000.00, 4911, 219);
INSERT INTO public.costo VALUES (3731, 3220705458.90, 3826, 181);
INSERT INTO public.costo VALUES (4848, 5887500.00, 4957, 135);
INSERT INTO public.costo VALUES (3789, 5073900.00, 3884, 179);
INSERT INTO public.costo VALUES (4171, 37500000.00, 4271, 179);
INSERT INTO public.costo VALUES (4056, 0.00, 4156, 179);
INSERT INTO public.costo VALUES (3196, 37500000.00, 3291, 179);
INSERT INTO public.costo VALUES (3207, 212152500.00, 3302, 179);
INSERT INTO public.costo VALUES (3191, 53850000.00, 3286, 192);
INSERT INTO public.costo VALUES (3464, 40365000.00, 3559, 179);
INSERT INTO public.costo VALUES (3489, 6300000.00, 3584, 179);
INSERT INTO public.costo VALUES (4627, 97500000.00, 4727, 179);
INSERT INTO public.costo VALUES (3218, 57000000.00, 3313, 179);
INSERT INTO public.costo VALUES (3086, 21300000.00, 3181, 162);
INSERT INTO public.costo VALUES (3093, 16083000.00, 3188, 193);
INSERT INTO public.costo VALUES (3181, 22500000.00, 3276, 179);
INSERT INTO public.costo VALUES (3183, 37500000.00, 3278, 179);
INSERT INTO public.costo VALUES (3184, 8400000.00, 3279, 179);
INSERT INTO public.costo VALUES (2996, 10509600.00, 3091, 179);
INSERT INTO public.costo VALUES (3115, 15000000.00, 3210, 5);
INSERT INTO public.costo VALUES (4306, 9750000.00, 4406, 179);
INSERT INTO public.costo VALUES (261, 119700000.00, 261, 117);
INSERT INTO public.costo VALUES (3116, 3900000.00, 3211, 193);
INSERT INTO public.costo VALUES (3456, 28350000.00, 3551, 179);
INSERT INTO public.costo VALUES (3459, 5453850.00, 3554, 179);
INSERT INTO public.costo VALUES (3119, 7500000.00, 3214, 203);
INSERT INTO public.costo VALUES (3085, 4140000.00, 3180, 196);
INSERT INTO public.costo VALUES (4688, 187606800.00, 4795, 179);
INSERT INTO public.costo VALUES (4711, 1305000000.00, 4818, 179);
INSERT INTO public.costo VALUES (4876, 9000000.00, 4986, 179);
INSERT INTO public.costo VALUES (4900, 11000000.00, 5010, 179);
INSERT INTO public.costo VALUES (4924, 1200000000.00, 5034, 179);
INSERT INTO public.costo VALUES (3467, 225000000.00, 3562, 149);
INSERT INTO public.costo VALUES (3379, 114000000.00, 3474, 181);
INSERT INTO public.costo VALUES (3903, 175010.91, 3998, 233);
INSERT INTO public.costo VALUES (4948, 11000000.00, 5058, 179);
INSERT INTO public.costo VALUES (4229, 6250000.00, 4329, 179);
INSERT INTO public.costo VALUES (3493, 6000000.00, 3588, 149);
INSERT INTO public.costo VALUES (3108, 3825000.00, 3203, 149);
INSERT INTO public.costo VALUES (3187, 20250000.00, 3282, 179);
INSERT INTO public.costo VALUES (4144, 270000000.00, 4244, 179);
INSERT INTO public.costo VALUES (4734, 18000000.00, 4841, 179);
INSERT INTO public.costo VALUES (4757, 27555000.00, 4866, 179);
INSERT INTO public.costo VALUES (3195, 0.00, 3290, 179);
INSERT INTO public.costo VALUES (3961, 4500000.00, 4061, 162);
INSERT INTO public.costo VALUES (4803, 3616971855.00, 4912, 181);
INSERT INTO public.costo VALUES (4826, 55760250.00, 4935, 179);
INSERT INTO public.costo VALUES (4849, 675000.00, 4958, 183);
INSERT INTO public.costo VALUES (3249, 0.00, 3344, 181);
INSERT INTO public.costo VALUES (3969, 11760000.00, 4069, 237);
INSERT INTO public.costo VALUES (4382, 0.00, 4482, 217);
INSERT INTO public.costo VALUES (3340, 161190000.00, 3435, 179);
INSERT INTO public.costo VALUES (3318, 127500000.00, 3413, 179);
INSERT INTO public.costo VALUES (4712, 56559000.00, 4819, 179);
INSERT INTO public.costo VALUES (4689, 76734000.00, 4796, 179);
INSERT INTO public.costo VALUES (4735, 12000000.00, 4842, 179);
INSERT INTO public.costo VALUES (4804, 486000.00, 4913, 181);
INSERT INTO public.costo VALUES (3305, 26400000.00, 3400, 179);
INSERT INTO public.costo VALUES (3313, 138148500.00, 3408, 179);
INSERT INTO public.costo VALUES (3314, 67500000.00, 3409, 179);
INSERT INTO public.costo VALUES (3306, 26700000.00, 3401, 179);
INSERT INTO public.costo VALUES (3307, 26400000.00, 3402, 179);
INSERT INTO public.costo VALUES (3316, 0.00, 3411, 179);
INSERT INTO public.costo VALUES (3308, 26400000.00, 3403, 179);
INSERT INTO public.costo VALUES (3971, 22500000.00, 4071, 5);
INSERT INTO public.costo VALUES (3310, 104139000.00, 3405, 179);
INSERT INTO public.costo VALUES (4827, 18000000.00, 4936, 179);
INSERT INTO public.costo VALUES (3311, 56801100.00, 3406, 179);
INSERT INTO public.costo VALUES (3089, 3750000.00, 3184, 193);
INSERT INTO public.costo VALUES (3090, 3750000.00, 3185, 193);
INSERT INTO public.costo VALUES (3114, 180000000.00, 3209, 201);
INSERT INTO public.costo VALUES (3112, 180000000.00, 3207, 201);
INSERT INTO public.costo VALUES (3974, 15000000.00, 4074, 236);
INSERT INTO public.costo VALUES (4877, 11000000.00, 4987, 179);
INSERT INTO public.costo VALUES (4901, 10000000.00, 5011, 117);
INSERT INTO public.costo VALUES (4925, 45000000.00, 5035, 179);
INSERT INTO public.costo VALUES (3473, 1500750.00, 3568, 179);
INSERT INTO public.costo VALUES (4851, 300000000.00, 4960, 179);
INSERT INTO public.costo VALUES (3904, 155443534.71, 3999, 233);
INSERT INTO public.costo VALUES (2973, 10000000.00, 3068, 181);
INSERT INTO public.costo VALUES (2976, 50000000.00, 3071, 181);
INSERT INTO public.costo VALUES (4949, 25000000.00, 5061, 181);
INSERT INTO public.costo VALUES (3957, 9000000.00, 4057, 236);
INSERT INTO public.costo VALUES (3057, 374512500.00, 3152, 179);
INSERT INTO public.costo VALUES (3058, 293798100.00, 3153, 179);
INSERT INTO public.costo VALUES (3061, 551233650.00, 3156, 179);
INSERT INTO public.costo VALUES (3056, 341019300.00, 3151, 179);
INSERT INTO public.costo VALUES (3060, 374512500.00, 3155, 179);
INSERT INTO public.costo VALUES (2956, 600750000.00, 3048, 179);
INSERT INTO public.costo VALUES (3064, 600000000.00, 3159, 179);
INSERT INTO public.costo VALUES (3065, 600000000.00, 3160, 179);
INSERT INTO public.costo VALUES (3466, 3000000.00, 3561, 179);
INSERT INTO public.costo VALUES (3319, 1035450000.00, 3414, 179);
INSERT INTO public.costo VALUES (3315, 427500000.00, 3410, 179);
INSERT INTO public.costo VALUES (3292, 2400000000.00, 3387, 179);
INSERT INTO public.costo VALUES (3501, 7875000.00, 3596, 179);
INSERT INTO public.costo VALUES (3302, 186959400.00, 3397, 179);
INSERT INTO public.costo VALUES (3304, 319036650.00, 3399, 179);
INSERT INTO public.costo VALUES (3303, 429560400.00, 3398, 179);
INSERT INTO public.costo VALUES (3120, 0.00, 3215, 179);
INSERT INTO public.costo VALUES (3962, 5250000.00, 4062, 163);
INSERT INTO public.costo VALUES (3503, 13918200.00, 3598, 179);
INSERT INTO public.costo VALUES (3506, 8700000.00, 3601, 179);
INSERT INTO public.costo VALUES (3507, 9300000.00, 3602, 179);
INSERT INTO public.costo VALUES (3508, 27600000.00, 3603, 179);
INSERT INTO public.costo VALUES (3505, 7350000.00, 3600, 179);
INSERT INTO public.costo VALUES (3033, 3375000.00, 3128, 179);
INSERT INTO public.costo VALUES (3462, 84000000.00, 3557, 179);
INSERT INTO public.costo VALUES (3488, 6300000.00, 3583, 179);
INSERT INTO public.costo VALUES (3334, 97500000.00, 3429, 179);
INSERT INTO public.costo VALUES (3479, 6354600.00, 3574, 179);
INSERT INTO public.costo VALUES (3478, 6354600.00, 3573, 179);
INSERT INTO public.costo VALUES (3530, 49912500.00, 3625, 179);
INSERT INTO public.costo VALUES (2962, 65235000.00, 3054, 181);
INSERT INTO public.costo VALUES (924, 20250000.00, 997, 30);
INSERT INTO public.costo VALUES (3559, 30750000.00, 3654, 179);
INSERT INTO public.costo VALUES (3805, 6000000.00, 3900, 39);
INSERT INTO public.costo VALUES (3806, 5250000.00, 3901, 135);
INSERT INTO public.costo VALUES (3942, 33000000.00, 4042, 179);
INSERT INTO public.costo VALUES (259, 95400000.00, 259, 117);
INSERT INTO public.costo VALUES (3521, 6750000.00, 3616, 220);
INSERT INTO public.costo VALUES (914, 3000000.00, 987, 12);
INSERT INTO public.costo VALUES (4538, 14850000.00, 4638, 179);
INSERT INTO public.costo VALUES (791, 2850000.00, 864, 12);
INSERT INTO public.costo VALUES (3404, 30000000.00, 3499, 179);
INSERT INTO public.costo VALUES (3555, 331370250.00, 3650, 149);
INSERT INTO public.costo VALUES (3453, 34350000.00, 3548, 220);
INSERT INTO public.costo VALUES (3522, 74999250.00, 3617, 150);
INSERT INTO public.costo VALUES (3825, 9123000.00, 3920, 179);
INSERT INTO public.costo VALUES (3560, 7500000.00, 3655, 179);
INSERT INTO public.costo VALUES (4690, 93960000.00, 4797, 179);
INSERT INTO public.costo VALUES (4713, 117450000.00, 4820, 179);
INSERT INTO public.costo VALUES (4736, 4500000.00, 4843, 179);
INSERT INTO public.costo VALUES (3500, 13500000.00, 3595, 179);
INSERT INTO public.costo VALUES (4782, 4200000.00, 4891, 179);
INSERT INTO public.costo VALUES (260, 75000000.00, 260, 117);
INSERT INTO public.costo VALUES (3125, 579602250.00, 3220, 179);
INSERT INTO public.costo VALUES (3105, 12000000.00, 3200, 146);
INSERT INTO public.costo VALUES (4825, 110379855.00, 4934, 179);
INSERT INTO public.costo VALUES (3109, 8900000.00, 3204, 146);
INSERT INTO public.costo VALUES (3398, 300000000.00, 3493, 181);
INSERT INTO public.costo VALUES (4102, 50406600.00, 4202, 179);
INSERT INTO public.costo VALUES (3499, 1800000.00, 3594, 179);
INSERT INTO public.costo VALUES (4828, 21000000.00, 4937, 179);
INSERT INTO public.costo VALUES (4805, 3711967560.00, 4914, 233);
INSERT INTO public.costo VALUES (3557, 3300000.00, 3652, 149);
INSERT INTO public.costo VALUES (3973, 9000000.00, 4073, 236);
INSERT INTO public.costo VALUES (3839, 12000000.00, 3934, 179);
INSERT INTO public.costo VALUES (4878, 19790000.00, 4988, 179);
INSERT INTO public.costo VALUES (4902, 12500000.00, 5012, 179);
INSERT INTO public.costo VALUES (4926, 18000000.00, 5036, 179);
INSERT INTO public.costo VALUES (3378, 114000000.00, 3473, 181);
INSERT INTO public.costo VALUES (3129, 5000000.00, 3224, 181);
INSERT INTO public.costo VALUES (3382, 100000000.00, 3477, 181);
INSERT INTO public.costo VALUES (3533, 7500000.00, 3628, 220);
INSERT INTO public.costo VALUES (4632, 14997000.00, 4732, 179);
INSERT INTO public.costo VALUES (3951, 3000000.00, 4051, 162);
INSERT INTO public.costo VALUES (279, 0.00, 279, 179);
INSERT INTO public.costo VALUES (3732, 0.00, 3827, 181);
INSERT INTO public.costo VALUES (4218, 419250000.00, 4318, 179);
INSERT INTO public.costo VALUES (3779, 930000.00, 3874, 179);
INSERT INTO public.costo VALUES (3981, 6525000.00, 4081, 5);
INSERT INTO public.costo VALUES (3956, 3000000.00, 4056, 163);
INSERT INTO public.costo VALUES (3525, 114750000.00, 3620, 150);
INSERT INTO public.costo VALUES (3528, 2250000.00, 3623, 220);
INSERT INTO public.costo VALUES (3990, 5670000.00, 4090, 5);
INSERT INTO public.costo VALUES (3529, 13877400.00, 3624, 179);
INSERT INTO public.costo VALUES (3994, 2010000.00, 4094, 5);
INSERT INTO public.costo VALUES (2943, 1225500000.00, 3035, 179);
INSERT INTO public.costo VALUES (4063, 90000000.00, 4163, 179);
INSERT INTO public.costo VALUES (3554, 225162000.00, 3649, 179);
INSERT INTO public.costo VALUES (4002, 14250000.00, 4102, 236);
INSERT INTO public.costo VALUES (3802, 943950.00, 3897, 179);
INSERT INTO public.costo VALUES (3748, 5148000.00, 3843, 28);
INSERT INTO public.costo VALUES (4005, 6750000.00, 4105, 162);
INSERT INTO public.costo VALUES (4006, 38599200.00, 4106, 5);
INSERT INTO public.costo VALUES (3527, 22800000.00, 3622, 149);
INSERT INTO public.costo VALUES (3750, 12750000.00, 3845, 179);
INSERT INTO public.costo VALUES (3842, 33000000.00, 3536, 179);
INSERT INTO public.costo VALUES (3807, 33000000.00, 3902, 179);
INSERT INTO public.costo VALUES (3526, 4500000.00, 3621, 150);
INSERT INTO public.costo VALUES (4427, 105000000.00, 4527, 179);
INSERT INTO public.costo VALUES (3552, 37267650.00, 3647, 179);
INSERT INTO public.costo VALUES (4387, 47999850.00, 4487, 179);
INSERT INTO public.costo VALUES (2957, 28500000.00, 3049, 179);
INSERT INTO public.costo VALUES (4442, 4965000.00, 4542, 218);
INSERT INTO public.costo VALUES (4537, 75000000.00, 4637, 179);
INSERT INTO public.costo VALUES (1126, 2850000.00, 1200, 36);
INSERT INTO public.costo VALUES (3824, 14700000.00, 3919, 146);
INSERT INTO public.costo VALUES (3898, 133200000.00, 3993, 179);
INSERT INTO public.costo VALUES (4461, 9493500.00, 4561, 179);
INSERT INTO public.costo VALUES (3727, 11279850.00, 3822, 39);
INSERT INTO public.costo VALUES (4691, 201290160.00, 4798, 179);
INSERT INTO public.costo VALUES (4714, 191400000.00, 4821, 179);
INSERT INTO public.costo VALUES (4737, 6000000.00, 4844, 150);
INSERT INTO public.costo VALUES (3375, 975000000.00, 3470, 181);
INSERT INTO public.costo VALUES (3571, 94500000.00, 3666, 179);
INSERT INTO public.costo VALUES (4806, 1500000.00, 4915, NULL);
INSERT INTO public.costo VALUES (4783, 33000000.00, 4892, 222);
INSERT INTO public.costo VALUES (3711, 46297640972.70, 3806, 181);
INSERT INTO public.costo VALUES (4829, 2700000.00, 4938, 179);
INSERT INTO public.costo VALUES (3967, 7500000.00, 4067, 162);
INSERT INTO public.costo VALUES (3624, 3200000000.00, 3719, 181);
INSERT INTO public.costo VALUES (3633, 116000000.00, 3728, 181);
INSERT INTO public.costo VALUES (4903, 8000000.00, 5013, 179);
INSERT INTO public.costo VALUES (4927, 375000000.00, 5037, NULL);
INSERT INTO public.costo VALUES (3845, 1000000000.00, 3939, 181);
INSERT INTO public.costo VALUES (4951, 10000000.00, 5063, 181);
INSERT INTO public.costo VALUES (3985, 4150200.00, 4085, 163);
INSERT INTO public.costo VALUES (3532, 8108400.00, 3627, 179);
INSERT INTO public.costo VALUES (3531, 22500000.00, 3626, 179);
INSERT INTO public.costo VALUES (4086, 15750000.00, 4186, 227);
INSERT INTO public.costo VALUES (4331, 375000000.00, 4431, 136);
INSERT INTO public.costo VALUES (4064, 114900000.00, 4164, 179);
INSERT INTO public.costo VALUES (4109, 54148950.00, 4209, 227);
INSERT INTO public.costo VALUES (3747, 3750000.00, 3842, 179);
INSERT INTO public.costo VALUES (3443, 5400000.00, 3538, 179);
INSERT INTO public.costo VALUES (3883, 891000000.00, 3978, 179);
INSERT INTO public.costo VALUES (3783, 4195950.00, 3878, 146);
INSERT INTO public.costo VALUES (3784, 99000.00, 3879, 179);
INSERT INTO public.costo VALUES (4692, 635100000.00, 4799, 179);
INSERT INTO public.costo VALUES (4715, 93960000.00, 4822, 179);
INSERT INTO public.costo VALUES (4738, 330000000.00, 4845, 201);
INSERT INTO public.costo VALUES (4129, 11700000.00, 4229, 227);
INSERT INTO public.costo VALUES (4784, 4950000.00, 4893, 222);
INSERT INTO public.costo VALUES (4807, 14437471755.00, 4916, 181);
INSERT INTO public.costo VALUES (4830, 3150000.00, 4939, 179);
INSERT INTO public.costo VALUES (4853, 24000000.00, 4963, 222);
INSERT INTO public.costo VALUES (4694, 26100000.00, 4801, 179);
INSERT INTO public.costo VALUES (3829, 132000000.00, 3924, 179);
INSERT INTO public.costo VALUES (3330, 179310000.00, 3425, 179);
INSERT INTO public.costo VALUES (3329, 127500000.00, 3424, 179);
INSERT INTO public.costo VALUES (3331, 84000000.00, 3426, 179);
INSERT INTO public.costo VALUES (3322, 229549500.00, 3417, 179);
INSERT INTO public.costo VALUES (3332, 108000000.00, 3427, 179);
INSERT INTO public.costo VALUES (3328, 179310000.00, 3423, 179);
INSERT INTO public.costo VALUES (4445, 210000000.00, 4545, 179);
INSERT INTO public.costo VALUES (1268, 9329700.00, 1342, 163);
INSERT INTO public.costo VALUES (3995, 33750000.00, 4095, 5);
INSERT INTO public.costo VALUES (4555, 3000000.00, 4655, 179);
INSERT INTO public.costo VALUES (4004, 5250000.00, 4104, 240);
INSERT INTO public.costo VALUES (1315, 11250000.00, 1389, 29);
INSERT INTO public.costo VALUES (1170, 6433200.00, 1244, 12);
INSERT INTO public.costo VALUES (1398, 22500000.00, 1473, 36);
INSERT INTO public.costo VALUES (4880, 7000000.00, 4990, 179);
INSERT INTO public.costo VALUES (4904, 3900000000.00, 5014, 179);
INSERT INTO public.costo VALUES (4928, 45000000.00, 5038, 179);
INSERT INTO public.costo VALUES (3954, 4050000.00, 4054, 235);
INSERT INTO public.costo VALUES (4482, 6277950.00, 4582, 179);
INSERT INTO public.costo VALUES (4065, 1575000.00, 4165, 28);
INSERT INTO public.costo VALUES (4388, 27000000.00, 4488, 179);
INSERT INTO public.costo VALUES (2585, 32382750.00, 2664, 28);
INSERT INTO public.costo VALUES (3326, 1281864900.00, 3421, 179);
INSERT INTO public.costo VALUES (3325, 287500500.00, 3420, 179);
INSERT INTO public.costo VALUES (4693, 1980990000.00, 4800, 179);
INSERT INTO public.costo VALUES (4716, 5564815104.00, 4823, 179);
INSERT INTO public.costo VALUES (4739, 99000000.00, 4846, 117);
INSERT INTO public.costo VALUES (4762, 3000000.00, 4871, 179);
INSERT INTO public.costo VALUES (3259, 24000000.00, 3354, 179);
INSERT INTO public.costo VALUES (4785, 495000000.00, 4894, 179);
INSERT INTO public.costo VALUES (4808, 155925000.00, 4917, 179);
INSERT INTO public.costo VALUES (3733, 46297640972.70, 3828, 181);
INSERT INTO public.costo VALUES (4831, 56801100.00, 4940, 179);
INSERT INTO public.costo VALUES (4854, 38250000.00, 4964, 179);
INSERT INTO public.costo VALUES (3415, 53850000.00, 3510, 192);
INSERT INTO public.costo VALUES (3516, 184677000.00, 3611, 149);
INSERT INTO public.costo VALUES (4131, 0.00, 4231, 227);
INSERT INTO public.costo VALUES (4717, 97384275.00, 4824, 179);
INSERT INTO public.costo VALUES (4763, 16500000.00, 4872, 179);
INSERT INTO public.costo VALUES (4636, 20700000.00, 4736, 179);
INSERT INTO public.costo VALUES (1612, 22500000.00, 1687, 163);
INSERT INTO public.costo VALUES (4576, 98850000.00, 4676, 179);
INSERT INTO public.costo VALUES (3965, 3000000.00, 4065, 163);
INSERT INTO public.costo VALUES (154, 12825000.00, 154, 179);
INSERT INTO public.costo VALUES (3413, 48900000.00, 3508, 39);
INSERT INTO public.costo VALUES (3049, 165604500.00, 3144, 179);
INSERT INTO public.costo VALUES (3051, 824850000.00, 3146, 179);
INSERT INTO public.costo VALUES (3999, 3750000.00, 4099, 163);
INSERT INTO public.costo VALUES (3019, 92542500.00, 3114, 179);
INSERT INTO public.costo VALUES (4635, 135000000.00, 4735, 179);
INSERT INTO public.costo VALUES (4485, 6277950.00, 4585, 179);
INSERT INTO public.costo VALUES (3517, 184677000.00, 3612, 149);
INSERT INTO public.costo VALUES (3513, 184677000.00, 3608, 149);
INSERT INTO public.costo VALUES (4881, 6900000.00, 4991, 179);
INSERT INTO public.costo VALUES (4905, 750000000.00, 5015, 179);
INSERT INTO public.costo VALUES (4929, 375000000.00, 5039, 179);
INSERT INTO public.costo VALUES (3537, 45000000.00, 3632, 193);
INSERT INTO public.costo VALUES (3542, 24750000.00, 3637, 179);
INSERT INTO public.costo VALUES (3544, 120000000.00, 3639, 179);
INSERT INTO public.costo VALUES (3545, 42000000.00, 3640, 179);
INSERT INTO public.costo VALUES (3588, 5250000.00, 3683, 179);
INSERT INTO public.costo VALUES (3590, 37350000.00, 3685, 179);
INSERT INTO public.costo VALUES (3585, 13695000.00, 3680, 179);
INSERT INTO public.costo VALUES (3587, 30000000.00, 3682, 179);
INSERT INTO public.costo VALUES (3739, 13375564.33, 3834, 181);
INSERT INTO public.costo VALUES (3909, 1875277.52, 4004, 233);
INSERT INTO public.costo VALUES (3547, 45000000.00, 3642, 193);
INSERT INTO public.costo VALUES (3030, 17370750.00, 3125, 179);
INSERT INTO public.costo VALUES (4950, 400000000.00, 5062, 181);
INSERT INTO public.costo VALUES (4953, 140000000.00, 5065, 232);
INSERT INTO public.costo VALUES (3564, 8250000.00, 3659, 149);
INSERT INTO public.costo VALUES (537, 30000000.00, 605, 63);
INSERT INTO public.costo VALUES (4486, 28500000.00, 4586, 179);
INSERT INTO public.costo VALUES (4484, 9750000.00, 4584, 179);
INSERT INTO public.costo VALUES (3020, 40500000.00, 3115, 179);
INSERT INTO public.costo VALUES (4296, 7768500.00, 4396, 179);
INSERT INTO public.costo VALUES (1624, 33000000.00, 1699, 165);
INSERT INTO public.costo VALUES (2657, 720000.00, 2738, 146);
INSERT INTO public.costo VALUES (4089, 300000000.00, 4189, 179);
INSERT INTO public.costo VALUES (4524, 31500000.00, 4624, 179);
INSERT INTO public.costo VALUES (3946, 270000000.00, 4046, 227);
INSERT INTO public.costo VALUES (3445, 13500000.00, 3540, 179);
INSERT INTO public.costo VALUES (4786, 16500000.00, 4895, 150);
INSERT INTO public.costo VALUES (4809, 32250000.00, 4918, 179);
INSERT INTO public.costo VALUES (4832, 1980000.00, 4941, 179);
INSERT INTO public.costo VALUES (4616, 75000000.00, 4716, 192);
INSERT INTO public.costo VALUES (1953, 15000000.00, 2028, 85);
INSERT INTO public.costo VALUES (4855, 53250000.00, 4965, 179);
INSERT INTO public.costo VALUES (4651, 0.00, 4751, 244);
INSERT INTO public.costo VALUES (4557, 0.00, 4657, 179);
INSERT INTO public.costo VALUES (4650, 0.00, 4750, 244);
INSERT INTO public.costo VALUES (3945, 0.00, 4045, 179);
INSERT INTO public.costo VALUES (4378, 0.00, 4478, 179);
INSERT INTO public.costo VALUES (4483, 0.00, 4583, 179);
INSERT INTO public.costo VALUES (4154, 0.00, 4254, 227);
INSERT INTO public.costo VALUES (4176, 0.00, 4276, 179);
INSERT INTO public.costo VALUES (4294, 0.00, 4394, 179);
INSERT INTO public.costo VALUES (4370, 0.00, 4470, 179);
INSERT INTO public.costo VALUES (4408, 0.00, 4508, 179);
INSERT INTO public.costo VALUES (4521, 0.00, 4621, 148);
INSERT INTO public.costo VALUES (3854, 0.00, 3948, 231);
INSERT INTO public.costo VALUES (4133, 0.00, 4233, 227);
INSERT INTO public.costo VALUES (3771, 0.00, 3866, 181);
INSERT INTO public.costo VALUES (3850, 0.00, 3944, 181);
INSERT INTO public.costo VALUES (4352, 0.00, 4452, 179);
INSERT INTO public.costo VALUES (3518, 184677000.00, 3613, 149);
INSERT INTO public.costo VALUES (4371, 0.00, 4471, 179);
INSERT INTO public.costo VALUES (3895, 0.00, 3990, 179);
INSERT INTO public.costo VALUES (4192, 0.00, 4292, 179);
INSERT INTO public.costo VALUES (3025, 0.00, 3120, 179);
INSERT INTO public.costo VALUES (3440, 28500000.00, 3535, 179);
INSERT INTO public.costo VALUES (3777, 11500500.00, 3872, 179);
INSERT INTO public.costo VALUES (3939, 1725000.00, 4039, 179);
INSERT INTO public.costo VALUES (4631, 179310000.00, 4731, 179);
INSERT INTO public.costo VALUES (3976, 27975000.00, 4076, 162);
INSERT INTO public.costo VALUES (2604, 3450000.00, 2683, 75);
INSERT INTO public.costo VALUES (3991, 3876000.00, 4091, 238);
INSERT INTO public.costo VALUES (3055, 165604500.00, 3150, 179);
INSERT INTO public.costo VALUES (3052, 309129000.00, 3147, 179);
INSERT INTO public.costo VALUES (3054, 551233650.00, 3149, 179);
INSERT INTO public.costo VALUES (3053, 442500000.00, 3148, 179);
INSERT INTO public.costo VALUES (785, 6000000.00, 858, 163);
INSERT INTO public.costo VALUES (4003, 70885500.00, 4103, 117);
INSERT INTO public.costo VALUES (3396, 3000000.00, 3491, 179);
INSERT INTO public.costo VALUES (4022, 3750000.00, 4122, 236);
INSERT INTO public.costo VALUES (4047, 4500000.00, 4147, 28);
INSERT INTO public.costo VALUES (3644, 2500000000.00, 3739, 181);
INSERT INTO public.costo VALUES (3583, 32500000.00, 3678, 179);
INSERT INTO public.costo VALUES (4882, 4071936000.00, 4992, 181);
INSERT INTO public.costo VALUES (4906, 90000000.00, 5016, 179);
INSERT INTO public.costo VALUES (4764, 9900000.00, 4873, 179);
INSERT INTO public.costo VALUES (3549, 6000000.00, 3644, 192);
INSERT INTO public.costo VALUES (3586, 11250000.00, 3681, 179);
INSERT INTO public.costo VALUES (3582, 16050000.00, 3677, 179);
INSERT INTO public.costo VALUES (3906, 87505.45, 4001, 233);
INSERT INTO public.costo VALUES (4954, 1000000000.00, 5066, 232);
INSERT INTO public.costo VALUES (3927, 23400000.00, 4027, 148);
INSERT INTO public.costo VALUES (3970, 12000000.00, 4070, 234);
INSERT INTO public.costo VALUES (4354, 39000000.00, 4454, 179);
INSERT INTO public.costo VALUES (4353, 46500000.00, 4453, 179);
INSERT INTO public.costo VALUES (4358, 108000000.00, 4458, 179);
INSERT INTO public.costo VALUES (4061, 3884100.00, 4161, 179);
INSERT INTO public.costo VALUES (2659, 7117500.00, 2740, 179);
INSERT INTO public.costo VALUES (4162, 59478150.00, 4262, 179);
INSERT INTO public.costo VALUES (3539, 67175100.00, 3634, 193);
INSERT INTO public.costo VALUES (3755, 61860000.00, 3850, 179);
INSERT INTO public.costo VALUES (4083, 54750000.00, 4183, 233);
INSERT INTO public.costo VALUES (4695, 190945500.00, 4802, 179);
INSERT INTO public.costo VALUES (4718, 287100000.00, 4825, 179);
INSERT INTO public.costo VALUES (4741, 277200000.00, 4849, 201);
INSERT INTO public.costo VALUES (3401, 75600000.00, 3496, 181);
INSERT INTO public.costo VALUES (4787, 5775000.00, 4896, 117);
INSERT INTO public.costo VALUES (4810, 10875000.00, 4919, 179);
INSERT INTO public.costo VALUES (3717, 5057538990.00, 3812, 181);
INSERT INTO public.costo VALUES (4833, 44631000.00, 4942, 179);
INSERT INTO public.costo VALUES (4856, 36757500.00, 4966, 221);
INSERT INTO public.costo VALUES (3572, 110250000.00, 3667, 179);
INSERT INTO public.costo VALUES (4132, 0.00, 4232, 227);
INSERT INTO public.costo VALUES (3345, 29250000.00, 3440, 179);
INSERT INTO public.costo VALUES (2572, 1500000000.00, 2651, 36);
INSERT INTO public.costo VALUES (3449, 12750000.00, 3544, 179);
INSERT INTO public.costo VALUES (3447, 109350000.00, 3542, 179);
INSERT INTO public.costo VALUES (3448, 97512900.00, 3543, 179);
INSERT INTO public.costo VALUES (3441, 33000000.00, 3536, 181);
INSERT INTO public.costo VALUES (3439, 54150000.00, 3534, 179);
INSERT INTO public.costo VALUES (2647, 45000000.00, 2728, 218);
INSERT INTO public.costo VALUES (3446, 7500000.00, 3541, 117);
INSERT INTO public.costo VALUES (3444, 5568000.00, 3539, 179);
INSERT INTO public.costo VALUES (3540, 52500000.00, 3635, 193);
INSERT INTO public.costo VALUES (3427, 187500000.00, 3522, 201);
INSERT INTO public.costo VALUES (3832, 13500000.00, 3927, 179);
INSERT INTO public.costo VALUES (3940, 396900000.00, 4040, 179);
INSERT INTO public.costo VALUES (3646, 2000000000.00, 3741, 181);
INSERT INTO public.costo VALUES (4857, 32000000.00, 4967, 179);
INSERT INTO public.costo VALUES (3595, 20000000.00, 3690, 179);
INSERT INTO public.costo VALUES (4907, 300000000.00, 5017, 179);
INSERT INTO public.costo VALUES (4931, 45000000.00, 5041, 179);
INSERT INTO public.costo VALUES (3918, 17504741.58, 4013, 233);
INSERT INTO public.costo VALUES (3658, 320000000.00, 3753, 179);
INSERT INTO public.costo VALUES (4955, 1000000000.00, 5067, 232);
INSERT INTO public.costo VALUES (3123, 750000000.00, 3218, 181);
INSERT INTO public.costo VALUES (3576, 45000000.00, 3671, 179);
INSERT INTO public.costo VALUES (3741, 450000000.00, 3836, 225);
INSERT INTO public.costo VALUES (4696, 207181800.00, 4803, 179);
INSERT INTO public.costo VALUES (4719, 107880000.00, 4826, 179);
INSERT INTO public.costo VALUES (3698, 18000000.00, 3793, 150);
INSERT INTO public.costo VALUES (4742, 247500000.00, 4850, 201);
INSERT INTO public.costo VALUES (4788, 55440000.00, 4897, 150);
INSERT INTO public.costo VALUES (4431, 18976050.00, 4531, 179);
INSERT INTO public.costo VALUES (3928, 23400000.00, 4028, 227);
INSERT INTO public.costo VALUES (4811, 27090000.00, 4920, 179);
INSERT INTO public.costo VALUES (4834, 2250000.00, 4943, 179);
INSERT INTO public.costo VALUES (3294, 187500000.00, 3389, 181);
INSERT INTO public.costo VALUES (3652, 52207105632.00, 3747, 181);
INSERT INTO public.costo VALUES (3719, 12733500.00, 3814, 179);
INSERT INTO public.costo VALUES (4523, 0.00, 4623, 179);
INSERT INTO public.costo VALUES (1980, 0.00, 2055, 163);
INSERT INTO public.costo VALUES (3851, 80415000.00, 3945, 179);
INSERT INTO public.costo VALUES (4562, 3900000.00, 4662, 192);
INSERT INTO public.costo VALUES (4157, 1109775000.00, 4257, 179);
INSERT INTO public.costo VALUES (1672, 24750000.00, 1747, 36);
INSERT INTO public.costo VALUES (4240, 47850000.00, 4340, 201);
INSERT INTO public.costo VALUES (3676, 4500000.00, 3771, 179);
INSERT INTO public.costo VALUES (4600, 8700000.00, 4700, 146);
INSERT INTO public.costo VALUES (4509, 108000000.00, 4609, 179);
INSERT INTO public.costo VALUES (4487, 36000000.00, 4587, 179);
INSERT INTO public.costo VALUES (4374, 55238400.00, 4474, 179);
INSERT INTO public.costo VALUES (4697, 1305000000.00, 4804, 179);
INSERT INTO public.costo VALUES (3645, 75600000.00, 3740, 181);
INSERT INTO public.costo VALUES (4743, 120525000.00, 4851, 117);
INSERT INTO public.costo VALUES (4766, 6600000.00, 4875, 179);
INSERT INTO public.costo VALUES (3665, 63781500.00, 3760, 28);
INSERT INTO public.costo VALUES (4789, 155925000.00, 4898, 179);
INSERT INTO public.costo VALUES (4812, 37500000.00, 4921, 179);
INSERT INTO public.costo VALUES (4835, 6300000.00, 4944, 179);
INSERT INTO public.costo VALUES (3837, 1275000000.00, 3932, 181);
INSERT INTO public.costo VALUES (4908, 2400000000.00, 5018, 179);
INSERT INTO public.costo VALUES (4932, 90000000.00, 5042, 179);
INSERT INTO public.costo VALUES (3905, 175010.91, 4000, 233);
INSERT INTO public.costo VALUES (4956, 20000000000.00, 5068, 179);
INSERT INTO public.costo VALUES (4203, 22500000.00, 4303, 179);
INSERT INTO public.costo VALUES (4034, 5250000.00, 4134, 28);
INSERT INTO public.costo VALUES (4765, 175000000.00, 4874, 182);
INSERT INTO public.costo VALUES (600, 3000000.00, 669, 28);
INSERT INTO public.costo VALUES (4503, 14700000.00, 4603, 179);
INSERT INTO public.costo VALUES (4720, 487200000.00, 4827, 179);
INSERT INTO public.costo VALUES (3514, 184677000.00, 3609, 149);
INSERT INTO public.costo VALUES (3925, 45384615.00, 4025, 179);
INSERT INTO public.costo VALUES (3654, 0.00, 3749, 181);
INSERT INTO public.costo VALUES (3721, 0.00, 3816, 181);
INSERT INTO public.costo VALUES (4140, 0.00, 4240, 227);
INSERT INTO public.costo VALUES (4278, 10575000.00, 4378, 179);
INSERT INTO public.costo VALUES (4037, 3750000.00, 4137, 28);
INSERT INTO public.costo VALUES (4041, 10620000.00, 4141, 28);
INSERT INTO public.costo VALUES (4039, 61374150.00, 4139, 28);
INSERT INTO public.costo VALUES (4051, 1608300000.00, 4151, 227);
INSERT INTO public.costo VALUES (4008, 8250000.00, 4108, 5);
INSERT INTO public.costo VALUES (4009, 12000000.00, 4109, 240);
INSERT INTO public.costo VALUES (4045, 12000000.00, 4145, 28);
INSERT INTO public.costo VALUES (4299, 33000000.00, 4399, 39);
INSERT INTO public.costo VALUES (4015, 43500000.00, 4115, 163);
INSERT INTO public.costo VALUES (4018, 20250000.00, 4118, 5);
INSERT INTO public.costo VALUES (4221, 42000000.00, 4321, 179);
INSERT INTO public.costo VALUES (4261, 4485000.00, 4361, 179);
INSERT INTO public.costo VALUES (4675, 21231450.00, 4775, 136);
INSERT INTO public.costo VALUES (4049, 11700000.00, 4149, 28);
INSERT INTO public.costo VALUES (4028, 6000000.00, 4128, 241);
INSERT INTO public.costo VALUES (4030, 4140000.00, 4130, 236);
INSERT INTO public.costo VALUES (4298, 22500000.00, 4398, 179);
INSERT INTO public.costo VALUES (4375, 7632000.00, 4475, 230);
INSERT INTO public.costo VALUES (4698, 88005720.00, 4805, 179);
INSERT INTO public.costo VALUES (4721, 69600000.00, 4828, 179);
INSERT INTO public.costo VALUES (4767, 33000000.00, 4876, 179);
INSERT INTO public.costo VALUES (4790, 110880000.00, 4899, 117);
INSERT INTO public.costo VALUES (4813, 126750000.00, 4922, 179);
INSERT INTO public.costo VALUES (3736, 69600000000.00, 3831, 181);
INSERT INTO public.costo VALUES (3716, 5057538990.00, 3811, 181);
INSERT INTO public.costo VALUES (3718, 10115077968.00, 3813, 181);
INSERT INTO public.costo VALUES (4836, 24000000.00, 4945, 179);
INSERT INTO public.costo VALUES (4885, 61150500.25, 4995, 179);
INSERT INTO public.costo VALUES (4909, 450000000.00, 5019, 179);
INSERT INTO public.costo VALUES (4200, 250000000.00, 4300, 179);
INSERT INTO public.costo VALUES (4017, 6730000.00, 4117, 236);
INSERT INTO public.costo VALUES (3794, 13000000.00, 3889, 39);
INSERT INTO public.costo VALUES (4957, 10000000000.00, 5069, 179);
INSERT INTO public.costo VALUES (3705, 0.00, 3800, 135);
INSERT INTO public.costo VALUES (4112, 0.00, 4212, 179);
INSERT INTO public.costo VALUES (4134, 0.00, 4234, 227);
INSERT INTO public.costo VALUES (4092, 0.00, 4192, 179);
INSERT INTO public.costo VALUES (4135, 0.00, 4235, 227);
INSERT INTO public.costo VALUES (4525, 0.00, 4625, 182);
INSERT INTO public.costo VALUES (4070, 0.00, 4170, 179);
INSERT INTO public.costo VALUES (4201, 0.00, 4301, 179);
INSERT INTO public.costo VALUES (4317, 0.00, 4417, 182);
INSERT INTO public.costo VALUES (4357, 39000000.00, 4457, 179);
INSERT INTO public.costo VALUES (4356, 90075000.00, 4456, 179);
INSERT INTO public.costo VALUES (4336, 1350000000.00, 4436, 179);
INSERT INTO public.costo VALUES (4470, 3450000.00, 4570, 179);
INSERT INTO public.costo VALUES (4280, 525000.00, 4380, 179);
INSERT INTO public.costo VALUES (3740, 23400000.00, 3835, 224);
INSERT INTO public.costo VALUES (4394, 2894940000.00, 4494, 179);
INSERT INTO public.costo VALUES (4007, 22516200.00, 4107, 5);
INSERT INTO public.costo VALUES (4640, 52500000.00, 4740, 179);
INSERT INTO public.costo VALUES (4043, 5250000.00, 4143, 28);
INSERT INTO public.costo VALUES (4010, 6000000.00, 4110, 162);
INSERT INTO public.costo VALUES (4281, 47250000.00, 4381, 179);
INSERT INTO public.costo VALUES (4044, 13785000.00, 4144, 28);
INSERT INTO public.costo VALUES (4013, 3000000.00, 4113, 162);
INSERT INTO public.costo VALUES (4020, 5850000.00, 4120, 236);
INSERT INTO public.costo VALUES (4376, 27000000.00, 4476, 179);
INSERT INTO public.costo VALUES (4639, 82500000.00, 4739, 179);
INSERT INTO public.costo VALUES (4225, 49500000.00, 4325, 179);
INSERT INTO public.costo VALUES (4021, 6000000.00, 4121, 117);
INSERT INTO public.costo VALUES (4262, 6750000.00, 4362, 179);
INSERT INTO public.costo VALUES (4025, 3000000.00, 4125, 241);
INSERT INTO public.costo VALUES (4048, 10200000.00, 4148, 28);
INSERT INTO public.costo VALUES (4026, 3375000.00, 4126, 163);
INSERT INTO public.costo VALUES (4027, 5250000.00, 4127, 241);
INSERT INTO public.costo VALUES (4029, 3300000.00, 4129, 163);
INSERT INTO public.costo VALUES (4031, 11250000.00, 4131, 5);
INSERT INTO public.costo VALUES (4202, 73500000.00, 4302, 179);
INSERT INTO public.costo VALUES (4395, 231000000.00, 4495, 179);
INSERT INTO public.costo VALUES (4377, 24600000.00, 4477, 179);
INSERT INTO public.costo VALUES (4242, 69900000.00, 4342, 179);
INSERT INTO public.costo VALUES (2908, 1877050.56, 3000, 181);
INSERT INTO public.costo VALUES (4886, 52414714.50, 4996, 179);
INSERT INTO public.costo VALUES (4910, 450000000.00, 5020, 179);
INSERT INTO public.costo VALUES (4934, 82500000.00, 5044, 179);
INSERT INTO public.costo VALUES (4038, 21730000.00, 4138, 28);
INSERT INTO public.costo VALUES (4016, 6730000.00, 4116, 236);
INSERT INTO public.costo VALUES (4046, 3706900.00, 4146, 28);
INSERT INTO public.costo VALUES (3912, 2355488.08, 4007, 233);
INSERT INTO public.costo VALUES (3836, 1000000.00, 3931, 181);
INSERT INTO public.costo VALUES (3911, 138928901.87, 4006, 233);
INSERT INTO public.costo VALUES (4958, 5000000000.00, 5070, 179);
INSERT INTO public.costo VALUES (2676, 71529450.00, 2757, 179);
INSERT INTO public.costo VALUES (4227, 31515000.00, 4327, 179);
INSERT INTO public.costo VALUES (2684, 289494000.00, 2765, 179);
INSERT INTO public.costo VALUES (4359, 30000000.00, 4459, 179);
INSERT INTO public.costo VALUES (4745, 66000000.00, 4853, 117);
INSERT INTO public.costo VALUES (2690, 181500000.00, 2771, 179);
INSERT INTO public.costo VALUES (4768, 57750000.00, 4877, 179);
INSERT INTO public.costo VALUES (4837, 81021000.00, 4946, 179);
INSERT INTO public.costo VALUES (4860, 750000000000.00, 4970, 179);
INSERT INTO public.costo VALUES (4527, 0.00, 4627, 179);
INSERT INTO public.costo VALUES (4563, 0.00, 4663, 179);
INSERT INTO public.costo VALUES (4138, 0.00, 4238, 227);
INSERT INTO public.costo VALUES (3394, 45000000.00, 3489, 179);
INSERT INTO public.costo VALUES (3968, 10500000.00, 4068, 163);
INSERT INTO public.costo VALUES (4432, 12405000.00, 4532, 179);
INSERT INTO public.costo VALUES (4615, 95850000.00, 4715, 192);
INSERT INTO public.costo VALUES (2864, 374985000.00, 2947, 179);
INSERT INTO public.costo VALUES (3979, 6375000.00, 4079, 162);
INSERT INTO public.costo VALUES (2600, 3750000.00, 2679, 163);
INSERT INTO public.costo VALUES (3048, 128250000.00, 3143, 179);
INSERT INTO public.costo VALUES (3996, 9329700.00, 4096, 162);
INSERT INTO public.costo VALUES (2607, 14850000.00, 2686, 179);
INSERT INTO public.costo VALUES (3935, 285000.00, 4035, 179);
INSERT INTO public.costo VALUES (3076, 28500000.00, 3171, 193);
INSERT INTO public.costo VALUES (4338, 578988000.00, 4438, 179);
INSERT INTO public.costo VALUES (4642, 30000000.00, 4742, 214);
INSERT INTO public.costo VALUES (4423, 11100000.00, 4523, 179);
INSERT INTO public.costo VALUES (4153, 724500000.00, 4253, 179);
INSERT INTO public.costo VALUES (2626, 9753750.00, 2707, 179);
INSERT INTO public.costo VALUES (4622, 18390000.00, 4722, 179);
INSERT INTO public.costo VALUES (3551, 38971350.00, 3646, 179);
INSERT INTO public.costo VALUES (2651, 270000.00, 2732, 28);
INSERT INTO public.costo VALUES (4433, 4349850.00, 4533, 179);
INSERT INTO public.costo VALUES (3038, 488107500.00, 3133, 179);
INSERT INTO public.costo VALUES (3452, 47287500.00, 3547, 179);
INSERT INTO public.costo VALUES (4584, 7500000.00, 4684, 179);
INSERT INTO public.costo VALUES (4409, 6000000.00, 4509, 179);
INSERT INTO public.costo VALUES (4769, 132000000.00, 4878, 179);
INSERT INTO public.costo VALUES (4620, 120750000.00, 4720, 192);
INSERT INTO public.costo VALUES (4792, 155925000.00, 4901, 214);
INSERT INTO public.costo VALUES (4838, 11538450.00, 4947, 179);
INSERT INTO public.costo VALUES (4861, 750000000000.00, 4971, 179);
INSERT INTO public.costo VALUES (4300, 0.00, 4400, 179);
INSERT INTO public.costo VALUES (4529, 217350000.00, 4629, 179);
INSERT INTO public.costo VALUES (3891, 20962500.00, 3986, 179);
INSERT INTO public.costo VALUES (4724, 278400000.00, 4831, 179);
INSERT INTO public.costo VALUES (3742, 3000000.00, 3837, 181);
INSERT INTO public.costo VALUES (4770, 495000.00, 4879, 179);
INSERT INTO public.costo VALUES (4793, 45045000.00, 4902, 179);
INSERT INTO public.costo VALUES (3838, 2250000000.00, 3933, 181);
INSERT INTO public.costo VALUES (4839, 18855000.00, 4948, 179);
INSERT INTO public.costo VALUES (4302, 0.00, 4402, 179);
INSERT INTO public.costo VALUES (3759, 19500000.00, 3854, 179);
INSERT INTO public.costo VALUES (4184, 0.00, 4284, 179);
INSERT INTO public.costo VALUES (4341, 0.00, 4441, 179);
INSERT INTO public.costo VALUES (3798, 0.00, 3893, 179);
INSERT INTO public.costo VALUES (4510, 0.00, 4610, 179);
INSERT INTO public.costo VALUES (4887, 34943143.00, 4997, 179);
INSERT INTO public.costo VALUES (4911, 225000000.00, 5021, 179);
INSERT INTO public.costo VALUES (4935, 45000000.00, 5045, 179);
INSERT INTO public.costo VALUES (4959, 1000000000.00, 5071, 232);
INSERT INTO public.costo VALUES (4961, 18000000.00, 5073, 179);
INSERT INTO public.costo VALUES (4084, 135000000.00, 4184, 227);
INSERT INTO public.costo VALUES (199, 22500000.00, 199, 179);
INSERT INTO public.costo VALUES (4960, 15000000.00, 5072, 179);
INSERT INTO public.costo VALUES (4962, 52500000.00, 5074, 179);
INSERT INTO public.costo VALUES (3640, 350000000.00, 3735, 179);
INSERT INTO public.costo VALUES (4498, 5400000.00, 4598, 179);
INSERT INTO public.costo VALUES (4963, 52500000.00, 5075, 179);
INSERT INTO public.costo VALUES (4699, 125433120.00, 4806, 179);
INSERT INTO public.costo VALUES (3022, 9433350.00, 3117, 117);
INSERT INTO public.costo VALUES (4859, 180000000.00, 4969, 248);
INSERT INTO public.costo VALUES (3938, 1335750000.00, 4038, 179);
INSERT INTO public.costo VALUES (3803, 4500000.00, 3898, 193);
INSERT INTO public.costo VALUES (4243, 10500000.00, 4343, 179);
INSERT INTO public.costo VALUES (4964, 16000000.00, 5076, 179);
INSERT INTO public.costo VALUES (3786, 25000.00, 3881, 179);
INSERT INTO public.costo VALUES (3107, 28050000.00, 3202, 146);
INSERT INTO public.costo VALUES (4965, 30000000.00, 5077, 179);
INSERT INTO public.costo VALUES (4966, 45000000.00, 5078, 179);
INSERT INTO public.costo VALUES (4967, 13218750.00, 5079, 179);
INSERT INTO public.costo VALUES (4969, NULL, 5084, NULL);
INSERT INTO public.costo VALUES (4970, 12234.00, 5085, 205);
INSERT INTO public.costo VALUES (4971, 34000.00, 5086, 179);
INSERT INTO public.costo VALUES (4972, 2000.00, 5099, 198);
INSERT INTO public.costo VALUES (4973, 120.00, 5100, 193);


--
-- TOC entry 3299 (class 0 OID 20304)
-- Dependencies: 215
-- Data for Name: especifico; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.especifico VALUES (1, 1, '4.02.01.01.00', 'ALIMENTOS Y BEBIDAS PARA PERSONAS');
INSERT INTO public.especifico VALUES (2, 2, '4.02.02.02.00', 'PETROLEO CRUDO Y GAS NATURAL');
INSERT INTO public.especifico VALUES (3, 2, '4.02.02.05.00', 'PIEDRA, ARCILLA, ARENA Y TIERRA');
INSERT INTO public.especifico VALUES (4, 3, '4.02.03.01.00', 'TEXTILES');
INSERT INTO public.especifico VALUES (5, 3, '4.02.03.02.00', 'PRENDAS VESTIR');
INSERT INTO public.especifico VALUES (6, 3, '4.02.03.03.00', 'CALZADOS');
INSERT INTO public.especifico VALUES (7, 4, '4.02.04.03.00', 'CAUCHOS Y TRIPAS PARA VEHICULOS');
INSERT INTO public.especifico VALUES (8, 5, '4.02.05.01.00', 'PULPA DE MADERA, PAPEL Y CARTON');
INSERT INTO public.especifico VALUES (9, 5, '4.02.05.02.00', 'ENVASES Y CAJAS DE PAPEL Y CARTON');
INSERT INTO public.especifico VALUES (10, 5, '4.02.05.03.00', 'PRODUCTOS DE PAPEL Y CARTON PARA OFICINA');
INSERT INTO public.especifico VALUES (11, 5, '4.02.05.04.00', 'LIBROS, REVISTAS Y PERIODICOS');
INSERT INTO public.especifico VALUES (12, 5, '4.02.05.05.00', 'MATERIALES DE ENSEÑANZA');
INSERT INTO public.especifico VALUES (13, 5, '4.02.05.07.00', 'PRODUCTOS DE PAPEL Y CARTON PARA LA IMPRENTA Y REPRODUCCION');
INSERT INTO public.especifico VALUES (14, 6, '4.02.06.03.00', 'TINTAS, PINTURAS Y COLORANTES');
INSERT INTO public.especifico VALUES (15, 6, '4.02.06.04.00', 'PRODUCTOS FARMACEUTICOS Y MEDICAMENTOS');
INSERT INTO public.especifico VALUES (16, 6, '4.02.06.05.00', 'PRODUCTOS DE TOCADOR');
INSERT INTO public.especifico VALUES (17, 6, '4.02.06.06.00', 'COMBUSTIBLES Y LUBRICANTES');
INSERT INTO public.especifico VALUES (18, 6, '4.02.06.08.00', 'PRODUCTOS PLASTICOS');
INSERT INTO public.especifico VALUES (19, 7, '4.02.07.02.00', 'VIDROS Y PRODUCTOS DE VIDRIO');
INSERT INTO public.especifico VALUES (20, 7, '4.02.07.03.00', 'PRODUCTOS DE ARCILLA PARA CONSTRUCCION');
INSERT INTO public.especifico VALUES (21, 7, '4.02.07.04.00', 'CEMENTO CAL Y YESO');
INSERT INTO public.especifico VALUES (22, 8, '4.02.08.01.00', 'PRODUCTOS PRIMARIOS DE HIERRO Y ACERO');
INSERT INTO public.especifico VALUES (23, 8, '4.02.08.02.00', 'PRODUCTOS DE METALES NO FERROSOS');
INSERT INTO public.especifico VALUES (24, 8, '4.02.08.03.00', 'HERRAMIENTAS MENORES, CUCHILLERIA Y ARTICULOS GENERALES DE FERRETERIA');
INSERT INTO public.especifico VALUES (25, 8, '4.02.08.04.00', 'PRODUCTOS METALICOS ESTRUCTURALES');
INSERT INTO public.especifico VALUES (26, 8, '4.02.08.09.00', 'REPUESTOS Y ACCESORIOS PARA EQUIPOS DE TRASNPORTE');
INSERT INTO public.especifico VALUES (27, 8, '4.02.08.10.00', 'REPUESTOS Y ACCESORIOS PARA OTROS EQUIPOS');
INSERT INTO public.especifico VALUES (28, 9, '4.02.10.01.00', 'ARTICULOS DE DEPORTE, RECREACION Y JUGUETES');
INSERT INTO public.especifico VALUES (29, 9, '4.02.10.02.00', 'MATERIALES Y UTILES DE LIMPIEZA Y ASEO');
INSERT INTO public.especifico VALUES (30, 9, '4.02.10.03.00', 'UTENSILIOS DE COCINA Y COMEDOR');
INSERT INTO public.especifico VALUES (31, 9, '4.02.10.04.00', 'UTILES MENORES MEDICOS-QUIRURGICOS DE LABORATORIO DENTALES Y VETERINARIA');
INSERT INTO public.especifico VALUES (32, 9, '4.02.10.05.00', 'UTILES DE ESCRITORIO, OFICINA Y MATERIALES DE INSTRUCCION');
INSERT INTO public.especifico VALUES (33, 9, '4.02.10.06.00', 'CONDECORACIONES, OFRENDAS Y SIMILARES');
INSERT INTO public.especifico VALUES (34, 9, '4.02.10.07.00', 'PRODUCTOS DE SEGURIDAD EN EL TRABAJO');
INSERT INTO public.especifico VALUES (35, 9, '4.02.10.08.00', 'MATERIALES PARA EQUIPOS DE COMPUTACION');
INSERT INTO public.especifico VALUES (36, 9, '4.02.10.11.00', 'MATERIALES ELECTRICOS');
INSERT INTO public.especifico VALUES (37, 9, '4.02.10.12.00', 'MATERIALES PARA INSTALACIONES SANITARIAS');
INSERT INTO public.especifico VALUES (38, 9, '4.02.10.99.00', 'OTROS PRODUCTOS Y UTILES DIVERSOS');
INSERT INTO public.especifico VALUES (39, 10, '4.02.99.01.00', 'OTROS MATERIALES Y SUMINISTROS');
INSERT INTO public.especifico VALUES (40, 11, '4.03.01.01.00', 'ALQUILERES DE EDIFICIOS Y LOCALES');
INSERT INTO public.especifico VALUES (41, 12, '4.03.02.02.00', 'ALQUILERES DE EQUIPOS DE TRASNPORTE, TRACCION Y ELEVACION');
INSERT INTO public.especifico VALUES (42, 12, '4.03.02.99.00', 'ALQUILERES DE OTRAS MAQUINARIAS Y EQUIPOS');
INSERT INTO public.especifico VALUES (43, 13, '4.03.03.03.00', 'PAQUETES DE PROGRAMA DE COMPUTACION');
INSERT INTO public.especifico VALUES (44, 14, '4.03.04.01.00', 'ELECTRICIDAD');
INSERT INTO public.especifico VALUES (46, 14, '4.03.04.04.00', 'SERVICIO DE TELEFONIA');
INSERT INTO public.especifico VALUES (47, 14, '4.03.04.05.00', 'SERVICIOS DE COMUNICACIONES');
INSERT INTO public.especifico VALUES (48, 14, '403.04.06.00', 'SERVICIOS DE ASEO Y DOMICILIARIO');
INSERT INTO public.especifico VALUES (49, 14, '4.03.04.07.00', 'SERVICIO DE CONDOMINIO');
INSERT INTO public.especifico VALUES (50, 15, '4.03.06.01.00', 'FLETES Y EMBALAJES');
INSERT INTO public.especifico VALUES (52, 15, '4.03.06.03.00', 'ESTACIONAMIENTO');
INSERT INTO public.especifico VALUES (53, 15, '4.03.06.05.00', 'SERVICIOS DE PROTECCION EN TRASLADO DE FONDOS Y DE MENSAJERIA');
INSERT INTO public.especifico VALUES (54, 16, '4.03.07.01.00', 'PUBLICIDAD Y PROPAGANDA');
INSERT INTO public.especifico VALUES (55, 16, '4.03.07.02.00', 'IMPRENTA Y REPRODUCCION');
INSERT INTO public.especifico VALUES (56, 16, '4.03.07.03.00', 'RELACIONES SOCIALES');
INSERT INTO public.especifico VALUES (57, 16, '4.03.07.04.00', 'AVISOS');
INSERT INTO public.especifico VALUES (58, 17, '4.03.08.01.00', 'PRIMAS Y GASTOS DE SEGUROS');
INSERT INTO public.especifico VALUES (59, 17, '4.03.08.02.00', 'COMISIONES Y GASTOS BANCARIOS');
INSERT INTO public.especifico VALUES (60, 17, '4.03.08.03.00', 'COMISIONES Y GASTOS DE ADQUISICION DE SEGUROS');
INSERT INTO public.especifico VALUES (61, 18, '4.03.09.01.00', 'VIATICOS DE PASAJES DENTRO DEL PAIS');
INSERT INTO public.especifico VALUES (62, 18, '4.03.09.02.00', 'VIATICOS DE PASAJES FUERA DEL PAIS');
INSERT INTO public.especifico VALUES (63, 19, '4.03.10.02.00', 'SERVICIOS DE CONTABILIDAD Y AUDITORIA');
INSERT INTO public.especifico VALUES (64, 19, '4.03.10.03.00', 'SERVICIOS DE PROCESAMIENTO DE DATOS');
INSERT INTO public.especifico VALUES (65, 19, '4.03.10.07.00', 'SERVICIOS DE CAPACITACION Y ADIESTRAMIENTO');
INSERT INTO public.especifico VALUES (66, 19, '4.03.10.09.00', 'SERVICIOS DE LAVANDERIA Y TINTORERIA');
INSERT INTO public.especifico VALUES (67, 19, '4.03.10.10.00', 'SERVICIOS DE VIGILANCIA');
INSERT INTO public.especifico VALUES (68, 19, '4.03.10.99.00', 'OTROS SERVICIOS PROFECIONALES Y TECNICOS');
INSERT INTO public.especifico VALUES (69, 20, '4.03.11.02.00', 'CONSERVACION Y REPARACIONES MENORES DE EQUIPOS DE TRASNPORTE, TRACCION Y ELEVACION');
INSERT INTO public.especifico VALUES (70, 20, '4.03.11.04.00', ' CONSERVACION Y REPARACION MENORES DE EQUIPOS MEDICOS-QUIRURGICOS DENTALES');
INSERT INTO public.especifico VALUES (71, 20, '4.03.11.07.00', 'CONSERVACION Y REPARACIONES MENORES DE MAQUINAS, MUEBLES Y DEMAS EQUIPOS DE OFICINAS Y ALOJAMIENTO');
INSERT INTO public.especifico VALUES (72, 20, '4.03.11.99.00', 'CONSERVACION Y REPARACIONES MENORES DE OTRAS MAQUINARIAS Y EQUIPOS');
INSERT INTO public.especifico VALUES (73, 21, '4.03.12.01.00', 'CONSERVACION Y REPARACIONES MENORES DE OBRAS EN BIENES DOMINIO PRIVADO');
INSERT INTO public.especifico VALUES (74, 22, '4.03.15.02.00', 'TASAS Y OTROS DERECHOS OBLIGATORIOS');
INSERT INTO public.especifico VALUES (75, 23, '4.03.16.01.00', 'SERVICIOS DE DIVERSION, ESPARCIMIENTO Y CULTURALES');
INSERT INTO public.especifico VALUES (77, 24, '4.03.18.99.00', 'OTROS IMPUESTOS INDIRECTOS');
INSERT INTO public.especifico VALUES (78, 25, '4.03.99.01.00', 'OTROS SERVICIOS NO PERSONALES');
INSERT INTO public.especifico VALUES (80, 27, '4.04.03.02.00', 'MAQUINARIA Y EQUIPOS PARA MANTENIMIENTO DE AUTOMOTORES');
INSERT INTO public.especifico VALUES (81, 27, '4.04.03.04.00', 'MAQUINARIA Y EQUIPOS DE ARTES GRAFICAS Y REPRODUCCION');
INSERT INTO public.especifico VALUES (82, 27, '4.04.03.05.00', 'MAQUINARIA Y EQUIPOS INDUSTRIALES Y DE TALLER');
INSERT INTO public.especifico VALUES (83, 28, '4.04.04.01.00', 'VEHICULOS AUTOMOTORES TERRESTRES');
INSERT INTO public.especifico VALUES (84, 29, '4.04.05.01.00', 'EQUIPOS DE TELECOMUNICACIONES');
INSERT INTO public.especifico VALUES (85, 30, '4.04.07.02.00', 'EQUIPOS DE ENSEÑANZA, DEPORTE Y RECREACION');
INSERT INTO public.especifico VALUES (86, 30, '4.04.07.04.00', 'LIBROS, REVISTAS Y OTROS INSTRUMENTOS DE ENSEÑANZAS');
INSERT INTO public.especifico VALUES (87, 30, '4.04.07.06.00', 'INSTRUMENTOS MUSICALES');
INSERT INTO public.especifico VALUES (88, 31, '4.04.09.01.00', 'MOBILIARIO Y EQUIPOS DE OFICINA');
INSERT INTO public.especifico VALUES (89, 31, '4.04.09.02.00', 'EQUIPOS DE COMPUTACION');
INSERT INTO public.especifico VALUES (90, 31, '4.04.09.03.00', 'MOBILIARIO Y EQUIPOS DE ALOJAMIENTO');
INSERT INTO public.especifico VALUES (76, 24, '4.03.18.01.00', 'IMPUESTOS AL VALOR AGREGADOoooooooooo');
INSERT INTO public.especifico VALUES (45, 14, '4.03.04.02.00', 'GAS');
INSERT INTO public.especifico VALUES (91, 32, '4.04.12.04.00', 'PAQUETES Y PROGRAMA DE COMPUTACION');
INSERT INTO public.especifico VALUES (92, 32, '4.04.12.99.00', 'ACTIVOS INTANGIBLES');
INSERT INTO public.especifico VALUES (93, 33, '4.04.99.01.00', 'OTROS ACTIVOS REALES');
INSERT INTO public.especifico VALUES (948, 1, '4.02.01.03.00', 'Productos agrícolas y pecuarios');
INSERT INTO public.especifico VALUES (949, 2, '4.02.02.01.00', 'Carbón mineral');
INSERT INTO public.especifico VALUES (950, 6, '4.02.06.07.00', 'Productos diversos derivados del petróleo y del carbón');
INSERT INTO public.especifico VALUES (951, 7, '4.02.07.99.00', 'Otros productos minerales no metálicos');
INSERT INTO public.especifico VALUES (952, 8, '4.02.08.99.00 ', 'Otros productos metálicos');
INSERT INTO public.especifico VALUES (953, 34, '4.02.09.01.00', 'Productos primarios de madera');
INSERT INTO public.especifico VALUES (954, 34, '4.02.09.02.00', 'Muebles y accesorios de madera para edificaciones');
INSERT INTO public.especifico VALUES (955, 34, '4.02.09.99.00', 'Otros productos de madera');
INSERT INTO public.especifico VALUES (956, 12, '4.03.02.01.00', 'Alquileres de maquinaria y demás equipos de construcción, campo,
industria y taller');
INSERT INTO public.especifico VALUES (957, 27, '4.04.03.06.00', 'Maquinaria y equipos de energía');
INSERT INTO public.especifico VALUES (958, 35, '4.04.11.05.07', 'Máquinas, muebles y demás equipos de oficina y alojamiento');
INSERT INTO public.especifico VALUES (959, 36, '4.04.15.07.00', 'Construcciones de edificaciones habitacionales');
INSERT INTO public.especifico VALUES (960, 37, '4.08.01.01.01', 'Depreciación de edificios e instalaciones');
INSERT INTO public.especifico VALUES (961, 37, '4.08.01.01.03', 'Depreciación de equipos de transporte, tracción y elevación');
INSERT INTO public.especifico VALUES (962, 37, '4.08.01.00.00', 'Depreciación de equipos de comunicaciones y de señalamiento');
INSERT INTO public.especifico VALUES (963, 37, '4.08.01.01.05', 'Depreciación de equipos médico - quirúrgicos, dentales y de
veterinaria');
INSERT INTO public.especifico VALUES (964, 37, '4.08.01.01.06', 'Depreciación de equipos científicos, religiosos, de enseñanza y
recreación');
INSERT INTO public.especifico VALUES (965, 37, '4.08.01.01.08', 'Depreciación de máquinas, muebles y demás equipos de oficina y
alojamiento');
INSERT INTO public.especifico VALUES (966, 37, '4.08.01.01.99', 'Depreciación de otros bienes de uso');
INSERT INTO public.especifico VALUES (967, 37, '4.08.01.02.04', 'Amortización de paquetes y programas de computación');
INSERT INTO public.especifico VALUES (969, 26, '4.04.01.02.02', 'Reparaciones, mejoras y adiciones mayores de equipos de
transporte, tracción y elevación');
INSERT INTO public.especifico VALUES (970, 26, '4.04.01.02.99', 'Reparaciones, mejoras y adiciones mayores de otras maquinaria y
equipos');
INSERT INTO public.especifico VALUES (971, 39, '4.07.01.01.99', 'Otras transferencias corrientes internas al sector privado');
INSERT INTO public.especifico VALUES (972, 19, '4.03.10.04.00', 'Servicios de ingeniería y arquitectónicos');
INSERT INTO public.especifico VALUES (973, 26, '4.04.01.02.04', 'Reparaciones, mejoras y adiciones mayores de equipos médico-quirúrgicos, dentales y de veterinaria');
INSERT INTO public.especifico VALUES (974, 14, '4.03.04.03.00', 'Agua');
INSERT INTO public.especifico VALUES (975, 6, '4.02.06.02.00', 'Abonos, plaguicidas y otros');
INSERT INTO public.especifico VALUES (977, 41, '4.01.07.10.00', 'Dotación de uniformes a empleados');
INSERT INTO public.especifico VALUES (979, 40, '4.04.06.01.00', 'Equipos médico - quirúrgicos, dentales y de veterinaria ');
INSERT INTO public.especifico VALUES (980, 41, '4.01.07.26.00 ', 'Dotación de uniforme a obreros');
INSERT INTO public.especifico VALUES (981, 19, '4.03.10.05.00
', 'Servicios médicos, odontológicos y otros servicios de sanidad');
INSERT INTO public.especifico VALUES (982, 19, '4.03.10.01.00', 'Servicios jurídicos');
INSERT INTO public.especifico VALUES (983, 42, '4.07.02.01.04', 'Transferencias corrientes a organismos internacionales');
INSERT INTO public.especifico VALUES (984, 26, '4.04.01.02.02', 'REPARACIONES MAYORES DE EQUIPOS DE TRANSPORTE, TRACCION Y ELEVACION');
INSERT INTO public.especifico VALUES (985, 26, '4.04.01.02.99', 'REPARACIONES MAYORES DE OTRAS MAQUINAS Y EQUIPOS');
INSERT INTO public.especifico VALUES (986, 41, '4.01.07.83.00', 'Dotación de uniformes al personal contratado');
INSERT INTO public.especifico VALUES (987, 27, '4.04.03.01.00', 'Maquinaria y demas equipos de construcción y mantenimiento');
INSERT INTO public.especifico VALUES (988, 43, '4.01.01.18.02', 'Remuneraciones por Honorarios profesionales');
INSERT INTO public.especifico VALUES (989, 14, '4.03.04.04.01', 'Servicios de telefonía prestados por organismos públicos
');
INSERT INTO public.especifico VALUES (990, 14, '4.03.04.04.02', 'Servicios de telefonía prestados por instituciones privadas');
INSERT INTO public.especifico VALUES (991, 26, '4.04.01.01.00', 'REPUESTOS MAYORES');
INSERT INTO public.especifico VALUES (992, 26, '4.04.01.01.03', 'REPUESTOS MAYORES PARA EQUIPOS DE COMUNICACION Y DE SENALAMIENTO');
INSERT INTO public.especifico VALUES (993, 39, '4.07.02.02.01', 'donaciones corrientes a personas');
INSERT INTO public.especifico VALUES (994, 39, '4.07.01.02.02', 'donaciones corrientes a instituciones sin fines de lucro');
INSERT INTO public.especifico VALUES (996, 19, '4.03.10.09.00', 'servicios de lavanderia y tintoreria');
INSERT INTO public.especifico VALUES (995, 39, '4.07.01.04.02', 'donaciones corrientes a entes desentralizados sin fines empresariales');
INSERT INTO public.especifico VALUES (51, 15, '4.03.06.02.00', 'ALMACENAJE');
INSERT INTO public.especifico VALUES (79, 26, '4.04.01.01.07', 'REPUESTOS MAYORES PARA MAQUINAS, MUEBLES Y DEMAS EQUIPOS DE OFICINA Y ALOJAMIENTO');
INSERT INTO public.especifico VALUES (997, 24, '4.03.18.01.00', 'Impuesto al Valor agregado333333');
INSERT INTO public.especifico VALUES (998, 45, '4.04.09.99.00
', 'Maquinas, Muebles y demás equipos de oficina y alojamiento');
INSERT INTO public.especifico VALUES (999, 44, '4.04.12.04.00', 'Activos Intangible ');
INSERT INTO public.especifico VALUES (1000, 8, '4.02.08.07.00', 'Material de señalamiento');
INSERT INTO public.especifico VALUES (1001, 26, '4.04.01.02.07', 'Reparaciones, mejoras y adiciones mayores de máquinas, muebles y demás equipos de oficina y alojamiento');
INSERT INTO public.especifico VALUES (1002, 47, '4.04.02.01.00', 'Conservación, ampliaciones y mejoras mayores de obras en bienes del dominio privado');
INSERT INTO public.especifico VALUES (1003, 8, '4.02.08.05.00', 'MATERIALES DE ORDEN PUBLICO, SEGURIDAD Y DEFENSA');
INSERT INTO public.especifico VALUES (1004, 2, '4.02.02.04.00', 'MATERIALES NO FERROSOS');
INSERT INTO public.especifico VALUES (1005, 39, '4.07.01.04.05', 'DONACIONES CORRIENTES A ENTES DECENTRALIZADOS CON FINES EMPRESARIALES NO PETROLEROS');


--
-- TOC entry 3300 (class 0 OID 20310)
-- Dependencies: 216
-- Data for Name: generico; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.generico VALUES (1, '4.02.01.00.00', 'PRODUCTOS ALIMENTICIOS Y AGROPECUARIOS', 1);
INSERT INTO public.generico VALUES (2, '4.02.02.00.00', 'PRODUTOS DE MINAS, CANTERAS Y YACIMIENTOS', 1);
INSERT INTO public.generico VALUES (3, '4.02.03.00.00', 'TEXTILES Y VESTUARIOS', 1);
INSERT INTO public.generico VALUES (4, '4.02.04.00.00', 'PRODUCTOS DE CUERO Y CAUCHO', 1);
INSERT INTO public.generico VALUES (5, '4.02.05.00.00', 'PRODUCTOS DE PAPEL, CARTÓN E IMPRESOS', 1);
INSERT INTO public.generico VALUES (6, '4.02.06.00.00', 'PRODUCTOS QUIMICOS Y DERIVADOS', 1);
INSERT INTO public.generico VALUES (7, '4.02.07.00.00', 'PRODUCTOS MINERALES NO METALICOS', 1);
INSERT INTO public.generico VALUES (8, '4.02.08.00.00', 'PRODUCTOS METALICOS', 1);
INSERT INTO public.generico VALUES (9, '4.02.10.00.00', 'PRODUCTOS VARIOS Y UTILES DIVERSOS', 1);
INSERT INTO public.generico VALUES (10, '4.02.99.00.00', 'OTROS MATERIALES Y SUMINISTROS', 1);
INSERT INTO public.generico VALUES (11, '4.03.01.00.00', 'ALQUILERES DE INMUEBLES', 2);
INSERT INTO public.generico VALUES (12, '4.03.02.00.00', 'ALQUILERES DE MAQUINARIA Y EQUIPOS', 2);
INSERT INTO public.generico VALUES (13, '4.03.03.00.00', 'DERECHOS SOBRE BIENES INTANGIBLES', 2);
INSERT INTO public.generico VALUES (14, '4.03.04.00.00', 'SERVICIOS BASICOS', 2);
INSERT INTO public.generico VALUES (15, '4.03.06.00.00', 'SERVICIO DE TRANSPORTE Y ALMACENAJE', 2);
INSERT INTO public.generico VALUES (16, '4.03.07.00.00', 'SERVICIOS DE INFORMACIÓN, IMPRESIÓN Y RELACIONES PÚBLICAS ', 2);
INSERT INTO public.generico VALUES (17, '4.03.08.00.00', 'PRIMAS Y OTROS GASTOS DE SEGUROS Y COMISIONES BANCARIAS', 2);
INSERT INTO public.generico VALUES (18, '4.03.09.00.00', 'VIÁTICOS Y PASAJES', 2);
INSERT INTO public.generico VALUES (19, '4.03.10.00.00', 'SERVICIOS PROFESIONALES Y TÉCNICOS', 2);
INSERT INTO public.generico VALUES (20, '4.03.11.00.00', 'CONSERVACIÓN Y REPARACIONES MENORES DE MAQUINARIA Y EQUIPOS', 2);
INSERT INTO public.generico VALUES (21, '4.03.12.00.00', 'CONSERVACIÓN Y REPARACIONES MENORES DE OBRAS', 2);
INSERT INTO public.generico VALUES (22, '4.03.15.00.00', 'SERVICIOS FISCALES', 2);
INSERT INTO public.generico VALUES (23, '4.03.16.00.00', 'SERVICIOS DE DIVERSIÓN, ESPARCIMIENTO Y CULTURALES', 2);
INSERT INTO public.generico VALUES (25, '4.03.99.00.00', 'OTROS SERVICIOS NO PERSONALES ', 2);
INSERT INTO public.generico VALUES (26, '4.04.01.00.00', 'RESPUESTOS Y REPARACIONES MAYORES', 3);
INSERT INTO public.generico VALUES (27, '4.04.03.00.00', 'MAQUINARÍA Y DEMÁS EQUIPOS DE CONSTRUCCIÓN, CAMPO, INDUSTRIA Y TALLER ', 3);
INSERT INTO public.generico VALUES (28, '4.04.04.00.00', 'EQUIPOS DE TRASNPORTE, TRACCION Y ELEVACION', 3);
INSERT INTO public.generico VALUES (29, '4.04.05.00.00', 'EQUIPOS DE COMUNICACIONES Y DE SEÑALAMIENTO', 3);
INSERT INTO public.generico VALUES (30, '4.04.07.00.00', 'EQUIPOS CIENTÍFICOS, RELIGIOSOS, DE ENSEÑANZA Y RECREACUIÓN ', 3);
INSERT INTO public.generico VALUES (31, '4.04.09.00.00', 'MÁQUINAS, MUEBLES Y DEMÁS EQUIPOS DE OFICINA Y ALOJAMIENTO', 3);
INSERT INTO public.generico VALUES (32, '4.04.12.00.00', 'ATIVOS INTANGIBLES', 3);
INSERT INTO public.generico VALUES (33, '4.04.99.00.00', 'OTROS ACTIVOS REALES', 3);
INSERT INTO public.generico VALUES (34, '4.02.09.00.00', 'Productos de madera', 1);
INSERT INTO public.generico VALUES (35, '4.04.11.00.00', 'Inmuebles, maquinaria y equipos usados', 3);
INSERT INTO public.generico VALUES (36, '4.04.15.00.00', 'Construcciones del dominio privado', 3);
INSERT INTO public.generico VALUES (37, '4.08.01.00.00', 'Depreciación y amortización', 4);
INSERT INTO public.generico VALUES (39, '4.07.01.00.00', 'Transferencias y donaciones corrientes internas', 5);
INSERT INTO public.generico VALUES (41, '4.01.07.00.00', 'Asistencia socio-económica', 6);
INSERT INTO public.generico VALUES (40, '4.04.06.00.00', 'Equipos médico - quirúrgicos, dentales y de veterinaria', 3);
INSERT INTO public.generico VALUES (42, '4.07.02.00.00', 'Transferencias y donaciones corrientes al exterior', 5);
INSERT INTO public.generico VALUES (43, '4.01.01.18.02', 'Remuneraciones por Honorarios profesionales', 6);
INSERT INTO public.generico VALUES (24, '4.03.18.00.00', 'IMPUESTOS INDIRECTOSuuuuuu', 2);
INSERT INTO public.generico VALUES (44, '4.04.12.04.00', 'Paquetes y Programas de Computación', 3);
INSERT INTO public.generico VALUES (45, '4.04.09.99.00', 'Otras Maquinas, Muebles y demás equipos de oficina y alojamiento ', 3);
INSERT INTO public.generico VALUES (46, '4.02.08.07.00', 'Material de señalamiento', 1);
INSERT INTO public.generico VALUES (47, '4.04.02.00.00', 'Conservación, ampliaciones y mejoras mayores de obras', 3);


--
-- TOC entry 3302 (class 0 OID 20318)
-- Dependencies: 218
-- Data for Name: gerencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.gerencia VALUES (3, 'GERENCIA DE MEDIOS COMUNITARIOS Y ALTERNATIVOS', true);
INSERT INTO public.gerencia VALUES (12, 'GERENCIA DE SEGUIMIENTO REGULATORIO', true);
INSERT INTO public.gerencia VALUES (13, 'GERENCIA DE RECAUDACION Y FISCALIZACION', true);
INSERT INTO public.gerencia VALUES (23, 'OFICINA DE ENLACE DE LA FUERZA ARMADA NACIONAL BOLIVARIANA', true);
INSERT INTO public.gerencia VALUES (25, 'GERENCIA DE MONITORIZACION SEGUIMIENTO E INVESTIGACION DE MEDIOS DE COMUNICACION', true);
INSERT INTO public.gerencia VALUES (26, 'GERENCIA DE FOMENTO AUDIOVISUAL', true);
INSERT INTO public.gerencia VALUES (32, 'GERENCIA GENERAL DE OPERACIONES', true);
INSERT INTO public.gerencia VALUES (6, 'GERENCIA DE OBRAS Y SERVICIOS', true);
INSERT INTO public.gerencia VALUES (36, 'GERENCIA DE PLANIFICACIÓN E INGENIERÍA DE NEGOCIOS', true);
INSERT INTO public.gerencia VALUES (16, 'OFICINA DE INFORMACION ESTADISTICA Y GEOGRAFIA', true);
INSERT INTO public.gerencia VALUES (11, 'GERENCIA DE GESTIÓN DE SERVICIOS DE TELECOMUNICACIONES', true);
INSERT INTO public.gerencia VALUES (33, 'CONSULTORIA JURIDICA', true);
INSERT INTO public.gerencia VALUES (31, 'OFICINA DE GESTIÓN ADMNISTRATIVA', true);
INSERT INTO public.gerencia VALUES (35, 'OFICINA DE ATENCION AL CIUDADANO', true);
INSERT INTO public.gerencia VALUES (39, 'OFICINA DE PROTECCION Y SEGURIDAD INTEGRAL', true);
INSERT INTO public.gerencia VALUES (17, 'OFICINA DE SISTEMA Y TECNOLOGIA DE LA INFORMACION', true);
INSERT INTO public.gerencia VALUES (37, 'GERENCIA DE ADMINISTRACION DE NOMBRES DE DOMINIO NIC.VE', true);
INSERT INTO public.gerencia VALUES (10, 'GERENCIA DE PLANIFICACION Y DESARROLLO DEL SECTOR TELECOMUNICACIONES', true);
INSERT INTO public.gerencia VALUES (38, 'GERENCIA DE REGIONES', true);
INSERT INTO public.gerencia VALUES (34, 'UNIDAD DE AUDITORIA INTERNA', true);
INSERT INTO public.gerencia VALUES (5, 'GERENCIA DE FORMACION', true);
INSERT INTO public.gerencia VALUES (24, 'GERENCIA DE RESPONSABILIDAD SOCIAL Y PARTICIPACION CIUDADANA', true);
INSERT INTO public.gerencia VALUES (4, 'OFICINA DE GESTION HUMANA', true);
INSERT INTO public.gerencia VALUES (19, 'OFICINA DE GESTIÓN ADMNISTRATIVA/FINANZAS', true);
INSERT INTO public.gerencia VALUES (40, 'OFICINA DE GESTIÓN ADMNISTRATIVA/ADQUISICION Y SUMINISTROS', true);
INSERT INTO public.gerencia VALUES (41, 'GERENCIA DE RESPONSABILIDAD SOCIAL Y PARTICIPACION CIUDADANA / FRS', true);
INSERT INTO public.gerencia VALUES (42, 'GERENCIA DE PLANIFICACION Y DESARROLLO DEL SECTOR TELECOMUNICACIONES / FSU', true);
INSERT INTO public.gerencia VALUES (43, 'OFICINA DE GESTION ADMINISTRATIVA/ SERVICIOS GENERALES', true);
INSERT INTO public.gerencia VALUES (2, 'GERENCIA DEL FONDO DE SERVICIO UNIVERSAL', true);
INSERT INTO public.gerencia VALUES (29, 'OFICINA DE GESTIÓN COMUNICACIONAL', true);
INSERT INTO public.gerencia VALUES (7, 'OFICINA DE PLANIFICACION, PRESUPUESTO Y SEGUIMIENTO DE LA GESTION', true);


--
-- TOC entry 3305 (class 0 OID 20329)
-- Dependencies: 221
-- Data for Name: iva; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.iva VALUES (4, 8);
INSERT INTO public.iva VALUES (5, 0);
INSERT INTO public.iva VALUES (1, 16);


--
-- TOC entry 3307 (class 0 OID 20334)
-- Dependencies: 223
-- Data for Name: medida; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.medida VALUES (221, 'Tarjeta');
INSERT INTO public.medida VALUES (223, 'ml');
INSERT INTO public.medida VALUES (5, 'AMPOLLA');
INSERT INTO public.medida VALUES (224, 'TALONARIO');
INSERT INTO public.medida VALUES (226, 'BOBINA');
INSERT INTO public.medida VALUES (228, 'PAQUETE 50 ');
INSERT INTO public.medida VALUES (230, 'RESMA');
INSERT INTO public.medida VALUES (12, 'AMPOLLA DE 2 ml');
INSERT INTO public.medida VALUES (232, 'Donacion');
INSERT INTO public.medida VALUES (233, 'SERVICIO');
INSERT INTO public.medida VALUES (15, 'AMPOLLA DE 3 ml');
INSERT INTO public.medida VALUES (242, 'Torre');
INSERT INTO public.medida VALUES (244, 'LICENCIAS');
INSERT INTO public.medida VALUES (246, 'HORA');
INSERT INTO public.medida VALUES (248, 'BULTO');
INSERT INTO public.medida VALUES (0, 'sin medida');
INSERT INTO public.medida VALUES (28, 'CAJA');
INSERT INTO public.medida VALUES (29, 'CÁPSULA');
INSERT INTO public.medida VALUES (30, 'CÁPSULA BLANDA');
INSERT INTO public.medida VALUES (36, 'COMPRIMIDO');
INSERT INTO public.medida VALUES (39, 'DOCENA');
INSERT INTO public.medida VALUES (61, 'FRASCO AMPOLLA DE 100 mg');
INSERT INTO public.medida VALUES (63, 'FRASCO AMPOLLA DE 1200000 UI');
INSERT INTO public.medida VALUES (75, 'FRASCO');
INSERT INTO public.medida VALUES (85, 'FRASCO DE 120 ml');
INSERT INTO public.medida VALUES (88, 'FRASCO DE 15 ml');
INSERT INTO public.medida VALUES (116, 'g');
INSERT INTO public.medida VALUES (117, 'Galon');
INSERT INTO public.medida VALUES (135, 'Kg');
INSERT INTO public.medida VALUES (136, 'Kit');
INSERT INTO public.medida VALUES (139, 'Lt');
INSERT INTO public.medida VALUES (146, 'PAQUETE');
INSERT INTO public.medida VALUES (148, 'pieza');
INSERT INTO public.medida VALUES (149, 'Rollo');
INSERT INTO public.medida VALUES (150, 'Saco');
INSERT INTO public.medida VALUES (162, 'SUSPENSION');
INSERT INTO public.medida VALUES (163, 'TABLETA');
INSERT INTO public.medida VALUES (220, 'Bolsa');
INSERT INTO public.medida VALUES (165, 'TUBO');
INSERT INTO public.medida VALUES (222, 'Metros');
INSERT INTO public.medida VALUES (225, 'INFORME');
INSERT INTO public.medida VALUES (227, 'PIEZA');
INSERT INTO public.medida VALUES (229, 'PAQUETE 50 ');
INSERT INTO public.medida VALUES (231, 'ACTIVIDADES DEPORTIVAS');
INSERT INTO public.medida VALUES (234, 'CREMA');
INSERT INTO public.medida VALUES (235, 'JARABE');
INSERT INTO public.medida VALUES (236, 'GOTAS');
INSERT INTO public.medida VALUES (237, 'UNGUENTO');
INSERT INTO public.medida VALUES (238, 'OVULOS');
INSERT INTO public.medida VALUES (239, 'VIALES');
INSERT INTO public.medida VALUES (240, 'SOBRE');
INSERT INTO public.medida VALUES (179, 'UNIDAD');
INSERT INTO public.medida VALUES (241, 'FRASCO');
INSERT INTO public.medida VALUES (641, 'Viaje');
INSERT INTO public.medida VALUES (181, 'Servicio');
INSERT INTO public.medida VALUES (182, 'Juegos');
INSERT INTO public.medida VALUES (183, 'Litro');
INSERT INTO public.medida VALUES (243, 'DIETA');
INSERT INTO public.medida VALUES (188, 'Solución');
INSERT INTO public.medida VALUES (245, 'CURSO');
INSERT INTO public.medida VALUES (247, 'Tm Tonelada Métrica');
INSERT INTO public.medida VALUES (192, 'Par');
INSERT INTO public.medida VALUES (193, 'caja');
INSERT INTO public.medida VALUES (196, 'Suspension');
INSERT INTO public.medida VALUES (197, '20 cc');
INSERT INTO public.medida VALUES (198, '10 cc');
INSERT INTO public.medida VALUES (199, '5 cc');
INSERT INTO public.medida VALUES (200, '3 cc');
INSERT INTO public.medida VALUES (201, 'CUÑETE');
INSERT INTO public.medida VALUES (202, 'sobre');
INSERT INTO public.medida VALUES (203, 'Ampolla 40mg');
INSERT INTO public.medida VALUES (205, '20 tabletas');
INSERT INTO public.medida VALUES (206, 'Conjunto');
INSERT INTO public.medida VALUES (210, 'Balòn');
INSERT INTO public.medida VALUES (213, 'TRANSFERENCIAS');
INSERT INTO public.medida VALUES (214, 'PAQUETES 100 UNID');
INSERT INTO public.medida VALUES (216, 'MERCADO');
INSERT INTO public.medida VALUES (217, 'SISTEMA');
INSERT INTO public.medida VALUES (218, 'PAQUETES 12');
INSERT INTO public.medida VALUES (219, 'Bolsa (20Kg),');
INSERT INTO public.medida VALUES (2, 'FRASCO DE 5 ml');


--
-- TOC entry 3331 (class 0 OID 20665)
-- Dependencies: 247
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.menu VALUES (1, 'Accion Especifica', NULL, '/accion/index', 2, NULL, 'book');
INSERT INTO public.menu VALUES (5, 'Actividades', NULL, '/actividades/index', 3, NULL, 'edit');
INSERT INTO public.menu VALUES (2, 'Menu', NULL, '/admin/menu/index', 10, NULL, 'ellipsis-v');
INSERT INTO public.menu VALUES (6, 'Base de Calculo', NULL, '/basecalculo/index', 4, NULL, 'calculator');
INSERT INTO public.menu VALUES (4, 'Formulacion', NULL, '/poa/index', NULL, NULL, 'book-open');


--
-- TOC entry 3309 (class 0 OID 20342)
-- Dependencies: 225
-- Data for Name: migration; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.migration VALUES ('m000000_000000_base', 1658253533);
INSERT INTO public.migration VALUES ('m140506_102106_rbac_init', 1658253578);
INSERT INTO public.migration VALUES ('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1658253578);
INSERT INTO public.migration VALUES ('m180523_151638_rbac_updates_indexes_without_prefix', 1658253578);
INSERT INTO public.migration VALUES ('m200409_110543_rbac_update_mssql_trigger', 1658253578);
INSERT INTO public.migration VALUES ('m140602_111327_create_menu_table', 1658280316);
INSERT INTO public.migration VALUES ('m160312_050000_create_user', 1658280316);


--
-- TOC entry 3312 (class 0 OID 20349)
-- Dependencies: 228
-- Data for Name: partida; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.partida VALUES (1, '4.02.00.00.00', 'MATERIALES, SUMINISTRO Y MERCANCIAS');
INSERT INTO public.partida VALUES (2, '4.03.00.00.00', 'SERVICIOS NO PERSONALES');
INSERT INTO public.partida VALUES (3, '4.04.00.00.00', 'ACTIVOS REALES');
INSERT INTO public.partida VALUES (4, '4.08.00.00.00', 'OTROS GASTOS');
INSERT INTO public.partida VALUES (5, '4.07.00.00.00', 'Transferencias y donaciones');
INSERT INTO public.partida VALUES (6, '4.01.00.00.00', 'GASTOS DE PERSONAL');


--
-- TOC entry 3313 (class 0 OID 20356)
-- Dependencies: 229
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.perfil VALUES (1, 'ADMINISTRADOR');
INSERT INTO public.perfil VALUES (2, 'USUARIO');


--
-- TOC entry 3293 (class 0 OID 20282)
-- Dependencies: 209
-- Data for Name: poa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.poa VALUES (91, 'DIRECCIÓN Y COORDINACIÓN DE LOS GASTOS DE LOS TRABAJADORES', '', NULL, 'ADMIN ADMIN', 1, NULL, 7);
INSERT INTO public.poa VALUES (92, 'GESTIÓN ADMINISTRATIVA', '', NULL, 'ADMIN ADMIN', 1, NULL, 7);
INSERT INTO public.poa VALUES (93, 'PREVISIÓN Y PROTECCIÓN SOCIAL', '', NULL, 'ADMIN ADMIN', 1, NULL, 7);
INSERT INTO public.poa VALUES (94, 'proyecto 1', 'esta es una prueba con el proyecto 1', NULL, 'ADMIN ADMIN', 2, NULL, 17);
INSERT INTO public.poa VALUES (96, 'accion centralizada', '', NULL, 'ADMIN ADMIN', 1, NULL, 17);
INSERT INTO public.poa VALUES (97, 'proyecto 2', 'objetivo del proyecto 2', NULL, 'ADMIN ADMIN', 2, NULL, 17);
INSERT INTO public.poa VALUES (99, 'proyecto 3', 'objetivo del proyecto 3', NULL, 'ADMIN ADMIN', 2, NULL, 17);


--
-- TOC entry 3316 (class 0 OID 20366)
-- Dependencies: 232
-- Data for Name: presu_partida; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3319 (class 0 OID 20378)
-- Dependencies: 235
-- Data for Name: requerimiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.requerimiento VALUES (13, 'Ceras para pisos', 139, 29, 1);
INSERT INTO public.requerimiento VALUES (3522, 'VENSOL U OPOLIN', 201, 29, 1);
INSERT INTO public.requerimiento VALUES (3524, 'CONCUR (FULLER) PARA LIMPIAR PORCELANATO', 117, 29, 1);
INSERT INTO public.requerimiento VALUES (3525, 'LIMPIAVIDRIO', 117, 29, 1);
INSERT INTO public.requerimiento VALUES (3528, 'MADEROL   O PRIDE', 179, 29, 1);
INSERT INTO public.requerimiento VALUES (5080, 'Prueba12', 217, 3, 1);
INSERT INTO public.requerimiento VALUES (3533, 'CANILLA PARA LAVAMANOS ½ X ½', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3534, 'LLAVES P/LAVAMANOS DOBLE', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3535, 'CANILLA P/POCETA  ¾ X ½', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3545, 'FLOTANTE ELECTRICO P AGUAS SERVIDAS', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3546, 'FLOTANTE ELECTRICO P/AGUA BLANCAS', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3548, 'VALVULA CHECK DE 2 /12 “', 220, 37, 1);
INSERT INTO public.requerimiento VALUES (3551, 'TAPA PARA POCETA', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3553, 'GRIFERIA DE FREGADERO', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3554, 'TAPON DE ½ Y ¾', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3555, 'BAJANTE P/FREGADERO 1 ¼', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3556, 'BREACKER 2X 30 HQC', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3557, 'BREACKER 2X40 HQC', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3558, 'BREACKER 1X30 HQC', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3559, 'BREACKER 1X20 HQC', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3560, 'EXTENSION ELECTRICA  DE 10 METROS', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3561, 'EXTENSION ELECTRICA 06 METROS', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3572, 'CURVA P/TUBERIA PAVCO ½ (90°)', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3573, 'CURVA P/TUBERIA PAVCO 3/4 (90°)', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3574, 'CURVA P/TUBERIA PAVCO ½ (45°)', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3580, 'CAJETIN 4X2 METAL ( COMBINADO)', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3583, 'CAJETIN 4X2 PAVCO(COMBINADO)', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3584, 'CAJETIN 4X2 METAL ( SUPERFICIAL )', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3593, 'TEIPE COBRA NEGRO', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3596, 'SOCATE CON ROSCA ( CERAMICA)', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3597, 'BOMBILLO Pl 13 CORTO', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3598, 'BOMBILLO CIRCULAR NEON 22W', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3599, 'BOMBILLO DICROICO LED 50W -110V', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3600, 'BOMBILLO TUBULAR DE 32W', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3601, 'BOMBILLO DE ROSCA 15W', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3602, 'BOMBILLO DE ROSCA 26W', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3603, 'BOMBILLO DE VAPOR DE SODIO 400W', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3607, 'CABLE N° 12 THW COLOR ROJO', 149, 36, 1);
INSERT INTO public.requerimiento VALUES (3608, 'CABLE N° 12 THW COLOR BLANCO', 149, 36, 1);
INSERT INTO public.requerimiento VALUES (3610, 'CABLE N° 10 THW COLOR ROJO O NEGRO', 149, 36, 1);
INSERT INTO public.requerimiento VALUES (3611, 'CABLE N° 10 THW COLOR BLANCO', 149, 36, 1);
INSERT INTO public.requerimiento VALUES (3612, 'CABLE N° 10 THW COLOR VERDE', 149, 36, 1);
INSERT INTO public.requerimiento VALUES (3613, 'CABLE N° 08 THW COLOR BLANCO', 149, 36, 1);
INSERT INTO public.requerimiento VALUES (3539, 'SIFON P /LAVAMANOS CORRUGADO 1 1/4', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3540, 'BAJANTE P/ LAVAMANOS', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3541, 'PEGA PAVCO AGUAS BLANCAS ALTA PRESION', 117, 37, 1);
INSERT INTO public.requerimiento VALUES (3542, 'LLAVE DE PASO  ½', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3543, 'LLAVE DE PASO ¾', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3544, 'LLAVE DE CHORRO PASE RAPIDO ½', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3536, 'LLAVES DE ARRESTO DE ½', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3547, 'VALVULA CHECK DE 2”', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3615, 'ARENA LAVADA', 220, 3, 1);
INSERT INTO public.requerimiento VALUES (3616, 'POLVILLO LIGADO', 220, 3, 1);
INSERT INTO public.requerimiento VALUES (3538, 'SIFON P /LAVAMANOS CORRUGADO 1 ½', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3595, 'TOMA CON TAPA', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3588, 'CINTA DOBLE FAX (3M) ½', 149, 38, 1);
INSERT INTO public.requerimiento VALUES (3519, 'LAVAPLATOS', 117, 29, 1);
INSERT INTO public.requerimiento VALUES (3520, 'DESENGRASANTE', 201, 29, 1);
INSERT INTO public.requerimiento VALUES (3576, 'CONECTORESP/TUBERIA DE METAL ½', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3549, 'VALVULA PARA FLUXOMETRO URINARIO', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3515, 'PAÑITOS AMARILLOS', 179, 4, 1);
INSERT INTO public.requerimiento VALUES (3517, 'LANA  ACERO N° 5', 179, 22, 1);
INSERT INTO public.requerimiento VALUES (3568, 'CONECTORES P/TUBERIA PAVCO ½', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3562, 'FLEXICON ( TUBERIA CORRUGADA ½)', 149, 37, 1);
INSERT INTO public.requerimiento VALUES (3550, 'VALVULA PARA FLUXOMETRO POCETA', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3582, 'TUBO DE ELECTRICIDAD METAL ¾', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3578, 'ANILLO P/TUBERIA DE METAL  ½', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3667, 'PICO P/BOMBONA GAS MAS', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (3633, 'TORNILLO P/DRYWALL 8X1', 193, 24, 1);
INSERT INTO public.requerimiento VALUES (3634, 'TORNILLO P/DRYWALL 8X2', 193, 24, 1);
INSERT INTO public.requerimiento VALUES (3635, 'TORNILLO CABEZA PLANA 6X1X1/2”', 193, 24, 1);
INSERT INTO public.requerimiento VALUES (3636, 'TORNILLO CABEZA PLANA 8X1X12”', 193, 24, 1);
INSERT INTO public.requerimiento VALUES (3652, 'TUBO DE COBRE 3/8', 149, 23, 1);
INSERT INTO public.requerimiento VALUES (3664, 'QUIMICO PARA LIMPIEZA DE A/A ( EVA 22)', 117, 24, 1);
INSERT INTO public.requerimiento VALUES (3659, 'ARMA FLEX ½', 149, 987, 1);
INSERT INTO public.requerimiento VALUES (3719, 'SERVICIO DE MANTENIMIENTO CORRECTIVO Y PREVENTIVO ASCENSORES', 181, 969, 1);
INSERT INTO public.requerimiento VALUES (3671, 'JUEGO DE LLAVE ALLEN (MILIMETRICA)', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (154, 'BOMBILLO FLUORESCENTE 3U 14W 120 V.', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3697, 'PROBADOR DE CORRIENTE ( TIPO DESTORNILLADOR)', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3704, 'LINTERNA  LED', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3618, 'MASTIQUE O PASTA PROFESIONAL', 201, 3, 1);
INSERT INTO public.requerimiento VALUES (3665, 'VARILLA DE PLATA', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3655, 'CAPACITOR DE ARRANQUE A/A 12 BTU', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3646, 'PROTECTOR AIRE ACONDICIONADO (220 V)', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3647, 'PROTECTOR PARA NEVERA (110)', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3624, 'DISCO DE CORTE DIAMANTE 4 ½', 179, 23, 1);
INSERT INTO public.requerimiento VALUES (3650, 'TUBO DE COBRE ½', 149, 23, 1);
INSERT INTO public.requerimiento VALUES (3620, 'CEMENTO GRIS', 150, 21, 1);
INSERT INTO public.requerimiento VALUES (3621, 'PEGO GRIS', 150, 21, 1);
INSERT INTO public.requerimiento VALUES (3622, 'LANA ACERO', 149, 22, 1);
INSERT INTO public.requerimiento VALUES (3623, 'CLAVO DE ACERO  2” Y 1/2”', 220, 24, 1);
INSERT INTO public.requerimiento VALUES (3626, 'DISCO DE TROSADORA DE 14 “', 179, 23, 1);
INSERT INTO public.requerimiento VALUES (3627, 'DISCO CORTE P/METAL 4 ½ (EXTRAFINO)', 179, 23, 1);
INSERT INTO public.requerimiento VALUES (3678, 'NIVEL 60 CM', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (3648, 'CAPUCHA PARA MANTENIMIENTO A/A', 179, 39, 1);
INSERT INTO public.requerimiento VALUES (3670, 'PICA TUBO DE COBRE', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3690, 'CINTA METRICA DE 5 METROS', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (3830, 'TACOS BLANCOS PARA NOTAS', 179, 10, 1);
INSERT INTO public.requerimiento VALUES (3673, 'DETECTOR DE FUGA ( A/A) ELECTRONICO', 179, 39, 1);
INSERT INTO public.requerimiento VALUES (3705, 'CAUTIN DE ELECTRICIDAD', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3711, 'EXACTO ', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3638, 'CERRADURA DE POMO C/ LLAVE', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (3632, 'RAMPLU PARA DRYWALL', 193, 38, 1);
INSERT INTO public.requerimiento VALUES (3637, 'CERRADURA DE POMO P/BAÑO', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (3639, 'MANILLA DE PALANCA /PARA PUERTA', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (3644, 'GUANTES DE CARNAZA LARGOS', 192, 34, 1);
INSERT INTO public.requerimiento VALUES (3692, 'LLAVE DE TUBO 12”', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3700, 'LLAVES AJUSTABLES ', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3526, 'CERA AUTOBRILLANTE', 201, 29, 1);
INSERT INTO public.requerimiento VALUES (3609, 'CABLE N° 12 THW COLOR VERDE', 149, 36, 1);
INSERT INTO public.requerimiento VALUES (3640, 'CILINDRO CISA', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (3686, 'LLANA LISA', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3687, 'LLANA DENTADA', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3689, 'CINTA METRICA 8 METROS', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (3675, 'CUCHARA 6 “', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3683, 'ESPATULA DE METAL 2”', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3628, 'CAL LIQUIDA', 220, 21, 1);
INSERT INTO public.requerimiento VALUES (3685, 'LLANA DE GOMA', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3680, 'CEGUETA', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3681, 'TOBO ALBAÑIL DE GOMA', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (3677, 'TENAZA  CORTA CERAMICA', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3682, 'MARTILLO DE OREJA', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3642, 'LENTES DE SEGURIDAD', 193, 34, 1);
INSERT INTO public.requerimiento VALUES (3749, 'ACONDICIONAMIENTO ESCALERAS DE EMERGENCIA SEDE II.', 181, 73, 1);
INSERT INTO public.requerimiento VALUES (3771, 'ramplús verde con tornillo', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (259, 'PASTA PROFESIONAL', 117, 21, 1);
INSERT INTO public.requerimiento VALUES (261, 'PINTURA DE ESMALTE', 117, 14, 1);
INSERT INTO public.requerimiento VALUES (3800, 'ELECTRODO Nº T6013 3/32', 135, 36, 1);
INSERT INTO public.requerimiento VALUES (279, 'VENTANAS PANORAMICA 1.20 X 1.00 M', 179, 25, 1);
INSERT INTO public.requerimiento VALUES (3893, 'CINTA PLASTICA PARA EMBALAR MARRON', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (3924, 'CAMARA FOTOGRAFICA MARCA CANON EOS 5D', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (3746, 'MANTENIMIENTO DE CERCO ELECTRICO AMBAS SEDES CONATEL', 181, 73, 1);
INSERT INTO public.requerimiento VALUES (3728, ' FUMIGACION ', 181, 68, 1);
INSERT INTO public.requerimiento VALUES (3740, 'REPARACION E INSTALACION DE BOMBA DE ACHIQUE', 181, 73, 1);
INSERT INTO public.requerimiento VALUES (3793, 'YESO', 150, 21, 1);
INSERT INTO public.requerimiento VALUES (3760, 'tornillo para drywall de 6x1', 28, 24, 1);
INSERT INTO public.requerimiento VALUES (3831, 'COTECNICA', 181, 48, 1);
INSERT INTO public.requerimiento VALUES (3747, ' SISTEMA DE DETECCION Y EXTINCION DE INCENDIOS SEDE II', 181, 68, 1);
INSERT INTO public.requerimiento VALUES (3739, 'MANTENIMIENTO DEL SISTEMA DE AIRE ACONDICIONADO PARA LAS SEDES ', 181, 1001, 1);
INSERT INTO public.requerimiento VALUES (3741, 'SERVICIO DE MANTENIMIENTO CORRECTIVO Y PREVENTIVO BOMBAS DE AGUAS BLANCAS Y SERVIDAS', 181, 1002, 1);
INSERT INTO public.requerimiento VALUES (3753, 'JUEGO DE SANITARIOS', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3925, 'CAMARA DE VIDEO', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4190, 'CACEROLA ALUMINIO 7 LITROS', 179, 30, 1);
INSERT INTO public.requerimiento VALUES (4254, 'ROLINERA', 227, 26, 1);
INSERT INTO public.requerimiento VALUES (4318, 'CAMARA DE SEGURIDAD', 179, 85, 1);
INSERT INTO public.requerimiento VALUES (4478, 'TABLA DIGITALIZADORA', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4730, 'CARTUCHO HP 4050 ', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4814, 'UNIDAD LECTORAS CD/DVD QUEMADORA  SAMSUNG', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (177, 'CAL HIDRATADA 20Kg', 150, 21, 1);
INSERT INTO public.requerimiento VALUES (4872, 'TUBERÍA CORRUGADA DE HIERRO ¾”', 179, 22, 1);
INSERT INTO public.requerimiento VALUES (3998, 'SERVICIO DE ELECTRICIDAD CORPOELEC NVA. ESPARTA ', 233, 44, 1);
INSERT INTO public.requerimiento VALUES (4960, 'EQUIPOS DE COCINA', 179, 90, 1);
INSERT INTO public.requerimiento VALUES (4930, 'CANTV', 233, 989, 1);
INSERT INTO public.requerimiento VALUES (4975, 'SERVICIO DE CONEXIÓN DUCTO BARRAS A TABLEROS ELECTRICOS', 179, 73, 1);
INSERT INTO public.requerimiento VALUES (5035, 'TECLADOS USB', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4637, 'TERMO POTAMO 22 LITROS                       ', 179, 30, 1);
INSERT INTO public.requerimiento VALUES (5065, 'DONACIONES A PERSONAS', 232, 993, 5);
INSERT INTO public.requerimiento VALUES (4027, 'BATA MASCULINA', 148, 986, 1);
INSERT INTO public.requerimiento VALUES (3895, 'CORRECTOR LIQUIDO AGUA TIPPEX', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (3926, 'MICROFONOS TIPO VALITAS', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (3966, 'tarjetas de memoria XQD ', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4159, 'PEGA ELEFANTE', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4447, 'APUNTADOR LASER', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (4542, 'STICK BANDERITAS', 218, 10, 1);
INSERT INTO public.requerimiento VALUES (4638, 'TABLA PARA PICAR        ', 179, 30, 1);
INSERT INTO public.requerimiento VALUES (4669, 'CEPILLO LIMPIADOR DE POCETAS', 179, 29, 1);
INSERT INTO public.requerimiento VALUES (4700, 'LIGAS PEQUEÑAS', 146, 32, 1);
INSERT INTO public.requerimiento VALUES (4731, 'CARTUCHO HP 920XL', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4815, 'VIDEO BEAM EPSON', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4845, 'PINTURAS ACRILICAS', 201, 14, NULL);
INSERT INTO public.requerimiento VALUES (3104, 'MULTITESTER ANALOGICO', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (4901, 'BLANCO DE LLAVES PARA CERRAJERIA', 214, 24, 1);
INSERT INTO public.requerimiento VALUES (3999, 'SERVICIO DE ELECTRICIDAD CORPOELEC CAPITAL', 233, 44, 1);
INSERT INTO public.requerimiento VALUES (4931, 'CANTV SERVICIO DE COMUNICACIONES', 233, 47, 1);
INSERT INTO public.requerimiento VALUES (4976, 'SERVICIO ADECUACION ARCHIMOVIL  ', 179, 68, 1);
INSERT INTO public.requerimiento VALUES (482, 'DICLOFENAC SODICO (1 mg / ml)', 2, 15, 5);
INSERT INTO public.requerimiento VALUES (5036, 'MOUSE USB', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (5066, 'DONACIONES A ENTES DESCENTRALIZADOS SIN FINES EMPRESARIALES', 232, 995, NULL);
INSERT INTO public.requerimiento VALUES (4028, 'BATA FEMENINA', 227, 986, 1);
INSERT INTO public.requerimiento VALUES (3896, 'ENGRAPADORA MANUAL TIPO ALICATE', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (3927, 'MICROFONOS TIPO INALAMBRICOS', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4192, 'CACEROLA ALUMINIO 9 LITROS', 179, 30, 1);
INSERT INTO public.requerimiento VALUES (4670, 'LIMPIADOR MULTIUSO O ANTIGRASA', 179, 29, 1);
INSERT INTO public.requerimiento VALUES (4701, 'LIGAS GRANDES', 146, 32, 1);
INSERT INTO public.requerimiento VALUES (4732, 'ACEITE MOTOR 5W 20', 179, 17, NULL);
INSERT INTO public.requerimiento VALUES (4816, 'CANTV ABA HUAWEI', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4846, 'pintura basica', 117, 14, 1);
INSERT INTO public.requerimiento VALUES (4902, 'CAMIONES CISTERNAS 9000 LTS', 179, 78, 1);
INSERT INTO public.requerimiento VALUES (3834, 'CONDOMINIO TORRE FONDO COMUN', 181, 49, 1);
INSERT INTO public.requerimiento VALUES (4000, 'SERVICIO DE ELECTRICIDAD CORPOELEC LARA ', 233, 44, 1);
INSERT INTO public.requerimiento VALUES (5007, 'LAMINAS DE PLYCEM', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (5037, 'MONITORES', NULL, 89, 1);
INSERT INTO public.requerimiento VALUES (4873, 'LIJAS', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (4977, 'SERVICIO REPARACION ESCALERAS DE EMERGENCIA                                   ', 179, 73, 1);
INSERT INTO public.requerimiento VALUES (4480, 'PIZARRA ACRILICA', 179, 88, 1);
INSERT INTO public.requerimiento VALUES (4160, 'SILICOM LIQUIDO', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (5067, 'DONACIONES A ENTES DESCENTRALIZADOS CON FINES EMPRESARIALES NO PETROLEROS', 232, 1005, NULL);
INSERT INTO public.requerimiento VALUES (605, 'PENICILINA G BENZATINICA (1.200.000 UI)', 63, 15, 5);
INSERT INTO public.requerimiento VALUES (3835, 'IMPRENTA Y REPRODUCCION', 224, 55, 1);
INSERT INTO public.requerimiento VALUES (648, 'HIDROCORTISONA (100 mg)', 61, 15, 5);
INSERT INTO public.requerimiento VALUES (3897, 'GOMA PARA BORRAR MAYKA NATA', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (3968, 'Cámara Canon EOS 5D Mark IV ', 179, 85, 1);
INSERT INTO public.requerimiento VALUES (4257, 'IMPRESORA MULTIFUNCIONAL HP OFFICE PRO 7740', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4321, 'PENDONES', 179, 54, 1);
INSERT INTO public.requerimiento VALUES (4417, 'JUEGO DE CABLES DE BUJIAS UNIDAD MOVIL ', 182, 26, 1);
INSERT INTO public.requerimiento VALUES (4481, 'ADOBE AFTER EFFECT', 217, 91, 1);
INSERT INTO public.requerimiento VALUES (4817, 'SUICHE DE 8 PUERTOS', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (4225, 'TENEDOR DE ALAMBRE TRINCHANTE 3 PUNTAS 52 CM', 227, 30, 1);
INSERT INTO public.requerimiento VALUES (4933, 'GOMA DE ALIMENTACION HP M551N', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4963, 'EXTENSIONES ELECTRICAS DE 10 METROS QUE SOPORTEN MAS 11.81 AMP ', 222, 36, 1);
INSERT INTO public.requerimiento VALUES (5008, 'PLETINAS', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (199, 'BLOQUES DE ARCILLA 10X20X30', 179, 20, 1);
INSERT INTO public.requerimiento VALUES (260, 'PINTURA DE CAUCHO CLASE C', 117, 14, 1);
INSERT INTO public.requerimiento VALUES (4874, 'LAVAMANOS + WC', 182, 37, 1);
INSERT INTO public.requerimiento VALUES (669, 'ACETAMINOFEN (100 mg / ml)', 28, 15, 5);
INSERT INTO public.requerimiento VALUES (4978, 'MOTOR PARA VEHICULO', 179, 80, 1);
INSERT INTO public.requerimiento VALUES (5006, 'LAMINAS DE DRY WALL', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (4025, 'CAUCHOS PARA MOTOS', 179, 7, 1);
INSERT INTO public.requerimiento VALUES (5038, 'CABLES USB', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4001, 'SERVICIO DE GAS PDVSA', 233, 45, 1);
INSERT INTO public.requerimiento VALUES (4161, 'SILICOM EN BARRA', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (5068, 'VEHICULOS', 179, 83, 1);
INSERT INTO public.requerimiento VALUES (3836, 'SERVICIO DE CONTABILIDAD Y AUDITORIA', 225, 63, 4);
INSERT INTO public.requerimiento VALUES (4162, 'PISTOLA DE SILICOM', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4290, 'EQUIPO PROFESIONAL DE RCP', 179, 979, 1);
INSERT INTO public.requerimiento VALUES (4482, 'ADOBE LIGHT ROOM', 217, 91, 1);
INSERT INTO public.requerimiento VALUES (4545, 'DESHUMIFICADOR ELECTRICO', 179, 979, 1);
INSERT INTO public.requerimiento VALUES (4609, 'CARTELERA DE CORCHO ', 179, 88, 1);
INSERT INTO public.requerimiento VALUES (4734, 'ACEITE SEMI SINTETICO 15W 40', 179, 17, 5);
INSERT INTO public.requerimiento VALUES (4818, 'MALETA DE HERRAMIENTAS', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (4875, 'SIFON PLASTICO', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3111, 'SERVICIOS DE CAPACITACION Y ADIESTRAMIENTO', 246, 65, 1);
INSERT INTO public.requerimiento VALUES (4904, 'SILLAS ERGONOMICAS, TIPO EJECUTIVAS', 179, 88, 1);
INSERT INTO public.requerimiento VALUES (4979, 'CANTV', 181, 47, 1);
INSERT INTO public.requerimiento VALUES (5009, 'ELECTRODOS', 135, 36, 1);
INSERT INTO public.requerimiento VALUES (5039, 'CHICHARRA GENERADORA DE TONO', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (5069, 'REPOTENCIACIÓN DE MOTOR', 179, 969, 1);
INSERT INTO public.requerimiento VALUES (4031, 'CAMISA DE VESTIR FEMENINA', 227, 986, 1);
INSERT INTO public.requerimiento VALUES (3962, 'Donaciones corrientes a entes decentralizados sin fines empresariales', 232, 995, 5);
INSERT INTO public.requerimiento VALUES (858, 'DEXAMETASONA (4 mg)', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4163, 'FOAMI', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4195, 'OLLA ARROZERA 42.5 LITROS', 179, 30, 1);
INSERT INTO public.requerimiento VALUES (4291, 'CHALECO DE PRIMEROS AUXILIOS', 179, 34, 1);
INSERT INTO public.requerimiento VALUES (864, 'TIOCOLCHICOSIDO (4 mg / 2 ml)', 12, 15, 5);
INSERT INTO public.requerimiento VALUES (4483, 'ADOBE PHOTOSHOP', 217, 91, 1);
INSERT INTO public.requerimiento VALUES (4610, 'ARTURITO', 179, 88, 1);
INSERT INTO public.requerimiento VALUES (4673, 'TELÉFONOS CON PANTALLA', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4735, 'MODEN', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4819, 'CAUTIN SOLDADOR', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (4789, 'ANALIZADOR DE ESPECTRO', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (3837, 'COMISIONES Y GASTOS BANCARIOS', 181, 59, 5);
INSERT INTO public.requerimiento VALUES (4849, 'PINTURA ELASTOMERICA', 201, 14, 1);
INSERT INTO public.requerimiento VALUES (4876, 'LLAVES DE PASO RAPIDO', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (4905, 'ESCRITORIO DE MADERA CON TRES GAVETAS', 179, 88, 1);
INSERT INTO public.requerimiento VALUES (4935, 'KIT DE MANTENIMIENTO DE FUSOR C9152A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4964, 'FRANELAS MANGA 3/4 POR 30', 179, 5, 1);
INSERT INTO public.requerimiento VALUES (4980, 'SUMINISTRO E INSTALACION DE MOTOR PARA TACOMA', 181, 984, 1);
INSERT INTO public.requerimiento VALUES (5010, 'DUCHA MARINA', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (4003, 'SERVICIO DE AGUA HIDROLARA', 233, 974, 1);
INSERT INTO public.requerimiento VALUES (5070, 'LATONERÍA Y PINTURA', 179, 969, 1);
INSERT INTO public.requerimiento VALUES (3866, 'REVISION Y REPARACION DE AIRE ACONDIONADO DE LA CUADRA DE SEGUIRIDAD EN SOTANO 1 SEDE II CONATEL', 181, 71, 1);
INSERT INTO public.requerimiento VALUES (3900, 'LAPICES DE GRAFITO Nº2', 39, 32, 1);
INSERT INTO public.requerimiento VALUES (4292, 'PANTALON TIPO RANGER', 179, 5, 1);
INSERT INTO public.requerimiento VALUES (4452, 'DECODIFICADORES TDA', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4484, 'ADOBE PREMIER', 217, 91, 1);
INSERT INTO public.requerimiento VALUES (4611, 'ESCRITORIO DE 1,20 MTS', 179, 88, 1);
INSERT INTO public.requerimiento VALUES (4736, 'ACEITE DE DIRECCION', 179, 17, 5);
INSERT INTO public.requerimiento VALUES (4790, 'ANTENAS TIPO LATIGO', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4820, 'BOBINA DE CABLE TELEFONICO MODULAR CATEGORIA 3', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (4850, 'PINTURA TRANSICAPA', 201, 14, 1);
INSERT INTO public.requerimiento VALUES (4877, 'GRIFERIA PARA DUCHAS DE 1 LLAVE', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (4906, 'BIBLIOTECAS ', 179, 88, 1);
INSERT INTO public.requerimiento VALUES (4936, 'GOMA DE ALIMENTACION 9500', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4965, 'CHEMISE DAMAS Y CABALLEROS DOS BORDADOS EN COLOR', 179, 5, 1);
INSERT INTO public.requerimiento VALUES (4981, 'SUMINISTRO E INSTALACION DE TECHO NERVADO TIPO VENIBER', 179, 1002, 1);
INSERT INTO public.requerimiento VALUES (987, 'RANITIDINA (50 mg / 2 ml)', 12, 15, 5);
INSERT INTO public.requerimiento VALUES (5011, 'SHAMPOO PARA VEHICULOS', 117, 38, 1);
INSERT INTO public.requerimiento VALUES (4004, 'SERVICIO DE AGUA HIDROCAPITAL', 233, 974, 1);
INSERT INTO public.requerimiento VALUES (5041, 'PILAS 9v PARA CHICHARRA', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (4164, 'PAPEL CONTAC', 179, 10, 1);
INSERT INTO public.requerimiento VALUES (3931, 'SERVICIO DE POLIZA DE CAUSION', 181, 58, 1);
INSERT INTO public.requerimiento VALUES (997, 'HIDROCORTISONA (500 mg)', 30, 15, 5);
INSERT INTO public.requerimiento VALUES (5071, 'Donaciones corrientes a entes descentralizados con fines empresariales no petroleros', 232, 1005, 5);
INSERT INTO public.requerimiento VALUES (1005, 'CEFADROXIL (500 mg)', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (3901, 'LIGAS DELGADAS Nª 18', 135, 32, 1);
INSERT INTO public.requerimiento VALUES (4165, 'TAPABOCA', 28, 31, 1);
INSERT INTO public.requerimiento VALUES (4261, 'TINTA IMPRESORA MAGENTA', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4325, 'PORTA PENDONES', 179, 88, 1);
INSERT INTO public.requerimiento VALUES (4453, 'CAMISAS LOGO CONATEL', 179, 5, 1);
INSERT INTO public.requerimiento VALUES (4485, 'ADOBE ILUSTRATOR', 217, 91, 1);
INSERT INTO public.requerimiento VALUES (4791, 'CÁMARA DIGITAL SONY 40 MP ', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4821, 'BOBINA DE CABLE  TELEFONICO REDONDO3', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (4851, 'BARNIS TRANSPARENTE', 117, 14, 1);
INSERT INTO public.requerimiento VALUES (4229, 'PINZA DE ACERO', 227, 30, 1);
INSERT INTO public.requerimiento VALUES (3666, 'KIT DE ARRANQUE PARA ENFRIADOR DE AGUA (RSIR  y  213THBYY)', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (4937, 'CARTUCHO NEGRO HP CP2025', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3932, 'SERVICIO DE POLIZA DE VEHICULOS', 181, 58, 1);
INSERT INTO public.requerimiento VALUES (4966, 'TARJETAS DE PRESENTACION DOS TINTAS POR 100', 221, 55, 1);
INSERT INTO public.requerimiento VALUES (5012, 'MOPA PARA PULIR VEHICULOS', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (5042, 'CABLES POWER SATA HDD', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (1158, 'AMPICILINA -SULBACTAM (0,25 g - 0,5 g)', 30, 15, 5);
INSERT INTO public.requerimiento VALUES (3840, 'CLIP PEQUEÑO', 28, 32, 1);
INSERT INTO public.requerimiento VALUES (3902, 'MARCADORES PARA ACETATO AZUL FABER ', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4034, 'Encuadernadora', 179, 88, 1);
INSERT INTO public.requerimiento VALUES (4262, 'TINTA IMPRESORA AMARILLO', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4454, 'BRAGAS', 179, 5, 1);
INSERT INTO public.requerimiento VALUES (4518, 'BOMBILLOS AHORRADORES', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (4676, 'ASPIRADORA ELECTRICA', 179, 998, 1);
INSERT INTO public.requerimiento VALUES (4707, 'CARTUCHO HP LASERJET CP2025', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4792, 'CARTUCHO EPSON 215 NEGRO', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4822, 'BOBINA DE CABLE  TELEFONICO JUMPERS', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (4908, 'PINTURA BASE EN ACEITE BRILLANTE', 201, 14, 1);
INSERT INTO public.requerimiento VALUES (4878, 'GRIFERIA PARA DUCHAS DE DOS LLAVES', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (1200, 'TIOCOLCHICOSIDO (4 mg)', 36, 15, 5);
INSERT INTO public.requerimiento VALUES (3806, 'SERVICIO DE CONEXIONES DE DATOS E INTERNET MOVISTAR', 181, 47, 1);
INSERT INTO public.requerimiento VALUES (3933, 'SERVICIO DE SEGURO PATRIMONIAL', 181, 58, 1);
INSERT INTO public.requerimiento VALUES (4938, 'CILINDRO HP CP2025', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3859, 'CONTRATACION DE RECUPERACION Y SERVICIO DE MANTENIMIENTO DE EQUIPOS DE ELEVACION SEDES I Y II', 181, 69, 1);
INSERT INTO public.requerimiento VALUES (1212, 'CAPTOPRIL (25 mg)', 36, 15, 5);
INSERT INTO public.requerimiento VALUES (4768, 'JUEGO DE LLAVES DE TUBO', 136, 24, 1);
INSERT INTO public.requerimiento VALUES (5013, 'CERA PARA PULIR VEHICULOS', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (4006, 'SERVICIO DE TELEFONIA MOVILNET', 233, 989, 1);
INSERT INTO public.requerimiento VALUES (1244, 'LANSOPRAZOL (15 mg)', 12, 15, 5);
INSERT INTO public.requerimiento VALUES (4035, 'ESPIRALES PARA ENCUADERNAR', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4982, 'BOMBILLOS Y LAMPARAS VARIAS', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (4934, 'TONER NEGRO C8543X', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3841, 'CARTUCHO TONER CIAN (CE401A)', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4231, 'CUCHARAS PERFORADA', 227, 30, 1);
INSERT INTO public.requerimiento VALUES (4327, 'CAMISA CON LOGOTIPO', 179, 5, 1);
INSERT INTO public.requerimiento VALUES (4487, 'RADIOS PORTATILES ', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4582, 'PAPEL  CREPE (COLORES SURTIDOS)', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4739, 'PLATINA PARA PUERTA', 179, 26, 1);
INSERT INTO public.requerimiento VALUES (4793, 'CARTUCHO CANON PGI-35 NEGRO', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4823, 'MANTENIMIENTO DE UPS', 179, 71, 1);
INSERT INTO public.requerimiento VALUES (4853, 'THINER', 117, 14, 1);
INSERT INTO public.requerimiento VALUES (4879, 'ABRAZADERAS PARA TUBERIAS', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (4909, 'ISC ', 233, 47, 5);
INSERT INTO public.requerimiento VALUES (4007, 'SERVICIO DE TELEFONIA DIGITEL', 233, 990, 1);
INSERT INTO public.requerimiento VALUES (4939, 'GOMA DE ALIMENTACION HP CP2025', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4984, 'TRANSFORMADOR PARA LAMPARAS', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (4967, 'AYUDANTE DE PLOMERO           ', 179, 78, 1);
INSERT INTO public.requerimiento VALUES (5014, 'PORTATILES (LAPTOP)', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (5044, 'BATERIAS DUNCAN MODELO R-90 PARA UPS', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (1342, 'DICLOFENAC SODICO (100 mg)', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (3842, 'SACAGRAPAS', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (3934, 'BOTELLONES DE AGUA ', 179, 1, 1);
INSERT INTO public.requerimiento VALUES (4232, 'CUCHARA LISA 53 CM ENTERIZA', 227, 30, 1);
INSERT INTO public.requerimiento VALUES (4456, 'CHAQUETAS UNISEX', 179, 5, 1);
INSERT INTO public.requerimiento VALUES (4488, 'TARJETAS HID ', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (1389, 'IBUPROFENO (500 mg)', 29, 15, 5);
INSERT INTO public.requerimiento VALUES (4583, 'PINCELES', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4740, 'LIMPIADOR DE MADERA', 179, 29, 1);
INSERT INTO public.requerimiento VALUES (4770, 'JUEGO DE LLAVES ALLEN', 136, 24, 1);
INSERT INTO public.requerimiento VALUES (4794, 'CHICHARRA GENERADORA DE TONO LANPRO', NULL, NULL, NULL);
INSERT INTO public.requerimiento VALUES (4824, 'BATERIA PARA UPS R-90 MARCA DUNCAL', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4880, 'HERRAJES PARA WC', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (4940, 'KIT FUSOR DE IMAGENES Q7502A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4910, 'SERVICIO DE LACNIC', 181, 47, 5);
INSERT INTO public.requerimiento VALUES (4985, 'JUEGO DE REBORDEADOR PARA TUBERIA DE COBRE', 136, 24, 1);
INSERT INTO public.requerimiento VALUES (5015, 'COMPUTADORES PARA ESCRITORIOS', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (5045, 'CABLES HDI', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4036, 'CD', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (1473, 'OMEPRAZOL (20 mg)', 36, 15, 5);
INSERT INTO public.requerimiento VALUES (3843, 'GRAPAS CORRUGADAS', 28, 32, 1);
INSERT INTO public.requerimiento VALUES (4169, 'PERSIANAS', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (3935, 'BOTELLONES DE AGUA ', 179, 1, 1);
INSERT INTO public.requerimiento VALUES (4233, 'COLADORES CHINOS DE ACERO MALLA 30 CM', 227, 30, 1);
INSERT INTO public.requerimiento VALUES (4361, 'RACHE DE 1/2 ', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (4457, 'CHALECO UNISEX', 179, 5, 1);
INSERT INTO public.requerimiento VALUES (4489, 'TARJETAS PARA IMPRESIÓN DE CARNET ', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4521, 'DECODIFICADORES TDA', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4584, 'PINTADEDOS (COLORES VARIADOS)', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4679, 'DISCO PORTATIL  1 TB', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4795, 'CHICHARRA GENERADORA DE TONO LANPRO', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4825, 'IMPRESORA PORTAIL  HP-470 INCLUYA  CABLE DE DATOS Y TRANSFORMADOR DE TENSION', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4201, 'SARTENES 30 CM', 179, 30, 1);
INSERT INTO public.requerimiento VALUES (4881, 'CODOS PARA LAVAMANOS', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (4911, 'ARENA AMARILLA', 219, 3, 1);
INSERT INTO public.requerimiento VALUES (4941, 'CILINDRO CE505A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4986, 'CEPILLOS CELDAS SUAVES CON PALO   ', 179, 29, 1);
INSERT INTO public.requerimiento VALUES (5016, 'REGULADORES', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (5046, 'CABLES DVI', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4009, 'SERVICIOS DE COMUNICACIONES CANTV', 233, 47, 1);
INSERT INTO public.requerimiento VALUES (3871, 'BLOCK DE RAYADO', 179, 10, 1);
INSERT INTO public.requerimiento VALUES (4329, 'NOTAS AUTOADHESIVAS Nº 75', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (3872, 'CARPETA LOMO ANCHO OFICIO', 179, 10, 1);
INSERT INTO public.requerimiento VALUES (3906, 'PERFORADOR DE 2 HUECOS', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4170, 'MOUSE', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3977, 'Monitor LCD 19', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4234, 'CUCHILLO CEBOLLERO 9', 227, 30, 1);
INSERT INTO public.requerimiento VALUES (4362, 'RACHE DE  3/8', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (4394, 'ACEITE DE DIRECCIÓN PARA MACHITO', 179, 17, 1);
INSERT INTO public.requerimiento VALUES (4426, 'LIMPIA PARABRISAS  MACHITO', 179, 26, 1);
INSERT INTO public.requerimiento VALUES (4458, 'CASCOS DE SEGURIDAD', 179, 34, 1);
INSERT INTO public.requerimiento VALUES (4490, 'PORTA CARNET  ', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4553, 'BLOCK DE CONSTRUCCION(24 hojas)', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4711, 'LIMPIADOR DE MUEBLES (SPRAY)', 179, 29, 1);
INSERT INTO public.requerimiento VALUES (4742, 'LAMINAS DE ACETATO', 214, 31, 1);
INSERT INTO public.requerimiento VALUES (4796, 'BOBINA CABLE UTP CATEGORIA 5', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (4826, 'CARTUCHO DE TINTA PARA IMPRESORA PORTATIL', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4856, 'MECHAS METALICAS ', 182, 24, 1);
INSERT INTO public.requerimiento VALUES (4882, 'CURVA PARA TUVERIA PAVCO ½” 90° ', 179, 22, 1);
INSERT INTO public.requerimiento VALUES (4912, 'ENLACE DIGITEL', 181, 47, 1);
INSERT INTO public.requerimiento VALUES (4680, 'UPS PARA MAQUINAS DE ESCRITORIO', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4942, 'KIT FUSOR MANTENIMIENTO MK-P2035-220', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4970, 'MATERIALES DE OFICINA', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4987, 'CEPILLOS CELDAS DURAS CON PALO   ', 179, 29, 1);
INSERT INTO public.requerimiento VALUES (5017, 'BOBINA DE CABLE UTP  CATEGORIA  5', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (5047, 'MICROFONOS', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4010, 'SERVICIOS DE COMUNICACIONES MOVISTAR', 233, 47, 1);
INSERT INTO public.requerimiento VALUES (4585, 'PAPEL  CREPE (COLORES SURTIDOS)', 179, 10, 1);
INSERT INTO public.requerimiento VALUES (1687, 'ACEPONATO DE HIDROCORTISONA (500 mg)', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4039, 'CARTELERA DE CORCHO', 179, 88, 1);
INSERT INTO public.requerimiento VALUES (3845, 'LIBRETAS DE RESORTES ', 179, 10, 1);
INSERT INTO public.requerimiento VALUES (3873, 'CARPETA LOMO ANCHO CARTA', 179, 10, 1);
INSERT INTO public.requerimiento VALUES (1699, 'SACCHAROMYCES BOULARDII (500 mg)', 165, 15, 5);
INSERT INTO public.requerimiento VALUES (3937, 'MICROONDAS', 179, 90, 1);
INSERT INTO public.requerimiento VALUES (3978, 'planta eléctrica', 179, 93, 1);
INSERT INTO public.requerimiento VALUES (4235, 'CUCHILLO CEBOLLERO 10', 227, 30, 1);
INSERT INTO public.requerimiento VALUES (4395, 'LIGA DE FRENOS ', 179, 17, 1);
INSERT INTO public.requerimiento VALUES (4427, 'BOBINA UNIDAD MOVIL ', 182, 26, 1);
INSERT INTO public.requerimiento VALUES (4459, 'PROTECTORES DE SEGURIDAD', 179, 34, 1);
INSERT INTO public.requerimiento VALUES (4523, 'LIMPIADOR DE POCETA ', 179, 29, 1);
INSERT INTO public.requerimiento VALUES (4554, 'BLOCK DE PAPEL CELOFAN', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4586, 'PINCELES', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4773, 'SACA FILTRO DE ACEITE', 227, 24, 1);
INSERT INTO public.requerimiento VALUES (4797, 'TECLADOS USB', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4203, 'TIJERA COCINA SMART COOK 8', 179, 30, 1);
INSERT INTO public.requerimiento VALUES (4857, 'MECHAS PARA CONCRETO ', 182, 24, 1);
INSERT INTO public.requerimiento VALUES (4883, 'CANILLAS PLASTICAS', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (4913, 'SERVICIO DE CNTI', 181, 47, 1);
INSERT INTO public.requerimiento VALUES (3811, 'HIDROCARIBE', 181, 974, 1);
INSERT INTO public.requerimiento VALUES (4943, 'GOMA DE ALIMENTACION HP 600', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4971, 'MATERIALES DE OFICINA', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4988, 'PALAS PLASTICAS', 179, 18, 1);
INSERT INTO public.requerimiento VALUES (5018, 'SUICHE POE 24 PUERTOS', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (5048, 'PENDRIVE KINSTONG 64 GB', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4202, 'SARTENES 40 CM', 179, 30, 1);
INSERT INTO public.requerimiento VALUES (4827, 'LAMPARAS DE EMERGENCIA', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (4969, 'PAPEL HIGIENICO', 248, 8, 1);
INSERT INTO public.requerimiento VALUES (3907, 'REGLAS PLASTICAS 30 CM', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (1747, 'KETOPROFENO (150 mg)', 36, 15, 5);
INSERT INTO public.requerimiento VALUES (4040, 'NEVERA EJECUTIVA', 179, 88, 1);
INSERT INTO public.requerimiento VALUES (3874, 'CARPETA MANILA OFICIO', 179, 10, 1);
INSERT INTO public.requerimiento VALUES (4396, 'REFRIGENRANTES PARA RADIADOR  PARA UNIDAD MOVIL ', 179, 17, 1);
INSERT INTO public.requerimiento VALUES (4428, 'CORREAS DE MOTOR PARA UNIDAD MOVIL', 179, 26, 1);
INSERT INTO public.requerimiento VALUES (4555, 'BLOCK DE PAPEL LUSTRILLO', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4587, 'PINTADEDOS (COLORES VARIADOS)', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4619, 'UNIFORMES DE PORTEROS', 148, 5, 1);
INSERT INTO public.requerimiento VALUES (4713, 'BOTAS TIPO FRAZZANI', 192, 986, 1);
INSERT INTO public.requerimiento VALUES (4798, 'MEMORIAS DDRR – DDR3', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4828, 'CINTA DE SEGURIDAD DE PELIGRO', 179, 1003, 1);
INSERT INTO public.requerimiento VALUES (4884, 'KIT SLOAN PARA FLUXOMETRO ', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (3812, 'HIDROLARA', 181, 974, 1);
INSERT INTO public.requerimiento VALUES (4944, 'CILINDRO HP 664 90A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4914, ' MANTENIMIENTO IMPREVISTOS A LA PLATAFORMA ', 233, 68, 5);
INSERT INTO public.requerimiento VALUES (5019, 'DISCO DURO 500GB O 1 TB', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4300, 'ESTUCHE DE RESCATE PARAMEDICO', 179, 31, 1);
INSERT INTO public.requerimiento VALUES (5049, 'AUDIFONOS CON MICROFONOS INCLUIDOS', 179, 27, 1);
INSERT INTO public.requerimiento VALUES (1851, 'DEXAMETASONA (0,1%)', 36, 15, 5);
INSERT INTO public.requerimiento VALUES (3875, 'CARPETA MANILA CARTA', 179, 10, 1);
INSERT INTO public.requerimiento VALUES (4556, 'BLOCK DE RAYAS 80 HOJAS', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4588, 'PLASTILINA O PLASTIDEDOS', 146, 32, 1);
INSERT INTO public.requerimiento VALUES (4714, 'BOTAS PUNTA DE ACERO', 192, 986, 1);
INSERT INTO public.requerimiento VALUES (4652, 'BOTAS DE SEGURIDAD(CABALLEROS)', 179, 986, 1);
INSERT INTO public.requerimiento VALUES (4775, 'SACA BUJIAS KIT 13- 16 Y 5/8', 136, 24, 1);
INSERT INTO public.requerimiento VALUES (4799, 'DISCO HHDD EXTERNO TOSHIBA', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4885, 'GAS REFRIGERANTE R22 DE 13.0KG', 179, 78, 1);
INSERT INTO public.requerimiento VALUES (4915, 'HONORARIOS PROFESIONALES', NULL, 988, 4);
INSERT INTO public.requerimiento VALUES (4013, 'SERVICIO DE ASEO URBANO Y DOMICILIARIO FOSPUCA', 233, 48, 1);
INSERT INTO public.requerimiento VALUES (3813, 'HIDROCAPITAL', 181, 974, 1);
INSERT INTO public.requerimiento VALUES (4945, 'KIT FUSOR DE MANTENIMIENTO HP 600', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4973, 'ROUTER', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4990, 'CEPILLOS PLASTICOS PARA ALBAÑILERIA   ', 179, 18, 1);
INSERT INTO public.requerimiento VALUES (5020, 'DISCO DURO EXTRAIBLE O PORTATIL DE 2TB', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (5050, 'BOLSOS PARA LAPTOP', 179, 4, 1);
INSERT INTO public.requerimiento VALUES (4301, 'TIJERA DE PARAMEDICO', 179, 31, 1);
INSERT INTO public.requerimiento VALUES (3939, 'MANTENIMIENTO Y REPARACION DE VEHICULOS', 181, 69, 1);
INSERT INTO public.requerimiento VALUES (3814, 'BLOCK DE RAYADO', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (3910, 'SACAPUNTAS ELECTRICO', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4042, 'MARCADORES PARA CD', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4238, 'CUCHILLO MEDIO GOLPE 8', 227, 30, 1);
INSERT INTO public.requerimiento VALUES (4302, 'LINTERNA MINI MAGLITE', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (4398, 'REFRIGERANTES PARA RADIADOR  PARA COLORADO', 179, 17, 1);
INSERT INTO public.requerimiento VALUES (4494, 'IMPRESORA PARA CARNET  ', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4526, 'FILTRO DE AIRE MOTOR ', 179, 26, 1);
INSERT INTO public.requerimiento VALUES (4589, 'PORTA CLIPS', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4621, 'UNIFORMES DE PORTEROS', 148, 5, 1);
INSERT INTO public.requerimiento VALUES (4684, 'Manto asfaltico para area de 182 metros cuadrados', 179, 39, 1);
INSERT INTO public.requerimiento VALUES (4715, 'BOTAS DIALECTRICAS', 192, 986, 1);
INSERT INTO public.requerimiento VALUES (4800, 'DISCO PC HHDD 500GB O 1 TB', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (2028, 'BUDESONIDA (0,64 mg / ml)', 85, 15, 5);
INSERT INTO public.requerimiento VALUES (4653, 'LENTES DE SEGURIDAD', 179, 34, 1);
INSERT INTO public.requerimiento VALUES (4916, 'MEMBRESIA ANUAL LACTLD ', 181, 983, 5);
INSERT INTO public.requerimiento VALUES (4946, 'CARTUCHO NEGRO CE390A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4991, 'SPRAY AROMATIZANTE', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (5021, 'MEMORIAS DDR', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (5051, 'BOLSO PARA LAPTOP TIPO MORRAL', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (4557, 'CARPETAS DE 3 AROS OSLO 3" tamaño Carta', 179, 10, 1);
INSERT INTO public.requerimiento VALUES (2055, 'JABÓN (120 g)', 163, 16, 1);
INSERT INTO public.requerimiento VALUES (3849, 'Audífonos', 179, 87, 1);
INSERT INTO public.requerimiento VALUES (4271, 'BARRAS DE PANICO', 179, 34, 1);
INSERT INTO public.requerimiento VALUES (4399, 'MARCADORES PUNTA FINA AZUL', 39, 32, 1);
INSERT INTO public.requerimiento VALUES (4431, 'KIT DE HERRAMIENTAS DE RED NEXXT SOLUTIONS', 136, 24, 1);
INSERT INTO public.requerimiento VALUES (4495, 'CAMARAS WED HD  ', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4527, 'PINTURA ANTICORROSIBA ', 179, 14, 1);
INSERT INTO public.requerimiento VALUES (4558, 'CARPETAS DE 3 AROS OSLO 3" TAMAÑO CARTA', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4654, 'BLUE JEANS (CABALLEROS)', 179, 5, 1);
INSERT INTO public.requerimiento VALUES (4716, 'BATAS TIPO SLAP', 192, 986, 1);
INSERT INTO public.requerimiento VALUES (4801, 'PASTA DVD  RW-R CAJAS DE 100 UNIDADES', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4831, 'GANCHOS DE SEGURIDAD (ESPOSAS)', 179, 1003, NULL);
INSERT INTO public.requerimiento VALUES (4917, 'LAMINA CONTRACHAPADA', 179, 22, 1);
INSERT INTO public.requerimiento VALUES (4947, 'CARTUCHO NEGRO HP 88 C9386AL', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4992, 'TRANSPORTE SITSA', 181, 41, 1);
INSERT INTO public.requerimiento VALUES (5022, 'PASTA CD REGRABABLE', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (5052, 'WEB CAM LED DE ALTA RESOLUCION (HD) CON MICROFONO INCLUIDO', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4303, 'AGENDA EJECUTIVA', 179, 10, 1);
INSERT INTO public.requerimiento VALUES (3850, 'Micrófono balita', 179, 87, 1);
INSERT INTO public.requerimiento VALUES (3878, 'SEPARADORES DE CARPETAS ', 146, 10, 1);
INSERT INTO public.requerimiento VALUES (4240, 'CUCHILLO MEDIO GOLPE 9', 227, 30, 1);
INSERT INTO public.requerimiento VALUES (4368, 'RAMPLUG   GRIS 1/2 CON TORNILLOS', 228, 24, 1);
INSERT INTO public.requerimiento VALUES (4400, 'REFRIGERANTES PARA RADIADOR  PARA COLORADO', 179, 17, 1);
INSERT INTO public.requerimiento VALUES (4464, 'MEMORIA RAM 2 X 8 GB DDR4', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4623, 'GUANTES DE SOFBOL', 179, 28, 1);
INSERT INTO public.requerimiento VALUES (4655, 'GUANTES DE NITRILO', 179, 34, 1);
INSERT INTO public.requerimiento VALUES (4717, 'MONOS QUIRURGICO', 227, 986, 1);
INSERT INTO public.requerimiento VALUES (4802, 'PASTA CD  CD-R PAQUETES DE 100 UNIDADES', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4832, 'GAS PIMIENTA SPRAY', 179, 1003, 1);
INSERT INTO public.requerimiento VALUES (4948, 'CARTUCHO NEGRO HP CD971AE', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3816, 'CANTV', 181, 989, 1);
INSERT INTO public.requerimiento VALUES (5023, 'PASTA DVD', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4918, 'AUDIFONOS CON MICROFONOS INCLUIDOS', 179, 27, 1);
INSERT INTO public.requerimiento VALUES (4045, 'LIGA DE GOMA Nº 18', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4209, 'RALLADOR DE ACERO', 227, 30, 1);
INSERT INTO public.requerimiento VALUES (3879, 'SOBRES BLANCOS CON VENTANA', 179, 10, 1);
INSERT INTO public.requerimiento VALUES (3943, 'BOMBONAS DE OXIGENO SERVICIO MEDICO', 179, 979, 1);
INSERT INTO public.requerimiento VALUES (4017, 'CONDOMINIO TORRE FONDO COMUN', 233, 49, 1);
INSERT INTO public.requerimiento VALUES (4624, 'PELOTAS DE SOFTBOL', 179, 28, 1);
INSERT INTO public.requerimiento VALUES (4803, 'REGULADORESDE VOLTAJES', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4833, 'PITOS ARBITRO', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (4465, 'DISCO DURO EXTERNO 5 TERABYTE', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4949, 'CARTUCHO NEGRO CE400', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (5024, 'UNIDAD DE CD-DVD PORTATIL', 179, 27, 1);
INSERT INTO public.requerimiento VALUES (5054, 'UPS(APC) DE 1500', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3984, 'Estaño', 179, 1004, 1);
INSERT INTO public.requerimiento VALUES (4919, 'CABLE DVI', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (4592, 'RESMA DE PAPEL TAMAÑO OFICIO', 230, 10, 1);
INSERT INTO public.requerimiento VALUES (4046, 'BOMBONA DE OXIGENO ', 227, 979, 1);
INSERT INTO public.requerimiento VALUES (3944, 'REPARACION NEBULIZADORES', 181, 979, 1);
INSERT INTO public.requerimiento VALUES (4402, 'REFRIGERANTES PARA RADIADOR  PARA COLORADO', 179, 17, 1);
INSERT INTO public.requerimiento VALUES (4561, 'CINTA ADHESIVA N° 3436 CELOVEN', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4625, 'JUEGO DE BOLAS CRIOLLAS', 182, 28, 1);
INSERT INTO public.requerimiento VALUES (4657, 'MONO TIPO QUIRURGICO  DAMAS COLOR VINO TINTO  TELA POPELINA ALGODON', 179, 5, 1);
INSERT INTO public.requerimiento VALUES (4750, 'LICENCIA ARCGIS ENTERPRISE STANDAR PARA SERVIDOR CON  4 CORES', 244, 91, 1);
INSERT INTO public.requerimiento VALUES (4804, 'UPS (APC) 1500', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4862, 'DESTORNILLADOR DE ESTRIAS ', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3818, ' DIGITEL', 181, 990, 1);
INSERT INTO public.requerimiento VALUES (4950, 'KIT FUSOR DE MANTENIMIENTO HP M551N', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4995, 'ESTETOSCOPIO ADULTO', 179, 979, 1);
INSERT INTO public.requerimiento VALUES (5055, 'IMPRESORAS PORTATILES', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4920, 'CABLE HDMI', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (4834, 'TV 60 PULGADAS', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (2491, 'METOCLOPRAMIDA (0,1 g / 100 ML)', 36, 15, 5);
INSERT INTO public.requerimiento VALUES (3915, 'PAPEL CARTA BOND BASE 20 BLANCO', 230, 10, 1);
INSERT INTO public.requerimiento VALUES (3819, 'SILLAS EJECUTIVAS', 179, 88, 1);
INSERT INTO public.requerimiento VALUES (3945, 'GLUCOMETRO', 179, 979, 1);
INSERT INTO public.requerimiento VALUES (3986, 'Memoria SD de mínimo 1 tera', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4243, 'COLADORES DE PASTA Nº 34', 179, 30, 1);
INSERT INTO public.requerimiento VALUES (4435, 'COMPUTADOR DE ESCRITORIO MODELO VIT E2250-02', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4531, 'BALASTROS TUBOS FLUORECENTES CIRCULAR 32W', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (4626, 'DOMINO', 182, 28, 1);
INSERT INTO public.requerimiento VALUES (4720, 'GUNATES DE CUERO PARA MOTORIZADOS', 192, 986, 1);
INSERT INTO public.requerimiento VALUES (4751, 'LICENCIA ARCGIS DESKTOP 10.5 STANDARD - ARCINFO                              ', 244, 91, 1);
INSERT INTO public.requerimiento VALUES (4805, 'CRIPEADORA PONCHADORA CRIMPING (RATCHERT)', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (4835, 'LINTERNAS RECARGABLES', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (4863, 'DETORNILLADOR DE PALAS ', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (4891, 'Bombillo de rosca 26w', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (4921, 'PENDRIVE 64 GB', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4951, 'CILINDRO HP M551N', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4996, 'ESTETOSCOPIO PEDIATRICO', 179, 979, 1);
INSERT INTO public.requerimiento VALUES (5056, 'SERVICIOS DE COMUNICACIONES DIGITEL', 181, 47, 1);
INSERT INTO public.requerimiento VALUES (2686, 'Engrapadoras', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4048, 'EQUIPO ORL', 227, 979, 1);
INSERT INTO public.requerimiento VALUES (2651, 'Computadoras de escritorio', 179, 15, 1);
INSERT INTO public.requerimiento VALUES (4212, 'CUCHARA LISA 53 CM ENTERIZA', 179, 30, 1);
INSERT INTO public.requerimiento VALUES (2598, 'DESLORATADINA (0,25 mg / 0,5 ml)', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4276, 'SEÑAL DE PELIGRO OBJETOS FIJOS A BAJA ALTURA', 179, 1000, 1);
INSERT INTO public.requerimiento VALUES (4340, 'PINTURA  BEIGE PARA  EXTERIORES', 201, 14, 1);
INSERT INTO public.requerimiento VALUES (4436, 'COMPUTADOR PORTÁTIL MODELO VIT 2423-02', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4532, 'BALASTROS TUBOS FLUORECENTES CIRCULAR 22W', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (2659, 'Almohadillas para sellos', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4627, 'PITOS (ARBITRO)', 179, 28, 1);
INSERT INTO public.requerimiento VALUES (4721, 'GUANTES DE GOMA', 192, 34, 1);
INSERT INTO public.requerimiento VALUES (4836, 'INVERSOR DE TENSIÓN DC-AC', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4892, 'CERAMICA PARED-PISO', 222, 3, 1);
INSERT INTO public.requerimiento VALUES (4922, 'WEB CAM  LED ', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4952, 'VIVERES', NULL, 1, 5);
INSERT INTO public.requerimiento VALUES (4997, 'BRAZALETE DE TENSIOMETRO', 179, 979, 1);
INSERT INTO public.requerimiento VALUES (5057, 'SERVICIO DE FLETE PARA ALIMENTO DE PERSONAL DE LA COMISION', 181, 50, 1);
INSERT INTO public.requerimiento VALUES (4244, 'PAILAS DE 20 CM', 179, 30, 1);
INSERT INTO public.requerimiento VALUES (3537, 'HERRAJE P/POCETA (VENCERAMICA)', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (2679, 'Clip binder 25 mm', 163, 32, 1);
INSERT INTO public.requerimiento VALUES (2683, 'Clips mariposa n° 2 paquete de 50', 75, 32, 1);
INSERT INTO public.requerimiento VALUES (2665, 'Bolígrafos negros punta media', 28, 32, 1);
INSERT INTO public.requerimiento VALUES (3821, 'POST IT', 179, 10, 1);
INSERT INTO public.requerimiento VALUES (2695, 'Ligas rojas', 88, 32, 1);
INSERT INTO public.requerimiento VALUES (2772, 'ESCRITORIOS', 179, 88, 1);
INSERT INTO public.requerimiento VALUES (2703, 'Marcador para pizarra acrílica color azul', 28, 32, 1);
INSERT INTO public.requerimiento VALUES (2707, 'Notas autoadhesivas de colores de 50mmx40mm', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4533, 'SOCATES PARA TUBOS FLUORECENTES', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (4596, 'TEMPERAS', 28, 32, 1);
INSERT INTO public.requerimiento VALUES (4628, 'CRONOMETROS', 179, 28, 1);
INSERT INTO public.requerimiento VALUES (2732, 'Resaltador luminoso amarillo', 28, 32, 1);
INSERT INTO public.requerimiento VALUES (4722, 'PANTALON MESONERO Y CHEF', 179, 986, 1);
INSERT INTO public.requerimiento VALUES (2738, 'Sobres manila tamaño carta', 146, 10, 1);
INSERT INTO public.requerimiento VALUES (4837, 'SERVICIOS DE CONTABILIDAD Y AUDITORIA', 225, 63, 1);
INSERT INTO public.requerimiento VALUES (4865, 'MARTILLOS', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (4893, 'TABLILLA ARTESANAL ROJA DOBLE CARA.', 222, 3, 1);
INSERT INTO public.requerimiento VALUES (4953, 'HORTALIZAS', NULL, 1, NULL);
INSERT INTO public.requerimiento VALUES (4998, 'EQUIPO DE CIRUGIA MENOR', 179, 31, 1);
INSERT INTO public.requerimiento VALUES (5028, 'MICROTELEFONO DE PRUEBAS', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (3988, 'CPU procesador de 5 núcleos RAM: 8 GB HDD: 1TB ', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (2740, 'Tijeras 7” mango plástico', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (5058, 'SILICON LIQUIDO  PARA INSTALACIONES SANITARIAS', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (2757, 'Baterías para vehículos', 179, 26, 1);
INSERT INTO public.requerimiento VALUES (2765, 'Hornos microondas domésticos', 179, 90, 1);
INSERT INTO public.requerimiento VALUES (2771, 'SILLAS', 179, 88, 1);
INSERT INTO public.requerimiento VALUES (3822, 'LAPIZ BICOLOR', 39, 32, 1);
INSERT INTO public.requerimiento VALUES (3617, 'YESO (20 KG)', 150, 3, 1);
INSERT INTO public.requerimiento VALUES (3884, 'BARRA ADHESIVA PEGA 20 GRAMOS', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (3948, 'ARTICULOS DEPORTIVOS TENIS DE MESA', 231, 28, 1);
INSERT INTO public.requerimiento VALUES (3989, 'Monitor 19 pulgadas ', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4050, 'AGUA OXIGENADA', 117, 15, 5);
INSERT INTO public.requerimiento VALUES (4051, 'ACETAMINOFEN', 162, 15, 5);
INSERT INTO public.requerimiento VALUES (4052, 'ACICLOVIR', 234, 15, 5);
INSERT INTO public.requerimiento VALUES (4053, 'ACICLOVIR', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4054, 'ACIDO FOLICO', 235, 15, 5);
INSERT INTO public.requerimiento VALUES (4055, 'ÁCIDO FOLICO', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4056, 'ACIDO FOLICO', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4057, 'ALOVENT', 236, 15, 5);
INSERT INTO public.requerimiento VALUES (4058, 'ALCOHOL', 117, 15, 5);
INSERT INTO public.requerimiento VALUES (4059, 'ALBENDAZOL', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4060, 'ALBENDAZOL', 162, 15, 5);
INSERT INTO public.requerimiento VALUES (4061, 'AMOXICILINA / ACIDO CLAVULANICO', 162, 15, 5);
INSERT INTO public.requerimiento VALUES (4062, 'AMOXICILINA / ACIDO CLAVULANICO', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4063, 'AMOXICILINA / ACIDO CLAVULANICO', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4064, 'ASPIRINA', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4065, 'ASPIRINA', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4066, 'ATAMEL FORTE', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4067, 'AZITROMICINA', 162, 15, 5);
INSERT INTO public.requerimiento VALUES (4068, 'AZITROMICINA', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4069, 'BACITRACINA', 237, 15, 5);
INSERT INTO public.requerimiento VALUES (4070, 'BAYCUTEN', 234, 15, 5);
INSERT INTO public.requerimiento VALUES (4071, 'BENUTREX LIOFILIZADO', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4072, 'BEZENTACIL', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4073, 'BERUDUAL', 236, 15, 5);
INSERT INTO public.requerimiento VALUES (4074, 'BUDECORT', 236, 15, 5);
INSERT INTO public.requerimiento VALUES (4075, 'CAPTOPRIL', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4076, 'CEDAX', 162, 15, 5);
INSERT INTO public.requerimiento VALUES (4077, 'CEFACIDAL', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4078, 'CEFALOTINA', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4079, 'CEFADROXILO', 162, 15, 5);
INSERT INTO public.requerimiento VALUES (4806, 'CABLES SATA HDD', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (4594, 'SOBRE MANILA EXTRA OFICIO', 179, 10, 1);
INSERT INTO public.requerimiento VALUES (4080, 'CEFADROXILO', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4081, 'CEFTRIAXONE', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4082, 'CETIRIZINA', 162, 15, 5);
INSERT INTO public.requerimiento VALUES (4083, 'CETIRIZINA', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4084, 'CICLOCAPRON', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4085, 'CIPROFLOXACINA', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4086, 'CLARICORT', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4087, 'CLARITROMICINA', 162, 15, 5);
INSERT INTO public.requerimiento VALUES (4088, 'CLARITROMICINA', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4089, 'CLEXANE', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4090, 'CLOROTRIMETON', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4091, 'CLOTRIMAZOL', 238, 15, 5);
INSERT INTO public.requerimiento VALUES (4092, 'CLOTRIMAZOL', 234, 15, 5);
INSERT INTO public.requerimiento VALUES (4093, 'DICLOFENAC POTASICO', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4094, 'DIAZEPAM', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4095, 'DICYNONE', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4096, 'DICLOFENAC POTASICO', 162, 15, 5);
INSERT INTO public.requerimiento VALUES (4097, 'DEXKETOPROFENO', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4098, 'EPAMIN', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4099, 'ENALAPRIL', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4100, 'ENTEROGERMINA', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4101, 'ENTEROGERMINA', 239, 15, 5);
INSERT INTO public.requerimiento VALUES (4102, 'GENTAMICINA', 236, 15, 5);
INSERT INTO public.requerimiento VALUES (4103, 'GERDEX', 117, 15, 5);
INSERT INTO public.requerimiento VALUES (4104, 'HIDRATACION ORAL', 240, 15, 5);
INSERT INTO public.requerimiento VALUES (4105, 'IBUPROFENO', 162, 15, 5);
INSERT INTO public.requerimiento VALUES (4106, 'INSULINA CRISTINA', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4107, 'INSULINA NPH', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4108, 'IRTOPAN', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4109, 'LIOLACTIL', 240, 15, 5);
INSERT INTO public.requerimiento VALUES (4110, 'LONGACEF', 162, 15, 5);
INSERT INTO public.requerimiento VALUES (4111, 'LORATADINA', 162, 15, 5);
INSERT INTO public.requerimiento VALUES (4112, 'LORATADINA', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4113, 'METRONIDAZOL', 162, 15, 5);
INSERT INTO public.requerimiento VALUES (4114, 'METRONIDAZOL', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4115, 'MIGREN', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4116, 'NAS ADULTO', 236, 15, 5);
INSERT INTO public.requerimiento VALUES (4117, 'NAS PEDIATRICO', 236, 15, 5);
INSERT INTO public.requerimiento VALUES (4118, 'OMEPRAZOL', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4119, 'ONDANSETRON', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4120, 'PEDIACORT', 236, 15, 5);
INSERT INTO public.requerimiento VALUES (4121, 'POVIDINE', 117, 15, 5);
INSERT INTO public.requerimiento VALUES (4122, 'PULMICORT', 236, 15, 5);
INSERT INTO public.requerimiento VALUES (4123, 'PLINDAN COMPUESTO', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4124, 'RESPIDUAL', 236, 15, 5);
INSERT INTO public.requerimiento VALUES (4125, 'SALBUTAMOL', 241, 15, 5);
INSERT INTO public.requerimiento VALUES (4126, 'SECNIDAZOL', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4127, 'SOLUCIÓN FISIOLÓGICA', 241, 15, 5);
INSERT INTO public.requerimiento VALUES (4128, 'TENSOPIN', 241, 15, 5);
INSERT INTO public.requerimiento VALUES (4129, 'TIOCOLFEN', 163, 15, 5);
INSERT INTO public.requerimiento VALUES (4130, 'TOBRADEX', 236, 15, 5);
INSERT INTO public.requerimiento VALUES (4131, 'VITAMINA K', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (4133, 'BAJA LENGUA', 28, 31, 5);
INSERT INTO public.requerimiento VALUES (4134, 'BATAS PARA PACIENTES', 28, 31, 5);
INSERT INTO public.requerimiento VALUES (4135, 'BISTURI #20', 28, 31, 5);
INSERT INTO public.requerimiento VALUES (4136, 'CATETER (JELCO) # 18', 28, 31, 5);
INSERT INTO public.requerimiento VALUES (4137, 'CATETER (JELCO) # 22', 28, 31, 5);
INSERT INTO public.requerimiento VALUES (4138, 'CENTRO DE CAMA', 28, 31, 5);
INSERT INTO public.requerimiento VALUES (4139, 'CUBIERTA PROTECTORA PARA TRANSDUCTOR VAGINAL CAJA', 28, 31, 5);
INSERT INTO public.requerimiento VALUES (4140, 'CURITAS', 28, 31, 5);
INSERT INTO public.requerimiento VALUES (4141, 'CLAVE AZUL (OBSTURADOR)', 28, 31, 5);
INSERT INTO public.requerimiento VALUES (4142, 'ESPECULOS (TALLA S,M,L)', 28, 31, 5);
INSERT INTO public.requerimiento VALUES (4143, 'LLAVES DE TRES VIAS', 28, 31, 5);
INSERT INTO public.requerimiento VALUES (4144, 'MASCARILLA QUIRURGICA (TAPABOCA DESECHABLE)', 28, 31, 5);
INSERT INTO public.requerimiento VALUES (4145, 'MACROGOTEROS', 28, 31, 5);
INSERT INTO public.requerimiento VALUES (4146, 'OBSTURADORES', 28, 31, 5);
INSERT INTO public.requerimiento VALUES (4147, 'SABANAS DESCARTABLES', 28, 31, 5);
INSERT INTO public.requerimiento VALUES (4148, 'SCAL # 23', 28, 31, 5);
INSERT INTO public.requerimiento VALUES (4149, 'TERMOMETROS RECTALES Y ORALES', 28, 31, 5);
INSERT INTO public.requerimiento VALUES (4310, 'SELLO NUMERADOR AUTOMATICO', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4342, 'KIT DE PRIMEROS AUXILIOS', 179, 15, 1);
INSERT INTO public.requerimiento VALUES (4406, 'PERFORADOR DE UN HUECO', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4438, 'IMPRESORAS PORTÁTILES (EPSON WORKFORCE WF-100W  ó HP OFFICEJET 200 MOBILE ó CANON PIXMA IP110 )', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4470, 'TARJETA GRAFICA GIGABYTE GTX 1070 G1', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (4534, 'TALONARIOS DE VOUCHER PARA CHEQUES', 179, 10, 1);
INSERT INTO public.requerimiento VALUES (4565, 'CLIPS MARIPOSA N°1', 28, 32, 1);
INSERT INTO public.requerimiento VALUES (4629, 'MALLA DE VOLEIBOL', 179, 28, 1);
INSERT INTO public.requerimiento VALUES (3654, 'KIT DE ARRANQUE 220 V', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3919, 'VASOS PLASTICOS GRANDES Nº 77', 146, 18, 1);
INSERT INTO public.requerimiento VALUES (2691, 'Lápiz grafito', 28, 32, 1);
INSERT INTO public.requerimiento VALUES (3990, 'CPU procesador de 5 núcleos RAM 16 GB HDD 2TB ', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4183, 'CAMBIO DE KIT DE RODAMIENTO DE MOTO', 233, 69, 1);
INSERT INTO public.requerimiento VALUES (4471, 'MEMORIA RAM2 X 16 GB DDR4', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (4630, 'MALLAS DE BALONCESTO', 179, 28, 1);
INSERT INTO public.requerimiento VALUES (4662, 'GUANTES DE CARNAZA  CORTOS', 192, 34, 1);
INSERT INTO public.requerimiento VALUES (4838, 'CABILLAS', 179, 22, 1);
INSERT INTO public.requerimiento VALUES (4866, 'MARTILLOS', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (4894, 'VENTANA PANORAMICA DE 1.3MX1.5M', 179, 25, 1);
INSERT INTO public.requerimiento VALUES (4954, 'VIVERES', 247, 1, 5);
INSERT INTO public.requerimiento VALUES (4999, 'EQUIPO DE PINZAS GINECOLOGICAS.', 179, 31, 1);
INSERT INTO public.requerimiento VALUES (4724, 'GORROS DE COCINA', 179, 5, 1);
INSERT INTO public.requerimiento VALUES (4693, 'Aire acondicionado Split de 18000 btu Nuevo (Para el Cuarto de servidores)', 179, 90, 1);
INSERT INTO public.requerimiento VALUES (2947, 'Cartuchos nro 72 para Plotter HP Designjet modelo T1200 color Mate Black', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (2950, 'Cartuchos nro 72 para Plotter HP Designjet modelo T1200 color Magenta', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (2951, 'Cartuchos nro 72 para Plotter HP Designjet modelo T1200 color Cyan', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (2952, 'Cartuchos nro 72 para Plotter HP Designjet modelo T1200 color Grey', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (2953, 'Cabezal 72 gris photo black', 179, 71, 1);
INSERT INTO public.requerimiento VALUES (2954, 'Cabezal 72 magenta/cian', 179, 71, 1);
INSERT INTO public.requerimiento VALUES (2955, 'Cabezal 72 matte black/yellow', 179, 71, 1);
INSERT INTO public.requerimiento VALUES (3199, 'Vendas', 149, 31, 5);
INSERT INTO public.requerimiento VALUES (2664, 'Bolígrafos azul punta media', 28, 32, 1);
INSERT INTO public.requerimiento VALUES (2972, 'DESAYUNO CON BEBIDAS', 179, 1, 1);
INSERT INTO public.requerimiento VALUES (4151, 'IMPRESORA PARA ECOCARDIOGRAFO', 227, 89, 1);
INSERT INTO public.requerimiento VALUES (2964, 'Pasaje aereo', 641, 61, 4);
INSERT INTO public.requerimiento VALUES (3035, 'EQUIPO DE COMPUTACION', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (3625, 'DISCO DE CORTE DIAMANTE  7 ½', 179, 23, 1);
INSERT INTO public.requerimiento VALUES (3049, 'REGULADOR DE VOLTAJE', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (2976, 'Pasapalos Variados', 135, 1, 1);
INSERT INTO public.requerimiento VALUES (2983, 'bombonas de gas refrigerante', 179, 2, 1);
INSERT INTO public.requerimiento VALUES (4248, 'VASOS DE ALUMINIO', 179, 30, 1);
INSERT INTO public.requerimiento VALUES (5000, 'HISTEROMETRO', 179, 31, 1);
INSERT INTO public.requerimiento VALUES (2946, 'Papel para Plotter, tamaño 42 x 50 YDS (Q1414A)', 179, 13, 1);
INSERT INTO public.requerimiento VALUES (3010, 'juego de sartenes', 182, 30, 1);
INSERT INTO public.requerimiento VALUES (3011, 'bandejas grandes', 182, 30, 1);
INSERT INTO public.requerimiento VALUES (4598, 'TIJERAS PUNTA ROMA', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4311, 'SELLOS ', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (3200, 'VASOS PLASTICOS 27', 146, 18, 1);
INSERT INTO public.requerimiento VALUES (4536, 'ENGRAPADORA INDUSTRIAL', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (3014, 'juego de calderos', 182, 30, 1);
INSERT INTO public.requerimiento VALUES (3015, 'bujias', 179, 26, 1);
INSERT INTO public.requerimiento VALUES (2978, 'Vasos Cónicos', 28, 9, 1);
INSERT INTO public.requerimiento VALUES (2981, 'vasos plasticos nº 77', 28, 18, 1);
INSERT INTO public.requerimiento VALUES (2982, 'cubiertos plasticos', 146, 18, 1);
INSERT INTO public.requerimiento VALUES (2989, 'pilas aa', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (4631, 'TERMO GRANDE', 179, 90, 1);
INSERT INTO public.requerimiento VALUES (4663, 'LENTES DE SEGURIDAD', 179, 34, 1);
INSERT INTO public.requerimiento VALUES (2993, 'juegos de ollas', 179, 30, 1);
INSERT INTO public.requerimiento VALUES (2996, 'juego de cubiertos', 182, 30, 1);
INSERT INTO public.requerimiento VALUES (3009, 'juego de cuchillos', 182, 30, 1);
INSERT INTO public.requerimiento VALUES (4725, 'UNIFORME DE CHEF', 179, 986, 1);
INSERT INTO public.requerimiento VALUES (4408, 'REFRIGERANTE (LITRO)', 179, 17, 1);
INSERT INTO public.requerimiento VALUES (4839, 'Vigas', 179, 22, 1);
INSERT INTO public.requerimiento VALUES (4895, 'CEMENTO GRIS PORTLAND II', 150, 21, 1);
INSERT INTO public.requerimiento VALUES (3025, 'filtro gasolina', 179, 26, 1);
INSERT INTO public.requerimiento VALUES (3026, 'filtro de aceite', 179, 26, 1);
INSERT INTO public.requerimiento VALUES (3824, 'HONORARIOS PROFESIONALES', 246, 988, 4);
INSERT INTO public.requerimiento VALUES (4955, 'HORTALIZAS', 247, 1, 5);
INSERT INTO public.requerimiento VALUES (3000, 'MENSAJERIA EXTERNA', 181, 53, 1);
INSERT INTO public.requerimiento VALUES (3048, 'Disco duro 4TB', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (5030, 'CAJA DE HERRAMIENTAS DE TELEFONIA', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3920, 'PILAS ALCALINAS DOBLE A 1.5 V ENERGIZER', 179, 38, 1);
INSERT INTO public.requerimiento VALUES (3038, 'abono', 179, 948, 1);
INSERT INTO public.requerimiento VALUES (3050, 'MONITORES', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (3043, 'IMPRESION LEYES  RESPONSABILIDAD SOCIAL', 181, 55, 1);
INSERT INTO public.requerimiento VALUES (3045, 'IMPRESION PANCARTAS PENDONES', 181, 55, 1);
INSERT INTO public.requerimiento VALUES (3046, 'AVISOS DE PRENSA', 181, 57, 1);
INSERT INTO public.requerimiento VALUES (3068, 'OTROS SERVICIOS PROFESIONALES Y TECNICOS', 181, 68, 1);
INSERT INTO public.requerimiento VALUES (3047, 'PENDRIVE 32 GB', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3054, 'GACETAS IMPRESAS SUSCRIPCION', 181, 78, 1);
INSERT INTO public.requerimiento VALUES (3053, 'GACETAS DIGITALES SUSCRIPCION', 181, 78, 1);
INSERT INTO public.requerimiento VALUES (2959, 'AGUA MINERAL DE 20 LTRS', 179, 1, 1);
INSERT INTO public.requerimiento VALUES (3076, 'CUNETES DE LAVAPLATOS ', 201, 29, 1);
INSERT INTO public.requerimiento VALUES (3071, 'OTROS SERVICIOS NO PERSONALES', 181, 78, 1);
INSERT INTO public.requerimiento VALUES (3072, 'ESCOBAS', 179, 29, 1);
INSERT INTO public.requerimiento VALUES (3073, 'PLUMEROS', 179, 29, 1);
INSERT INTO public.requerimiento VALUES (3077, 'GALONES LIMPIA VIDRIO', 117, 29, 1);
INSERT INTO public.requerimiento VALUES (3079, 'GALONES DE LIMPIA PISO', 117, 29, 1);
INSERT INTO public.requerimiento VALUES (2974, 'ALMUERZO CON BEBIDAS', 179, 1, 1);
INSERT INTO public.requerimiento VALUES (3992, 'Grabador digital recargable ', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (3089, 'Paquete de Tornillos Plycer (plicer)', 146, 24, 1);
INSERT INTO public.requerimiento VALUES (3090, 'TORNILLOS PARA DRY WALL', 146, 24, 1);
INSERT INTO public.requerimiento VALUES (3091, 'MECHAS DE METAL', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3092, 'MECHAS DE PARED', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3094, 'DESTORNILLADOS DE ESTRIAS JUEGO DE 6 ', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3096, 'ALICATE', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3097, 'MARTILLO', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3098, 'UNION UNIVERSAL FERRETERIA', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3101, 'CLAVOS RANURADOS', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (4840, 'Planchones', 179, 22, 1);
INSERT INTO public.requerimiento VALUES (3108, 'Pasapalos variados', 181, 1, 1);
INSERT INTO public.requerimiento VALUES (3113, 'SERVILLETAS', 179, 8, 1);
INSERT INTO public.requerimiento VALUES (3114, 'FONDO DE PINTURA', 179, 14, 1);
INSERT INTO public.requerimiento VALUES (3115, 'PINTURA EN AEROSOL', 179, 14, 1);
INSERT INTO public.requerimiento VALUES (3118, 'ESPONJA DE FREGAR', 179, 29, 1);
INSERT INTO public.requerimiento VALUES (3120, 'BALASTRO de 3 x 32w', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3182, 'Adhesivo e Tela', 193, 31, 5);
INSERT INTO public.requerimiento VALUES (3130, 'GRAPAS', 28, 32, 1);
INSERT INTO public.requerimiento VALUES (3133, 'TONER PARA IMPRESORA HP REFERENCIA C8543X', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3134, 'AZUCAR ', 135, 1, 5);
INSERT INTO public.requerimiento VALUES (3135, 'CAFE', 135, 1, 5);
INSERT INTO public.requerimiento VALUES (3854, 'DISCO DE CORTE PARA METAL 4 1/2', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3140, 'REGLA', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (3141, 'impresora multifuncional', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (3183, 'Algodon', 193, 31, 5);
INSERT INTO public.requerimiento VALUES (3143, 'DISCO DURO DE 500 GB PARA LAPTOP HP', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3144, 'DISCO 1 PORT 10 K SCSI 146 GB432320-001', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3146, 'DISCO 7,2K SATA 500 GB 656107 ', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3147, 'DISCO 10 K SAS 300GB', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3148, 'DISCO 7,2 K 3G SATA MDL 1TB454273-001   ', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3149, 'DISCO 6G DP 10K SAS 300 GB507284-001  ', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3150, 'DISCO 1 PORT 10K SCSI 146GB432320-001 ', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3151, 'DISCO 72GB 15K ULTRA 320SCSI4047B-001   ', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3152, 'DISCO 36.4GB 15K ULTRA 320SCSI  ', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3153, 'DISCO 6GB SAS FRU 42D0633 146GB', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3155, 'DISCO DUAL PORT 15K SCSI 72GB418398-001      ', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3156, 'DISCO 6GB SAS FRU 42D0638 300GB', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3105, 'TERMO DE CAFE', 183, 1, 1);
INSERT INTO public.requerimiento VALUES (3825, 'MOVISTAR', 181, 990, 1);
INSERT INTO public.requerimiento VALUES (3159, 'DISCOS 6G DP 15K SAS 300GB517350-001     ', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3160, 'DISCOS TOSHIBA AL13SEB600 SAS 600 GB 10K 6G N° DE PARTE:HDEBC01GEA51', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3161, 'VÍDEO BEAM ', 179, 85, 1);
INSERT INTO public.requerimiento VALUES (3164, 'RAK PARA SERVIDORES', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (3001, 'AUDITORIA Y CONTABILIDAD', 181, 63, 4);
INSERT INTO public.requerimiento VALUES (3171, 'Genurin Tableta', 193, 15, 5);
INSERT INTO public.requerimiento VALUES (4313, 'TINTA NEGRA', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (3176, 'Rinomax Nasal', 188, 15, 5);
INSERT INTO public.requerimiento VALUES (3177, 'Solución Fisiológica ringer', 188, 15, 5);
INSERT INTO public.requerimiento VALUES (3178, 'Solución fisiológica 09', 188, 15, 5);
INSERT INTO public.requerimiento VALUES (3180, 'Todex', 196, 15, 5);
INSERT INTO public.requerimiento VALUES (3181, 'Enterogermina', 162, 15, 5);
INSERT INTO public.requerimiento VALUES (3184, 'cateter Jelco 20', 193, 31, 5);
INSERT INTO public.requerimiento VALUES (3185, 'Cateter Jelco 24', 193, 31, 5);
INSERT INTO public.requerimiento VALUES (3186, 'Gasas', 193, 31, 5);
INSERT INTO public.requerimiento VALUES (4409, 'KIT FUSOR HP LASERT JET 9040 MFP', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3188, 'Guante esteril', 193, 31, 5);
INSERT INTO public.requerimiento VALUES (3189, 'Inyectadora', 197, 31, 5);
INSERT INTO public.requerimiento VALUES (3190, 'Inyectadora', 198, 31, 5);
INSERT INTO public.requerimiento VALUES (3191, 'Inyectadora', 199, 31, 5);
INSERT INTO public.requerimiento VALUES (4441, 'IMPRESORAS PORTÁTILES (EPSON WORKFORCE WF-100W  ó HP OFFICEJET 200 MOBILE ó CANON PIXMA IP110 )', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (3193, 'Inyectadora', 200, 31, 5);
INSERT INTO public.requerimiento VALUES (3083, 'CUÑETES PINTURA DE TRAFICO', 201, 14, 1);
INSERT INTO public.requerimiento VALUES (3197, 'scalp 21', 202, 31, 5);
INSERT INTO public.requerimiento VALUES (3085, 'CUÑETES DE TRANSICAPA', 201, 14, 1);
INSERT INTO public.requerimiento VALUES (4537, 'ABRE HUECO INDUSTRIAL', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (3093, 'ALICATE ELECTRICISTA', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3116, 'JABON LIQUIDO', 117, 29, 1);
INSERT INTO public.requerimiento VALUES (3170, 'ARREGLOS FLORALES', 179, 33, 1);
INSERT INTO public.requerimiento VALUES (3201, 'Venda Mediana', 149, 31, 5);
INSERT INTO public.requerimiento VALUES (3203, 'Venda Pequeña', 149, 31, 5);
INSERT INTO public.requerimiento VALUES (3207, 'CUÑETES PINTURA DE CAUCHO', 201, 14, 1);
INSERT INTO public.requerimiento VALUES (3109, 'REFRIGERIOS', 179, 1, 1);
INSERT INTO public.requerimiento VALUES (3125, 'FILTRO ANTIPOLEN AIRE ACONDICIONADO', 179, 26, 1);
INSERT INTO public.requerimiento VALUES (3117, 'DESINFECTANTE', 117, 29, 1);
INSERT INTO public.requerimiento VALUES (3209, 'CUÑETE PINTURA BLANCA TIPO B', 201, 14, 1);
INSERT INTO public.requerimiento VALUES (3211, 'Primperan', 193, 15, 5);
INSERT INTO public.requerimiento VALUES (3212, 'Meticorten 5mg', 193, 15, 5);
INSERT INTO public.requerimiento VALUES (3213, 'Solumedrol 125', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (3214, 'Solumedrol', 203, 15, 5);
INSERT INTO public.requerimiento VALUES (3215, 'CEPILLO LAVAR ROPAS', 179, 29, 1);
INSERT INTO public.requerimiento VALUES (3219, 'ROUTER CANTV', 181, 84, 1);
INSERT INTO public.requerimiento VALUES (3217, 'Ivagan Forte', 205, 15, 5);
INSERT INTO public.requerimiento VALUES (3102, 'KIT DE REDES PROFESIONAL', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (3224, 'CENAS CON BEBIDAS', 181, 1, 1);
INSERT INTO public.requerimiento VALUES (3223, 'KIT DE HERRAMIENTAS DE COMPUTACION', 136, 24, 1);
INSERT INTO public.requerimiento VALUES (3218, 'TELEVISION DIGITAL', 181, 47, 1);
INSERT INTO public.requerimiento VALUES (3282, 'CHALECOS REFLECTORES L', 179, 34, 1);
INSERT INTO public.requerimiento VALUES (4186, 'KIT DE BOMBA DE DIRECCION', 227, 26, 1);
INSERT INTO public.requerimiento VALUES (3287, 'Uniforme de sotfball', 148, 5, 1);
INSERT INTO public.requerimiento VALUES (3234, 'TENSIOMETROS', 179, 979, 1);
INSERT INTO public.requerimiento VALUES (3235, 'NEBULIZADORES', 179, 979, 1);
INSERT INTO public.requerimiento VALUES (3826, 'DIRECTV', 181, 47, 1);
INSERT INTO public.requerimiento VALUES (3993, 'Cámaras fotográficas Panasonic DMC-FH12', 179, 85, 1);
INSERT INTO public.requerimiento VALUES (3243, 'TOMA CORRIENTE DOBLE', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3249, 'BREAKER DE 2*50 AMPERIOS', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3250, 'BANDERAS ', 179, 4, 1);
INSERT INTO public.requerimiento VALUES (3253, 'CEMENTO GRIS', 150, 21, 1);
INSERT INTO public.requerimiento VALUES (4378, 'BOMBILLOS OJOS DE BUEY', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3255, 'Buscapina compositum x 30', 193, 15, 5);
INSERT INTO public.requerimiento VALUES (3257, 'Buscapina Plus x20', 193, 15, 5);
INSERT INTO public.requerimiento VALUES (3206, 'Mascarilla para Nebulizar', 179, 31, 5);
INSERT INTO public.requerimiento VALUES (3230, 'MANTENIMIENTO MANGUERA TENSIOMETROS', 181, 70, 1);
INSERT INTO public.requerimiento VALUES (3231, 'MANTENIMIENTO EQUIPO ECOSONOGRAMA', 181, 70, 1);
INSERT INTO public.requerimiento VALUES (3232, 'MANTENIMIENTO ELECTROCARDIOGRAMA', 181, 70, 1);
INSERT INTO public.requerimiento VALUES (3229, 'MANTENIMIENTO DE NEBULIZADORES', 181, 70, 1);
INSERT INTO public.requerimiento VALUES (4474, 'GUILLOTINA TABLOIDE', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (3260, 'notolac 20mg', 193, 15, 5);
INSERT INTO public.requerimiento VALUES (3263, 'INSECTICIDAD', 179, 975, 1);
INSERT INTO public.requerimiento VALUES (4569, 'CREYONES', 28, 32, 1);
INSERT INTO public.requerimiento VALUES (4601, 'AMBIENTADOR', 179, 29, 1);
INSERT INTO public.requerimiento VALUES (4633, 'BALON DE FUTBOL', 179, 28, 1);
INSERT INTO public.requerimiento VALUES (3226, 'MANTENIMIENTO PREVENTIVO DE AGUAS BLANCAS', 181, 71, 1);
INSERT INTO public.requerimiento VALUES (4726, 'CARTUCHOS HP Officejet 460/470 ', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3275, 'CASCOS INTEGRALES', 179, 34, 1);
INSERT INTO public.requerimiento VALUES (3276, 'IMPERMEABLES', 179, 34, 1);
INSERT INTO public.requerimiento VALUES (3277, 'GUANTES', 179, 34, 1);
INSERT INTO public.requerimiento VALUES (3278, 'LENTES DE PROTECCION', 179, 34, 1);
INSERT INTO public.requerimiento VALUES (3279, 'LIGAS DE PRENSAR', 179, 34, 1);
INSERT INTO public.requerimiento VALUES (3289, 'Uniforme de fútbol de sala', 148, 5, 1);
INSERT INTO public.requerimiento VALUES (3290, 'Rodilleras', 179, 28, 1);
INSERT INTO public.requerimiento VALUES (3291, 'Balonera de malla', 179, 28, 1);
INSERT INTO public.requerimiento VALUES (4780, 'GPS -GARMIN DRIVESMART 60LMT 6', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (3294, 'Balón De Fútbol Sala ', 210, 28, 1);
INSERT INTO public.requerimiento VALUES (4841, 'Perfiles', 179, 22, 1);
INSERT INTO public.requerimiento VALUES (3296, 'Balón Voleibol', 210, 28, 1);
INSERT INTO public.requerimiento VALUES (3297, 'Balón de basketball', 210, 28, 1);
INSERT INTO public.requerimiento VALUES (3247, 'BOMBILLOS PL 13 LD', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3302, 'Bate de sotfball', 179, 28, 1);
INSERT INTO public.requerimiento VALUES (4896, 'CAL EN PASTA', 117, 21, 1);
INSERT INTO public.requerimiento VALUES (3310, 'CARTUCHO HP 95 COLOR DJ', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4956, 'PROTEINAS', 247, 1, 5);
INSERT INTO public.requerimiento VALUES (4538, 'CONEXION DUCTOBARRAS A TABLEROS ELECTRICOS SEDE II', 233, 68, 1);
INSERT INTO public.requerimiento VALUES (5001, 'PORTA AGUJA GINECOLOGICO', 179, 31, 1);
INSERT INTO public.requerimiento VALUES (3210, 'Novalcina', 5, 15, 5);
INSERT INTO public.requerimiento VALUES (5061, 'RECARGA DE EXTINTORES DE OFICINAS REGIONALES', 181, 78, 1);
INSERT INTO public.requerimiento VALUES (3313, 'CARTUCHO HP 94 XL NEGRO', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3365, 'SWITCH D-LINK 16 PUERTOS 10/100 MBPS DES-1016', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (3394, 'DISCO DURO EXTERNO 2TB', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4411, 'LITROS DE ACEITE DOS TIEMPOS DESMALEZADORA', 179, 17, 1);
INSERT INTO public.requerimiento VALUES (3387, 'LAPTOP', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (3317, 'CABLE DE RED UTP CAT 5 LANPRO', 226, 89, 1);
INSERT INTO public.requerimiento VALUES (3889, 'BOLIGRAFOS UNIBALL AZUL', 39, 32, 1);
INSERT INTO public.requerimiento VALUES (3344, 'DIRECTV', 181, 47, 1);
INSERT INTO public.requerimiento VALUES (4475, 'RESMA DE PAPEL TABLOIDE', 230, 13, 1);
INSERT INTO public.requerimiento VALUES (3827, 'CANTV', 181, 47, 1);
INSERT INTO public.requerimiento VALUES (3348, 'CABEZAL 72 GRIS PHOTO BLACK', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3349, 'CABEZAL 72 MAGENTA/CIAN', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3350, 'CABEZAL 72 MATTE BLACK/YELLOW', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4602, ' LIMPIEADORA DE PISO', 179, 29, 1);
INSERT INTO public.requerimiento VALUES (4727, 'CARTUCHO HP 895', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4781, 'JUEGO DE ANTENAS ', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4811, 'CONECTORES DE TLF AURICULARES', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3367, 'SWITCH DE 48 PUERTOS POE', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4842, 'Laminas lisas', 179, 22, 1);
INSERT INTO public.requerimiento VALUES (3354, 'MOUSE', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4897, 'YESO', 150, 21, 1);
INSERT INTO public.requerimiento VALUES (3376, 'DISCO PORTATIL DE 500GB', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (3400, 'KIT TAMBOR NEGRO C8560A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3401, 'KIT TAMBOR AZUL C8561A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3379, 'ACTUALIZACION DE SOFTWARE DE CENTRAL TELEFONICA', 181, 91, 1);
INSERT INTO public.requerimiento VALUES (3402, 'KIT TAMBOR AMARILLO C8562A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3403, 'KIT TAMBOR MAGENTA C8563A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3383, 'SERVIDOR', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (3405, 'KIT DE TRANSFERENCIA C8555A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3406, 'KIT FUSOR DE IMÁGENES C8556A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3324, 'CARTUCHO PARA IMPRESORA HP CP2025 (CC530A)', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4957, 'TONER UNIVERSAL', 135, 35, 1);
INSERT INTO public.requerimiento VALUES (3389, 'CERTIFICADOS ELECTRÓNICO DE SOFTWARE PARA EL PORTAL DE REGISTRO.NIC.VE Y SERVIDOR DE CORREO DEL NIC.VE.', 181, 91, 1);
INSERT INTO public.requerimiento VALUES (3395, 'KIT DE MANTENIMIENTO C9152A', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3397, 'TONER CYAN C8551A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3398, 'TONER YELLOW C8552A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3399, 'TONER MAGENTA C8553A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3407, 'CARTUCHO TONER AMARILLO (HP507) CE402A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3408, 'CARTUCHO TONER MAGENTA (CE403A) CE403A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3409, 'CARTUCHO TONER NEGRO (CE400) CE400A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3410, 'KIT FUSOR CE506A', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3411, 'ADF ROLLER REPLACEMENT KIT L2718A', 179, 79, 1);
INSERT INTO public.requerimiento VALUES (3415, 'CARTUCHO CYAN CC531A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3417, 'CARTUCHO MAGENTA CC533A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (5002, 'ESTERILIZADOR PORTATIL.', 179, 979, 1);
INSERT INTO public.requerimiento VALUES (4570, 'CUADERNOS 1 LINEA', 179, 10, 1);
INSERT INTO public.requerimiento VALUES (3414, 'KIT DE MANTENIMIENTO (CF064A) ', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3413, 'CARTUCHO TONER 90A CE 390A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3222, 'ROUTER INALAMBRICO', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (3202, 'BOLSAS PLASTICAS 40 KR', 146, 18, 1);
INSERT INTO public.requerimiento VALUES (3204, 'BOLSAS PLASTICAS PAPELERA', 146, 18, 1);
INSERT INTO public.requerimiento VALUES (5062, 'REPUESTOS VARIOS PARA VEHICULOS', 181, 26, 1);
INSERT INTO public.requerimiento VALUES (3208, 'CUÑETE PINTURA BLANCA TIPO A', 201, 14, 1);
INSERT INTO public.requerimiento VALUES (3419, 'TONER NEGRO 305X CE410X', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3420, 'TONER AZUL 305X CE411A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3421, 'TONER AMARILLO 305A CE412A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3422, 'TONER MAGENTA 305A CE413A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3423, 'CARTUCHO NEGRO (HP 920) CD971AL', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3424, 'CARTUCHO CYAN (HP 920) CD972AL', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3425, 'CARTUCHO AMARILLO (HP 920) CD974AL', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3426, 'CARTUCHO MAGENTA (HP 920) CD973AL', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3427, 'CARTUCHO NEGRO (HP 60) CC640W', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3428, 'CARTUCHO TRICOLOR (HP 60) CC643W', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3429, 'CARTUCHO NEGRO(HP 122) CH561HL', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3430, 'CARTUCHO TRICOLOR(HP 122) CH562H', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3431, 'CARTUCHO NEGRO (HP 61) CH561W', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3432, 'CARTUCHO TRICOLOR (HP 62) CH562W', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3434, 'CARTUCHO NEGRO (HP 72) C9403A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3435, 'CARTUCHO NEGRO FOTOGRAFIA (HP 72) C9370A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3437, 'CARTUCHO MAGENTA (HP 72) C9372A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3438, 'CARTUCHO AMARILLO (HP 72) C9373A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3439, 'CARTUCHO GRIS (HP 72) C9374A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3440, 'CINTA EPSON FX 890 S015329', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3441, 'CINTA EPSON LQ-590 S015337', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3442, 'CARTUCHO NEGRO HP( 56) C6656AL', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3443, 'CARTUCHO TRICOLOR HP( 57) C6657AL', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4958, 'TINTA LIQUIDA HP', 183, 35, 1);
INSERT INTO public.requerimiento VALUES (3433, 'CARTUCHO NEGRO (HP98) C9364W', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3890, 'BORRADOR PARA PIZARRA ACRILICA', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (3649, 'GAS REFRIGERANTE R22 (BOMBONA DESECHABLE DE 13,6 Kgrs.)', 179, 2, 1);
INSERT INTO public.requerimiento VALUES (3418, 'CARTUCHO NEGRO CE505A', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4220, 'OLLA SOPERA 80 LITROS GRUESA', 179, 30, 1);
INSERT INTO public.requerimiento VALUES (3496, 'SUMINISTRO E INSTALACIONES DE EQUIPOS Y MAQUINARIAS PARA EL FUNCIONAMIENTO DE PLANTAS ELECTRICAS BOMBAS DE AGUA', 181, 985, 1);
INSERT INTO public.requerimiento VALUES (3499, 'TRIPAS PARA CAUCHOS', 179, 7, 1);
INSERT INTO public.requerimiento VALUES (4284, 'CINTA DE SEGURIDAD DE PELIGRO', 179, 34, 1);
INSERT INTO public.requerimiento VALUES (3477, 'EVENTOS INSTITUCIONALES', 181, 56, 1);
INSERT INTO public.requerimiento VALUES (3142, 'BOTONES DE RECONOCIMIENTO', 179, 33, 1);
INSERT INTO public.requerimiento VALUES (4380, 'EMPACADURAS PARA MANGERA', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (4476, 'PEGA UHU', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4508, 'ZOOM H5 FOUR TRACK PORTABLE  RECORDER', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (5003, 'OXIMETRO', 179, 31, 1);
INSERT INTO public.requerimiento VALUES (4728, 'CARTUCHO HP 500 CE 402A / 403A/ 401A/ CE400X', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3473, 'EXAMENES MEDICOS PREEMPLEOS', 181, 981, 1);
INSERT INTO public.requerimiento VALUES (3474, 'EXAMENES MEDICOS PREVACACIONALES', 181, 981, 1);
INSERT INTO public.requerimiento VALUES (4782, 'LAPTOP ', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4812, 'CISCO LINKSIS  ROUTER', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4843, 'Contra enchapados', 179, 22, 1);
INSERT INTO public.requerimiento VALUES (3470, 'BOLETO AEREO INTERNACIONAL', 181, 62, 1);
INSERT INTO public.requerimiento VALUES (4898, 'LAMINA CONTRACHAPADA ', 179, 22, 1);
INSERT INTO public.requerimiento VALUES (3489, 'ALIMENTOS Y BEBIDAS PARA REUNIONES', 179, 1, 1);
INSERT INTO public.requerimiento VALUES (3828, 'MOVISTAR COMUNICACIONES', 181, 47, 1);
INSERT INTO public.requerimiento VALUES (3742, 'MANTENIMIENTO DE SISTEMA DE APERTURA Y CIERRE DE PORTON DE LA TORRE I CONATEL.', 181, 73, 1);
INSERT INTO public.requerimiento VALUES (4348, 'JUEGO DE ALICATES PARA ELECTRICISTAS', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (5033, 'TARJETA SANGOMA PARA RESPALDO DEL ASTERIK', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4667, 'DELANTAL CON COCINERO CON GORRO', 179, 5, 1);
INSERT INTO public.requerimiento VALUES (2728, 'PEGA DE BARRA', 218, 38, 1);
INSERT INTO public.requerimiento VALUES (3446, 'DISCO 10K SAS 146GB ', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (3491, 'PRENSA NACIONAL', 179, 11, 1);
INSERT INTO public.requerimiento VALUES (3286, 'BOTAS DE SEGURIDAD PARA OBREROS ', 192, 980, 1);
INSERT INTO public.requerimiento VALUES (3505, 'CHEMISE PARA OBREROS', 148, 980, 1);
INSERT INTO public.requerimiento VALUES (5063, 'REPARACION DE CAUCHOS DE VEHICULOS', 181, 78, 1);
INSERT INTO public.requerimiento VALUES (3508, 'CHEMISES CONTRATADOS', 39, 977, 1);
INSERT INTO public.requerimiento VALUES (4156, 'ALMOHADILLAS PARA MOUSE', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4189, 'OLLAS 5 LITROS', 179, 30, 1);
INSERT INTO public.requerimiento VALUES (4253, 'MONITORES 23 LED', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (3510, 'BOTAS DE SEGURIDAD PARA CONTRATADOS', 192, 34, 1);
INSERT INTO public.requerimiento VALUES (4381, 'MANGUERA (10 MTS)', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (4477, 'REGLA DE ACERO', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4509, 'MICROFONO LYXPRO MPL20 5400', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (4636, 'TERMO POTAMO 44 LITROS                       ', 179, 90, 1);
INSERT INTO public.requerimiento VALUES (3128, 'BORRADORES NATA', 179, 32, 1);
INSERT INTO public.requerimiento VALUES (4729, 'CARTUCHO HP 1000 N122', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4813, 'MOUSES USB', 179, 89, 1);
INSERT INTO public.requerimiento VALUES (4445, 'CÁMARA DIGITAL SONY 20.1 MP', 179, 85, 1);
INSERT INTO public.requerimiento VALUES (4844, 'cemento', 150, 21, 1);
INSERT INTO public.requerimiento VALUES (4871, 'CURVA PARA TUBERIA PAVCO ¾” 45°', 179, 22, 1);
INSERT INTO public.requerimiento VALUES (4899, 'PEGA BLANCA, ELEFANTE', 117, 32, 1);
INSERT INTO public.requerimiento VALUES (5034, 'VIDEO BEAM', 179, 84, 1);
INSERT INTO public.requerimiento VALUES (5073, 'RESMAS DE HOJAS TAMAÑO OFICIA', 179, 8, 1);
INSERT INTO public.requerimiento VALUES (4184, 'PAPEL BOND ', 227, 26, 1);
INSERT INTO public.requerimiento VALUES (5072, 'RESMA DE HOJAS TAMAÑO CARTA', 179, 8, 1);
INSERT INTO public.requerimiento VALUES (5074, 'SACO DE CEMENTO BLANCO', 179, 21, 1);
INSERT INTO public.requerimiento VALUES (3735, ' EQUIPOS DE AIRE ACONDICIONADO DE 5 TON ', 179, 90, 1);
INSERT INTO public.requerimiento VALUES (5075, 'PENDRIVE 32 GB', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (4038, 'MAQUINA DESTRUCTORA DE PAPEL', 179, 90, 1);
INSERT INTO public.requerimiento VALUES (3220, 'TONER PREMIUN C8543 X LJ 9000/9050 COMPATIBLE HP C8543', 179, 35, 1);
INSERT INTO public.requerimiento VALUES (3898, 'GRAPAS LISAS WINGO', 193, 32, 1);
INSERT INTO public.requerimiento VALUES (3095, 'DESTORNILLADOS DE PALA JUEGO DE 6 ', 179, 24, 1);
INSERT INTO public.requerimiento VALUES (4343, 'BOLSAS NEGRAS 200 LITROS ', 179, 18, 1);
INSERT INTO public.requerimiento VALUES (3881, 'SOBRES MANILA TAMAÑO CARTA', 179, 10, 1);
INSERT INTO public.requerimiento VALUES (3493, 'REPUESTOS Y ACCESORIOS PARA VEHICULOS Y MOTOS', 181, 26, 1);
INSERT INTO public.requerimiento VALUES (4886, 'DESINFECTANTE', 117, 29, 1);
INSERT INTO public.requerimiento VALUES (5076, 'COLETOS', 179, 29, 1);
INSERT INTO public.requerimiento VALUES (4603, 'HARAGAN', 179, 29, 1);
INSERT INTO public.requerimiento VALUES (3512, 'CLORO', 201, 29, 1);
INSERT INTO public.requerimiento VALUES (3743, 'MANTENIMIENTO PLANTAS ELECTRICAS ', 181, 1001, 1);
INSERT INTO public.requerimiento VALUES (5077, 'JUEGO DE SARTENES', 179, 30, 1);
INSERT INTO public.requerimiento VALUES (5078, 'JUEGO DE CUBIERTOS', 179, 30, 1);
INSERT INTO public.requerimiento VALUES (4635, 'CAMISA TIPO COLUMBIA', 179, 5, 1);
INSERT INTO public.requerimiento VALUES (3594, 'INTERRUPTOR SENCILLO P/EMPOTRAR', 179, 36, 1);
INSERT INTO public.requerimiento VALUES (3532, 'LLAVES P /LAVAMANOS INDIVIDUALES', 179, 37, 1);
INSERT INTO public.requerimiento VALUES (5079, 'BATERIAS P/VEHICULOS', 179, 26, 1);
INSERT INTO public.requerimiento VALUES (5082, 'Prueba1', 198, 70, 1);
INSERT INTO public.requerimiento VALUES (5084, 'p', NULL, NULL, NULL);
INSERT INTO public.requerimiento VALUES (5093, 'aaa', 198, 70, 5);
INSERT INTO public.requerimiento VALUES (5085, 'tableta', 205, 975, 1);
INSERT INTO public.requerimiento VALUES (5086, 'BOTAS DE SEGURIDAD', 179, 6, 1);
INSERT INTO public.requerimiento VALUES (5087, 'aaa', 198, 70, 5);
INSERT INTO public.requerimiento VALUES (5088, 'aaa', 198, 70, 5);
INSERT INTO public.requerimiento VALUES (5089, 'aaa', 198, 70, 5);
INSERT INTO public.requerimiento VALUES (5090, 'aaa', 198, 70, 5);
INSERT INTO public.requerimiento VALUES (5091, 'aaa', 198, 70, 5);
INSERT INTO public.requerimiento VALUES (5092, 'aaa', 198, 70, 5);
INSERT INTO public.requerimiento VALUES (5094, 'aaa', 198, 70, 5);
INSERT INTO public.requerimiento VALUES (5098, 'aaa', 205, 975, 4);
INSERT INTO public.requerimiento VALUES (5099, 'aaa', 198, 70, 5);
INSERT INTO public.requerimiento VALUES (5100, 'botellas', 193, 59, 1);


--
-- TOC entry 3317 (class 0 OID 20373)
-- Dependencies: 233
-- Data for Name: tbl_presupuesto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3322 (class 0 OID 20388)
-- Dependencies: 238
-- Data for Name: tbl_subespecifico; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3324 (class 0 OID 20396)
-- Dependencies: 240
-- Data for Name: tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo VALUES (1, 'ACCION CENTRALIZADA');
INSERT INTO public.tipo VALUES (2, 'PROYECTO');


--
-- TOC entry 3326 (class 0 OID 20404)
-- Dependencies: 242
-- Data for Name: tipo_moneda; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3335 (class 0 OID 20700)
-- Dependencies: 251
-- Data for Name: unidad_medida; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.unidad_medida VALUES (1, 'ups', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 32);
INSERT INTO public.unidad_medida VALUES (3, 'servidores', NULL, 999, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 33);
INSERT INTO public.unidad_medida VALUES (4, 'ups', 60, 4, 5, 6, 7, 8, 7, 6, 5, 4, 3, 2, 3, 30);
INSERT INTO public.unidad_medida VALUES (5, 'servidores', 12, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 30);
INSERT INTO public.unidad_medida VALUES (6, 'contrato', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34);
INSERT INTO public.unidad_medida VALUES (7, 'resmas', 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35);


--
-- TOC entry 3333 (class 0 OID 20681)
-- Dependencies: 249
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3327 (class 0 OID 20411)
-- Dependencies: 243
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario VALUES ('afuentes', '$2y$13$n.EPt2nivuZLRTgYqJRlZu3hOkIYVUUPVMhJgOtpBkejE.yRABNF2', 2, 17, 'ANTHONY', 'FUENTES', 25409661, 'COORDINADOR', 'AFUENTES@CONATEL.GOB.VE', 1, 'RZcvVHYIEFrezAVD891KbQk1aLJl5acL', 4);
INSERT INTO public.usuario VALUES ('jonder123', '$2y$13$glPfOVro81gWzGuRqQ/YS.UiD47owGDQQwrpZQKu47fgMuzbWEAPa', 2, 37, 'JONDER ALEYN', 'RODRIGUEZ', 29333112, 'COORDINADOR', 'jonder@CONATEL.GOB.VE', 1, 'Ua1g4lhYlDfoxRsgguGxVZmuC1H9zgCL', 7);
INSERT INTO public.usuario VALUES ('prueba', '$2y$13$CvaEKcwFEq.Kcq.4x.W2D.VtTMp4CSqCXrCl.Y6FMkEdpNOmVDqum', 2, 33, 'Prueba', 'prueba', 111111111, 'COORDINADOR', 'prueba@conatel.gob.ve', 1, 'pghwyD2vV28XIW7J8fjs9AOAaM86v9bl', 10);
INSERT INTO public.usuario VALUES ('jancheta', '$2y$13$Ke1VwnUc9B9KqFtAgw0Sa.vKA9ZC0Qb5txgJZ.nWPV.zuaExAT5bm', 2, 7, 'janet', 'ancheta', 12393832, 'ANALISTA', 'jancheta@conatel.gob.ve', 1, 'fOn0_lkq1x1NDHk6fsiCWGLf6ae_8FU1', 11);
INSERT INTO public.usuario VALUES ('admin', '$2y$13$f4ZvSYUfLKC1yZql2vIaL.GLR..D.Gk1Pw7fLtnBS1mOIVTUVKDpC', 1, 17, 'ADMIN', 'ADMIN', 11111111, 'ADMINISTRADOR', 'ADMIN@CONATEL.GOB.VE', 1, 'XEK71vfVnNsaTw7fidt82hXqg1as943P', 6);
INSERT INTO public.usuario VALUES ('nleidenz', '$2y$13$MqHUqk0Qpq062xXjab0AIeB/oUF7y7g9/Kx.7rwoFZTGSZBaFFUby', 2, 35, 'NELSON', 'LEIDENZ', 13498678, 'ANALISTA', 'NLEIDENZ@CONATEL.GOB.VE', 1, 'PPqCLCGFOuzEmdwsy4aMtAKRwFLz1fp5', 5);


--
-- TOC entry 3329 (class 0 OID 20419)
-- Dependencies: 245
-- Data for Name: visibilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.visibilidad VALUES (1, '1');
INSERT INTO public.visibilidad VALUES (2, '2');


--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 204
-- Name: actividades_idactividad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actividades_idactividad_seq', 35, true);


--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 212
-- Name: calendario_id_calendario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.calendario_id_calendario_seq', 40288, true);


--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 214
-- Name: costo_idcosto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.costo_idcosto_seq', 4973, true);


--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 217
-- Name: generica_id_generica_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.generica_id_generica_seq', 47, true);


--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 219
-- Name: id_accion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_accion_id_seq', 53, true);


--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 220
-- Name: id_gerencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_gerencia_id_seq', 43, true);


--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 222
-- Name: iva_id_iva_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iva_id_iva_seq', 6, true);


--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 224
-- Name: medida_idmedida_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medida_idmedida_seq', 249, true);


--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 246
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_id_seq', 6, true);


--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 226
-- Name: moneda_id_moneda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moneda_id_moneda_seq', 1, false);


--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 230
-- Name: plan_basecalculo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plan_basecalculo_seq', 1, false);


--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 234
-- Name: presupusto_id_presupuesto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presupusto_id_presupuesto_seq', 1, false);


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 236
-- Name: producto_idproducto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_idproducto_seq', 5100, true);


--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 210
-- Name: proyecto_idproyecto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proyecto_idproyecto_seq', 100, true);


--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 237
-- Name: tbl_especifico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_especifico_id_seq', 1005, true);


--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 227
-- Name: tbl_partida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_partida_id_seq', 6, true);


--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 231
-- Name: tbl_presu_partida_id_partida_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_presu_partida_id_partida_seq', 3, true);


--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 239
-- Name: tbl_subespecifico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_subespecifico_id_seq', 462, true);


--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 241
-- Name: tipo_id_tipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_id_tipo_seq', 1, false);


--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 250
-- Name: unidad_medida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unidad_medida_id_seq', 7, true);


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 248
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 244
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 11, true);


--
-- TOC entry 3069 (class 2606 OID 20439)
-- Name: actividades actividades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividades_pkey PRIMARY KEY (idactividad);


--
-- TOC entry 3071 (class 2606 OID 20441)
-- Name: auth_assignment auth_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_assignment
    ADD CONSTRAINT auth_assignment_pkey PRIMARY KEY (item_name, user_id);


--
-- TOC entry 3077 (class 2606 OID 20443)
-- Name: auth_item_child auth_item_child_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_item_child
    ADD CONSTRAINT auth_item_child_pkey PRIMARY KEY (parent, child);


--
-- TOC entry 3074 (class 2606 OID 20445)
-- Name: auth_item auth_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_item
    ADD CONSTRAINT auth_item_pkey PRIMARY KEY (name);


--
-- TOC entry 3079 (class 2606 OID 20447)
-- Name: auth_rule auth_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_rule
    ADD CONSTRAINT auth_rule_pkey PRIMARY KEY (name);


--
-- TOC entry 3085 (class 2606 OID 20449)
-- Name: costo costo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.costo
    ADD CONSTRAINT costo_pkey PRIMARY KEY (idcosto);


--
-- TOC entry 3067 (class 2606 OID 20451)
-- Name: accion id_accion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accion
    ADD CONSTRAINT id_accion_pkey PRIMARY KEY (id_accion);


--
-- TOC entry 3091 (class 2606 OID 20453)
-- Name: gerencia id_gerencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gerencia
    ADD CONSTRAINT id_gerencia_pkey PRIMARY KEY (id_gerencia);


--
-- TOC entry 3115 (class 2606 OID 20455)
-- Name: usuario id_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT id_usuario PRIMARY KEY (id);


--
-- TOC entry 3081 (class 2606 OID 20457)
-- Name: poa idpoa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poa
    ADD CONSTRAINT idpoa_pkey PRIMARY KEY (idpoa);


--
-- TOC entry 3093 (class 2606 OID 20459)
-- Name: iva iva_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iva
    ADD CONSTRAINT iva_pkey PRIMARY KEY (id_iva);


--
-- TOC entry 3095 (class 2606 OID 20461)
-- Name: medida medida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medida
    ADD CONSTRAINT medida_pkey PRIMARY KEY (idmedida);


--
-- TOC entry 3119 (class 2606 OID 20673)
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- TOC entry 3097 (class 2606 OID 20463)
-- Name: migration migration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);


--
-- TOC entry 3113 (class 2606 OID 20465)
-- Name: tipo_moneda necesidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_moneda
    ADD CONSTRAINT necesidad_pkey PRIMARY KEY (id_moneda);


--
-- TOC entry 3099 (class 2606 OID 20467)
-- Name: partida partida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partida
    ADD CONSTRAINT partida_pkey PRIMARY KEY (id);


--
-- TOC entry 3101 (class 2606 OID 20469)
-- Name: perfil perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT perfil_pkey PRIMARY KEY (id_perfil);


--
-- TOC entry 3083 (class 2606 OID 20471)
-- Name: basecalculo plan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basecalculo
    ADD CONSTRAINT plan_pkey PRIMARY KEY (id_plan);


--
-- TOC entry 3105 (class 2606 OID 20473)
-- Name: tbl_presupuesto presupusto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_presupuesto
    ADD CONSTRAINT presupusto_pkey PRIMARY KEY (id_presupuesto);


--
-- TOC entry 3107 (class 2606 OID 20475)
-- Name: requerimiento producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requerimiento
    ADD CONSTRAINT producto_pkey PRIMARY KEY (idproducto);


--
-- TOC entry 3087 (class 2606 OID 20477)
-- Name: especifico tbl_especifico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especifico
    ADD CONSTRAINT tbl_especifico_pkey PRIMARY KEY (id_especifico);


--
-- TOC entry 3103 (class 2606 OID 20479)
-- Name: presu_partida tbl_partida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presu_partida
    ADD CONSTRAINT tbl_partida_pkey PRIMARY KEY (id_partida);


--
-- TOC entry 3109 (class 2606 OID 20481)
-- Name: tbl_subespecifico tbl_subespecifico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_subespecifico
    ADD CONSTRAINT tbl_subespecifico_pkey PRIMARY KEY (id);


--
-- TOC entry 3089 (class 2606 OID 20483)
-- Name: generico tbl_subramo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.generico
    ADD CONSTRAINT tbl_subramo_pkey PRIMARY KEY (id_generico);


--
-- TOC entry 3111 (class 2606 OID 20485)
-- Name: tipo tipo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo
    ADD CONSTRAINT tipo_pkey PRIMARY KEY (id_tipo);


--
-- TOC entry 3123 (class 2606 OID 20708)
-- Name: unidad_medida unidad_medida_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidad_medida
    ADD CONSTRAINT unidad_medida_pk PRIMARY KEY (id);


--
-- TOC entry 3121 (class 2606 OID 20690)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3117 (class 2606 OID 20487)
-- Name: visibilidad visibilidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visibilidad
    ADD CONSTRAINT visibilidad_pkey PRIMARY KEY (id_visibilidad);


--
-- TOC entry 3072 (class 1259 OID 20488)
-- Name: idx-auth_assignment-user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx-auth_assignment-user_id" ON public.auth_assignment USING btree (user_id);


--
-- TOC entry 3075 (class 1259 OID 20489)
-- Name: idx-auth_item-type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx-auth_item-type" ON public.auth_item USING btree (type);


--
-- TOC entry 3124 (class 2606 OID 20490)
-- Name: accion accion_id_tipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accion
    ADD CONSTRAINT accion_id_tipo_fkey FOREIGN KEY (id_tipo) REFERENCES public.tipo(id_tipo) NOT VALID;


--
-- TOC entry 3125 (class 2606 OID 20495)
-- Name: accion acción_idgerencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accion
    ADD CONSTRAINT "acción_idgerencia_fkey" FOREIGN KEY (idgerencia) REFERENCES public.gerencia(id_gerencia) NOT VALID;


--
-- TOC entry 3126 (class 2606 OID 20500)
-- Name: accion acción_idpoa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accion
    ADD CONSTRAINT "acción_idpoa_fkey" FOREIGN KEY (idpoa) REFERENCES public.poa(idpoa) NOT VALID;


--
-- TOC entry 3127 (class 2606 OID 20505)
-- Name: actividades actividad_idaccionespecifica; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividad_idaccionespecifica FOREIGN KEY (idaccionespecifica) REFERENCES public.accion(id_accion);


--
-- TOC entry 3128 (class 2606 OID 20510)
-- Name: actividades actividades_id_gerencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividades_id_gerencia_fkey FOREIGN KEY (id_gerencia) REFERENCES public.gerencia(id_gerencia) NOT VALID;


--
-- TOC entry 3129 (class 2606 OID 20515)
-- Name: actividades actividades_id_poa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividades_id_poa_fkey FOREIGN KEY (id_poa) REFERENCES public.poa(idpoa) NOT VALID;


--
-- TOC entry 3130 (class 2606 OID 20520)
-- Name: actividades actividades_id_tipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actividades
    ADD CONSTRAINT actividades_id_tipo_fkey FOREIGN KEY (id_tipo) REFERENCES public.tipo(id_tipo) NOT VALID;


--
-- TOC entry 3131 (class 2606 OID 20525)
-- Name: auth_assignment auth_assignment_item_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_assignment
    ADD CONSTRAINT auth_assignment_item_name_fkey FOREIGN KEY (item_name) REFERENCES public.auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3133 (class 2606 OID 20530)
-- Name: auth_item_child auth_item_child_child_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_item_child
    ADD CONSTRAINT auth_item_child_child_fkey FOREIGN KEY (child) REFERENCES public.auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3134 (class 2606 OID 20535)
-- Name: auth_item_child auth_item_child_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_item_child
    ADD CONSTRAINT auth_item_child_parent_fkey FOREIGN KEY (parent) REFERENCES public.auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3132 (class 2606 OID 20540)
-- Name: auth_item auth_item_rule_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_item
    ADD CONSTRAINT auth_item_rule_name_fkey FOREIGN KEY (rule_name) REFERENCES public.auth_rule(name) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3138 (class 2606 OID 20545)
-- Name: basecalculo basecalculo_id_accion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basecalculo
    ADD CONSTRAINT basecalculo_id_accion_fkey FOREIGN KEY (id_accion) REFERENCES public.accion(id_accion) NOT VALID;


--
-- TOC entry 3139 (class 2606 OID 20550)
-- Name: basecalculo basecalculo_id_actividad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basecalculo
    ADD CONSTRAINT basecalculo_id_actividad_fkey FOREIGN KEY (id_actividad) REFERENCES public.actividades(idactividad) NOT VALID;


--
-- TOC entry 3140 (class 2606 OID 20555)
-- Name: basecalculo basecalculo_id_moneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basecalculo
    ADD CONSTRAINT basecalculo_id_moneda_fkey FOREIGN KEY (id_moneda) REFERENCES public.tipo_moneda(id_moneda) NOT VALID;


--
-- TOC entry 3148 (class 2606 OID 20560)
-- Name: costo costo_idmedida_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.costo
    ADD CONSTRAINT costo_idmedida_fkey FOREIGN KEY (idmedida) REFERENCES public.medida(idmedida);


--
-- TOC entry 3149 (class 2606 OID 20565)
-- Name: costo costo_idproducto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.costo
    ADD CONSTRAINT costo_idproducto_fkey FOREIGN KEY (idproducto) REFERENCES public.requerimiento(idproducto);


--
-- TOC entry 3158 (class 2606 OID 20674)
-- Name: menu menu_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_parent_fkey FOREIGN KEY (parent) REFERENCES public.menu(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3141 (class 2606 OID 20570)
-- Name: basecalculo plan_id_gerencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basecalculo
    ADD CONSTRAINT plan_id_gerencia_fkey FOREIGN KEY (id_gerencia) REFERENCES public.gerencia(id_gerencia);


--
-- TOC entry 3142 (class 2606 OID 20575)
-- Name: basecalculo plan_poa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basecalculo
    ADD CONSTRAINT plan_poa_fkey FOREIGN KEY (id_poa) REFERENCES public.poa(idpoa);


--
-- TOC entry 3135 (class 2606 OID 20580)
-- Name: poa poa_id_gerencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poa
    ADD CONSTRAINT poa_id_gerencia_fkey FOREIGN KEY (id_gerencia) REFERENCES public.gerencia(id_gerencia) NOT VALID;


--
-- TOC entry 3136 (class 2606 OID 20585)
-- Name: poa poa_id_tipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poa
    ADD CONSTRAINT poa_id_tipo_fkey FOREIGN KEY (id_tipo) REFERENCES public.tipo(id_tipo) NOT VALID;


--
-- TOC entry 3137 (class 2606 OID 20590)
-- Name: poa poa_idvisibilidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poa
    ADD CONSTRAINT poa_idvisibilidad_fkey FOREIGN KEY (idvisibilidad) REFERENCES public.visibilidad(id_visibilidad) NOT VALID;


--
-- TOC entry 3153 (class 2606 OID 20595)
-- Name: requerimiento producto_idespecifico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requerimiento
    ADD CONSTRAINT producto_idespecifico_fkey FOREIGN KEY (idespecifico) REFERENCES public.especifico(id_especifico);


--
-- TOC entry 3154 (class 2606 OID 20600)
-- Name: requerimiento producto_idmedida_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requerimiento
    ADD CONSTRAINT producto_idmedida_fkey FOREIGN KEY (idmedida) REFERENCES public.medida(idmedida);


--
-- TOC entry 3155 (class 2606 OID 20605)
-- Name: requerimiento producto_iva_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requerimiento
    ADD CONSTRAINT producto_iva_fkey FOREIGN KEY (iva) REFERENCES public.iva(id_iva);


--
-- TOC entry 3150 (class 2606 OID 20610)
-- Name: especifico tbl_especifico_id_subramo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especifico
    ADD CONSTRAINT tbl_especifico_id_subramo_fkey FOREIGN KEY (id_generico) REFERENCES public.generico(id_generico);


--
-- TOC entry 3152 (class 2606 OID 20615)
-- Name: presu_partida tbl_partida_id_presupuesto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presu_partida
    ADD CONSTRAINT tbl_partida_id_presupuesto_fkey FOREIGN KEY (id_presupuesto) REFERENCES public.tbl_presupuesto(id_presupuesto);


--
-- TOC entry 3143 (class 2606 OID 20620)
-- Name: basecalculo tbl_plan_id_especifico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basecalculo
    ADD CONSTRAINT tbl_plan_id_especifico_fkey FOREIGN KEY (id_especifico) REFERENCES public.especifico(id_especifico);


--
-- TOC entry 3144 (class 2606 OID 20625)
-- Name: basecalculo tbl_plan_id_generica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basecalculo
    ADD CONSTRAINT tbl_plan_id_generica_fkey FOREIGN KEY (id_generica) REFERENCES public.generico(id_generico);


--
-- TOC entry 3145 (class 2606 OID 20630)
-- Name: basecalculo tbl_plan_id_medida_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basecalculo
    ADD CONSTRAINT tbl_plan_id_medida_fkey FOREIGN KEY (id_medida) REFERENCES public.medida(idmedida);


--
-- TOC entry 3146 (class 2606 OID 20635)
-- Name: basecalculo tbl_plan_id_partida_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basecalculo
    ADD CONSTRAINT tbl_plan_id_partida_fkey FOREIGN KEY (id_partida) REFERENCES public.partida(id);


--
-- TOC entry 3147 (class 2606 OID 20640)
-- Name: basecalculo tbl_plan_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basecalculo
    ADD CONSTRAINT tbl_plan_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.requerimiento(idproducto);


--
-- TOC entry 3151 (class 2606 OID 20645)
-- Name: generico tbl_subramo_id_ramo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.generico
    ADD CONSTRAINT tbl_subramo_id_ramo_fkey FOREIGN KEY (id_partida) REFERENCES public.partida(id);


--
-- TOC entry 3159 (class 2606 OID 20709)
-- Name: unidad_medida unidad_medida_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidad_medida
    ADD CONSTRAINT unidad_medida_fk FOREIGN KEY (id_actividad) REFERENCES public.actividades(idactividad);


--
-- TOC entry 3156 (class 2606 OID 20650)
-- Name: usuario usuario_id_gerencia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_gerencia_fkey FOREIGN KEY (id_gerencia) REFERENCES public.gerencia(id_gerencia);


--
-- TOC entry 3157 (class 2606 OID 20655)
-- Name: usuario usuario_id_perfil_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_perfil_fkey FOREIGN KEY (id_perfil) REFERENCES public.perfil(id_perfil);


-- Completed on 2022-08-02 23:35:18 -04

--
-- PostgreSQL database dump complete
--

