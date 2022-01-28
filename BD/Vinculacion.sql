--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4 (Debian 13.4-1.pgdg100+1)
-- Dumped by pg_dump version 14.1

-- Started on 2022-01-28 01:33:01

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
-- TOC entry 250 (class 1255 OID 41720)
-- Name: editarcategoriadiscapacidad(integer, character varying); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.editarcategoriadiscapacidad(varidcategoriadiscapacidad integer, varcategoriadiscapacidad character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.categoriadiscapacidad
		SET idcategoriadiscapacidad=varidcategoriadiscapacidad, categoriadiscapacidad=varcategoriadiscapacidad
		WHERE idcategoriadiscapacidad=varidcategoriadiscapacidad;
END;
$$;


ALTER FUNCTION public.editarcategoriadiscapacidad(varidcategoriadiscapacidad integer, varcategoriadiscapacidad character varying) OWNER TO appdist;

--
-- TOC entry 253 (class 1255 OID 41728)
-- Name: editarcategoriarecurso(integer, character varying); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.editarcategoriarecurso(varidcategoriarecurso integer, varcategoriarecurso character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.categoriarecurso
	SET idcategoriarecurso=varidcategoriarecurso, categoriarecurso=varcategoriarecurso
	WHERE  idcategoriarecurso=varidcategoriarecurso;
END;
$$;


ALTER FUNCTION public.editarcategoriarecurso(varidcategoriarecurso integer, varcategoriarecurso character varying) OWNER TO appdist;

--
-- TOC entry 266 (class 1255 OID 41729)
-- Name: editarciudad(integer, integer, character varying, boolean); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.editarciudad(varidciudad integer, varidprovincia integer, varciudad character varying, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ciudad
	SET idciudad=varidciudad, idprovincia=varidprovincia, ciudad=varciudad, estado=varestado
	WHERE idciudad=varidciudad;
END;
$$;


ALTER FUNCTION public.editarciudad(varidciudad integer, varidprovincia integer, varciudad character varying, varestado boolean) OWNER TO appdist;

--
-- TOC entry 268 (class 1255 OID 41731)
-- Name: editarconcepto(integer, integer, text, text); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.editarconcepto(varidconcepto integer, variddiscapacidad integer, vardescripcion text, varetiquetas text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.concepto
	SET idconcepto=varidconcepto, iddiscapacidad=variddiscapacidad, descripcion=vardescripcion, etiquetas=varetiquetas
	WHERE idconcepto=varidconcepto;
	
END;
$$;


ALTER FUNCTION public.editarconcepto(varidconcepto integer, variddiscapacidad integer, vardescripcion text, varetiquetas text) OWNER TO appdist;

--
-- TOC entry 269 (class 1255 OID 41732)
-- Name: editardiscapacidad(integer, integer, character varying); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.editardiscapacidad(variddiscapacidad integer, varidcategoriadiscapacidad integer, vardiscapacidad character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.discapacidad
	SET iddiscapacidad=variddiscapacidad, idcategoriadiscapacidad=varidcategoriadiscapacidad, discapacidad=vardiscapacidad
	WHERE iddiscapacidad=variddiscapacidad;
END;
$$;


ALTER FUNCTION public.editardiscapacidad(variddiscapacidad integer, varidcategoriadiscapacidad integer, vardiscapacidad character varying) OWNER TO appdist;

--
-- TOC entry 249 (class 1255 OID 41689)
-- Name: editarlugar(integer, integer, text, text, numeric, numeric, text, boolean); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.editarlugar(varidlugar integer, varidciudad integer, varlugar text, vardescripcion text, varcoordendax numeric, varcoordenday numeric, varetiquetas text, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

	update lugares set idciudad=varIDCiudad, lugar=varlugar,descripcion=vardescripcion,coordendax=varcoordendax,coordenday=varcoordenday,etiqueta=varetiquetas,estado=varestado
  where idlugar=varidlugar;
END;
$$;


ALTER FUNCTION public.editarlugar(varidlugar integer, varidciudad integer, varlugar text, vardescripcion text, varcoordendax numeric, varcoordenday numeric, varetiquetas text, varestado boolean) OWNER TO appdist;

--
-- TOC entry 265 (class 1255 OID 41727)
-- Name: editarpais(integer, character varying, character varying, boolean); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.editarpais(varidpais integer, varpais character varying, varcodigo character varying, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Pais (Pais, Codigo, Estado) 
	VALUES (varPais, varCodigo, TRUE);
	UPDATE public.pais
	SET pais=varpais, codigo=varcodigo, estado=varestado
	WHERE idpais=varidpais;
END;
$$;


ALTER FUNCTION public.editarpais(varidpais integer, varpais character varying, varcodigo character varying, varestado boolean) OWNER TO appdist;

--
-- TOC entry 267 (class 1255 OID 41730)
-- Name: editarpersona(integer, integer, character varying, character varying, character varying, character varying, character varying, text, boolean, boolean); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.editarpersona(varidpersona integer, varidciudad integer, varnombre character varying, varapellido character varying, vargenero character varying, varusuario character varying, varcorreo character varying, varclave text, varadmin boolean, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.persona
	SET idciudad=varidciudad, nombre=varnombre, apellido=varapellido, genero=vargenero, usuario=varusuario, correo=varcorreo, clave=varclave, administrador=varadmin, estado=varestado
	WHERE idpersona=varidpersona;
END;
$$;


ALTER FUNCTION public.editarpersona(varidpersona integer, varidciudad integer, varnombre character varying, varapellido character varying, vargenero character varying, varusuario character varying, varcorreo character varying, varclave text, varadmin boolean, varestado boolean) OWNER TO appdist;

--
-- TOC entry 270 (class 1255 OID 41733)
-- Name: editarprovincia(integer, integer, character varying, boolean); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.editarprovincia(varidprovincia integer, varidpais integer, varprovincia character varying, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

	UPDATE public.provincia
	SET idpais=varidpais, provincia=varprovincia, estado=varestado
	WHERE idprovincia=varidprovincia;
END;
$$;


ALTER FUNCTION public.editarprovincia(varidprovincia integer, varidpais integer, varprovincia character varying, varestado boolean) OWNER TO appdist;

--
-- TOC entry 271 (class 1255 OID 41734)
-- Name: editarrecurso(integer, integer, integer, character varying, character varying, character varying, boolean); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.editarrecurso(varidrecurso integer, varcategoriarecurso integer, variddiscapacidad integer, varrecurso character varying, vardescripcion character varying, varetiquetas character varying, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

	UPDATE public.recurso
	SET  idcategoriarecurso=varcategoriarecurso, iddiscapacidad=variddiscapacidad, recurso=varrecurso, descripcion=vardescripcion, etiquetas=varetiquetas, estado=varestado
	WHERE idrecurso=varidrecurso;
END;
$$;


ALTER FUNCTION public.editarrecurso(varidrecurso integer, varcategoriarecurso integer, variddiscapacidad integer, varrecurso character varying, vardescripcion character varying, varetiquetas character varying, varestado boolean) OWNER TO appdist;

--
-- TOC entry 230 (class 1255 OID 41653)
-- Name: eliminarcategoriadiscapacidad(integer); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.eliminarcategoriadiscapacidad(varidcategoriadiscapacidad integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM CategoriaDiscapacidad 
	WHERE varIdCategoriaDiscapacidad = idCategoriaDiscapacidad;
END;
$$;


ALTER FUNCTION public.eliminarcategoriadiscapacidad(varidcategoriadiscapacidad integer) OWNER TO appdist;

--
-- TOC entry 231 (class 1255 OID 41654)
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
-- TOC entry 232 (class 1255 OID 41655)
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
-- TOC entry 233 (class 1255 OID 41656)
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
-- TOC entry 234 (class 1255 OID 41657)
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
-- TOC entry 235 (class 1255 OID 41658)
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
-- TOC entry 236 (class 1255 OID 41659)
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
-- TOC entry 237 (class 1255 OID 41660)
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
-- TOC entry 238 (class 1255 OID 41661)
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
-- TOC entry 239 (class 1255 OID 41662)
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
-- TOC entry 240 (class 1255 OID 41663)
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
-- TOC entry 241 (class 1255 OID 41664)
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
-- TOC entry 242 (class 1255 OID 41665)
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
-- TOC entry 243 (class 1255 OID 41666)
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
-- TOC entry 244 (class 1255 OID 41667)
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
-- TOC entry 245 (class 1255 OID 41668)
-- Name: insertarcategoriadiscapacidad(character varying); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.insertarcategoriadiscapacidad(varcategoriadiscapacidad character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO CategoriaDiscapacidad (CategoriaDiscapacidad) 
	VALUES (varCategoriaDiscapacidad);
END;
$$;


ALTER FUNCTION public.insertarcategoriadiscapacidad(varcategoriadiscapacidad character varying) OWNER TO appdist;

--
-- TOC entry 252 (class 1255 OID 41690)
-- Name: insertarcategoriarecurso(character varying); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.insertarcategoriarecurso(varcategoriarecurso character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO categoriarecurso (categoriarecurso) 
	VALUES (varcategoriarecurso);
END;
$$;


ALTER FUNCTION public.insertarcategoriarecurso(varcategoriarecurso character varying) OWNER TO appdist;

--
-- TOC entry 246 (class 1255 OID 41669)
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
-- TOC entry 273 (class 1255 OID 41670)
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
-- TOC entry 251 (class 1255 OID 42046)
-- Name: insertardiscapacidad(character varying, integer); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.insertardiscapacidad(vardiscapacidad character varying, varidcategoriadiscapacidad integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO public.discapacidad(discapacidad,idcategoriadiscapacidad)
	VALUES (vardiscapacidad, varidcategoriadiscapacidad);
END;
$$;


ALTER FUNCTION public.insertardiscapacidad(vardiscapacidad character varying, varidcategoriadiscapacidad integer) OWNER TO appdist;

--
-- TOC entry 274 (class 1255 OID 41685)
-- Name: insertarlugar(integer, text, text, numeric, numeric, text); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.insertarlugar(varidciudad integer, varlugar text, vardescripcion text, varcoordendax numeric, varcoordenday numeric, varetiqueta text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Lugares (IDCiudad, Lugar, Descripcion, CoordendaX, CoordendaY, Etiqueta,Estado) 
	VALUES (varIDCiudad, varLugar, varDescripcion, varCoordendaX, varCoordendaY, varEtiqueta,TRUE);
END;
$$;


ALTER FUNCTION public.insertarlugar(varidciudad integer, varlugar text, vardescripcion text, varcoordendax numeric, varcoordenday numeric, varetiqueta text) OWNER TO appdist;

--
-- TOC entry 247 (class 1255 OID 41673)
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
-- TOC entry 272 (class 1255 OID 41674)
-- Name: insertarpersona(integer, character varying, character varying, character varying, character varying, character varying, text, boolean); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.insertarpersona(varidciudad integer, varnombre character varying, varapellido character varying, vargenero character varying, varusuario character varying, varcorreo character varying, varclave text, varadmin boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Persona (IDCiudad, Nombre, Apellido,  Genero, 
		Usuario, Correo, Clave, Administrador, Estado) 
	VALUES (varIDCiudad, varNombre, varApellido,vargenero, varUsuario, varCorreo, varClave, varAdmin, TRUE);
END;
$$;


ALTER FUNCTION public.insertarpersona(varidciudad integer, varnombre character varying, varapellido character varying, vargenero character varying, varusuario character varying, varcorreo character varying, varclave text, varadmin boolean) OWNER TO appdist;

--
-- TOC entry 248 (class 1255 OID 41675)
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

--
-- TOC entry 275 (class 1255 OID 42133)
-- Name: insertarrecurso(integer, integer, character varying, text, text, text); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.insertarrecurso(varcategoriarecurso integer, variddiscapacidad integer, varrecurso character varying, vardescripcion text, varetiquetas text, varruta text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO recurso (idcategoriarecurso, iddiscapacidad, recurso, descripcion, etiquetas, estado, ruta) 
	VALUES (varcategoriarecurso, variddiscapacidad, varrecurso, vardescripcion, varetiquetas, TRUE, varruta);
END;
$$;


ALTER FUNCTION public.insertarrecurso(varcategoriarecurso integer, variddiscapacidad integer, varrecurso character varying, vardescripcion text, varetiquetas text, varruta text) OWNER TO appdist;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 201 (class 1259 OID 41508)
-- Name: categoriadiscapacidad; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.categoriadiscapacidad (
    idcategoriadiscapacidad integer NOT NULL,
    categoriadiscapacidad character varying(25) NOT NULL
);


ALTER TABLE public.categoriadiscapacidad OWNER TO appdist;

--
-- TOC entry 200 (class 1259 OID 41506)
-- Name: categoriadiscapacidad_idcategoriadiscapacidad_seq; Type: SEQUENCE; Schema: public; Owner: appdist
--

CREATE SEQUENCE public.categoriadiscapacidad_idcategoriadiscapacidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoriadiscapacidad_idcategoriadiscapacidad_seq OWNER TO appdist;

--
-- TOC entry 3156 (class 0 OID 0)
-- Dependencies: 200
-- Name: categoriadiscapacidad_idcategoriadiscapacidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.categoriadiscapacidad_idcategoriadiscapacidad_seq OWNED BY public.categoriadiscapacidad.idcategoriadiscapacidad;


--
-- TOC entry 203 (class 1259 OID 41517)
-- Name: categoriarecurso; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.categoriarecurso (
    idcategoriarecurso integer NOT NULL,
    categoriarecurso character varying(25) NOT NULL
);


ALTER TABLE public.categoriarecurso OWNER TO appdist;

--
-- TOC entry 202 (class 1259 OID 41515)
-- Name: categoriarecurso_idcategoriarecurso_seq; Type: SEQUENCE; Schema: public; Owner: appdist
--

CREATE SEQUENCE public.categoriarecurso_idcategoriarecurso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoriarecurso_idcategoriarecurso_seq OWNER TO appdist;

--
-- TOC entry 3157 (class 0 OID 0)
-- Dependencies: 202
-- Name: categoriarecurso_idcategoriarecurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.categoriarecurso_idcategoriarecurso_seq OWNED BY public.categoriarecurso.idcategoriarecurso;


--
-- TOC entry 205 (class 1259 OID 41526)
-- Name: ciudad; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.ciudad (
    idciudad integer NOT NULL,
    idprovincia integer NOT NULL,
    ciudad character varying(30) NOT NULL,
    estado boolean NOT NULL
);


ALTER TABLE public.ciudad OWNER TO appdist;

--
-- TOC entry 204 (class 1259 OID 41524)
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
-- TOC entry 3158 (class 0 OID 0)
-- Dependencies: 204
-- Name: ciudad_idciudad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.ciudad_idciudad_seq OWNED BY public.ciudad.idciudad;


--
-- TOC entry 207 (class 1259 OID 41536)
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
-- TOC entry 206 (class 1259 OID 41534)
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
-- TOC entry 3159 (class 0 OID 0)
-- Dependencies: 206
-- Name: concepto_idconcepto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.concepto_idconcepto_seq OWNED BY public.concepto.idconcepto;


--
-- TOC entry 209 (class 1259 OID 41549)
-- Name: discapacidad; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.discapacidad (
    iddiscapacidad integer NOT NULL,
    idcategoriadiscapacidad integer,
    discapacidad character varying(10) NOT NULL
);


ALTER TABLE public.discapacidad OWNER TO appdist;

--
-- TOC entry 208 (class 1259 OID 41547)
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
-- TOC entry 3160 (class 0 OID 0)
-- Dependencies: 208
-- Name: discapacidad_iddiscapacidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.discapacidad_iddiscapacidad_seq OWNED BY public.discapacidad.iddiscapacidad;


--
-- TOC entry 211 (class 1259 OID 41559)
-- Name: lugares; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.lugares (
    idlugar integer NOT NULL,
    idciudad integer NOT NULL,
    lugar character varying(75) NOT NULL,
    descripcion text NOT NULL,
    coordendax numeric(10,6) NOT NULL,
    coordenday numeric(10,6) NOT NULL,
    etiqueta text,
    estado boolean NOT NULL
);


ALTER TABLE public.lugares OWNER TO appdist;

--
-- TOC entry 210 (class 1259 OID 41557)
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
-- TOC entry 3161 (class 0 OID 0)
-- Dependencies: 210
-- Name: lugares_idlugar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.lugares_idlugar_seq OWNED BY public.lugares.idlugar;


--
-- TOC entry 213 (class 1259 OID 41572)
-- Name: pais; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.pais (
    idpais integer NOT NULL,
    pais character varying(40) NOT NULL,
    codigo character(4) NOT NULL,
    estado boolean NOT NULL
);


ALTER TABLE public.pais OWNER TO appdist;

--
-- TOC entry 212 (class 1259 OID 41570)
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
-- TOC entry 3162 (class 0 OID 0)
-- Dependencies: 212
-- Name: pais_idpais_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.pais_idpais_seq OWNED BY public.pais.idpais;


--
-- TOC entry 215 (class 1259 OID 41581)
-- Name: persona; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.persona (
    idpersona integer NOT NULL,
    idciudad integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    genero character(9) NOT NULL,
    usuario character varying(25) NOT NULL,
    correo character varying(50) NOT NULL,
    clave character varying(80) NOT NULL,
    administrador boolean NOT NULL,
    estado boolean
);


ALTER TABLE public.persona OWNER TO appdist;

--
-- TOC entry 214 (class 1259 OID 41579)
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
-- TOC entry 3163 (class 0 OID 0)
-- Dependencies: 214
-- Name: persona_idpersona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.persona_idpersona_seq OWNED BY public.persona.idpersona;


--
-- TOC entry 217 (class 1259 OID 41591)
-- Name: provincia; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.provincia (
    idprovincia integer NOT NULL,
    idpais integer NOT NULL,
    provincia character varying(30) NOT NULL,
    estado boolean NOT NULL
);


ALTER TABLE public.provincia OWNER TO appdist;

--
-- TOC entry 216 (class 1259 OID 41589)
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
-- TOC entry 3164 (class 0 OID 0)
-- Dependencies: 216
-- Name: provincia_idprovincia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.provincia_idprovincia_seq OWNED BY public.provincia.idprovincia;


--
-- TOC entry 219 (class 1259 OID 41601)
-- Name: recurso; Type: TABLE; Schema: public; Owner: appdist
--

CREATE TABLE public.recurso (
    idrecurso integer NOT NULL,
    idcategoriarecurso integer NOT NULL,
    iddiscapacidad integer NOT NULL,
    recurso character varying(25) NOT NULL,
    descripcion text NOT NULL,
    etiquetas text NOT NULL,
    estado boolean NOT NULL,
    ruta text NOT NULL
);


ALTER TABLE public.recurso OWNER TO appdist;

--
-- TOC entry 218 (class 1259 OID 41599)
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
-- TOC entry 3165 (class 0 OID 0)
-- Dependencies: 218
-- Name: recurso_idrecurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.recurso_idrecurso_seq OWNED BY public.recurso.idrecurso;


--
-- TOC entry 221 (class 1259 OID 41740)
-- Name: vwcategoriadiscapacidad; Type: VIEW; Schema: public; Owner: appdist
--

CREATE VIEW public.vwcategoriadiscapacidad AS
 SELECT categoriadiscapacidad.idcategoriadiscapacidad,
    categoriadiscapacidad.categoriadiscapacidad
   FROM public.categoriadiscapacidad;


ALTER TABLE public.vwcategoriadiscapacidad OWNER TO appdist;

--
-- TOC entry 222 (class 1259 OID 41744)
-- Name: vwcategoriarecurso; Type: VIEW; Schema: public; Owner: appdist
--

CREATE VIEW public.vwcategoriarecurso AS
 SELECT categoriarecurso.idcategoriarecurso,
    categoriarecurso.categoriarecurso
   FROM public.categoriarecurso;


ALTER TABLE public.vwcategoriarecurso OWNER TO appdist;

--
-- TOC entry 223 (class 1259 OID 41748)
-- Name: vwciudad; Type: VIEW; Schema: public; Owner: appdist
--

CREATE VIEW public.vwciudad AS
 SELECT c.idciudad,
    c.idprovincia,
    c.ciudad,
    c.estado,
    p.provincia
   FROM (public.ciudad c
     JOIN public.provincia p ON ((c.idprovincia = p.idprovincia)));


ALTER TABLE public.vwciudad OWNER TO appdist;

--
-- TOC entry 228 (class 1259 OID 42063)
-- Name: vwconcepto; Type: VIEW; Schema: public; Owner: appdist
--

CREATE VIEW public.vwconcepto AS
 SELECT c.idconcepto,
    c.iddiscapacidad,
    d.discapacidad,
    c.descripcion,
    c.etiquetas
   FROM (public.concepto c
     JOIN public.discapacidad d ON ((c.iddiscapacidad = d.iddiscapacidad)));


ALTER TABLE public.vwconcepto OWNER TO appdist;

--
-- TOC entry 227 (class 1259 OID 42047)
-- Name: vwdiscapacidad; Type: VIEW; Schema: public; Owner: appdist
--

CREATE VIEW public.vwdiscapacidad AS
 SELECT d.iddiscapacidad,
    d.idcategoriadiscapacidad,
    cd.categoriadiscapacidad,
    d.discapacidad
   FROM (public.discapacidad d
     JOIN public.categoriadiscapacidad cd ON ((d.idcategoriadiscapacidad = cd.idcategoriadiscapacidad)));


ALTER TABLE public.vwdiscapacidad OWNER TO appdist;

--
-- TOC entry 220 (class 1259 OID 41735)
-- Name: vwlugar; Type: VIEW; Schema: public; Owner: appdist
--

CREATE VIEW public.vwlugar AS
 SELECT l.idlugar,
    c.ciudad,
    p.provincia,
    pa.pais,
    l.lugar,
    l.descripcion,
    l.coordendax,
    l.coordenday,
    l.etiqueta,
    l.estado
   FROM (((public.lugares l
     JOIN public.ciudad c ON ((l.idciudad = c.idciudad)))
     JOIN public.provincia p ON ((c.idprovincia = p.idprovincia)))
     JOIN public.pais pa ON ((p.idpais = pa.idpais)));


ALTER TABLE public.vwlugar OWNER TO appdist;

--
-- TOC entry 224 (class 1259 OID 41760)
-- Name: vwpais; Type: VIEW; Schema: public; Owner: appdist
--

CREATE VIEW public.vwpais AS
 SELECT pais.idpais,
    pais.pais,
    pais.codigo,
    pais.estado
   FROM public.pais;


ALTER TABLE public.vwpais OWNER TO appdist;

--
-- TOC entry 226 (class 1259 OID 41806)
-- Name: vwpersona; Type: VIEW; Schema: public; Owner: appdist
--

CREATE VIEW public.vwpersona AS
 SELECT p.idpersona,
    p.idciudad,
    p.nombre,
    p.apellido,
    p.genero,
    p.usuario,
    p.correo,
    p.clave,
    p.administrador,
    p.estado,
    c.ciudad
   FROM (public.persona p
     JOIN public.ciudad c ON ((c.idciudad = p.idciudad)));


ALTER TABLE public.vwpersona OWNER TO appdist;

--
-- TOC entry 225 (class 1259 OID 41764)
-- Name: vwprovincia; Type: VIEW; Schema: public; Owner: appdist
--

CREATE VIEW public.vwprovincia AS
 SELECT p.idprovincia,
    pa.pais,
    p.provincia,
    p.estado
   FROM (public.provincia p
     JOIN public.pais pa ON ((p.idpais = pa.idpais)));


ALTER TABLE public.vwprovincia OWNER TO appdist;

--
-- TOC entry 229 (class 1259 OID 42067)
-- Name: vwrecurso; Type: VIEW; Schema: public; Owner: appdist
--

CREATE VIEW public.vwrecurso AS
 SELECT r.idrecurso,
    r.idcategoriarecurso,
    cr.categoriarecurso,
    r.iddiscapacidad,
    d.discapacidad,
    r.recurso,
    r.descripcion,
    r.etiquetas,
    r.estado,
    r.ruta
   FROM ((public.recurso r
     JOIN public.categoriarecurso cr ON ((r.idcategoriarecurso = cr.idcategoriarecurso)))
     JOIN public.discapacidad d ON ((r.iddiscapacidad = d.iddiscapacidad)));


ALTER TABLE public.vwrecurso OWNER TO appdist;

--
-- TOC entry 2935 (class 2604 OID 41511)
-- Name: categoriadiscapacidad idcategoriadiscapacidad; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.categoriadiscapacidad ALTER COLUMN idcategoriadiscapacidad SET DEFAULT nextval('public.categoriadiscapacidad_idcategoriadiscapacidad_seq'::regclass);


--
-- TOC entry 2936 (class 2604 OID 41520)
-- Name: categoriarecurso idcategoriarecurso; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.categoriarecurso ALTER COLUMN idcategoriarecurso SET DEFAULT nextval('public.categoriarecurso_idcategoriarecurso_seq'::regclass);


--
-- TOC entry 2937 (class 2604 OID 41529)
-- Name: ciudad idciudad; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.ciudad ALTER COLUMN idciudad SET DEFAULT nextval('public.ciudad_idciudad_seq'::regclass);


--
-- TOC entry 2938 (class 2604 OID 41539)
-- Name: concepto idconcepto; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.concepto ALTER COLUMN idconcepto SET DEFAULT nextval('public.concepto_idconcepto_seq'::regclass);


--
-- TOC entry 2939 (class 2604 OID 41552)
-- Name: discapacidad iddiscapacidad; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.discapacidad ALTER COLUMN iddiscapacidad SET DEFAULT nextval('public.discapacidad_iddiscapacidad_seq'::regclass);


--
-- TOC entry 2940 (class 2604 OID 41562)
-- Name: lugares idlugar; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.lugares ALTER COLUMN idlugar SET DEFAULT nextval('public.lugares_idlugar_seq'::regclass);


--
-- TOC entry 2941 (class 2604 OID 41575)
-- Name: pais idpais; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.pais ALTER COLUMN idpais SET DEFAULT nextval('public.pais_idpais_seq'::regclass);


--
-- TOC entry 2942 (class 2604 OID 41584)
-- Name: persona idpersona; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.persona ALTER COLUMN idpersona SET DEFAULT nextval('public.persona_idpersona_seq'::regclass);


--
-- TOC entry 2943 (class 2604 OID 41594)
-- Name: provincia idprovincia; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.provincia ALTER COLUMN idprovincia SET DEFAULT nextval('public.provincia_idprovincia_seq'::regclass);


--
-- TOC entry 2944 (class 2604 OID 41604)
-- Name: recurso idrecurso; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.recurso ALTER COLUMN idrecurso SET DEFAULT nextval('public.recurso_idrecurso_seq'::regclass);


--
-- TOC entry 3132 (class 0 OID 41508)
-- Dependencies: 201
-- Data for Name: categoriadiscapacidad; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.categoriadiscapacidad (idcategoriadiscapacidad, categoriadiscapacidad) FROM stdin;
1	Discapacidad auditiva
2	Discapacidad física
3	Discapacidad intelectual
4	Discapacidad Multiple
5	Discapacidad psicosocial
6	Discapacidad visual
7	Post
\.


--
-- TOC entry 3134 (class 0 OID 41517)
-- Dependencies: 203
-- Data for Name: categoriarecurso; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.categoriarecurso (idcategoriarecurso, categoriarecurso) FROM stdin;
1	Archivos
\.


--
-- TOC entry 3136 (class 0 OID 41526)
-- Dependencies: 205
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.ciudad (idciudad, idprovincia, ciudad, estado) FROM stdin;
1	12	Quevedo	t
2	17	Puerto Quito	t
3	12	Valencia	t
4	1	Cuenca	t
185	1	Girón	t
126	1	Gualaceo	t
132	1	Nabón	t
5	1	Paute	t
6	1	Pucara	t
7	1	San Fernando	t
8	1	Santa Isabel	t
9	1	Sigsig	t
10	1	Oña	t
11	1	Chordeleg	t
12	1	El Pan	t
13	1	Sevilla de Oro	t
14	1	Guachapala	t
15	1	Camilo Ponce Enríquez	t
16	2	Guaranda	t
17	2	Chillanes	t
18	2	Chimbo	t
19	2	Echeandía	t
20	2	San Miguel	t
21	2	Caluma	t
22	2	Las Naves	t
23	3	Azogues	t
24	3	Biblián	t
25	3	Cañar	t
26	3	La Troncal	t
27	3	El Tambo	t
28	3	Déleg	t
29	3	Suscal	t
30	4	Tulcán	t
31	4	Bolívar	t
32	4	Espejo	t
33	4	Mira	t
34	4	Montúfar	t
35	4	San Pedro de Huaca	t
36	5	Latacunga	t
37	5	La Maná	t
38	5	Pangua	t
39	5	Pujili	t
40	5	Salcedo	t
41	5	Saquisilí	t
42	5	Sigchos	t
43	6	Riobamba	t
44	6	Alausi	t
45	6	Colta	t
46	6	Chambo	t
47	6	Chunchi	t
48	6	Guamote	t
49	6	Guano	t
50	6	Pallatanga	t
51	6	Penipe	t
52	6	Cumandá	t
53	7	Machala	t
54	7	Arenillas	t
55	7	Atahualpa	t
56	7	Balsas	t
57	7	Chilla	t
58	7	El Guabo	t
59	7	Huaquillas	t
60	7	Marcabelí	t
61	7	Pasaje	t
62	7	Piñas	t
63	7	Portovelo	t
64	7	Santa Rosa	t
65	7	Zaruma	t
66	7	Las Lajas	t
67	8	Esmeraldas	t
68	8	Eloy Alfaro	t
69	8	Muisne	t
70	8	Quinindé	t
71	8	San Lorenzo	t
72	8	Atacames	t
73	8	Rioverde	t
74	8	La Concordia	t
75	9	Guayaquil	t
76	9	Alfredo Baquerizo Moreno	t
77	9	Balao	t
78	9	Balzar	t
79	9	Colimes	t
80	9	Daule	t
81	9	Durán	t
82	9	El Empalme	t
83	9	El Triunfo	t
84	9	Milagro	t
85	9	Naranjal	t
86	9	Naranjito	t
87	9	Palestina	t
88	9	Pedro Carbo	t
89	9	Samborondón	t
90	9	Santa Lucía	t
91	9	Salitre (Urbina Jado)	t
92	9	San Jacinto de Yaguachi	t
93	9	Playas	t
94	9	Simón Bolívar	t
95	9	Coronel Marcelino Maridueña	t
96	9	Lomas de Sargentillo	t
97	9	Nobol	t
98	9	General Antonio Elizalde	t
99	9	Isidro Ayora	t
100	10	Ibarra	t
101	10	Antonio Ante	t
102	10	Cotacachi	t
103	10	Otavalo	t
104	10	Pimampiro	t
105	10	San Miguel de Urcuquí	t
106	11	Loja	t
107	11	Calvas	t
108	11	Catamayo	t
109	11	Celica	t
110	11	Chaguarpamba	t
111	11	Espíndola	t
112	11	Gonzanamá	t
113	11	Macará	t
114	11	Paltas	t
115	11	Puyango	t
116	11	Saraguro	t
117	11	Sozoranga	t
118	11	Zapotillo	t
119	11	Pindal	t
120	11	Quilanga	t
121	11	Olmedo	t
122	12	Babahoyo	t
123	12	Baba	t
124	12	Montalvo	t
125	12	Puebloviejo	t
127	12	Urdaneta	t
128	12	Ventanas	t
129	12	Vínces	t
130	12	Palenque	t
131	12	Buena Fé	t
133	12	Mocache	t
134	12	Quinsaloma	t
135	13	Portoviejo	t
136	13	Bolívar	t
137	13	Chone	t
138	13	El Carmen	t
139	13	Flavio Alfaro	t
140	13	Jipijapa	t
141	13	Junín	t
142	13	Manta	t
143	13	Montecristi	t
144	13	Paján	t
145	13	Pichincha	t
146	13	Rocafuerte	t
147	13	Santa Ana	t
148	13	Sucre	t
149	13	Tosagua	t
150	13	24 de Mayo	t
151	13	Pedernales	t
152	13	Olmedo	t
153	13	Puerto López	t
154	13	Jama	t
155	13	Jaramijó	t
156	13	San Vicente	t
157	14	Morona	t
158	14	Gualaquiza	t
159	14	Limón Indanza	t
160	14	Palora	t
161	14	Santiago	t
162	14	Sucúa	t
163	14	Huamboya	t
164	14	San Juan Bosco	t
165	14	Taisha	t
166	14	Logroño	t
167	14	Pablo Sexto	t
168	14	Tiwintza	t
169	15	Tena	t
170	15	Archidona	t
171	15	El Chaco	t
172	15	Quijos	t
173	15	Carlos Julio Arosemena Tola	t
174	16	Pastaza	t
175	16	Mera	t
176	16	Santa Clara	t
177	16	Arajuno	t
178	17	Quito	t
179	17	Cayambe	t
180	17	Mejia	t
181	17	Pedro Moncayo	t
182	17	Rumiñahui	t
183	17	San Miguel de Los Bancos	t
184	17	Pedro Vicente Maldonado	t
186	18	Ambato	t
187	18	Baños de Agua Santa	t
188	18	Cevallos	t
189	18	Mocha	t
190	18	Patate	t
191	18	Quero	t
192	18	San Pedro de Pelileo	t
193	18	Santiago de Píllaro	t
194	18	Tisaleo	t
195	19	Zamora	t
196	19	Chinchipe	t
197	19	Nangaritza	t
198	19	Yacuambi	t
199	19	Yantzaza (Yanzatza)	t
200	19	El Pangui	t
201	19	Centinela del Cóndor	t
202	19	Palanda	t
203	19	Paquisha	t
204	20	San Cristóbal	t
205	20	Isabela	t
206	20	Santa Cruz	t
207	21	Lago Agrio	t
208	21	Gonzalo Pizarro	t
209	21	Putumayo	t
210	21	Shushufindi	t
211	21	Sucumbíos	t
212	21	Cascales	t
213	21	Cuyabeno	t
214	22	Orellana	t
215	22	Aguarico	t
216	22	La Joya de Los Sachas	t
217	22	Loreto	t
218	23	Santo Domingo	t
219	24	Santa Elena	t
220	24	La Libertad	t
221	24	Salinas	t
222	25	Las Golondrinas	t
223	25	Manga del Cura	t
224	25	El Piedrero	t
\.


--
-- TOC entry 3138 (class 0 OID 41536)
-- Dependencies: 207
-- Data for Name: concepto; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.concepto (idconcepto, iddiscapacidad, descripcion, etiquetas) FROM stdin;
45	68	<h1>TÍTULO PRINCIPAL</h1><hr><div style=" display: flex;"><div><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p></div><div><div style="width: 450px; height: 300px; border: 1px solid black; background: url(https://res.cloudinary.com/durxpegdm/image/upload/v1641799052/450x300_pfdnog.jpg)"></div></div></div>	asdasdatitulo: sdssa
46	68	<h1 id="firstHeading" class="firstHeading mw-first-heading" style="color: rgb(0, 0, 0); margin-top: 0px; margin-bottom: 0.25em; padding: 0px; overflow: visible; border-bottom: 1px solid rgb(162, 169, 177); font-size: 1.8em; font-family: &quot;Linux Libertine&quot;, Georgia, Times, serif; line-height: 1.3;">Julio César</h1><div id="bodyContent" class="vector-body" style="font-size: calc(0.875em); line-height: 1.6; position: relative; z-index: 0; color: rgb(32, 33, 34); font-family: sans-serif;"><div id="contentSub" style="font-size: 11.76px; line-height: 1.2em; margin: 0px 0px 1.4em 1em; color: rgb(84, 89, 93); width: auto;"></div><div id="contentSub2" style="font-size: 11.76px; line-height: 1.2em; margin: 0px 0px 1.4em 1em; color: rgb(84, 89, 93); width: auto;"></div><div id="jump-to-nav"></div><a class="mw-jump-link" href="https://es.wikipedia.org/wiki/Julio_C%C3%A9sar#mw-head" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; display: block; clip: rect(1px, 1px, 1px, 1px); width: 1px; height: 1px; margin: -1px; border: 0px; padding: 0px; overflow: hidden; position: absolute !important;">Ir a la navegación</a><a class="mw-jump-link" href="https://es.wikipedia.org/wiki/Julio_C%C3%A9sar#searchInput" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; display: block; clip: rect(1px, 1px, 1px, 1px); width: 1px; height: 1px; margin: -1px; border: 0px; padding: 0px; overflow: hidden; position: absolute !important;">Ir a la búsqueda</a><div id="mw-content-text" class="mw-body-content mw-content-ltr" lang="es" dir="ltr" style="direction: ltr;"><div class="mw-parser-output"><div class="rellink noprint hatnote" style="font-style: italic; padding-left: 1.6em; margin-bottom: 0.5em;">Para otros usos de este término, véase&nbsp;<a href="https://es.wikipedia.org/wiki/Julio_C%C3%A9sar_(desambiguaci%C3%B3n)" class="mw-disambig" title="Julio César (desambiguación)" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Julio César (desambiguación)</a>.</div><div class="rellink noprint hatnote" style="font-style: italic; padding-left: 1.6em; margin-bottom: 0.5em;">«Cayo Julio César» redirige aquí. Para otros personajes homónimos, véase&nbsp;<a href="https://es.wikipedia.org/wiki/Cayo_Julio_C%C3%A9sar_(desambiguaci%C3%B3n)" class="mw-disambig" title="Cayo Julio César (desambiguación)" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Cayo Julio César (desambiguación)</a>.</div><table class="infobox" style="font-size: 12.6px; border: 1px solid rgb(180, 187, 200); background-color: rgb(249, 249, 249); color: rgb(0, 0, 0); margin: 0.5em 0px 0.7em 1.2em; padding: 0.23em; clear: right; float: right; line-height: 1.4em; width: 22.7em;"><tbody><tr><th colspan="3" class="cabecera persona" style="vertical-align: middle; font-size: 17.64px; font-weight: bolder; height: 45px; line-height: 1.2em; text-align: center; background-color: rgb(238, 238, 238);">Cayo Julio César</th></tr><tr><td colspan="3" style="vertical-align: top; text-align: center;"><a href="https://commons.wikimedia.org/wiki/File:Bust_of_Gaius_Iulius_Caesar_in_Naples.jpg" class="image" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><img alt="Bust of Gaius Iulius Caesar in Naples.jpg" src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Bust_of_Gaius_Iulius_Caesar_in_Naples.jpg/245px-Bust_of_Gaius_Iulius_Caesar_in_Naples.jpg" decoding="async" width="245" height="444" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/be/Bust_of_Gaius_Iulius_Caesar_in_Naples.jpg/368px-Bust_of_Gaius_Iulius_Caesar_in_Naples.jpg 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/be/Bust_of_Gaius_Iulius_Caesar_in_Naples.jpg/490px-Bust_of_Gaius_Iulius_Caesar_in_Naples.jpg 2x" data-file-width="800" data-file-height="1450"></a><br><div style="display: inline; font-size: smaller;">Busto de Julio César en el&nbsp;<a href="https://es.wikipedia.org/wiki/Museo_Arqueol%C3%B3gico_Nacional_de_N%C3%A1poles" title="Museo Arqueológico Nacional de Nápoles" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Museo Arqueológico Nacional de Nápoles</a>.</div></td></tr><tr><th colspan="3" style="vertical-align: top; text-align: center; background-color: rgb(238, 238, 238);">Información personal</th></tr><tr><th scope="row" style="vertical-align: top;">Nombre secular</th><td colspan="2" style="vertical-align: top;">Gaius Iulius Caesar</td></tr><tr><th scope="row" style="vertical-align: top;">Nacimiento</th><td colspan="2" style="vertical-align: top;"><a href="https://es.wikipedia.org/wiki/12_de_julio" title="12 de julio" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">12</a>&nbsp;o&nbsp;<a href="https://es.wikipedia.org/wiki/13_de_julio" title="13 de julio" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">13 de julio</a>&nbsp;de&nbsp;<a href="https://es.wikipedia.org/wiki/100_a._C." title="100 a. C." style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">100&nbsp;a.&nbsp;C.</a><br><a href="https://es.wikipedia.org/wiki/Roma" title="Roma" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Roma</a>,&nbsp;<a href="https://es.wikipedia.org/wiki/Rep%C3%BAblica_romana" title="República romana" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">República romana</a></td></tr><tr><th scope="row" style="vertical-align: top;">Fallecimiento</th><td colspan="2" style="vertical-align: top;"><a href="https://es.wikipedia.org/wiki/15_de_marzo" title="15 de marzo" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">15 de marzo</a>&nbsp;de&nbsp;<a href="https://es.wikipedia.org/wiki/44_a._C." title="44 a. C." style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">44&nbsp;a.&nbsp;C.</a><br><a href="https://es.wikipedia.org/wiki/Roma" title="Roma" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Roma</a>,&nbsp;<a href="https://es.wikipedia.org/wiki/Rep%C3%BAblica_romana" title="República romana" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">República romana</a></td></tr><tr><th colspan="3" style="vertical-align: top; text-align: center; background-color: rgb(238, 238, 238);">Familia</th></tr><tr><th scope="row" style="vertical-align: top;">Padre</th><td colspan="2" style="vertical-align: top;"><a href="https://es.wikipedia.org/wiki/Cayo_Julio_C%C3%A9sar_(pretor)" title="Cayo Julio César (pretor)" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Cayo Julio César</a></td></tr><tr><th scope="row" style="vertical-align: top;">Madre</th><td colspan="2" style="vertical-align: top;"><a href="https://es.wikipedia.org/wiki/Aurelia_(madre_de_Julio_C%C3%A9sar)" title="Aurelia (madre de Julio César)" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Aurelia</a></td></tr><tr><th scope="row" style="vertical-align: top;">Cónyuge</th><td colspan="2" style="vertical-align: top;"><a href="https://es.wikipedia.org/wiki/Cornelia_(esposa_de_Julio_C%C3%A9sar)" title="Cornelia (esposa de Julio César)" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Cornelia</a>&nbsp;(84&nbsp;a.&nbsp;C.-68&nbsp;a.&nbsp;C.)<br><a href="https://es.wikipedia.org/wiki/Pompeya_(esposa_de_Julio_C%C3%A9sar)" title="Pompeya (esposa de Julio César)" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Pompeya</a>&nbsp;(68&nbsp;a.&nbsp;C.-63&nbsp;a.&nbsp;C.)<br><a href="https://es.wikipedia.org/wiki/Calpurnia_(esposa_de_Julio_C%C3%A9sar)" title="Calpurnia (esposa de Julio César)" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Calpurnia</a>&nbsp;(59&nbsp;a.&nbsp;C.-44&nbsp;a.&nbsp;C.)</td></tr><tr><th scope="row" style="vertical-align: top;">Hijos</th><td colspan="2" style="vertical-align: top;"><a href="https://es.wikipedia.org/wiki/Julia_(hija_de_Julio_C%C3%A9sar)" title="Julia (hija de Julio César)" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Julia</a><br><a href="https://es.wikipedia.org/wiki/Cesari%C3%B3n" title="Cesarión" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Cesarión</a>&nbsp;(ilegítimo)<br><a href="https://es.wikipedia.org/wiki/Augusto" title="Augusto" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Augusto</a>&nbsp;(adoptivo)</td></tr><tr><td class="noprint" colspan="3" style="vertical-align: top;"></td></tr></tbody></table><p style="margin-top: 0.5em; margin-bottom: 0.5em;"><b>Cayo</b>&nbsp;o&nbsp;<b>Gayo Julio César</b>&nbsp;(en&nbsp;<a href="https://es.wikipedia.org/wiki/Lat%C3%ADn" title="Latín" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">latín</a>:&nbsp;<i>Gaius Iulius Caesar</i>;<sup id="cite_ref-2" class="reference separada" style="line-height: 1em; unicode-bidi: isolate; white-space: nowrap; margin-right: 0.6ch;"><a href="https://es.wikipedia.org/wiki/Julio_C%C3%A9sar#cite_note-2" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">a</a></sup>​&nbsp;<a href="https://es.wikipedia.org/wiki/12_de_julio" title="12 de julio" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">12</a>&nbsp;o&nbsp;<a href="https://es.wikipedia.org/wiki/13_de_julio" title="13 de julio" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">13 de julio</a>&nbsp;de&nbsp;<a href="https://es.wikipedia.org/wiki/100_a._C." title="100 a. C." style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">100 a. C.</a>-<a href="https://es.wikipedia.org/wiki/15_de_marzo" title="15 de marzo" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">15 de marzo</a>&nbsp;de&nbsp;<a href="https://es.wikipedia.org/wiki/44_a._C." title="44 a. C." style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">44 a. C.</a>) fue un político y militar&nbsp;<a href="https://es.wikipedia.org/wiki/Rep%C3%BAblica_romana" title="República romana" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">romano</a>&nbsp;del&nbsp;<span style="white-space: nowrap;">siglo I a. C.</span>&nbsp;miembro de los patricios&nbsp;<a href="https://es.wikipedia.org/wiki/Julios_C%C3%A9sares" title="Julios Césares" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Julios Césares</a>&nbsp;que alcanzó las más altas magistraturas del Estado romano y dominó la política de la República tras vencer en la&nbsp;<a href="https://es.wikipedia.org/wiki/Segunda_guerra_civil_de_la_Rep%C3%BAblica_romana" title="Segunda guerra civil de la República romana" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">guerra civil</a>&nbsp;que le enfrentó al sector más conservador del&nbsp;<a href="https://es.wikipedia.org/wiki/Senado_(Antigua_Roma)" class="mw-redirect" title="Senado (Antigua Roma)" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Senado</a>.</p><p style="margin-top: 0.5em; margin-bottom: 0.5em;">Nacido en el seno de la&nbsp;<a href="https://es.wikipedia.org/wiki/Gens_Julia" title="Gens Julia" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><i>gens</i>&nbsp;Julia</a>, una familia&nbsp;<a href="https://es.wikipedia.org/wiki/Patricios" title="Patricios" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">patricia</a>&nbsp;de escasa fortuna, estuvo emparentado con algunos de los hombres más influyentes de su época, como su tío&nbsp;<a href="https://es.wikipedia.org/wiki/Cayo_Mario" title="Cayo Mario" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Cayo Mario</a>, quien influiría de manera determinante en su carrera política. En 84&nbsp;a.&nbsp;C., a los 16 años, el&nbsp;<a href="https://es.wikipedia.org/wiki/Populares" title="Populares" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">popular</a>&nbsp;<a href="https://es.wikipedia.org/wiki/Lucio_Cornelio_Cinna" title="Lucio Cornelio Cinna" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Lucio Cornelio Cinna</a>&nbsp;lo nombró&nbsp;<i><a href="https://es.wikipedia.org/wiki/Flamen_Dialis" title="Flamen Dialis" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">flamen Dialis</a></i>, cargo religioso del que fue relevado por&nbsp;<a href="https://es.wikipedia.org/wiki/Sila" title="Sila" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Sila</a>, con quien tuvo conflictos a causa de su matrimonio con la hija de Cinna. Tras escapar de morir a manos de los sicarios del dictador Sila, fue perdonado gracias a la intercesión de los parientes de su madre. Trasladado a la provincia de&nbsp;<a href="https://es.wikipedia.org/wiki/Asia_(provincia_romana)" title="Asia (provincia romana)" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Asia</a>, combatió en&nbsp;<a href="https://es.wikipedia.org/wiki/Mitilene" title="Mitilene" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Mitilene</a>&nbsp;como&nbsp;<a href="https://es.wikipedia.org/wiki/Legado_(Antigua_Roma)" title="Legado (Antigua Roma)" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">legado</a>&nbsp;de&nbsp;<a href="https://es.wikipedia.org/w/index.php?title=Marco_Minucio_Termo&amp;action=edit&amp;redlink=1" class="new" title="Marco Minucio Termo (aún no redactado)" style="color: rgb(186, 0, 0); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Marco Minucio Termo</a>. Volvió a Roma a la muerte de Sila en 78&nbsp;a.&nbsp;C., y ejerció por un tiempo la abogacía. En 73&nbsp;a.&nbsp;C. sucedió a&nbsp;<a href="https://es.wikipedia.org/wiki/Cayo_Aurelio_Cota" title="Cayo Aurelio Cota" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Cayo Aurelio Cota</a>&nbsp;como&nbsp;<a href="https://es.wikipedia.org/wiki/Pont%C3%ADfice" title="Pontífice" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">pontífice</a>, y pronto entró en relación con los cónsules&nbsp;<a href="https://es.wikipedia.org/wiki/Pompeyo" title="Pompeyo" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Pompeyo</a>&nbsp;y&nbsp;<a href="https://es.wikipedia.org/wiki/Craso" title="Craso" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Craso</a>, cuya amistad le permitiría lanzar su propia carrera política.<sup id="cite_ref-4" class="reference separada" style="line-height: 1em; unicode-bidi: isolate; white-space: nowrap; margin-right: 0.6ch;"><a href="https://es.wikipedia.org/wiki/Julio_C%C3%A9sar#cite_note-4" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">b</a></sup>​ En 70&nbsp;a.&nbsp;C. César sirvió como&nbsp;<a href="https://es.wikipedia.org/wiki/Cuestor" title="Cuestor" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">cuestor</a>&nbsp;en la&nbsp;<a href="https://es.wikipedia.org/wiki/Administraci%C3%B3n_provincial_romana" title="Administración provincial romana" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">provincia</a>&nbsp;de la&nbsp;<a href="https://es.wikipedia.org/wiki/Hispania_Ulterior" title="Hispania Ulterior" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Hispania Ulterior</a>&nbsp;y como&nbsp;<a href="https://es.wikipedia.org/wiki/Edil_curul" title="Edil curul" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">edil curul</a>&nbsp;en&nbsp;<a href="https://es.wikipedia.org/wiki/Roma" title="Roma" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Roma</a>. Durante el desempeño de esa&nbsp;<a href="https://es.wikipedia.org/wiki/Magistratura_(Antigua_Roma)" title="Magistratura (Antigua Roma)" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">magistratura</a>&nbsp;ofreció unos espectáculos que fueron recordados durante mucho tiempo por el pueblo.</p><p style="margin-top: 0.5em; margin-bottom: 0.5em;">En 63&nbsp;a.&nbsp;C. fue elegido&nbsp;<a href="https://es.wikipedia.org/wiki/Pretor_urbano" class="mw-redirect" title="Pretor urbano" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">pretor urbano</a>&nbsp;al obtener más votos que el resto de candidatos. Ese mismo año murió&nbsp;<a href="https://es.wikipedia.org/wiki/Quinto_Cecilio_Metelo_P%C3%ADo" title="Quinto Cecilio Metelo Pío" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Quinto Cecilio Metelo Pío</a>,&nbsp;<i><a href="https://es.wikipedia.org/wiki/Pontifex_maximus" class="mw-redirect" title="Pontifex maximus" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">pontifex maximus</a></i>&nbsp;designado durante la dictadura de Sila, y, en las elecciones celebradas para sustituirle, venció César. Al término de su pretura sirvió como&nbsp;<a href="https://es.wikipedia.org/wiki/Propretor" title="Propretor" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">propretor</a>&nbsp;en Hispania, donde capitaneó una breve&nbsp;<a href="https://es.wikipedia.org/wiki/Campa%C3%B1a_militar" title="Campaña militar" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">campaña militar</a>&nbsp;contra los&nbsp;<a href="https://es.wikipedia.org/wiki/Lusitanos" title="Lusitanos" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">lusitanos</a>. En 59&nbsp;a.&nbsp;C. fue elegido&nbsp;<a href="https://es.wikipedia.org/wiki/C%C3%B3nsul_romano" title="Cónsul romano" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">cónsul</a>&nbsp;gracias al apoyo de sus dos aliados políticos, Pompeyo y Craso, los hombres con los que César formó el llamado&nbsp;<a href="https://es.wikipedia.org/wiki/Primer_Triunvirato_(Antigua_Roma)" title="Primer Triunvirato (Antigua Roma)" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Primer Triunvirato</a>. Su colega durante el consulado,&nbsp;<a href="https://es.wikipedia.org/wiki/Marco_Calpurnio_B%C3%ADbulo" title="Marco Calpurnio Bíbulo" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Marco Calpurnio Bíbulo</a>, se retiró para así entorpecer la labor de César que, sin embargo, logró sacar adelante una serie de medidas legales, entre las que destaca una ley agraria que regulaba el reparto de tierras entre los soldados veteranos.</p><p style="margin-top: 0.5em; margin-bottom: 0.5em;">Tras su consulado fue designado&nbsp;<a href="https://es.wikipedia.org/wiki/Proc%C3%B3nsul" title="Procónsul" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">procónsul</a>&nbsp;de las provincias de la&nbsp;<a href="https://es.wikipedia.org/wiki/Galia_Transalpina" title="Galia Transalpina" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Galia Transalpina</a>,&nbsp;<a href="https://es.wikipedia.org/wiki/Iliria" title="Iliria" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Iliria</a>&nbsp;y la&nbsp;<a href="https://es.wikipedia.org/wiki/Galia_Cisalpina" class="mw-redirect" title="Galia Cisalpina" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Galia Cisalpina</a>, esta última tras la muerte de su&nbsp;<a href="https://es.wikipedia.org/wiki/Gobernador_romano" title="Gobernador romano" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">gobernador</a>,&nbsp;<a href="https://es.wikipedia.org/wiki/Quinto_Cecilio_Metelo_C%C3%A9ler" title="Quinto Cecilio Metelo Céler" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Céler</a>. Su gobierno se caracterizó por una política muy agresiva con la que sometió a prácticamente la totalidad de los&nbsp;<a href="https://es.wikipedia.org/wiki/Celtas" class="mw-redirect" title="Celtas" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">pueblos celtas</a>&nbsp;en varias campañas. Este conflicto, conocido como la&nbsp;<a href="https://es.wikipedia.org/wiki/Guerra_de_las_Galias" title="Guerra de las Galias" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">guerra de las Galias</a>, finalizó cuando el general republicano venció en la&nbsp;<a href="https://es.wikipedia.org/wiki/Batalla_de_Alesia" title="Batalla de Alesia" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">batalla de Alesia</a>&nbsp;a los últimos focos de oposición, encabezados por un jefe&nbsp;<a href="https://es.wikipedia.org/wiki/Arverno" class="mw-redirect" title="Arverno" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">arverno</a>&nbsp;llamado&nbsp;<a href="https://es.wikipedia.org/wiki/Vercing%C3%A9torix" title="Vercingétorix" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Vercingétorix</a>. Sus conquistas extendieron el dominio romano sobre los territorios que hoy integran&nbsp;<a href="https://es.wikipedia.org/wiki/Francia" title="Francia" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Francia</a>,&nbsp;<a href="https://es.wikipedia.org/wiki/B%C3%A9lgica" title="Bélgica" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Bélgica</a>,&nbsp;<a href="https://es.wikipedia.org/wiki/Pa%C3%ADses_Bajos" title="Países Bajos" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Países Bajos</a>&nbsp;y parte de&nbsp;<a href="https://es.wikipedia.org/wiki/Alemania" title="Alemania" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Alemania</a>. Fue el primer general romano en penetrar en los inexplorados territorios de&nbsp;<a href="https://es.wikipedia.org/wiki/Britania" title="Britania" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Britania</a>&nbsp;y&nbsp;<a href="https://es.wikipedia.org/wiki/Germania_(regi%C3%B3n)" class="mw-redirect" title="Germania (región)" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Germania</a>.</p><p style="margin-top: 0.5em; margin-bottom: 0.5em;">Mientras César terminaba de organizar la estructura administrativa de la nueva provincia que había anexionado a la República, sus enemigos políticos trataban en Roma de despojarle de su ejército y cargo utilizando el Senado. César, a sabiendas de que si entraba en la capital sería juzgado y exiliado, intentó presentarse al consulado&nbsp;<i>in absentia</i>, a lo que los optimates se negaron. Este y otros factores le impulsaron a desafiar las órdenes senatoriales y protagonizar el famoso cruce del&nbsp;<a href="https://es.wikipedia.org/wiki/R%C3%ADo_Rubic%C3%B3n" title="Río Rubicón" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Rubicón</a>, momento en el que, al parecer, pronunció la inmortal frase&nbsp;<i><a href="https://es.wikipedia.org/wiki/Alea_iacta_est" title="Alea iacta est" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">alea iacta est</a></i>&nbsp;(«la suerte está echada»). Inició así una nueva&nbsp;<a href="https://es.wikipedia.org/wiki/Segunda_guerra_civil_de_la_Rep%C3%BAblica_romana" title="Segunda guerra civil de la República romana" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">guerra civil</a>, en la que se enfrentó a los&nbsp;<a href="https://es.wikipedia.org/wiki/Optimates" title="Optimates" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">optimates</a>, que estaban liderados por su antiguo aliado, Pompeyo. Sus victorias en las batallas de&nbsp;<a href="https://es.wikipedia.org/wiki/Batalla_de_Farsalia" title="Batalla de Farsalia" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Farsalia</a>,&nbsp;<a href="https://es.wikipedia.org/wiki/Batalla_de_Tapso" title="Batalla de Tapso" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Tapso</a>&nbsp;y&nbsp;<a href="https://es.wikipedia.org/wiki/Batalla_de_Munda" title="Batalla de Munda" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Munda</a>&nbsp;sobre los conservadores, le hicieron el amo de la República. El hecho de que estuviera en plena guerra civil no evitó que se enfrentara a&nbsp;<a href="https://es.wikipedia.org/wiki/Farnaces_II_del_Ponto" title="Farnaces II del Ponto" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Farnaces&nbsp;II</a>&nbsp;en&nbsp;<a href="https://es.wikipedia.org/wiki/Batalla_de_Zela_(47_a._C.)" title="Batalla de Zela (47 a. C.)" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Zela</a>&nbsp;y a los enemigos de&nbsp;<a href="https://es.wikipedia.org/wiki/Cleopatra" title="Cleopatra" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Cleopatra</a>&nbsp;en&nbsp;<a href="https://es.wikipedia.org/wiki/Alejandr%C3%ADa" title="Alejandría" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Alejandría</a>. A su regreso a Roma se hizo nombrar cónsul y dictador perpetuo, e inició una serie de reformas económicas, urbanísticas y administrativas.</p><p style="margin-top: 0.5em; margin-bottom: 0.5em;">A pesar de que bajo su gobierno la República experimentó un breve periodo de gran prosperidad, algunos senadores vieron a César como un&nbsp;<a href="https://es.wikipedia.org/wiki/Tiran%C3%ADa" title="Tiranía" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">tirano</a>&nbsp;que ambicionaba restaurar la&nbsp;<a href="https://es.wikipedia.org/wiki/Monarqu%C3%ADa_romana" title="Monarquía romana" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">monarquía</a>. Con el objetivo de eliminar la amenaza que suponía el dictador, un grupo de senadores formado por algunos de sus hombres de confianza como&nbsp;<a href="https://es.wikipedia.org/wiki/Marco_Junio_Bruto" title="Marco Junio Bruto" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Marco Junio Bruto</a>&nbsp;y&nbsp;<a href="https://es.wikipedia.org/wiki/Cayo_Casio_Longino" title="Cayo Casio Longino" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Cayo Casio Longino</a>&nbsp;y antiguos lugartenientes como&nbsp;<a href="https://es.wikipedia.org/wiki/Cayo_Trebonio" title="Cayo Trebonio" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Cayo Trebonio</a>&nbsp;y&nbsp;<a href="https://es.wikipedia.org/wiki/D%C3%A9cimo_Junio_Bruto_Albino" title="Décimo Junio Bruto Albino" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Décimo Junio Bruto Albino</a>&nbsp;urdieron una conspiración con el fin de eliminarlo. Dicho complot culminó cuando, en los&nbsp;<a href="https://es.wikipedia.org/wiki/Idus_de_marzo" title="Idus de marzo" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">idus de marzo</a>, los conspiradores asesinaron a César en el Senado. Su muerte provocó el estallido de un largo periodo de guerras, en la que los partidarios del régimen de César,&nbsp;<a href="https://es.wikipedia.org/wiki/Marco_Antonio" title="Marco Antonio" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Marco Antonio</a>,&nbsp;<a href="https://es.wikipedia.org/wiki/Octavio" class="mw-redirect" title="Octavio" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Octavio</a>&nbsp;y&nbsp;<a href="https://es.wikipedia.org/wiki/L%C3%A9pido" title="Lépido" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Lépido</a>, derrotaron en la doble&nbsp;<a href="https://es.wikipedia.org/wiki/Batalla_de_Filipos" title="Batalla de Filipos" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">batalla de Filipos</a>&nbsp;a sus asesinos, liderados por Bruto y Casio. Al término del conflicto, Octavio, Antonio y Lépido formaron el&nbsp;<a href="https://es.wikipedia.org/wiki/Segundo_Triunvirato_(Antigua_Roma)" title="Segundo Triunvirato (Antigua Roma)" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Segundo Triunvirato</a>&nbsp;y se repartieron los territorios de la República, aunque, una vez apartado Lépido, finalmente volverían a enfrentarse en&nbsp;<a href="https://es.wikipedia.org/wiki/Batalla_de_Accio" title="Batalla de Accio" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Accio</a>, donde Octavio, heredero de César, venció a Marco Antonio y se convirtió en el primer emperador romano,&nbsp;<a href="https://es.wikipedia.org/wiki/Augusto" title="Augusto" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Augusto</a>.</p><p style="margin-top: 0.5em; margin-bottom: 0.5em;">Al margen de su carrera política y militar, César destacó como&nbsp;<a href="https://es.wikipedia.org/wiki/Oratoria" title="Oratoria" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">orador</a>&nbsp;y&nbsp;<a href="https://es.wikipedia.org/wiki/Literatura" title="Literatura" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">escritor</a>. Redactó, al menos, un tratado de&nbsp;<a href="https://es.wikipedia.org/wiki/Astronom%C3%ADa" title="Astronomía" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">astronomía</a>, otro acerca de la&nbsp;<a href="https://es.wikipedia.org/wiki/Religi%C3%B3n_romana" class="mw-redirect" title="Religión romana" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">religión republicana romana</a>&nbsp;y un estudio sobre el&nbsp;<a href="https://es.wikipedia.org/wiki/Lat%C3%ADn" title="Latín" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">latín</a>, ninguno de los cuales ha sobrevivido hasta nuestros días. Las únicas obras que se conservan son sus&nbsp;<i><a href="https://es.wikipedia.org/wiki/De_bello_Gallico" title="De bello Gallico" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Comentarios de la guerra de las Galias</a></i>&nbsp;y sus&nbsp;<i><a href="https://es.wikipedia.org/wiki/De_bello_civili" title="De bello civili" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Comentarios de la guerra civil</a></i>. Se conoce el desarrollo de su carrera como militar y gran parte de su vida a través de sus propias obras y de los escritos de autores como&nbsp;<a href="https://es.wikipedia.org/wiki/Suetonio" title="Suetonio" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Suetonio</a>,&nbsp;<a href="https://es.wikipedia.org/wiki/Plutarco" title="Plutarco" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Plutarco</a>,&nbsp;<a href="https://es.wikipedia.org/wiki/Veleyo_Pat%C3%A9rculo" title="Veleyo Patérculo" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Veleyo Patérculo</a>&nbsp;o&nbsp;<a href="https://es.wikipedia.org/wiki/Eutropio" title="Eutropio" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Eutropio</a>.</p></div></div></div>	sdasdasdatitulo: julio
\.


--
-- TOC entry 3140 (class 0 OID 41549)
-- Dependencies: 209
-- Data for Name: discapacidad; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.discapacidad (iddiscapacidad, idcategoriadiscapacidad, discapacidad) FROM stdin;
66	2	Hematiti
68	2	Hemapi
\.


--
-- TOC entry 3142 (class 0 OID 41559)
-- Dependencies: 211
-- Data for Name: lugares; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.lugares (idlugar, idciudad, lugar, descripcion, coordendax, coordenday, etiqueta, estado) FROM stdin;
3	10	Centro Gerontogico	Centro de ayuda a personas adultas Mayores	-0.280000	-79.210000	null	t
4	10	Centro Gerontogico	Centro de ayuda a personas adultas Mayores	-0.280000	-79.210000	valor	t
5	24	asasa	aasdasd	-78.630000	-1.150000	null	t
6	24	asasa	aasdasd	-78.630000	-1.150000	null	t
7	24	asdasda	dadasdads	-78.605204	-1.160695	null	t
\.


--
-- TOC entry 3144 (class 0 OID 41572)
-- Dependencies: 213
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.pais (idpais, pais, codigo, estado) FROM stdin;
1	Ecuador	+593	t
\.


--
-- TOC entry 3146 (class 0 OID 41581)
-- Dependencies: 215
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.persona (idpersona, idciudad, nombre, apellido, genero, usuario, correo, clave, administrador, estado) FROM stdin;
1	1	Ariel	Fernández	Masculino	Arialdo	arialdo999@gmail.com	7c4a8d09ca3762af61e59520943dc26494f8941b	t	t
10	2	Francisco	Moreira	Masculino	fmoreirag	uzuamkifrancisco15@gmail.com	8d55979c77262068b1e49767af870419487b790e	t	t
11	2	Pedro	Moreira	Femenino 	sd	uzumakifrancisco15@gmail.com	7c4a8d09ca3762af61e59520943dc26494f8941b	t	t
12	2	Pedro	Moreira	Femenino 	sd	uzumakifrancisco15@gmail.com	7c4a8d09ca3762af61e59520943dc26494f8941b	t	t
\.


--
-- TOC entry 3148 (class 0 OID 41591)
-- Dependencies: 217
-- Data for Name: provincia; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.provincia (idprovincia, idpais, provincia, estado) FROM stdin;
1	1	Azuay	t
2	1	Bolívar	t
3	1	Cañar	t
4	1	Carchi	t
5	1	Cotopaxi	t
6	1	Chimborazo	t
7	1	El Oro	t
8	1	Esmeraldas	t
9	1	Guayas	t
10	1	Imbabura	t
11	1	Loja	t
12	1	Los Ríos	t
13	1	Manabí	t
14	1	Morona Santiago	t
15	1	Napo	t
16	1	Pastaza	t
17	1	Pichincha	t
18	1	Tungurahua	t
19	1	Zamora Chinchipe	t
20	1	Galápagos	t
21	1	Sucumbíos	t
22	1	Orellana	t
23	1	Santo Domingo de Los Tsáchilas	t
24	1	Santa Elena	t
25	1	Zonas No Delimitadas	t
\.


--
-- TOC entry 3150 (class 0 OID 41601)
-- Dependencies: 219
-- Data for Name: recurso; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.recurso (idrecurso, idcategoriarecurso, iddiscapacidad, recurso, descripcion, etiquetas, estado, ruta) FROM stdin;
5	1	66	Archivo	Archivo Prueba	No	t	C:\\Users\\Arialdo\\Documents\\NetBeansProjects\\Repositorio\\vinculacion\\build\\web\\\\Archivo.png
\.


--
-- TOC entry 3166 (class 0 OID 0)
-- Dependencies: 200
-- Name: categoriadiscapacidad_idcategoriadiscapacidad_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.categoriadiscapacidad_idcategoriadiscapacidad_seq', 7, true);


--
-- TOC entry 3167 (class 0 OID 0)
-- Dependencies: 202
-- Name: categoriarecurso_idcategoriarecurso_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.categoriarecurso_idcategoriarecurso_seq', 1, false);


--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 204
-- Name: ciudad_idciudad_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.ciudad_idciudad_seq', 3, true);


--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 206
-- Name: concepto_idconcepto_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.concepto_idconcepto_seq', 46, true);


--
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 208
-- Name: discapacidad_iddiscapacidad_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.discapacidad_iddiscapacidad_seq', 68, true);


--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 210
-- Name: lugares_idlugar_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.lugares_idlugar_seq', 7, true);


--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 212
-- Name: pais_idpais_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.pais_idpais_seq', 1, false);


--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 214
-- Name: persona_idpersona_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.persona_idpersona_seq', 12, true);


--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 216
-- Name: provincia_idprovincia_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.provincia_idprovincia_seq', 3, true);


--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 218
-- Name: recurso_idrecurso_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.recurso_idrecurso_seq', 5, true);


--
-- TOC entry 2947 (class 2606 OID 41513)
-- Name: categoriadiscapacidad pk_categoriadiscapacidad; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.categoriadiscapacidad
    ADD CONSTRAINT pk_categoriadiscapacidad PRIMARY KEY (idcategoriadiscapacidad);


--
-- TOC entry 2950 (class 2606 OID 41522)
-- Name: categoriarecurso pk_categoriarecurso; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.categoriarecurso
    ADD CONSTRAINT pk_categoriarecurso PRIMARY KEY (idcategoriarecurso);


--
-- TOC entry 2953 (class 2606 OID 41531)
-- Name: ciudad pk_ciudad; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT pk_ciudad PRIMARY KEY (idciudad);


--
-- TOC entry 2957 (class 2606 OID 41544)
-- Name: concepto pk_concepto; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.concepto
    ADD CONSTRAINT pk_concepto PRIMARY KEY (idconcepto);


--
-- TOC entry 2961 (class 2606 OID 41554)
-- Name: discapacidad pk_discapacidad; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.discapacidad
    ADD CONSTRAINT pk_discapacidad PRIMARY KEY (iddiscapacidad);


--
-- TOC entry 2965 (class 2606 OID 41567)
-- Name: lugares pk_lugares; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.lugares
    ADD CONSTRAINT pk_lugares PRIMARY KEY (idlugar);


--
-- TOC entry 2969 (class 2606 OID 41577)
-- Name: pais pk_pais; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pk_pais PRIMARY KEY (idpais);


--
-- TOC entry 2973 (class 2606 OID 41586)
-- Name: persona pk_persona; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT pk_persona PRIMARY KEY (idpersona);


--
-- TOC entry 2976 (class 2606 OID 41596)
-- Name: provincia pk_provincia; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT pk_provincia PRIMARY KEY (idprovincia);


--
-- TOC entry 2979 (class 2606 OID 41609)
-- Name: recurso pk_recurso; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT pk_recurso PRIMARY KEY (idrecurso);


--
-- TOC entry 2945 (class 1259 OID 41514)
-- Name: categoriadiscapacidad_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX categoriadiscapacidad_pk ON public.categoriadiscapacidad USING btree (idcategoriadiscapacidad);


--
-- TOC entry 2948 (class 1259 OID 41523)
-- Name: categoriarecurso_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX categoriarecurso_pk ON public.categoriarecurso USING btree (idcategoriarecurso);


--
-- TOC entry 2951 (class 1259 OID 41532)
-- Name: ciudad_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX ciudad_pk ON public.ciudad USING btree (idciudad);


--
-- TOC entry 2970 (class 1259 OID 41588)
-- Name: ciudad_tutor_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX ciudad_tutor_fk ON public.persona USING btree (idciudad);


--
-- TOC entry 2955 (class 1259 OID 41545)
-- Name: concepto_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX concepto_pk ON public.concepto USING btree (idconcepto);


--
-- TOC entry 2959 (class 1259 OID 41555)
-- Name: discapacidad_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX discapacidad_pk ON public.discapacidad USING btree (iddiscapacidad);


--
-- TOC entry 2963 (class 1259 OID 41568)
-- Name: lugares_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX lugares_pk ON public.lugares USING btree (idlugar);


--
-- TOC entry 2967 (class 1259 OID 41578)
-- Name: pais_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX pais_pk ON public.pais USING btree (idpais);


--
-- TOC entry 2974 (class 1259 OID 41598)
-- Name: pais_provincia_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX pais_provincia_fk ON public.provincia USING btree (idpais);


--
-- TOC entry 2971 (class 1259 OID 41587)
-- Name: persona_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX persona_pk ON public.persona USING btree (idpersona);


--
-- TOC entry 2954 (class 1259 OID 41533)
-- Name: provincia_ciudad_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX provincia_ciudad_fk ON public.ciudad USING btree (idprovincia);


--
-- TOC entry 2977 (class 1259 OID 41597)
-- Name: provincia_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX provincia_pk ON public.provincia USING btree (idprovincia);


--
-- TOC entry 2980 (class 1259 OID 41610)
-- Name: recurso_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX recurso_pk ON public.recurso USING btree (idrecurso);


--
-- TOC entry 2966 (class 1259 OID 41569)
-- Name: relationship_4_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX relationship_4_fk ON public.lugares USING btree (idciudad);


--
-- TOC entry 2981 (class 1259 OID 41611)
-- Name: relationship_5_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX relationship_5_fk ON public.recurso USING btree (idcategoriarecurso);


--
-- TOC entry 2982 (class 1259 OID 41612)
-- Name: relationship_6_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX relationship_6_fk ON public.recurso USING btree (iddiscapacidad);


--
-- TOC entry 2958 (class 1259 OID 41546)
-- Name: relationship_7_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX relationship_7_fk ON public.concepto USING btree (iddiscapacidad);


--
-- TOC entry 2962 (class 1259 OID 41556)
-- Name: relationship_8_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX relationship_8_fk ON public.discapacidad USING btree (idcategoriadiscapacidad);


--
-- TOC entry 2983 (class 2606 OID 41613)
-- Name: ciudad fk_ci_provincia_pr; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT fk_ci_provincia_pr FOREIGN KEY (idprovincia) REFERENCES public.provincia(idprovincia) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2984 (class 2606 OID 41618)
-- Name: concepto fk_co_relations_di; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.concepto
    ADD CONSTRAINT fk_co_relations_di FOREIGN KEY (iddiscapacidad) REFERENCES public.discapacidad(iddiscapacidad) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2985 (class 2606 OID 41623)
-- Name: discapacidad fk_di_relations_ca; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.discapacidad
    ADD CONSTRAINT fk_di_relations_ca FOREIGN KEY (idcategoriadiscapacidad) REFERENCES public.categoriadiscapacidad(idcategoriadiscapacidad) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2986 (class 2606 OID 41628)
-- Name: lugares fk_lu_relations_ci; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.lugares
    ADD CONSTRAINT fk_lu_relations_ci FOREIGN KEY (idciudad) REFERENCES public.ciudad(idciudad) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2987 (class 2606 OID 41633)
-- Name: persona fk_pe_ciudad_tu_ci; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT fk_pe_ciudad_tu_ci FOREIGN KEY (idciudad) REFERENCES public.ciudad(idciudad) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2988 (class 2606 OID 41638)
-- Name: provincia fk_pr_pais_prov_pa; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT fk_pr_pais_prov_pa FOREIGN KEY (idpais) REFERENCES public.pais(idpais) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2989 (class 2606 OID 41643)
-- Name: recurso fk_re_relations_ca; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT fk_re_relations_ca FOREIGN KEY (idcategoriarecurso) REFERENCES public.categoriarecurso(idcategoriarecurso) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2990 (class 2606 OID 41648)
-- Name: recurso fk_re_relations_di; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT fk_re_relations_di FOREIGN KEY (iddiscapacidad) REFERENCES public.discapacidad(iddiscapacidad) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2022-01-28 01:33:05

--
-- PostgreSQL database dump complete
--

