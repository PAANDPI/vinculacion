--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4 (Debian 13.4-1.pgdg100+1)
-- Dumped by pg_dump version 14.1

-- Started on 2022-01-08 14:04:31

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
-- TOC entry 229 (class 1255 OID 33175)
-- Name: eliminarcategoria(integer); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.eliminarcategoria(varidcategoria integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM categoria 
	WHERE varIdCategoria = idCategoria;
END;
$$;


ALTER FUNCTION public.eliminarcategoria(varidcategoria integer) OWNER TO appdist;

--
-- TOC entry 230 (class 1255 OID 33176)
-- Name: eliminarciudad(integer); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.eliminarciudad(varidciudad integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM ciudad 
	WHERE varIdCiudad = idCiudad;
END;
$$;


ALTER FUNCTION public.eliminarciudad(varidciudad integer) OWNER TO appdist;

--
-- TOC entry 231 (class 1255 OID 33177)
-- Name: eliminarconcepto(integer); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.eliminarconcepto(varidconcepto integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM concepto 
	WHERE varIdConcepto = idConcepto;
END;
$$;


ALTER FUNCTION public.eliminarconcepto(varidconcepto integer) OWNER TO appdist;

--
-- TOC entry 232 (class 1255 OID 33178)
-- Name: eliminardiscapacidad(integer); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.eliminardiscapacidad(variddiscapacidad integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM discapacidad 
	WHERE varIdDiscapacidad = idDiscapacidad;
END;
$$;


ALTER FUNCTION public.eliminardiscapacidad(variddiscapacidad integer) OWNER TO appdist;

--
-- TOC entry 233 (class 1255 OID 33179)
-- Name: eliminarlugares(integer); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.eliminarlugares(varidlugar integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM lugares 
	WHERE varIdLugar = idLugar;
END;
$$;


ALTER FUNCTION public.eliminarlugares(varidlugar integer) OWNER TO appdist;

--
-- TOC entry 234 (class 1255 OID 33180)
-- Name: eliminarpais(integer); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.eliminarpais(varidpais integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM pais 
	WHERE varIdPais = idPais;
END;
$$;


ALTER FUNCTION public.eliminarpais(varidpais integer) OWNER TO appdist;

--
-- TOC entry 235 (class 1255 OID 33181)
-- Name: eliminarpersona(integer); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.eliminarpersona(varidpersona integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM persona 
	WHERE varIdPersona = idPersona;
END;
$$;


ALTER FUNCTION public.eliminarpersona(varidpersona integer) OWNER TO appdist;

--
-- TOC entry 236 (class 1255 OID 33183)
-- Name: eliminarprovincia(integer); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.eliminarprovincia(varidprovincia integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM provincia 
	WHERE varIdProvincia = idProvincia;
END;
$$;


ALTER FUNCTION public.eliminarprovincia(varidprovincia integer) OWNER TO appdist;

--
-- TOC entry 228 (class 1255 OID 33174)
-- Name: eliminarrecurso(integer); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.eliminarrecurso(varidrecurso integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM recurso 
	WHERE varIdRecurso = idRecurso;
END;
$$;


ALTER FUNCTION public.eliminarrecurso(varidrecurso integer) OWNER TO appdist;

--
-- TOC entry 223 (class 1255 OID 33169)
-- Name: habilitardeshabilitarciudad(integer); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.habilitardeshabilitarciudad(varidciudad integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE ciudad SET Estado = !Estado
	WHERE varIdCiudad = idCiudad;
END;
$$;


ALTER FUNCTION public.habilitardeshabilitarciudad(varidciudad integer) OWNER TO appdist;

--
-- TOC entry 224 (class 1255 OID 33170)
-- Name: habilitardeshabilitarlugares(integer); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.habilitardeshabilitarlugares(varidlugar integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE lugares SET Estado = !Estado
	WHERE varIdLugar = IdLugar;
END;
$$;


ALTER FUNCTION public.habilitardeshabilitarlugares(varidlugar integer) OWNER TO appdist;

--
-- TOC entry 225 (class 1255 OID 33171)
-- Name: habilitardeshabilitarpais(integer); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.habilitardeshabilitarpais(varidpais integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE pais SET Estado = !Estado
	WHERE varIdPais = idPais;
END;
$$;


ALTER FUNCTION public.habilitardeshabilitarpais(varidpais integer) OWNER TO appdist;

--
-- TOC entry 222 (class 1255 OID 33168)
-- Name: habilitardeshabilitarpersona(integer); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.habilitardeshabilitarpersona(varidpersona integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE Persona SET Estado = !Estado
	WHERE varIDPersona = IDPersona;
END;
$$;


ALTER FUNCTION public.habilitardeshabilitarpersona(varidpersona integer) OWNER TO appdist;

--
-- TOC entry 226 (class 1255 OID 33172)
-- Name: habilitardeshabilitarprovincia(integer); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.habilitardeshabilitarprovincia(varidprovincia integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE provincia SET Estado = !Estado
	WHERE varIdProvincia = idProvincia;
END;
$$;


ALTER FUNCTION public.habilitardeshabilitarprovincia(varidprovincia integer) OWNER TO appdist;

--
-- TOC entry 227 (class 1255 OID 33173)
-- Name: habilitardeshabilitarrecurso(integer); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.habilitardeshabilitarrecurso(varidrecurso integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE recurso SET Estado = !Estado
	WHERE varIdRecurso = idRecurso;
END;
$$;


ALTER FUNCTION public.habilitardeshabilitarrecurso(varidrecurso integer) OWNER TO appdist;

--
-- TOC entry 237 (class 1255 OID 33184)
-- Name: insertarcategoria(character varying); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.insertarcategoria(varcategoria character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Categoria (Categoria) 
	VALUES (varCategoria);
END;
$$;


ALTER FUNCTION public.insertarcategoria(varcategoria character varying) OWNER TO appdist;

--
-- TOC entry 239 (class 1255 OID 33197)
-- Name: insertarciudad(integer, character varying); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.insertarciudad(varidprovincia integer, varciudad character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Ciudad (IDProvincia, Ciudad, Estado) 
	VALUES (varIDProvincia, varCiudad, TRUE);
END;
$$;


ALTER FUNCTION public.insertarciudad(varidprovincia integer, varciudad character varying) OWNER TO appdist;

--
-- TOC entry 245 (class 1255 OID 33198)
-- Name: insertarconcepto(integer, text, text); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.insertarconcepto(variddiscapacidad integer, vardescripcion text, varetiquetas text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Concepto (IDDiscapacidad, Descripcion, Etiquetas) 
	VALUES (varIDDiscapacidad, varDescripcion, varEtiquetas);
END;
$$;


ALTER FUNCTION public.insertarconcepto(variddiscapacidad integer, vardescripcion text, varetiquetas text) OWNER TO appdist;

--
-- TOC entry 238 (class 1255 OID 33190)
-- Name: insertardiscapacidad(character varying); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.insertardiscapacidad(vardiscapacidad character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Discapacidad (Discapacidad) 
	VALUES (varDiscapacidad);
END;
$$;


ALTER FUNCTION public.insertardiscapacidad(vardiscapacidad character varying) OWNER TO appdist;

--
-- TOC entry 252 (class 1255 OID 33199)
-- Name: insertarlugar(integer, text, text, numeric, numeric, text); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.insertarlugar(varidciudad integer, varlugar text, vardescripcion text, varcoordendax numeric, varcoordenday numeric, varetiquetas text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Lugares (IDCiudad, Lugar, Descripcion, CoordendaX, CoordendaY, Etiquetas) 
	VALUES (varIDCiudad, varLugar, varDescripcion, varCoordendaX, varCoordendaY, varEtiquetas, TRUE);
END;
$$;


ALTER FUNCTION public.insertarlugar(varidciudad integer, varlugar text, vardescripcion text, varcoordendax numeric, varcoordenday numeric, varetiquetas text) OWNER TO appdist;

--
-- TOC entry 253 (class 1255 OID 33201)
-- Name: insertarpais(character varying, character varying); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.insertarpais(varpais character varying, varcodigo character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Pais (Pais, Codigo, Estado) 
	VALUES (varPais, varCodigo, TRUE);
END;
$$;


ALTER FUNCTION public.insertarpais(varpais character varying, varcodigo character varying) OWNER TO appdist;

--
-- TOC entry 255 (class 1255 OID 33221)
-- Name: insertarpersona(integer, character varying, character varying, date, character varying, character varying, text, character varying, character varying, text, boolean); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.insertarpersona(varidciudad integer, varnombre character varying, varapellido character varying, varfechanacimiento date, vartelefono character varying, vargenero character varying, vardireccion text, varusuario character varying, varcorreo character varying, varclave text, varadmin boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Persona (IDCiudad, Nombre, Apellido, FechaNacimiento, Telefono, Genero, 
		Direccion, Usuario, Correo, Clave, Administrador, Estado) 
	VALUES (varIDCiudad, varNombre, varApellido, varFechaNacimiento, varTelefono, varGenero, 
			varDireccion, varUsuario, varCorreo, varClave, varAdmin, TRUE);
END;
$$;


ALTER FUNCTION public.insertarpersona(varidciudad integer, varnombre character varying, varapellido character varying, varfechanacimiento date, vartelefono character varying, vargenero character varying, vardireccion text, varusuario character varying, varcorreo character varying, varclave text, varadmin boolean) OWNER TO appdist;

--
-- TOC entry 254 (class 1255 OID 33208)
-- Name: insertarprovincia(integer, character varying); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.insertarprovincia(varidpais integer, varprovincia character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Provincia (IDPais, Provincia, Estado) 
	VALUES (varIDPais, varProvincia, TRUE);
END;
$$;


ALTER FUNCTION public.insertarprovincia(varidpais integer, varprovincia character varying) OWNER TO appdist;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 201 (class 1259 OID 33035)
-- Name: categoria; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.categoria (
    idcategoria integer NOT NULL,
    categoria character(25) NOT NULL
);


ALTER TABLE public.categoria OWNER TO appdist;

--
-- TOC entry 200 (class 1259 OID 33033)
-- Name: categoria_idcategoria_seq; Type: SEQUENCE; Schema: public; Owner: appdist
--

CREATE SEQUENCE public.categoria_idcategoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_idcategoria_seq OWNER TO appdist;

--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 200
-- Name: categoria_idcategoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.categoria_idcategoria_seq OWNED BY public.categoria.idcategoria;


--
-- TOC entry 203 (class 1259 OID 33044)
-- Name: ciudad; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.ciudad (
    idciudad integer NOT NULL,
    idprovincia integer NOT NULL,
    ciudad character(50) NOT NULL,
    estado boolean NOT NULL
);


ALTER TABLE public.ciudad OWNER TO appdist;

--
-- TOC entry 202 (class 1259 OID 33042)
-- Name: ciudad_idciudad_seq; Type: SEQUENCE; Schema: public; Owner: appdist
--

CREATE SEQUENCE public.ciudad_idciudad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ciudad_idciudad_seq OWNER TO appdist;

--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 202
-- Name: ciudad_idciudad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.ciudad_idciudad_seq OWNED BY public.ciudad.idciudad;


--
-- TOC entry 205 (class 1259 OID 33054)
-- Name: concepto; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.concepto (
    idconcepto integer NOT NULL,
    iddiscapacidad integer,
    descripcion text NOT NULL,
    etiquetas text NOT NULL
);


ALTER TABLE public.concepto OWNER TO appdist;

--
-- TOC entry 204 (class 1259 OID 33052)
-- Name: concepto_idconcepto_seq; Type: SEQUENCE; Schema: public; Owner: appdist
--

CREATE SEQUENCE public.concepto_idconcepto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.concepto_idconcepto_seq OWNER TO appdist;

--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 204
-- Name: concepto_idconcepto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.concepto_idconcepto_seq OWNED BY public.concepto.idconcepto;


--
-- TOC entry 207 (class 1259 OID 33067)
-- Name: discapacidad; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.discapacidad (
    iddiscapacidad integer NOT NULL,
    discapacidad character(25) NOT NULL
);


ALTER TABLE public.discapacidad OWNER TO appdist;

--
-- TOC entry 219 (class 1259 OID 33342)
-- Name: discapacidad_categoria; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.discapacidad_categoria (
    iddiscapacidadcategoria integer NOT NULL,
    categoria character varying(30) NOT NULL,
    concepto text NOT NULL
);


ALTER TABLE public.discapacidad_categoria OWNER TO appdist;

--
-- TOC entry 218 (class 1259 OID 33340)
-- Name: discapacidad_categoria_iddiscapacidadcategoria_seq; Type: SEQUENCE; Schema: public; Owner: appdist
--

CREATE SEQUENCE public.discapacidad_categoria_iddiscapacidadcategoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discapacidad_categoria_iddiscapacidadcategoria_seq OWNER TO appdist;

--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 218
-- Name: discapacidad_categoria_iddiscapacidadcategoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.discapacidad_categoria_iddiscapacidadcategoria_seq OWNED BY public.discapacidad_categoria.iddiscapacidadcategoria;


--
-- TOC entry 206 (class 1259 OID 33065)
-- Name: discapacidad_iddiscapacidad_seq; Type: SEQUENCE; Schema: public; Owner: appdist
--

CREATE SEQUENCE public.discapacidad_iddiscapacidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discapacidad_iddiscapacidad_seq OWNER TO appdist;

--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 206
-- Name: discapacidad_iddiscapacidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.discapacidad_iddiscapacidad_seq OWNED BY public.discapacidad.iddiscapacidad;


--
-- TOC entry 209 (class 1259 OID 33076)
-- Name: lugares; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.lugares (
    idlugar integer NOT NULL,
    idciudad integer NOT NULL,
    lugar text NOT NULL,
    descripcion text NOT NULL,
    coordendax numeric(10,6) NOT NULL,
    coordenday numeric(10,6) NOT NULL,
    etiqueta text,
    estado boolean NOT NULL
);


ALTER TABLE public.lugares OWNER TO appdist;

--
-- TOC entry 208 (class 1259 OID 33074)
-- Name: lugares_idlugar_seq; Type: SEQUENCE; Schema: public; Owner: appdist
--

CREATE SEQUENCE public.lugares_idlugar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lugares_idlugar_seq OWNER TO appdist;

--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 208
-- Name: lugares_idlugar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.lugares_idlugar_seq OWNED BY public.lugares.idlugar;


--
-- TOC entry 211 (class 1259 OID 33089)
-- Name: pais; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.pais (
    idpais integer NOT NULL,
    pais character(40) NOT NULL,
    codigo character(4) NOT NULL,
    estado boolean NOT NULL
);


ALTER TABLE public.pais OWNER TO appdist;

--
-- TOC entry 210 (class 1259 OID 33087)
-- Name: pais_idpais_seq; Type: SEQUENCE; Schema: public; Owner: appdist
--

CREATE SEQUENCE public.pais_idpais_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pais_idpais_seq OWNER TO appdist;

--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 210
-- Name: pais_idpais_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.pais_idpais_seq OWNED BY public.pais.idpais;


--
-- TOC entry 213 (class 1259 OID 33098)
-- Name: persona; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.persona (
    idpersona integer NOT NULL,
    idciudad integer NOT NULL,
    nombre character(50) NOT NULL,
    apellido character(50) NOT NULL,
    fechanacimiento date NOT NULL,
    telefono character(15),
    genero character(9) NOT NULL,
    direccion text,
    usuario character(25) NOT NULL,
    correo character(50) NOT NULL,
    clave text NOT NULL,
    administrador boolean NOT NULL,
    estado boolean NOT NULL
);


ALTER TABLE public.persona OWNER TO appdist;

--
-- TOC entry 212 (class 1259 OID 33096)
-- Name: persona_idpersona_seq; Type: SEQUENCE; Schema: public; Owner: appdist
--

CREATE SEQUENCE public.persona_idpersona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persona_idpersona_seq OWNER TO appdist;

--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 212
-- Name: persona_idpersona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.persona_idpersona_seq OWNED BY public.persona.idpersona;


--
-- TOC entry 215 (class 1259 OID 33111)
-- Name: provincia; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.provincia (
    idprovincia integer NOT NULL,
    idpais integer NOT NULL,
    provincia character(50) NOT NULL,
    estado boolean NOT NULL
);


ALTER TABLE public.provincia OWNER TO appdist;

--
-- TOC entry 214 (class 1259 OID 33109)
-- Name: provincia_idprovincia_seq; Type: SEQUENCE; Schema: public; Owner: appdist
--

CREATE SEQUENCE public.provincia_idprovincia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provincia_idprovincia_seq OWNER TO appdist;

--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 214
-- Name: provincia_idprovincia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.provincia_idprovincia_seq OWNED BY public.provincia.idprovincia;


--
-- TOC entry 217 (class 1259 OID 33121)
-- Name: recurso; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.recurso (
    idrecurso integer NOT NULL,
    idcategoria integer NOT NULL,
    iddiscapacidad integer NOT NULL,
    recurso text NOT NULL,
    descripcion text NOT NULL,
    etiquetas text NOT NULL,
    estado boolean NOT NULL
);


ALTER TABLE public.recurso OWNER TO appdist;

--
-- TOC entry 216 (class 1259 OID 33119)
-- Name: recurso_idrecurso_seq; Type: SEQUENCE; Schema: public; Owner: appdist
--

CREATE SEQUENCE public.recurso_idrecurso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recurso_idrecurso_seq OWNER TO appdist;

--
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 216
-- Name: recurso_idrecurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.recurso_idrecurso_seq OWNED BY public.recurso.idrecurso;


--
-- TOC entry 221 (class 1259 OID 33353)
-- Name: visitas; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.visitas (
    idvisita bigint NOT NULL,
    fecha timestamp without time zone NOT NULL,
    host character(14) NOT NULL
);


ALTER TABLE public.visitas OWNER TO appdist;

--
-- TOC entry 220 (class 1259 OID 33351)
-- Name: visitas_idvisita_seq; Type: SEQUENCE; Schema: public; Owner: appdist
--

CREATE SEQUENCE public.visitas_idvisita_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visitas_idvisita_seq OWNER TO appdist;

--
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 220
-- Name: visitas_idvisita_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.visitas_idvisita_seq OWNED BY public.visitas.idvisita;


--
-- TOC entry 2891 (class 2604 OID 33038)
-- Name: categoria idcategoria; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.categoria ALTER COLUMN idcategoria SET DEFAULT nextval('public.categoria_idcategoria_seq'::regclass);


--
-- TOC entry 2892 (class 2604 OID 33047)
-- Name: ciudad idciudad; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.ciudad ALTER COLUMN idciudad SET DEFAULT nextval('public.ciudad_idciudad_seq'::regclass);


--
-- TOC entry 2893 (class 2604 OID 33057)
-- Name: concepto idconcepto; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.concepto ALTER COLUMN idconcepto SET DEFAULT nextval('public.concepto_idconcepto_seq'::regclass);


--
-- TOC entry 2894 (class 2604 OID 33070)
-- Name: discapacidad iddiscapacidad; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.discapacidad ALTER COLUMN iddiscapacidad SET DEFAULT nextval('public.discapacidad_iddiscapacidad_seq'::regclass);


--
-- TOC entry 2900 (class 2604 OID 33345)
-- Name: discapacidad_categoria iddiscapacidadcategoria; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.discapacidad_categoria ALTER COLUMN iddiscapacidadcategoria SET DEFAULT nextval('public.discapacidad_categoria_iddiscapacidadcategoria_seq'::regclass);


--
-- TOC entry 2895 (class 2604 OID 33079)
-- Name: lugares idlugar; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.lugares ALTER COLUMN idlugar SET DEFAULT nextval('public.lugares_idlugar_seq'::regclass);


--
-- TOC entry 2896 (class 2604 OID 33092)
-- Name: pais idpais; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.pais ALTER COLUMN idpais SET DEFAULT nextval('public.pais_idpais_seq'::regclass);


--
-- TOC entry 2897 (class 2604 OID 33101)
-- Name: persona idpersona; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.persona ALTER COLUMN idpersona SET DEFAULT nextval('public.persona_idpersona_seq'::regclass);


--
-- TOC entry 2898 (class 2604 OID 33114)
-- Name: provincia idprovincia; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.provincia ALTER COLUMN idprovincia SET DEFAULT nextval('public.provincia_idprovincia_seq'::regclass);


--
-- TOC entry 2899 (class 2604 OID 33124)
-- Name: recurso idrecurso; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.recurso ALTER COLUMN idrecurso SET DEFAULT nextval('public.recurso_idrecurso_seq'::regclass);


--
-- TOC entry 2901 (class 2604 OID 33356)
-- Name: visitas idvisita; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.visitas ALTER COLUMN idvisita SET DEFAULT nextval('public.visitas_idvisita_seq'::regclass);


--
-- TOC entry 3078 (class 0 OID 33035)
-- Dependencies: 201
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.categoria (idcategoria, categoria) FROM stdin;
\.


--
-- TOC entry 3080 (class 0 OID 33044)
-- Dependencies: 203
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.ciudad (idciudad, idprovincia, ciudad, estado) FROM stdin;
1	1	Quevedo                                           	t
\.


--
-- TOC entry 3082 (class 0 OID 33054)
-- Dependencies: 205
-- Data for Name: concepto; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.concepto (idconcepto, iddiscapacidad, descripcion, etiquetas) FROM stdin;
\.


--
-- TOC entry 3084 (class 0 OID 33067)
-- Dependencies: 207
-- Data for Name: discapacidad; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.discapacidad (iddiscapacidad, discapacidad) FROM stdin;
1	Visual                   
\.


--
-- TOC entry 3096 (class 0 OID 33342)
-- Dependencies: 219
-- Data for Name: discapacidad_categoria; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.discapacidad_categoria (iddiscapacidadcategoria, categoria, concepto) FROM stdin;
\.


--
-- TOC entry 3086 (class 0 OID 33076)
-- Dependencies: 209
-- Data for Name: lugares; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.lugares (idlugar, idciudad, lugar, descripcion, coordendax, coordenday, etiqueta, estado) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 33089)
-- Dependencies: 211
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.pais (idpais, pais, codigo, estado) FROM stdin;
1	Ecuador                                 	+593	t
2	Colombia                                	+57 	t
\.


--
-- TOC entry 3090 (class 0 OID 33098)
-- Dependencies: 213
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.persona (idpersona, idciudad, nombre, apellido, fechanacimiento, telefono, genero, direccion, usuario, correo, clave, administrador, estado) FROM stdin;
1	1	Ariel                                             	Fernández                                         	2000-02-28	0987654321     	Masculino	NID	Arialdo                  	Arialdo999@gmail.com                              	7c4a8d09ca3762af61e59520943dc26494f8941b	t	t
\.


--
-- TOC entry 3092 (class 0 OID 33111)
-- Dependencies: 215
-- Data for Name: provincia; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.provincia (idprovincia, idpais, provincia, estado) FROM stdin;
1	1	Los Ríos                                          	t
\.


--
-- TOC entry 3094 (class 0 OID 33121)
-- Dependencies: 217
-- Data for Name: recurso; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.recurso (idrecurso, idcategoria, iddiscapacidad, recurso, descripcion, etiquetas, estado) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 33353)
-- Dependencies: 221
-- Data for Name: visitas; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.visitas (idvisita, fecha, host) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 200
-- Name: categoria_idcategoria_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.categoria_idcategoria_seq', 1, false);


--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 202
-- Name: ciudad_idciudad_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.ciudad_idciudad_seq', 1, true);


--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 204
-- Name: concepto_idconcepto_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.concepto_idconcepto_seq', 1, false);


--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 218
-- Name: discapacidad_categoria_iddiscapacidadcategoria_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.discapacidad_categoria_iddiscapacidadcategoria_seq', 1, false);


--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 206
-- Name: discapacidad_iddiscapacidad_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.discapacidad_iddiscapacidad_seq', 1, true);


--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 208
-- Name: lugares_idlugar_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.lugares_idlugar_seq', 1, false);


--
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 210
-- Name: pais_idpais_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.pais_idpais_seq', 2, true);


--
-- TOC entry 3122 (class 0 OID 0)
-- Dependencies: 212
-- Name: persona_idpersona_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.persona_idpersona_seq', 1, true);


--
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 214
-- Name: provincia_idprovincia_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.provincia_idprovincia_seq', 1, true);


--
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 216
-- Name: recurso_idrecurso_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.recurso_idrecurso_seq', 1, false);


--
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 220
-- Name: visitas_idvisita_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.visitas_idvisita_seq', 1, false);


--
-- TOC entry 2937 (class 2606 OID 33350)
-- Name: discapacidad_categoria discapacidad_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.discapacidad_categoria
    ADD CONSTRAINT discapacidad_categoria_pkey PRIMARY KEY (iddiscapacidadcategoria);


--
-- TOC entry 2904 (class 2606 OID 33040)
-- Name: categoria pk_categoria; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT pk_categoria PRIMARY KEY (idcategoria);


--
-- TOC entry 2907 (class 2606 OID 33049)
-- Name: ciudad pk_ciudad; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT pk_ciudad PRIMARY KEY (idciudad);


--
-- TOC entry 2911 (class 2606 OID 33062)
-- Name: concepto pk_concepto; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.concepto
    ADD CONSTRAINT pk_concepto PRIMARY KEY (idconcepto);


--
-- TOC entry 2915 (class 2606 OID 33072)
-- Name: discapacidad pk_discapacidad; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.discapacidad
    ADD CONSTRAINT pk_discapacidad PRIMARY KEY (iddiscapacidad);


--
-- TOC entry 2918 (class 2606 OID 33084)
-- Name: lugares pk_lugares; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.lugares
    ADD CONSTRAINT pk_lugares PRIMARY KEY (idlugar);


--
-- TOC entry 2922 (class 2606 OID 33094)
-- Name: pais pk_pais; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pk_pais PRIMARY KEY (idpais);


--
-- TOC entry 2926 (class 2606 OID 33106)
-- Name: persona pk_persona; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT pk_persona PRIMARY KEY (idpersona);


--
-- TOC entry 2929 (class 2606 OID 33116)
-- Name: provincia pk_provincia; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT pk_provincia PRIMARY KEY (idprovincia);


--
-- TOC entry 2932 (class 2606 OID 33129)
-- Name: recurso pk_recurso; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT pk_recurso PRIMARY KEY (idrecurso);


--
-- TOC entry 2939 (class 2606 OID 33358)
-- Name: visitas visitas_pkey; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.visitas
    ADD CONSTRAINT visitas_pkey PRIMARY KEY (idvisita);


--
-- TOC entry 2902 (class 1259 OID 33041)
-- Name: categoria_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX categoria_pk ON public.categoria USING btree (idcategoria);


--
-- TOC entry 2905 (class 1259 OID 33050)
-- Name: ciudad_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX ciudad_pk ON public.ciudad USING btree (idciudad);


--
-- TOC entry 2923 (class 1259 OID 33108)
-- Name: ciudad_tutor_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX ciudad_tutor_fk ON public.persona USING btree (idciudad);


--
-- TOC entry 2909 (class 1259 OID 33063)
-- Name: concepto_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX concepto_pk ON public.concepto USING btree (idconcepto);


--
-- TOC entry 2913 (class 1259 OID 33073)
-- Name: discapacidad_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX discapacidad_pk ON public.discapacidad USING btree (iddiscapacidad);


--
-- TOC entry 2916 (class 1259 OID 33085)
-- Name: lugares_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX lugares_pk ON public.lugares USING btree (idlugar);


--
-- TOC entry 2920 (class 1259 OID 33095)
-- Name: pais_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX pais_pk ON public.pais USING btree (idpais);


--
-- TOC entry 2927 (class 1259 OID 33118)
-- Name: pais_provincia_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX pais_provincia_fk ON public.provincia USING btree (idpais);


--
-- TOC entry 2924 (class 1259 OID 33107)
-- Name: persona_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX persona_pk ON public.persona USING btree (idpersona);


--
-- TOC entry 2908 (class 1259 OID 33051)
-- Name: provincia_ciudad_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX provincia_ciudad_fk ON public.ciudad USING btree (idprovincia);


--
-- TOC entry 2930 (class 1259 OID 33117)
-- Name: provincia_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX provincia_pk ON public.provincia USING btree (idprovincia);


--
-- TOC entry 2933 (class 1259 OID 33130)
-- Name: recurso_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX recurso_pk ON public.recurso USING btree (idrecurso);


--
-- TOC entry 2919 (class 1259 OID 33086)
-- Name: relationship_4_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX relationship_4_fk ON public.lugares USING btree (idciudad);


--
-- TOC entry 2934 (class 1259 OID 33131)
-- Name: relationship_5_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX relationship_5_fk ON public.recurso USING btree (idcategoria);


--
-- TOC entry 2935 (class 1259 OID 33132)
-- Name: relationship_6_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX relationship_6_fk ON public.recurso USING btree (iddiscapacidad);


--
-- TOC entry 2912 (class 1259 OID 33064)
-- Name: relationship_7_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX relationship_7_fk ON public.concepto USING btree (iddiscapacidad);


--
-- TOC entry 2940 (class 2606 OID 33133)
-- Name: ciudad fk_ci_provincia_pr; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT fk_ci_provincia_pr FOREIGN KEY (idprovincia) REFERENCES public.provincia(idprovincia) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2941 (class 2606 OID 33138)
-- Name: concepto fk_co_relations_di; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.concepto
    ADD CONSTRAINT fk_co_relations_di FOREIGN KEY (iddiscapacidad) REFERENCES public.discapacidad(iddiscapacidad) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2942 (class 2606 OID 33143)
-- Name: lugares fk_lu_relations_ci; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.lugares
    ADD CONSTRAINT fk_lu_relations_ci FOREIGN KEY (idciudad) REFERENCES public.ciudad(idciudad) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2943 (class 2606 OID 33148)
-- Name: persona fk_pe_ciudad_tu_ci; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT fk_pe_ciudad_tu_ci FOREIGN KEY (idciudad) REFERENCES public.ciudad(idciudad) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2944 (class 2606 OID 33153)
-- Name: provincia fk_pr_pais_prov_pa; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT fk_pr_pais_prov_pa FOREIGN KEY (idpais) REFERENCES public.pais(idpais) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2945 (class 2606 OID 33158)
-- Name: recurso fk_re_relations_ca; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT fk_re_relations_ca FOREIGN KEY (idcategoria) REFERENCES public.categoria(idcategoria) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2946 (class 2606 OID 33163)
-- Name: recurso fk_re_relations_di; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT fk_re_relations_di FOREIGN KEY (iddiscapacidad) REFERENCES public.discapacidad(iddiscapacidad) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2022-01-08 14:04:35

--
-- PostgreSQL database dump complete
--

