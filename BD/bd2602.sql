--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4 (Debian 13.4-1.pgdg100+1)
-- Dumped by pg_dump version 14.1

-- Started on 2022-02-26 04:10:39

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
-- TOC entry 249 (class 1255 OID 43056)
-- Name: cambiarclave(integer, text); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.cambiarclave(varidpersona integer, varclave text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.persona
	SET clave = varclave
	WHERE idpersona=varidpersona;
END;
$$;


ALTER FUNCTION public.cambiarclave(varidpersona integer, varclave text) OWNER TO appdist;

--
-- TOC entry 254 (class 1255 OID 41720)
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
-- TOC entry 257 (class 1255 OID 41728)
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
-- TOC entry 270 (class 1255 OID 41729)
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
-- TOC entry 271 (class 1255 OID 41731)
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
-- TOC entry 272 (class 1255 OID 41732)
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
-- TOC entry 253 (class 1255 OID 41689)
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
-- TOC entry 269 (class 1255 OID 41727)
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
-- TOC entry 278 (class 1255 OID 43055)
-- Name: editarpersona(integer, integer, character varying, character varying, character varying, character varying, character varying, boolean, boolean); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.editarpersona(varidpersona integer, varidciudad integer, varnombre character varying, varapellido character varying, vargenero character varying, varusuario character varying, varcorreo character varying, varadmin boolean, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.persona
	SET idciudad=varidciudad, nombre=varnombre, apellido=varapellido, genero=vargenero, usuario=varusuario, correo=varcorreo, administrador=varadmin, estado=varestado
	WHERE idpersona=varidpersona;
END;
$$;


ALTER FUNCTION public.editarpersona(varidpersona integer, varidciudad integer, varnombre character varying, varapellido character varying, vargenero character varying, varusuario character varying, varcorreo character varying, varadmin boolean, varestado boolean) OWNER TO appdist;

--
-- TOC entry 273 (class 1255 OID 41733)
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
-- TOC entry 274 (class 1255 OID 41734)
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
-- TOC entry 232 (class 1255 OID 41653)
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
-- TOC entry 250 (class 1255 OID 43057)
-- Name: eliminarcategoriarecurso(integer); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.eliminarcategoriarecurso(varidcategoriarecurso integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM CategoriaRecurso 
	WHERE varidcategoriarecurso = idcategoriarecurso;
END;
$$;


ALTER FUNCTION public.eliminarcategoriarecurso(varidcategoriarecurso integer) OWNER TO appdist;

--
-- TOC entry 233 (class 1255 OID 41654)
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
-- TOC entry 234 (class 1255 OID 41655)
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
-- TOC entry 235 (class 1255 OID 41656)
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
-- TOC entry 236 (class 1255 OID 41657)
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
-- TOC entry 237 (class 1255 OID 41658)
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
-- TOC entry 238 (class 1255 OID 41659)
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
-- TOC entry 239 (class 1255 OID 41660)
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
-- TOC entry 240 (class 1255 OID 41661)
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
-- TOC entry 241 (class 1255 OID 41662)
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
-- TOC entry 242 (class 1255 OID 41663)
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
-- TOC entry 243 (class 1255 OID 41664)
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
-- TOC entry 244 (class 1255 OID 41665)
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
-- TOC entry 245 (class 1255 OID 41666)
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
-- TOC entry 246 (class 1255 OID 41667)
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
-- TOC entry 247 (class 1255 OID 41668)
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
-- TOC entry 256 (class 1255 OID 41690)
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
-- TOC entry 248 (class 1255 OID 41669)
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
-- TOC entry 276 (class 1255 OID 41670)
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
-- TOC entry 255 (class 1255 OID 42046)
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
-- TOC entry 277 (class 1255 OID 41685)
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
-- TOC entry 251 (class 1255 OID 41673)
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
-- TOC entry 275 (class 1255 OID 41674)
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
-- TOC entry 252 (class 1255 OID 41675)
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
-- TOC entry 279 (class 1255 OID 43096)
-- Name: insertarrecurso(integer, integer, character varying, text, text, text, boolean); Type: FUNCTION; Schema: public; Owner: appdist
--

CREATE FUNCTION public.insertarrecurso(varcategoriarecurso integer, variddiscapacidad integer, varrecurso character varying, vardescripcion text, varetiquetas text, varruta text, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO recurso (idcategoriarecurso, iddiscapacidad, recurso, descripcion, etiquetas, estado, ruta) 
	VALUES (varcategoriarecurso, variddiscapacidad, varrecurso, vardescripcion, varetiquetas, varestado, varruta);
END;
$$;


ALTER FUNCTION public.insertarrecurso(varcategoriarecurso integer, variddiscapacidad integer, varrecurso character varying, vardescripcion text, varetiquetas text, varruta text, varestado boolean) OWNER TO appdist;

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
-- TOC entry 3168 (class 0 OID 0)
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
-- TOC entry 3169 (class 0 OID 0)
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
-- TOC entry 3170 (class 0 OID 0)
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
-- TOC entry 3171 (class 0 OID 0)
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
    discapacidad character varying(50) NOT NULL
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
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 208
-- Name: discapacidad_iddiscapacidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appdist
--

ALTER SEQUENCE public.discapacidad_iddiscapacidad_seq OWNED BY public.discapacidad.iddiscapacidad;


--
-- TOC entry 229 (class 1259 OID 43243)
-- Name: discapacidadcantidad; Type: VIEW; Schema: public; Owner: appdist
--

CREATE VIEW public.discapacidadcantidad AS
SELECT
    NULL::integer AS iddiscapacidad,
    NULL::character varying(50) AS discapacidad,
    NULL::bigint AS recursos,
    NULL::bigint AS conceptos;


ALTER TABLE public.discapacidadcantidad OWNER TO appdist;

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
-- TOC entry 3173 (class 0 OID 0)
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
-- TOC entry 3174 (class 0 OID 0)
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
-- TOC entry 3175 (class 0 OID 0)
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
-- TOC entry 3176 (class 0 OID 0)
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
    recurso text NOT NULL,
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
-- TOC entry 3177 (class 0 OID 0)
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
-- TOC entry 228 (class 1259 OID 42213)
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
-- TOC entry 227 (class 1259 OID 42209)
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
-- TOC entry 230 (class 1259 OID 43247)
-- Name: vwdiscapacidadcantidad; Type: VIEW; Schema: public; Owner: appdist
--

CREATE VIEW public.vwdiscapacidadcantidad AS
SELECT
    NULL::integer AS iddiscapacidad,
    NULL::character varying(50) AS discapacidad,
    NULL::bigint AS recursos,
    NULL::bigint AS conceptos;


ALTER TABLE public.vwdiscapacidadcantidad OWNER TO appdist;

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
-- TOC entry 231 (class 1259 OID 43253)
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
-- TOC entry 2945 (class 2604 OID 41511)
-- Name: categoriadiscapacidad idcategoriadiscapacidad; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.categoriadiscapacidad ALTER COLUMN idcategoriadiscapacidad SET DEFAULT nextval('public.categoriadiscapacidad_idcategoriadiscapacidad_seq'::regclass);


--
-- TOC entry 2946 (class 2604 OID 41520)
-- Name: categoriarecurso idcategoriarecurso; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.categoriarecurso ALTER COLUMN idcategoriarecurso SET DEFAULT nextval('public.categoriarecurso_idcategoriarecurso_seq'::regclass);


--
-- TOC entry 2947 (class 2604 OID 41529)
-- Name: ciudad idciudad; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.ciudad ALTER COLUMN idciudad SET DEFAULT nextval('public.ciudad_idciudad_seq'::regclass);


--
-- TOC entry 2948 (class 2604 OID 41539)
-- Name: concepto idconcepto; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.concepto ALTER COLUMN idconcepto SET DEFAULT nextval('public.concepto_idconcepto_seq'::regclass);


--
-- TOC entry 2949 (class 2604 OID 41552)
-- Name: discapacidad iddiscapacidad; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.discapacidad ALTER COLUMN iddiscapacidad SET DEFAULT nextval('public.discapacidad_iddiscapacidad_seq'::regclass);


--
-- TOC entry 2950 (class 2604 OID 41562)
-- Name: lugares idlugar; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.lugares ALTER COLUMN idlugar SET DEFAULT nextval('public.lugares_idlugar_seq'::regclass);


--
-- TOC entry 2951 (class 2604 OID 41575)
-- Name: pais idpais; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.pais ALTER COLUMN idpais SET DEFAULT nextval('public.pais_idpais_seq'::regclass);


--
-- TOC entry 2952 (class 2604 OID 41584)
-- Name: persona idpersona; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.persona ALTER COLUMN idpersona SET DEFAULT nextval('public.persona_idpersona_seq'::regclass);


--
-- TOC entry 2953 (class 2604 OID 41594)
-- Name: provincia idprovincia; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.provincia ALTER COLUMN idprovincia SET DEFAULT nextval('public.provincia_idprovincia_seq'::regclass);


--
-- TOC entry 2954 (class 2604 OID 41604)
-- Name: recurso idrecurso; Type: DEFAULT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.recurso ALTER COLUMN idrecurso SET DEFAULT nextval('public.recurso_idrecurso_seq'::regclass);


--
-- TOC entry 3144 (class 0 OID 41508)
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
-- TOC entry 3146 (class 0 OID 41517)
-- Dependencies: 203
-- Data for Name: categoriarecurso; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.categoriarecurso (idcategoriarecurso, categoriarecurso) FROM stdin;
1	Archivos
2	Videos
3	Imagenes
4	Juegos
5	PDF
6	Audio
7	Musica
\.


--
-- TOC entry 3148 (class 0 OID 41526)
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
-- TOC entry 3150 (class 0 OID 41536)
-- Dependencies: 207
-- Data for Name: concepto; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.concepto (idconcepto, iddiscapacidad, descripcion, etiquetas) FROM stdin;
64	75	<h1 id="firstHeading" class="firstHeading mw-first-heading" style="color: rgb(0, 0, 0); margin-top: 0px; margin-bottom: 0.25em; padding: 0px; overflow: visible; border-bottom: 1px solid rgb(162, 169, 177); font-size: 1.8em; font-family: &quot;Linux Libertine&quot;, Georgia, Times, serif; line-height: 1.3;">Sordera</h1><div id="bodyContent" class="vector-body" style="font-size: calc(0.875em); line-height: 1.6; position: relative; z-index: 0; color: rgb(32, 33, 34); font-family: sans-serif;"><div id="contentSub" style="font-size: 11.76px; line-height: 1.2em; margin: 0px 0px 1.4em 1em; color: rgb(84, 89, 93); width: auto;"></div><div id="contentSub2" style="font-size: 11.76px; line-height: 1.2em; margin: 0px 0px 1.4em 1em; color: rgb(84, 89, 93); width: auto;"></div><div id="jump-to-nav"></div><a class="mw-jump-link" href="https://es.wikipedia.org/wiki/Espina_b%C3%ADfida#mw-head" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; display: block; clip: rect(1px, 1px, 1px, 1px); width: 1px; height: 1px; margin: -1px; border: 0px; padding: 0px; overflow: hidden; position: absolute !important;">Ir a la navegación</a><a class="mw-jump-link" href="https://es.wikipedia.org/wiki/Espina_b%C3%ADfida#searchInput" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; display: block; clip: rect(1px, 1px, 1px, 1px); width: 1px; height: 1px; margin: -1px; border: 0px; padding: 0px; overflow: hidden; position: absolute !important;">Ir a la búsqueda</a><div id="mw-content-text" class="mw-body-content mw-content-ltr" lang="es" dir="ltr" style="direction: ltr;"><div class="mw-parser-output"><table class="infobox" style="font-size: 12.6px; border: 1px solid rgb(180, 187, 200); background-color: rgb(249, 249, 249); color: rgb(0, 0, 0); margin: 0.5em 0px 0.7em 1.2em; padding: 0.23em; clear: right; float: right; line-height: 1.4em; width: 22.7em;"><tbody><tr><th colspan="3" class="cabecera medicina" style="vertical-align: middle; background: url(&quot;//upload.wikimedia.org/wikipedia/commons/2/23/Picto_infobox_med.png&quot;) right top no-repeat rgb(220, 220, 220); font-size: 17.64px; font-weight: bolder; height: 45px; line-height: 1.2em; text-align: center;">Sordera</th></tr><tr><td colspan="3" style="vertical-align: top; text-align: center;"><img src="data:image/jpeg;base64,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" alt="Día Internacional de la Sordera: ¿Qué es la enfermedad hipoacusia?"><br></td></tr><tr><th scope="row" style="vertical-align: top;"><br></th><td colspan="2" style="vertical-align: top;"><br></td></tr></tbody></table><p style="text-align: justify; margin-top: 0.5em; margin-bottom: 0.5em;"><span style="font-weight: bold;"><span style="font-size: 14px;">La&nbsp;</span><span style="font-size: 14px;">sordera</span><span style="font-size: 14px;">&nbsp;es la dificultad o la imposibilidad de usar el&nbsp;</span>sentido<span style="font-size: 14px;">&nbsp;del&nbsp;</span>oído<span style="font-size: 14px;">&nbsp;debido a una pérdida de la capacidad auditiva parcial (</span><span style="font-size: 14px;">hipoacusia</span><span style="font-size: 14px;">) o total (</span><span style="font-size: 14px;">cofosis</span><span style="font-size: 14px;">), y unilateral o bilateral. Así pues, una persona sorda será incapaz o tendrá problemas para oír. Esta puede ser un rasgo hereditario o puede ser consecuencia de una enfermedad,&nbsp;</span><span style="font-size: 14px;">exposición a largo plazo al ruido,</span><span style="font-size: 14px;">&nbsp;o medicamentos</span><span style="font-size: 14px;">&nbsp;agresivos para el nervio auditivo.</span><br></span></p><p style="text-align: justify; margin-top: 0.5em; margin-bottom: 0.5em;"><span style="font-size: 14px;"><br></span></p><h2 style="color: rgb(0, 0, 0); margin: 1em 0px 0.25em; padding: 0px; overflow: hidden; border-bottom: 1px solid rgb(162, 169, 177); font-size: 1.5em; font-family: &quot;Linux Libertine&quot;, Georgia, Times, serif; line-height: 1.3;"><span class="mw-headline" id="Tipos_de_sordera">Tipos de sordera</span></h2><div><span class="mw-headline"><br></span></div><ul style="list-style-image: url(&quot;/w/skins/Vector/resources/common/images/bullet-icon.svg?d4515&quot;); margin: 0.3em 0px 0px 1.6em; padding: 0px; font-size: 14px;"><li style="margin-bottom: 0.1em;">Sordera parcial: Se manifiesta cuando la persona tiene una leve capacidad auditiva (hipoacusia) y pueden usar un aparato auditivo para que ésta mejore, pero no se ven obligados a hacerlo.</li><li style="margin-bottom: 0.1em;">Sordera total o completa: Se manifiesta cuando la persona afectada no tiene capacidad para oír absolutamente nada. En este caso se puede llegar a utilizar el implante coclear,​ aunque dependerá de la particularidad de cada persona.</li></ul><p style="margin-top: 0.5em; margin-bottom: 0.5em; font-size: 14px;">La sordera también se da por desgaste de los oídos; esto explica por qué los adultos no pueden oír algunas frecuencias que personas de menor edad sí pueden.</p></div></div></div>	Hipoacusia, Sorderatitulo: CONCEPTO DE HIPOACUSIA
54	77	<h1 id="firstHeading" class="firstHeading mw-first-heading" style="color: rgb(0, 0, 0); margin-top: 0px; margin-bottom: 0.25em; padding: 0px; overflow: visible; border-bottom: 1px solid rgb(162, 169, 177); font-size: 1.8em; font-family: &quot;Linux Libertine&quot;, Georgia, Times, serif; line-height: 1.3;">Sordoceguera</h1><div id="bodyContent" class="vector-body" style="font-size: calc(0.875em); line-height: 1.6; position: relative; z-index: 0; color: rgb(32, 33, 34); font-family: sans-serif;"><div id="contentSub" style="font-size: 11.76px; line-height: 1.2em; margin: 0px 0px 1.4em 1em; color: rgb(84, 89, 93); width: auto;"></div><div id="contentSub2" style="font-size: 11.76px; line-height: 1.2em; margin: 0px 0px 1.4em 1em; color: rgb(84, 89, 93); width: auto;"></div><div id="jump-to-nav"></div><a class="mw-jump-link" href="https://es.wikipedia.org/wiki/Espina_b%C3%ADfida#mw-head" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; display: block; clip: rect(1px, 1px, 1px, 1px); width: 1px; height: 1px; margin: -1px; border: 0px; padding: 0px; overflow: hidden; position: absolute !important;">Ir a la navegación</a><a class="mw-jump-link" href="https://es.wikipedia.org/wiki/Espina_b%C3%ADfida#searchInput" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; display: block; clip: rect(1px, 1px, 1px, 1px); width: 1px; height: 1px; margin: -1px; border: 0px; padding: 0px; overflow: hidden; position: absolute !important;">Ir a la búsqueda</a><div id="mw-content-text" class="mw-body-content mw-content-ltr" lang="es" dir="ltr" style="direction: ltr;"><div class="mw-parser-output"><table class="infobox" style="font-size: 12.6px; border: 1px solid rgb(180, 187, 200); background-color: rgb(249, 249, 249); color: rgb(0, 0, 0); margin: 0.5em 0px 0.7em 1.2em; padding: 0.23em; clear: right; float: right; line-height: 1.4em; width: 22.7em;"><tbody><tr><th colspan="3" class="cabecera medicina" style="vertical-align: middle; background: url(&quot;//upload.wikimedia.org/wikipedia/commons/2/23/Picto_infobox_med.png&quot;) right top no-repeat rgb(220, 220, 220); font-size: 17.64px; font-weight: bolder; height: 45px; line-height: 1.2em; text-align: center;">Sordoceguera</th></tr><tr><td colspan="3" style="vertical-align: top; text-align: center;"><img src="https://i0.wp.com/periodistas-es.com/wp-content/uploads/sordoceguera.gif?resize=350%2C298" alt="App GoAll para personas sordociegas | Periodistas en Español"><br></td></tr><tr><th scope="row" style="vertical-align: top;"><br></th><td colspan="2" style="vertical-align: top;"><br></td></tr></tbody></table><p style="text-align: justify; margin-top: 0.5em; margin-bottom: 0.5em; font-size: 14px;">La&nbsp;<b>sordoceguera</b>&nbsp;es una única discapacidad que combina dos deficiencias: la&nbsp;deficiencia visual&nbsp;y la&nbsp;deficiencia auditiva.</p><p style="text-align: justify; margin-top: 0.5em; margin-bottom: 0.5em; font-size: 14px;">La escuela de Perkins for blind de Estados Unidos fue la primera que se dedicó a la educación de niños sordociegos, la cual y expresa:</p><p style="text-align: justify; margin-top: 0.5em; margin-bottom: 0.5em; font-size: 14px;">“El término sordoceguera se refiere a aquel que representa deficiencias visuales y auditivas sin consideración del grado de deficiencia y cuya combinación provoca unos problemas de comunicación y desarrollo educativos tales que no pueden encajar adecuadamente en los programas de educación especial para déficit auditivo o visual”.</p><p style="text-align: justify; margin-top: 0.5em; margin-bottom: 0.5em; font-size: 14px;"><br></p><h2 style="color: rgb(0, 0, 0); margin: 1em 0px 0.25em; padding: 0px; overflow: hidden; border-bottom: 1px solid rgb(162, 169, 177); font-size: 1.5em; font-family: &quot;Linux Libertine&quot;, Georgia, Times, serif; line-height: 1.3;"><span class="mw-headline" id="Tratamiento">Tratamiento</span></h2><p style="text-align: justify; margin-top: 0.5em; margin-bottom: 0.5em; font-size: 14px;">La sordoceguera es una discapacidad y no una&nbsp;enfermedad. Por lo tanto, no se puede prescribir tratamiento. Enseguida se alistarán una serie de consejos básicos que pueden ayudar a superar las limitaciones de ambos sentidos.<br></p><p style="text-align: justify; margin-top: 0.5em; margin-bottom: 0.5em; font-size: 14px;">Para poca capacidad de visión se puede emplear ayudas auxiliares para leer, como por ejemplo pantallas más grandes o lupas de agrandamiento. Para poca capacidad auditiva se pueden emplear&nbsp;ayudas de audición. Una pequeña cantidad de infantes sordociegos pueden ser atendidos con un&nbsp;implante coclear, esto es, con&nbsp;audífonos.</p><p style="text-align: justify; margin-top: 0.5em; margin-bottom: 0.5em; font-size: 14px;">Esto es posible cuando el&nbsp;nervio auditivo&nbsp;tiene buena capacidad de funcionamiento. Pero hasta hoy no hay conocimientos seguros sobre la utilidad de este método&nbsp;quirúrgico.</p></div></div></div>	Sordocegueratitulo: CONCEPTO DE SORDOCEGUERA
56	75	<h1 id="firstHeading" class="firstHeading mw-first-heading" style="color: rgb(0, 0, 0); margin-top: 0px; margin-bottom: 0.25em; padding: 0px; overflow: visible; border-bottom: 1px solid rgb(162, 169, 177); font-size: 1.8em; font-family: &quot;Linux Libertine&quot;, Georgia, Times, serif; line-height: 1.3;">Sordera</h1><div id="bodyContent" class="vector-body" style="font-size: calc(0.875em); line-height: 1.6; position: relative; z-index: 0; color: rgb(32, 33, 34); font-family: sans-serif;"><div id="contentSub" style="font-size: 11.76px; line-height: 1.2em; margin: 0px 0px 1.4em 1em; color: rgb(84, 89, 93); width: auto;"></div><div id="contentSub2" style="font-size: 11.76px; line-height: 1.2em; margin: 0px 0px 1.4em 1em; color: rgb(84, 89, 93); width: auto;"></div><div id="jump-to-nav"></div><a class="mw-jump-link" href="https://es.wikipedia.org/wiki/Espina_b%C3%ADfida#mw-head" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; display: block; clip: rect(1px, 1px, 1px, 1px); width: 1px; height: 1px; margin: -1px; border: 0px; padding: 0px; overflow: hidden; position: absolute !important;">Ir a la navegación</a><a class="mw-jump-link" href="https://es.wikipedia.org/wiki/Espina_b%C3%ADfida#searchInput" style="color: rgb(6, 69, 173); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; display: block; clip: rect(1px, 1px, 1px, 1px); width: 1px; height: 1px; margin: -1px; border: 0px; padding: 0px; overflow: hidden; position: absolute !important;">Ir a la búsqueda</a><div id="mw-content-text" class="mw-body-content mw-content-ltr" lang="es" dir="ltr" style="direction: ltr;"><div class="mw-parser-output"><table class="infobox" style="font-size: 12.6px; border: 1px solid rgb(180, 187, 200); background-color: rgb(249, 249, 249); color: rgb(0, 0, 0); margin: 0.5em 0px 0.7em 1.2em; padding: 0.23em; clear: right; float: right; line-height: 1.4em; width: 22.7em;"><tbody><tr><th colspan="3" class="cabecera medicina" style="vertical-align: middle; background: url(&quot;//upload.wikimedia.org/wikipedia/commons/2/23/Picto_infobox_med.png&quot;) right top no-repeat rgb(220, 220, 220); font-size: 17.64px; font-weight: bolder; height: 45px; line-height: 1.2em; text-align: center;">Sordera</th></tr><tr><td colspan="3" style="vertical-align: top; text-align: center;"><img src="data:image/jpeg;base64,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" alt="Día Internacional de la Sordera: ¿Qué es la enfermedad hipoacusia?"><br></td></tr><tr><th scope="row" style="vertical-align: top;"><br></th><td colspan="2" style="vertical-align: top;"><br></td></tr></tbody></table><p style="text-align: justify; margin-top: 0.5em; margin-bottom: 0.5em;"><span style="font-size: 14px;">La&nbsp;</span><b style="font-size: 14px;">sordera</b><span style="font-size: 14px;">&nbsp;es la dificultad o la imposibilidad de usar el&nbsp;</span>sentido<span style="font-size: 14px;">&nbsp;del&nbsp;</span>oído<span style="font-size: 14px;">&nbsp;debido a una pérdida de la capacidad auditiva parcial (</span><b style="font-size: 14px;">hipoacusia</b><span style="font-size: 14px;">) o total (</span><b style="font-size: 14px;">cofosis</b><span style="font-size: 14px;">), y unilateral o bilateral. Así pues, una persona sorda será incapaz o tendrá problemas para oír. Esta puede ser un rasgo hereditario o puede ser consecuencia de una enfermedad,&nbsp;</span><span style="font-size: 14px;">exposición a largo plazo al ruido,</span><span style="font-size: 14px;">&nbsp;o medicamentos</span><span style="font-size: 14px;">&nbsp;agresivos para el nervio auditivo.</span><br></p><p style="text-align: justify; margin-top: 0.5em; margin-bottom: 0.5em;"><span style="font-size: 14px;"><br></span></p><h2 style="color: rgb(0, 0, 0); margin: 1em 0px 0.25em; padding: 0px; overflow: hidden; border-bottom: 1px solid rgb(162, 169, 177); font-size: 1.5em; font-family: &quot;Linux Libertine&quot;, Georgia, Times, serif; line-height: 1.3;"><span class="mw-headline" id="Tipos_de_sordera">Tipos de sordera</span></h2><div><span class="mw-headline"><br></span></div><ul style="list-style-image: url(&quot;/w/skins/Vector/resources/common/images/bullet-icon.svg?d4515&quot;); margin: 0.3em 0px 0px 1.6em; padding: 0px; font-size: 14px;"><li style="margin-bottom: 0.1em;">Sordera parcial: Se manifiesta cuando la persona tiene una leve capacidad auditiva (hipoacusia) y pueden usar un aparato auditivo para que ésta mejore, pero no se ven obligados a hacerlo.</li><li style="margin-bottom: 0.1em;">Sordera total o completa: Se manifiesta cuando la persona afectada no tiene capacidad para oír absolutamente nada. En este caso se puede llegar a utilizar el implante coclear,​ aunque dependerá de la particularidad de cada persona.</li></ul><p style="margin-top: 0.5em; margin-bottom: 0.5em; font-size: 14px;">La sordera también se da por desgaste de los oídos; esto explica por qué los adultos no pueden oír algunas frecuencias que personas de menor edad sí pueden.</p></div></div></div>	Hipoacusia, Sorderatitulo: CONCEPTO DE HIPOACUSIA
\.


--
-- TOC entry 3152 (class 0 OID 41549)
-- Dependencies: 209
-- Data for Name: discapacidad; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.discapacidad (iddiscapacidad, idcategoriadiscapacidad, discapacidad) FROM stdin;
69	2	Distrofia muscular
70	2	Lesión en la médula espinal
71	2	Espina bífida
72	2	Esclerosis múltiple
73	2	Parálisis cerebral
74	3	Epilepsia
75	1	Hipoacusia
77	4	Sordoceguera
80	3	Síndrome de down
81	2	sdsdd
82	2	xxxxx
83	3	Distrofia muscular 1
66	2	Hematite
85	2	ds
\.


--
-- TOC entry 3154 (class 0 OID 41559)
-- Dependencies: 211
-- Data for Name: lugares; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.lugares (idlugar, idciudad, lugar, descripcion, coordendax, coordenday, etiqueta, estado) FROM stdin;
8	100	PATRONATO DE ACCIÓN SOCIAL DEL GOBIERNO PROVINCIAL DE IMBABURA	Institución que promueve el derecho a la salud y desarrollo social	0.351946	-78.117184	PATRONATOS	t
9	178	INSTITUTO FISCAL DE DISCAPACIDAD MOTRIZ	Es un centro educativo de Educación Especial y sostenimiento Fiscal, con jurisdicción Hispana.	-0.277468	-78.548145	INSTITUTOS	t
10	178	FEDERACIÓN NACIONAL DE CIEGOS DEL ECUADOR	Es una organización de derecho jurídico, sin fines de lucro, creada para servir a las personas con discapacidad visual	-0.173198	-78.488371	ORGANIZACIONES	t
11	178	FUNDACIÓN AMIGOS BENEFACTORES DE ENFERMOS INCURABLES	Brinda servicios médicos especializados y atención integral con calidad, a niños, adultos y adultos mayores, con enfermedades crónicas.	-0.174232	-78.482727	FUNDACIONES	t
12	178	FUNDACIÓN CAMPAMENTO CRISTIANO ESPERANZA	Proveer con excelencia y amor cristiano servicios de salud, habilitación, rehabilitación, educación especial para niños, adolescentes, jóvenes y adultos con discapacidad severa.	-0.092668	-78.475557	FUNDACIONES	t
13	178	FUNDACIÓN EINA	Es una fundación de enseñanza individualizada para niños, niñas y adolescentes sin fines de lucro, nuestra razón de ser es brindar atención personalizada a niños, niñas y jóvenes con discapacidad intelectual.	-0.068239	-78.459351	FUNDACIONES	t
14	178	FUNDACIÓN EL TRIÁNGULO	Es una ONG sin fines de lucro, trabaja ofreciendo oportunidades de formación educativa, vocacional y de inclusión laboral a personas con discapacidad intelectual.	-0.105961	-78.488635	FUNDACIONES	t
16	207	CENTRO DE DESARROLLO INTEGRAL PARA PERSONAS CON DISCAPACIDAD LAGO AGRIO	El centro diurno atiende ocho horas diarias, de lunes a viernes; y prioriza la atención a personas con discapacidad.	0.091055	-76.887999	FUNDACIONES	t
17	106	FUNDACIÓN CARITAS FELICES	Organización sin fines de lucro. Con una espiritualidad integrada en la vida, en comunión y fidelidad al evangelio de Jesús y a su opción por los más vulnerables.	-4.014178	-79.211172	FUNDACIONES	t
18	93	CENTRO DIURNO DE DESARROLLO INTEGRAL PARA PERSONAS CON DISCAPACIDAD	El Centro Diurno atiende ocho horas diarias, de lunes a viernes; y prioriza la atención a personas con discapacidad.	-2.631947	-80.399327	FUNDACIONES	t
19	106	CENTRO MEDICO DE ESPECIALIDADES IESS NUEVA LOJA	Administración pública y defensa; planes de seguridad social de afiliación obligatoria	0.093421	-76.901588	CENTROS MÉDICOS	t
20	100	PATRONATO PROVINCIAL DE IMBABURA	Institución que promueve el derecho a la salud y desarrollo social a fin de mejorar las condiciones de vida de la población.	0.351930	-78.117296	PATRONATOS	t
21	16	INSTITUTO DE PARÁLISIS CEREBRAL 	El IPCA ofrece atención diurna en rehabilitación médico terapéutica y educación especial para niños y jóvenes con Parálisis Cerebral y Pluridiscapacidad	-2.909022	-79.031456	FUNDACIONES	t
15	1	ESCUELA ESPECIAL SAN JOSÉ DE CALASANZ (XYZ)	Es un centro que ofrece talleres artesanales y educación básica a personas sin y con discapacidad.	-2.916809	-79.006324	ESCUELAS	t
23	106	CENTRO DE ACCIÓN SOCIAL MATILDE HIDALGO	Centro de acción social Matilde Hidalgo dedicada a actividades de asistencia social.	-3.996002	-79.202696	FUNDACIONES	t
24	178	FUNDACIÓN TIERRA NUEVA	Es una organización sin fines de lucro, creada para dar servicios de SALUD, EDUCACIÓN y PROTECCIÓN SOCIAL a la población.	-0.284249	-78.550251	FUNDACIONES	t
28	19	MENSAJEROS DE LA PAZ 2	asdasdas	-1.150740	-78.641338	ORGANIZACIONES	t
29	18	asd	asd	-1.158807	-78.603058	INSTITUTOS	t
31	17	xyz0ND-MWKMPEOK	DWREFESMK No encontramos el jsp para poder corregir la falta de de Categoría 	-1.202640	-78.591385	ESCUELAS	t
33	17	xyz0ND-MWKMPEOK	DWREFESMK No encontramos el jsp para poder corregir la falta de de Categoría 	-1.202640	-78.591385	ESCUELAS	t
34	17	xyz0ND-MWKMPEOK	DWREFESMK No encontramos el jsp para poder corregir la falta de de Categoría 	-1.202640	-78.591385	ESCUELAS	t
35	17	xyz0ND (MWKMPEOK)	DWREFESMK No encontramos el jsp para poder corregir la falta de de Categoría 	-1.202640	-78.591385	ESCUELAS	t
36	17	xyz0ND (MWKMPEOK)	DWREFESMK No encontramos el jsp para poder corregir la falta de de Categoría 	-1.202640	-78.591385	ESCUELAS	t
37	17	xyz0ND (MWKMPEOK)	DWREFESMK No encontramos el jsp para poder corregir la falta de de Categoría 	-1.202640	-78.591385	ESCUELAS	t
22	16	MENSAJEROS DE LA PAZ	Desarrolla programas y proyectos en el área de protección integral y especial a niños, niñas, adolescentes y sus familias	-2.896573	-79.008963	FUNDACIONES	t
38	17	xyz0ND (MWKMPEOK)	DWREFESMK No encontramos el jsp para poder corregir la falta de de Categoría 	-1.202640	-78.591385	ESCUELAS	t
39	17	xyzND MWKMPEOK-	DWREFESMK No encontramos el jsp para poder corregir la falta de de Categoría 	-1.202640	-78.591385	ESCUELAS	t
40	17	xyzND )MWKMPEOK	DWREFESMK No encontramos el jsp para poder corregir la falta de de Categoría 	-1.202640	-78.591385	ESCUELAS	t
\.


--
-- TOC entry 3156 (class 0 OID 41572)
-- Dependencies: 213
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.pais (idpais, pais, codigo, estado) FROM stdin;
1	Ecuador	+593	t
\.


--
-- TOC entry 3158 (class 0 OID 41581)
-- Dependencies: 215
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.persona (idpersona, idciudad, nombre, apellido, genero, usuario, correo, clave, administrador, estado) FROM stdin;
17	2	Francisco	Moreira	Masculino	fmoreirag45	uzumakifrancisco15@gmail.com	7c4a8d09ca3762af61e59520943dc26494f8941b	t	t
18	128	Michelle	Solano	Femenino 	dsolanoc	doris.solano2017@uteq.edu.ec	40bd001563085fc35165329ea1ff5c5ecbdbbeef	t	t
\.


--
-- TOC entry 3160 (class 0 OID 41591)
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
-- TOC entry 3162 (class 0 OID 41601)
-- Dependencies: 219
-- Data for Name: recurso; Type: TABLE DATA; Schema: public; Owner: appdist
--

COPY public.recurso (idrecurso, idcategoriarecurso, iddiscapacidad, recurso, descripcion, etiquetas, estado, ruta) FROM stdin;
19	3	75	Tipos de hipoacusia	Información sobre lo hipoacusia	Recurso	t	http://fyc.uteq.edu.ec:8080/files/yuyapuy/recursosDiscapacidades/Tipos de hipoacusia.png
20	3	75	Hipoacusia infantil	Información sobre lo hipoacusia	Recurso	t	http://fyc.uteq.edu.ec:8080/files/yuyapuy/recursosDiscapacidades/Hipoacusia infantil.png
21	2	75	Video informativo	Video informativo sobre lo hipoacusia	Recurso	f	https://youtu.be/dcNrB6_psVk
22	4	80	Números y operaciones	Son juegos sobre Números y operaciones para que los niños aprendan mucho.	Matemática	f	https://www.mundoprimaria.com/juegos-educativos/juegos-matematicas/numeros
23	5	80	SÍNDROME de DOWN 	El Síndrome de Down (SD), también llamado trisomía 21, es la causa mas frecuente de retraso mental identificable de origen genético. Se trata de una anomalía cromosómica que tiene una incidencia de 1 de cada 800 nacidos, y que aumenta con la edad materna. Es la cromosomopatía mas frecuente y mejor conocida.	Síndrome de down	f	https://www.aeped.es/sites/default/files/documentos/6-down.pdf
24	3	74	Infografía Epilepsia	La epilepsia es el 3er trastorno neurológico más común a nivel mundial. El 75% de las personas con epilepsia logra superar las crisis con la medicación adecuada.	Epilepsia	f	https://ghc.com.mx/wp-content/uploads/2021/07/infografi%cc%81a_Epilepsia_vF.png
26	3	80	Cinemática Inversa	Ejemplo de cinemática	aaa, eee	t	localhost:8084/files/yuyapuy/recursosDiscapacidades/Cinemática Inversa.png
27	3	66	Cinemática	Ejemplo de cinemática	Ejemplo , Cinemática	t	localhost:8084/files/yuyapuy/recursosDiscapacidades/Cinemática.png
28	3	70	Cinemática	ok	ko	t	localhost:8084/files/yuyapuy/recursosDiscapacidades/Cinemática.png
25	3	74	Cinematica	Uso de la cinemática inversa	Robot	t	fyc.uteq.edu.ec:8080/files/yuyapuy/recursosDiscapacidades/Cinematica.png
29	3	75	asdasd	sad	dasdas	t	localhost:8090/files/yuyapuy/recursosDiscapacidades/asdasd.png
30	5	73	Niño	Guía para los que trabajan con niños Paralíticos Cerebrales	aaa,aaa,aaa	t	localhost:8084/files/yuyapuy/recursosDiscapacidades/Niño.pdf
\.


--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 200
-- Name: categoriadiscapacidad_idcategoriadiscapacidad_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.categoriadiscapacidad_idcategoriadiscapacidad_seq', 7, true);


--
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 202
-- Name: categoriarecurso_idcategoriarecurso_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.categoriarecurso_idcategoriarecurso_seq', 1, true);


--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 204
-- Name: ciudad_idciudad_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.ciudad_idciudad_seq', 3, true);


--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 206
-- Name: concepto_idconcepto_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.concepto_idconcepto_seq', 67, true);


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 208
-- Name: discapacidad_iddiscapacidad_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.discapacidad_iddiscapacidad_seq', 85, true);


--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 210
-- Name: lugares_idlugar_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.lugares_idlugar_seq', 40, true);


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 212
-- Name: pais_idpais_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.pais_idpais_seq', 1, false);


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 214
-- Name: persona_idpersona_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.persona_idpersona_seq', 27, true);


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 216
-- Name: provincia_idprovincia_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.provincia_idprovincia_seq', 3, true);


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 218
-- Name: recurso_idrecurso_seq; Type: SEQUENCE SET; Schema: public; Owner: appdist
--

SELECT pg_catalog.setval('public.recurso_idrecurso_seq', 31, true);


--
-- TOC entry 2957 (class 2606 OID 41513)
-- Name: categoriadiscapacidad pk_categoriadiscapacidad; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.categoriadiscapacidad
    ADD CONSTRAINT pk_categoriadiscapacidad PRIMARY KEY (idcategoriadiscapacidad);


--
-- TOC entry 2960 (class 2606 OID 41522)
-- Name: categoriarecurso pk_categoriarecurso; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.categoriarecurso
    ADD CONSTRAINT pk_categoriarecurso PRIMARY KEY (idcategoriarecurso);


--
-- TOC entry 2963 (class 2606 OID 41531)
-- Name: ciudad pk_ciudad; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT pk_ciudad PRIMARY KEY (idciudad);


--
-- TOC entry 2967 (class 2606 OID 41544)
-- Name: concepto pk_concepto; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.concepto
    ADD CONSTRAINT pk_concepto PRIMARY KEY (idconcepto);


--
-- TOC entry 2971 (class 2606 OID 41554)
-- Name: discapacidad pk_discapacidad; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.discapacidad
    ADD CONSTRAINT pk_discapacidad PRIMARY KEY (iddiscapacidad);


--
-- TOC entry 2975 (class 2606 OID 41567)
-- Name: lugares pk_lugares; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.lugares
    ADD CONSTRAINT pk_lugares PRIMARY KEY (idlugar);


--
-- TOC entry 2979 (class 2606 OID 41577)
-- Name: pais pk_pais; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pk_pais PRIMARY KEY (idpais);


--
-- TOC entry 2983 (class 2606 OID 41586)
-- Name: persona pk_persona; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT pk_persona PRIMARY KEY (idpersona);


--
-- TOC entry 2986 (class 2606 OID 41596)
-- Name: provincia pk_provincia; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT pk_provincia PRIMARY KEY (idprovincia);


--
-- TOC entry 2989 (class 2606 OID 41609)
-- Name: recurso pk_recurso; Type: CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT pk_recurso PRIMARY KEY (idrecurso);


--
-- TOC entry 2955 (class 1259 OID 41514)
-- Name: categoriadiscapacidad_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX categoriadiscapacidad_pk ON public.categoriadiscapacidad USING btree (idcategoriadiscapacidad);


--
-- TOC entry 2958 (class 1259 OID 41523)
-- Name: categoriarecurso_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX categoriarecurso_pk ON public.categoriarecurso USING btree (idcategoriarecurso);


--
-- TOC entry 2961 (class 1259 OID 41532)
-- Name: ciudad_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX ciudad_pk ON public.ciudad USING btree (idciudad);


--
-- TOC entry 2980 (class 1259 OID 41588)
-- Name: ciudad_tutor_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX ciudad_tutor_fk ON public.persona USING btree (idciudad);


--
-- TOC entry 2965 (class 1259 OID 41545)
-- Name: concepto_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX concepto_pk ON public.concepto USING btree (idconcepto);


--
-- TOC entry 2969 (class 1259 OID 41555)
-- Name: discapacidad_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX discapacidad_pk ON public.discapacidad USING btree (iddiscapacidad);


--
-- TOC entry 2973 (class 1259 OID 41568)
-- Name: lugares_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX lugares_pk ON public.lugares USING btree (idlugar);


--
-- TOC entry 2977 (class 1259 OID 41578)
-- Name: pais_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX pais_pk ON public.pais USING btree (idpais);


--
-- TOC entry 2984 (class 1259 OID 41598)
-- Name: pais_provincia_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX pais_provincia_fk ON public.provincia USING btree (idpais);


--
-- TOC entry 2981 (class 1259 OID 41587)
-- Name: persona_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX persona_pk ON public.persona USING btree (idpersona);


--
-- TOC entry 2964 (class 1259 OID 41533)
-- Name: provincia_ciudad_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX provincia_ciudad_fk ON public.ciudad USING btree (idprovincia);


--
-- TOC entry 2987 (class 1259 OID 41597)
-- Name: provincia_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX provincia_pk ON public.provincia USING btree (idprovincia);


--
-- TOC entry 2990 (class 1259 OID 41610)
-- Name: recurso_pk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE UNIQUE INDEX recurso_pk ON public.recurso USING btree (idrecurso);


--
-- TOC entry 2976 (class 1259 OID 41569)
-- Name: relationship_4_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX relationship_4_fk ON public.lugares USING btree (idciudad);


--
-- TOC entry 2991 (class 1259 OID 41611)
-- Name: relationship_5_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX relationship_5_fk ON public.recurso USING btree (idcategoriarecurso);


--
-- TOC entry 2992 (class 1259 OID 41612)
-- Name: relationship_6_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX relationship_6_fk ON public.recurso USING btree (iddiscapacidad);


--
-- TOC entry 2968 (class 1259 OID 41546)
-- Name: relationship_7_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX relationship_7_fk ON public.concepto USING btree (iddiscapacidad);


--
-- TOC entry 2972 (class 1259 OID 41556)
-- Name: relationship_8_fk; Type: INDEX; Schema: public; Owner: appdist
--

CREATE INDEX relationship_8_fk ON public.discapacidad USING btree (idcategoriadiscapacidad);


--
-- TOC entry 3140 (class 2618 OID 43246)
-- Name: discapacidadcantidad _RETURN; Type: RULE; Schema: public; Owner: appdist
--

CREATE OR REPLACE VIEW public.discapacidadcantidad AS
 SELECT d.iddiscapacidad,
    d.discapacidad,
    count(r.iddiscapacidad) AS recursos,
    count(c.iddiscapacidad) AS conceptos
   FROM ((public.discapacidad d
     FULL JOIN public.recurso r ON ((d.iddiscapacidad = r.iddiscapacidad)))
     FULL JOIN public.concepto c ON ((c.iddiscapacidad = d.iddiscapacidad)))
  GROUP BY d.iddiscapacidad;


--
-- TOC entry 3141 (class 2618 OID 43250)
-- Name: vwdiscapacidadcantidad _RETURN; Type: RULE; Schema: public; Owner: appdist
--

CREATE OR REPLACE VIEW public.vwdiscapacidadcantidad AS
 SELECT x.iddiscapacidad,
    x.discapacidad,
    y.recursos,
    x.conceptos
   FROM (( SELECT d.iddiscapacidad,
            d.discapacidad,
            count(r.iddiscapacidad) AS recursos
           FROM (public.discapacidad d
             FULL JOIN public.recurso r ON ((d.iddiscapacidad = r.iddiscapacidad)))
          GROUP BY d.iddiscapacidad) y
     JOIN ( SELECT d.iddiscapacidad,
            d.discapacidad,
            count(c.iddiscapacidad) AS conceptos
           FROM (public.discapacidad d
             FULL JOIN public.concepto c ON ((c.iddiscapacidad = d.iddiscapacidad)))
          GROUP BY d.iddiscapacidad) x ON ((x.iddiscapacidad = y.iddiscapacidad)));


--
-- TOC entry 2993 (class 2606 OID 41613)
-- Name: ciudad fk_ci_provincia_pr; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT fk_ci_provincia_pr FOREIGN KEY (idprovincia) REFERENCES public.provincia(idprovincia) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2994 (class 2606 OID 41618)
-- Name: concepto fk_co_relations_di; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.concepto
    ADD CONSTRAINT fk_co_relations_di FOREIGN KEY (iddiscapacidad) REFERENCES public.discapacidad(iddiscapacidad) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2995 (class 2606 OID 41623)
-- Name: discapacidad fk_di_relations_ca; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.discapacidad
    ADD CONSTRAINT fk_di_relations_ca FOREIGN KEY (idcategoriadiscapacidad) REFERENCES public.categoriadiscapacidad(idcategoriadiscapacidad) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2996 (class 2606 OID 41628)
-- Name: lugares fk_lu_relations_ci; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.lugares
    ADD CONSTRAINT fk_lu_relations_ci FOREIGN KEY (idciudad) REFERENCES public.ciudad(idciudad) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2997 (class 2606 OID 41633)
-- Name: persona fk_pe_ciudad_tu_ci; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT fk_pe_ciudad_tu_ci FOREIGN KEY (idciudad) REFERENCES public.ciudad(idciudad) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2998 (class 2606 OID 41638)
-- Name: provincia fk_pr_pais_prov_pa; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT fk_pr_pais_prov_pa FOREIGN KEY (idpais) REFERENCES public.pais(idpais) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2999 (class 2606 OID 41643)
-- Name: recurso fk_re_relations_ca; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT fk_re_relations_ca FOREIGN KEY (idcategoriarecurso) REFERENCES public.categoriarecurso(idcategoriarecurso) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3000 (class 2606 OID 41648)
-- Name: recurso fk_re_relations_di; Type: FK CONSTRAINT; Schema: public; Owner: appdist
--

ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT fk_re_relations_di FOREIGN KEY (iddiscapacidad) REFERENCES public.discapacidad(iddiscapacidad) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2022-02-26 04:10:45

--
-- PostgreSQL database dump complete
--

