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
-- Name: eliminarCategoriaDiscapacidad(integer); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.eliminarCategoriaDiscapacidad(varidCategoriaDiscapacidad integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM CategoriaDiscapacidad 
	WHERE varIdCategoriaDiscapacidad = idCategoriaDiscapacidad;
END;
$$;


ALTER FUNCTION public.eliminarCategoriaDiscapacidad(varidCategoriaDiscapacidad integer) OWNER TO appdist;

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

CREATE FUNCTION public.insertarCategoriaDiscapacidad(varCategoriaDiscapacidad character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO CategoriaDiscapacidad (CategoriaDiscapacidad) 
	VALUES (varCategoriaDiscapacidad);
END;
$$;

ALTER FUNCTION public.insertarCategoriaDiscapacidad(varCategoriaDiscapacidad character varying) OWNER TO appdist;

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

CREATE FUNCTION public.insertarpersona(varidciudad integer, varnombre character varying, varapellido character varying, vargenero character varying, varusuario character varying, varcorreo character varying, varclave text, varadmin boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Persona (IDCiudad, Nombre, Apellido,  Genero, 
		Usuario, Correo, Clave, Administrador, Estado) 
	VALUES (varIDCiudad, varNombre, varApellido, varUsuario, varCorreo, varClave, varAdmin, TRUE);
END;
$$;


ALTER FUNCTION public.insertarpersona(varidciudad integer, varnombre character varying, varapellido character varying, vargenero character varying, varusuario character varying, varcorreo character varying, varclave text, varadmin boolean) OWNER TO appdist;

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

