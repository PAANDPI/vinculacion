PGDMP     ;    ,                z            yuyapuy    13.4 (Debian 13.4-1.pgdg100+1)    14.1 ?    e           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            f           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            g           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            h           1262    41505    yuyapuy    DATABASE     [   CREATE DATABASE yuyapuy WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE yuyapuy;
                appdist    false                        3079    43368    unaccent 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;
    DROP EXTENSION unaccent;
                   false            i           0    0    EXTENSION unaccent    COMMENT     P   COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';
                        false    2            ?            1255    43056    cambiarclave(integer, text)    FUNCTION     ?   CREATE FUNCTION public.cambiarclave(varidpersona integer, varclave text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.persona
	SET clave = varclave
	WHERE idpersona=varidpersona;
END;
$$;
 H   DROP FUNCTION public.cambiarclave(varidpersona integer, varclave text);
       public          appdist    false                       1255    41720 7   editarcategoriadiscapacidad(integer, character varying)    FUNCTION     ?  CREATE FUNCTION public.editarcategoriadiscapacidad(varidcategoriadiscapacidad integer, varcategoriadiscapacidad character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.categoriadiscapacidad
		SET idcategoriadiscapacidad=varidcategoriadiscapacidad, categoriadiscapacidad=varcategoriadiscapacidad
		WHERE idcategoriadiscapacidad=varidcategoriadiscapacidad;
END;
$$;
 ?   DROP FUNCTION public.editarcategoriadiscapacidad(varidcategoriadiscapacidad integer, varcategoriadiscapacidad character varying);
       public          appdist    false                       1255    41728 2   editarcategoriarecurso(integer, character varying)    FUNCTION     U  CREATE FUNCTION public.editarcategoriarecurso(varidcategoriarecurso integer, varcategoriarecurso character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.categoriarecurso
	SET idcategoriarecurso=varidcategoriarecurso, categoriarecurso=varcategoriarecurso
	WHERE  idcategoriarecurso=varidcategoriarecurso;
END;
$$;
 s   DROP FUNCTION public.editarcategoriarecurso(varidcategoriarecurso integer, varcategoriarecurso character varying);
       public          appdist    false                       1255    41729 :   editarciudad(integer, integer, character varying, boolean)    FUNCTION     I  CREATE FUNCTION public.editarciudad(varidciudad integer, varidprovincia integer, varciudad character varying, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ciudad
	SET idciudad=varidciudad, idprovincia=varidprovincia, ciudad=varciudad, estado=varestado
	WHERE idciudad=varidciudad;
END;
$$;
 ?   DROP FUNCTION public.editarciudad(varidciudad integer, varidprovincia integer, varciudad character varying, varestado boolean);
       public          appdist    false                       1255    41731 ,   editarconcepto(integer, integer, text, text)    FUNCTION     j  CREATE FUNCTION public.editarconcepto(varidconcepto integer, variddiscapacidad integer, vardescripcion text, varetiquetas text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.concepto
	SET idconcepto=varidconcepto, iddiscapacidad=variddiscapacidad, descripcion=vardescripcion, etiquetas=varetiquetas
	WHERE idconcepto=varidconcepto;
	
END;
$$;
    DROP FUNCTION public.editarconcepto(varidconcepto integer, variddiscapacidad integer, vardescripcion text, varetiquetas text);
       public          appdist    false                       1255    41732 7   editardiscapacidad(integer, integer, character varying)    FUNCTION     ?  CREATE FUNCTION public.editardiscapacidad(variddiscapacidad integer, varidcategoriadiscapacidad integer, vardiscapacidad character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.discapacidad
	SET iddiscapacidad=variddiscapacidad, idcategoriadiscapacidad=varidcategoriadiscapacidad, discapacidad=vardiscapacidad
	WHERE iddiscapacidad=variddiscapacidad;
END;
$$;
 ?   DROP FUNCTION public.editardiscapacidad(variddiscapacidad integer, varidcategoriadiscapacidad integer, vardiscapacidad character varying);
       public          appdist    false                       1255    41689 J   editarlugar(integer, integer, text, text, numeric, numeric, text, boolean)    FUNCTION     ?  CREATE FUNCTION public.editarlugar(varidlugar integer, varidciudad integer, varlugar text, vardescripcion text, varcoordendax numeric, varcoordenday numeric, varetiquetas text, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

	update lugares set idciudad=varIDCiudad, lugar=varlugar,descripcion=vardescripcion,coordendax=varcoordendax,coordenday=varcoordenday,etiqueta=varetiquetas,estado=varestado
  where idlugar=varidlugar;
END;
$$;
 ?   DROP FUNCTION public.editarlugar(varidlugar integer, varidciudad integer, varlugar text, vardescripcion text, varcoordendax numeric, varcoordenday numeric, varetiquetas text, varestado boolean);
       public          appdist    false                       1255    41727 B   editarpais(integer, character varying, character varying, boolean)    FUNCTION     k  CREATE FUNCTION public.editarpais(varidpais integer, varpais character varying, varcodigo character varying, varestado boolean) RETURNS void
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
    DROP FUNCTION public.editarpais(varidpais integer, varpais character varying, varcodigo character varying, varestado boolean);
       public          appdist    false                       1255    43055 ?   editarpersona(integer, integer, character varying, character varying, character varying, character varying, character varying, boolean, boolean)    FUNCTION       CREATE FUNCTION public.editarpersona(varidpersona integer, varidciudad integer, varnombre character varying, varapellido character varying, vargenero character varying, varusuario character varying, varcorreo character varying, varadmin boolean, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.persona
	SET idciudad=varidciudad, nombre=varnombre, apellido=varapellido, genero=vargenero, usuario=varusuario, correo=varcorreo, administrador=varadmin, estado=varestado
	WHERE idpersona=varidpersona;
END;
$$;
   DROP FUNCTION public.editarpersona(varidpersona integer, varidciudad integer, varnombre character varying, varapellido character varying, vargenero character varying, varusuario character varying, varcorreo character varying, varadmin boolean, varestado boolean);
       public          appdist    false                       1255    41733 =   editarprovincia(integer, integer, character varying, boolean)    FUNCTION     =  CREATE FUNCTION public.editarprovincia(varidprovincia integer, varidpais integer, varprovincia character varying, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

	UPDATE public.provincia
	SET idpais=varidpais, provincia=varprovincia, estado=varestado
	WHERE idprovincia=varidprovincia;
END;
$$;
 ?   DROP FUNCTION public.editarprovincia(varidprovincia integer, varidpais integer, varprovincia character varying, varestado boolean);
       public          appdist    false                       1255    41734 j   editarrecurso(integer, integer, integer, character varying, character varying, character varying, boolean)    FUNCTION       CREATE FUNCTION public.editarrecurso(varidrecurso integer, varcategoriarecurso integer, variddiscapacidad integer, varrecurso character varying, vardescripcion character varying, varetiquetas character varying, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

	UPDATE public.recurso
	SET  idcategoriarecurso=varcategoriarecurso, iddiscapacidad=variddiscapacidad, recurso=varrecurso, descripcion=vardescripcion, etiquetas=varetiquetas, estado=varestado
	WHERE idrecurso=varidrecurso;
END;
$$;
 ?   DROP FUNCTION public.editarrecurso(varidrecurso integer, varcategoriarecurso integer, variddiscapacidad integer, varrecurso character varying, vardescripcion character varying, varetiquetas character varying, varestado boolean);
       public          appdist    false                       1255    43367 }   editarrecurso(integer, integer, integer, character varying, character varying, character varying, character varying, boolean)    FUNCTION     ,  CREATE FUNCTION public.editarrecurso(varidrecurso integer, varcategoriarecurso integer, variddiscapacidad integer, varrecurso character varying, vardescripcion character varying, varetiquetas character varying, varruta character varying, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

	UPDATE public.recurso
	SET  idcategoriarecurso=varcategoriarecurso, iddiscapacidad=variddiscapacidad, recurso=varrecurso, descripcion=vardescripcion, etiquetas=varetiquetas,
	estado=varestado,
	ruta=varruta
	WHERE idrecurso=varidrecurso;
END;
$$;
    DROP FUNCTION public.editarrecurso(varidrecurso integer, varcategoriarecurso integer, variddiscapacidad integer, varrecurso character varying, vardescripcion character varying, varetiquetas character varying, varruta character varying, varestado boolean);
       public          appdist    false            ?            1255    41653 &   eliminarcategoriadiscapacidad(integer)    FUNCTION     ?   CREATE FUNCTION public.eliminarcategoriadiscapacidad(varidcategoriadiscapacidad integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM CategoriaDiscapacidad 
	WHERE varIdCategoriaDiscapacidad = idCategoriaDiscapacidad;
END;
$$;
 X   DROP FUNCTION public.eliminarcategoriadiscapacidad(varidcategoriadiscapacidad integer);
       public          appdist    false            ?            1255    43057 !   eliminarcategoriarecurso(integer)    FUNCTION     ?   CREATE FUNCTION public.eliminarcategoriarecurso(varidcategoriarecurso integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM CategoriaRecurso 
	WHERE varidcategoriarecurso = idcategoriarecurso;
END;
$$;
 N   DROP FUNCTION public.eliminarcategoriarecurso(varidcategoriarecurso integer);
       public          appdist    false            ?            1255    41654    eliminarciudad(integer)    FUNCTION     ?   CREATE FUNCTION public.eliminarciudad(varidciudad integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM ciudad 
	WHERE varIdCiudad = idCiudad;
END;
$$;
 :   DROP FUNCTION public.eliminarciudad(varidciudad integer);
       public          appdist    false            ?            1255    41655    eliminarconcepto(integer)    FUNCTION     ?   CREATE FUNCTION public.eliminarconcepto(varidconcepto integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM concepto 
	WHERE varIdConcepto = idConcepto;
END;
$$;
 >   DROP FUNCTION public.eliminarconcepto(varidconcepto integer);
       public          appdist    false            ?            1255    41656    eliminardiscapacidad(integer)    FUNCTION     ?   CREATE FUNCTION public.eliminardiscapacidad(variddiscapacidad integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM discapacidad 
	WHERE varIdDiscapacidad = idDiscapacidad;
END;
$$;
 F   DROP FUNCTION public.eliminardiscapacidad(variddiscapacidad integer);
       public          appdist    false            ?            1255    41657    eliminarlugares(integer)    FUNCTION     ?   CREATE FUNCTION public.eliminarlugares(varidlugar integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM lugares 
	WHERE varIdLugar = idLugar;
END;
$$;
 :   DROP FUNCTION public.eliminarlugares(varidlugar integer);
       public          appdist    false            ?            1255    41658    eliminarpais(integer)    FUNCTION     ?   CREATE FUNCTION public.eliminarpais(varidpais integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM pais 
	WHERE varIdPais = idPais;
END;
$$;
 6   DROP FUNCTION public.eliminarpais(varidpais integer);
       public          appdist    false            ?            1255    41659    eliminarpersona(integer)    FUNCTION     ?   CREATE FUNCTION public.eliminarpersona(varidpersona integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM persona 
	WHERE varIdPersona = idPersona;
END;
$$;
 <   DROP FUNCTION public.eliminarpersona(varidpersona integer);
       public          appdist    false            ?            1255    41660    eliminarprovincia(integer)    FUNCTION     ?   CREATE FUNCTION public.eliminarprovincia(varidprovincia integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM provincia 
	WHERE varIdProvincia = idProvincia;
END;
$$;
 @   DROP FUNCTION public.eliminarprovincia(varidprovincia integer);
       public          appdist    false            ?            1255    41661    eliminarrecurso(integer)    FUNCTION     ?   CREATE FUNCTION public.eliminarrecurso(varidrecurso integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM recurso 
	WHERE varIdRecurso = idRecurso;
END;
$$;
 <   DROP FUNCTION public.eliminarrecurso(varidrecurso integer);
       public          appdist    false            ?            1255    41662 $   habilitardeshabilitarciudad(integer)    FUNCTION     ?   CREATE FUNCTION public.habilitardeshabilitarciudad(varidciudad integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE ciudad SET Estado = !Estado
	WHERE varIdCiudad = idCiudad;
END;
$$;
 G   DROP FUNCTION public.habilitardeshabilitarciudad(varidciudad integer);
       public          appdist    false            ?            1255    41663 %   habilitardeshabilitarlugares(integer)    FUNCTION     ?   CREATE FUNCTION public.habilitardeshabilitarlugares(varidlugar integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE lugares SET Estado = !Estado
	WHERE varIdLugar = IdLugar;
END;
$$;
 G   DROP FUNCTION public.habilitardeshabilitarlugares(varidlugar integer);
       public          appdist    false            ?            1255    41664 "   habilitardeshabilitarpais(integer)    FUNCTION     ?   CREATE FUNCTION public.habilitardeshabilitarpais(varidpais integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE pais SET Estado = !Estado
	WHERE varIdPais = idPais;
END;
$$;
 C   DROP FUNCTION public.habilitardeshabilitarpais(varidpais integer);
       public          appdist    false            ?            1255    41665 %   habilitardeshabilitarpersona(integer)    FUNCTION     ?   CREATE FUNCTION public.habilitardeshabilitarpersona(varidpersona integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE Persona SET Estado = !Estado
	WHERE varIDPersona = IDPersona;
END;
$$;
 I   DROP FUNCTION public.habilitardeshabilitarpersona(varidpersona integer);
       public          appdist    false            ?            1255    41666 '   habilitardeshabilitarprovincia(integer)    FUNCTION     ?   CREATE FUNCTION public.habilitardeshabilitarprovincia(varidprovincia integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE provincia SET Estado = !Estado
	WHERE varIdProvincia = idProvincia;
END;
$$;
 M   DROP FUNCTION public.habilitardeshabilitarprovincia(varidprovincia integer);
       public          appdist    false            ?            1255    41667 %   habilitardeshabilitarrecurso(integer)    FUNCTION     ?   CREATE FUNCTION public.habilitardeshabilitarrecurso(varidrecurso integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE recurso SET Estado = !Estado
	WHERE varIdRecurso = idRecurso;
END;
$$;
 I   DROP FUNCTION public.habilitardeshabilitarrecurso(varidrecurso integer);
       public          appdist    false            ?            1255    41668 0   insertarcategoriadiscapacidad(character varying)    FUNCTION     ?   CREATE FUNCTION public.insertarcategoriadiscapacidad(varcategoriadiscapacidad character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO CategoriaDiscapacidad (CategoriaDiscapacidad) 
	VALUES (varCategoriaDiscapacidad);
END;
$$;
 `   DROP FUNCTION public.insertarcategoriadiscapacidad(varcategoriadiscapacidad character varying);
       public          appdist    false                       1255    41690 +   insertarcategoriarecurso(character varying)    FUNCTION     ?   CREATE FUNCTION public.insertarcategoriarecurso(varcategoriarecurso character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO categoriarecurso (categoriarecurso) 
	VALUES (varcategoriarecurso);
END;
$$;
 V   DROP FUNCTION public.insertarcategoriarecurso(varcategoriarecurso character varying);
       public          appdist    false            ?            1255    41669 *   insertarciudad(integer, character varying)    FUNCTION     ?   CREATE FUNCTION public.insertarciudad(varidprovincia integer, varciudad character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Ciudad (IDProvincia, Ciudad, Estado) 
	VALUES (varIDProvincia, varCiudad, TRUE);
END;
$$;
 Z   DROP FUNCTION public.insertarciudad(varidprovincia integer, varciudad character varying);
       public          appdist    false                       1255    41670 %   insertarconcepto(integer, text, text)    FUNCTION     !  CREATE FUNCTION public.insertarconcepto(variddiscapacidad integer, vardescripcion text, varetiquetas text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO Concepto (IDDiscapacidad, Descripcion, Etiquetas) 
	VALUES (varIDDiscapacidad, varDescripcion, varEtiquetas);
END;
$$;
 j   DROP FUNCTION public.insertarconcepto(variddiscapacidad integer, vardescripcion text, varetiquetas text);
       public          appdist    false                       1255    42046 0   insertardiscapacidad(character varying, integer)    FUNCTION     ,  CREATE FUNCTION public.insertardiscapacidad(vardiscapacidad character varying, varidcategoriadiscapacidad integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO public.discapacidad(discapacidad,idcategoriadiscapacidad)
	VALUES (vardiscapacidad, varidcategoriadiscapacidad);
END;
$$;
 r   DROP FUNCTION public.insertardiscapacidad(vardiscapacidad character varying, varidcategoriadiscapacidad integer);
       public          appdist    false                       1255    41685 :   insertarlugar(integer, text, text, numeric, numeric, text)    FUNCTION     ?  CREATE FUNCTION public.insertarlugar(varidciudad integer, varlugar text, vardescripcion text, varcoordendax numeric, varcoordenday numeric, varetiqueta text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Lugares (IDCiudad, Lugar, Descripcion, CoordendaX, CoordendaY, Etiqueta,Estado) 
	VALUES (varIDCiudad, varLugar, varDescripcion, varCoordendaX, varCoordendaY, varEtiqueta,TRUE);
END;
$$;
 ?   DROP FUNCTION public.insertarlugar(varidciudad integer, varlugar text, vardescripcion text, varcoordendax numeric, varcoordenday numeric, varetiqueta text);
       public          appdist    false                        1255    41673 2   insertarpais(character varying, character varying)    FUNCTION     ?   CREATE FUNCTION public.insertarpais(varpais character varying, varcodigo character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Pais (Pais, Codigo, Estado) 
	VALUES (varPais, varCodigo, TRUE);
END;
$$;
 [   DROP FUNCTION public.insertarpais(varpais character varying, varcodigo character varying);
       public          appdist    false                       1255    41674 ?   insertarpersona(integer, character varying, character varying, character varying, character varying, character varying, text, boolean)    FUNCTION       CREATE FUNCTION public.insertarpersona(varidciudad integer, varnombre character varying, varapellido character varying, vargenero character varying, varusuario character varying, varcorreo character varying, varclave text, varadmin boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Persona (IDCiudad, Nombre, Apellido,  Genero, 
		Usuario, Correo, Clave, Administrador, Estado) 
	VALUES (varIDCiudad, varNombre, varApellido,vargenero, varUsuario, varCorreo, varClave, varAdmin, TRUE);
END;
$$;
 ?   DROP FUNCTION public.insertarpersona(varidciudad integer, varnombre character varying, varapellido character varying, vargenero character varying, varusuario character varying, varcorreo character varying, varclave text, varadmin boolean);
       public          appdist    false                       1255    41675 -   insertarprovincia(integer, character varying)    FUNCTION     ?   CREATE FUNCTION public.insertarprovincia(varidpais integer, varprovincia character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Provincia (IDPais, Provincia, Estado) 
	VALUES (varIDPais, varProvincia, TRUE);
END;
$$;
 [   DROP FUNCTION public.insertarprovincia(varidpais integer, varprovincia character varying);
       public          appdist    false                       1255    43096 O   insertarrecurso(integer, integer, character varying, text, text, text, boolean)    FUNCTION     ?  CREATE FUNCTION public.insertarrecurso(varcategoriarecurso integer, variddiscapacidad integer, varrecurso character varying, vardescripcion text, varetiquetas text, varruta text, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO recurso (idcategoriarecurso, iddiscapacidad, recurso, descripcion, etiquetas, estado, ruta) 
	VALUES (varcategoriarecurso, variddiscapacidad, varrecurso, vardescripcion, varetiquetas, varestado, varruta);
END;
$$;
 ?   DROP FUNCTION public.insertarrecurso(varcategoriarecurso integer, variddiscapacidad integer, varrecurso character varying, vardescripcion text, varetiquetas text, varruta text, varestado boolean);
       public          appdist    false            ?            1259    41508    categoriadiscapacidad    TABLE     ?   CREATE TABLE public.categoriadiscapacidad (
    idcategoriadiscapacidad integer NOT NULL,
    categoriadiscapacidad character varying(25) NOT NULL
);
 )   DROP TABLE public.categoriadiscapacidad;
       public         heap    appdist    false            ?            1259    41506 1   categoriadiscapacidad_idcategoriadiscapacidad_seq    SEQUENCE     ?   CREATE SEQUENCE public.categoriadiscapacidad_idcategoriadiscapacidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public.categoriadiscapacidad_idcategoriadiscapacidad_seq;
       public          appdist    false    202            j           0    0 1   categoriadiscapacidad_idcategoriadiscapacidad_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.categoriadiscapacidad_idcategoriadiscapacidad_seq OWNED BY public.categoriadiscapacidad.idcategoriadiscapacidad;
          public          appdist    false    201            ?            1259    41517    categoriarecurso    TABLE     ?   CREATE TABLE public.categoriarecurso (
    idcategoriarecurso integer NOT NULL,
    categoriarecurso character varying(25) NOT NULL
);
 $   DROP TABLE public.categoriarecurso;
       public         heap    appdist    false            ?            1259    41515 '   categoriarecurso_idcategoriarecurso_seq    SEQUENCE     ?   CREATE SEQUENCE public.categoriarecurso_idcategoriarecurso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.categoriarecurso_idcategoriarecurso_seq;
       public          appdist    false    204            k           0    0 '   categoriarecurso_idcategoriarecurso_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.categoriarecurso_idcategoriarecurso_seq OWNED BY public.categoriarecurso.idcategoriarecurso;
          public          appdist    false    203            ?            1259    41526    ciudad    TABLE     ?   CREATE TABLE public.ciudad (
    idciudad integer NOT NULL,
    idprovincia integer NOT NULL,
    ciudad character varying(30) NOT NULL,
    estado boolean NOT NULL
);
    DROP TABLE public.ciudad;
       public         heap    appdist    false            ?            1259    41524    ciudad_idciudad_seq    SEQUENCE     ?   CREATE SEQUENCE public.ciudad_idciudad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.ciudad_idciudad_seq;
       public          appdist    false    206            l           0    0    ciudad_idciudad_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.ciudad_idciudad_seq OWNED BY public.ciudad.idciudad;
          public          appdist    false    205            ?            1259    41536    concepto    TABLE     ?   CREATE TABLE public.concepto (
    idconcepto integer NOT NULL,
    iddiscapacidad integer,
    descripcion text NOT NULL,
    etiquetas text NOT NULL
);
    DROP TABLE public.concepto;
       public         heap    appdist    false            ?            1259    41534    concepto_idconcepto_seq    SEQUENCE     ?   CREATE SEQUENCE public.concepto_idconcepto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.concepto_idconcepto_seq;
       public          appdist    false    208            m           0    0    concepto_idconcepto_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.concepto_idconcepto_seq OWNED BY public.concepto.idconcepto;
          public          appdist    false    207            ?            1259    41549    discapacidad    TABLE     ?   CREATE TABLE public.discapacidad (
    iddiscapacidad integer NOT NULL,
    idcategoriadiscapacidad integer,
    discapacidad character varying(50) NOT NULL
);
     DROP TABLE public.discapacidad;
       public         heap    appdist    false            ?            1259    41547    discapacidad_iddiscapacidad_seq    SEQUENCE     ?   CREATE SEQUENCE public.discapacidad_iddiscapacidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.discapacidad_iddiscapacidad_seq;
       public          appdist    false    210            n           0    0    discapacidad_iddiscapacidad_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.discapacidad_iddiscapacidad_seq OWNED BY public.discapacidad.iddiscapacidad;
          public          appdist    false    209            ?            1259    43243    discapacidadcantidad    VIEW     ?   CREATE VIEW public.discapacidadcantidad AS
SELECT
    NULL::integer AS iddiscapacidad,
    NULL::character varying(50) AS discapacidad,
    NULL::bigint AS recursos,
    NULL::bigint AS conceptos;
 '   DROP VIEW public.discapacidadcantidad;
       public          appdist    false            ?            1259    41559    lugares    TABLE     $  CREATE TABLE public.lugares (
    idlugar integer NOT NULL,
    idciudad integer NOT NULL,
    lugar character varying(75) NOT NULL,
    descripcion text NOT NULL,
    coordendax numeric(10,6) NOT NULL,
    coordenday numeric(10,6) NOT NULL,
    etiqueta text,
    estado boolean NOT NULL
);
    DROP TABLE public.lugares;
       public         heap    appdist    false            ?            1259    41557    lugares_idlugar_seq    SEQUENCE     ?   CREATE SEQUENCE public.lugares_idlugar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.lugares_idlugar_seq;
       public          appdist    false    212            o           0    0    lugares_idlugar_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.lugares_idlugar_seq OWNED BY public.lugares.idlugar;
          public          appdist    false    211            ?            1259    41572    pais    TABLE     ?   CREATE TABLE public.pais (
    idpais integer NOT NULL,
    pais character varying(40) NOT NULL,
    codigo character(4) NOT NULL,
    estado boolean NOT NULL
);
    DROP TABLE public.pais;
       public         heap    appdist    false            ?            1259    41570    pais_idpais_seq    SEQUENCE     ?   CREATE SEQUENCE public.pais_idpais_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.pais_idpais_seq;
       public          appdist    false    214            p           0    0    pais_idpais_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.pais_idpais_seq OWNED BY public.pais.idpais;
          public          appdist    false    213            ?            1259    41581    persona    TABLE     ?  CREATE TABLE public.persona (
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
    DROP TABLE public.persona;
       public         heap    appdist    false            ?            1259    41579    persona_idpersona_seq    SEQUENCE     ?   CREATE SEQUENCE public.persona_idpersona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.persona_idpersona_seq;
       public          appdist    false    216            q           0    0    persona_idpersona_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.persona_idpersona_seq OWNED BY public.persona.idpersona;
          public          appdist    false    215            ?            1259    41591 	   provincia    TABLE     ?   CREATE TABLE public.provincia (
    idprovincia integer NOT NULL,
    idpais integer NOT NULL,
    provincia character varying(30) NOT NULL,
    estado boolean NOT NULL
);
    DROP TABLE public.provincia;
       public         heap    appdist    false            ?            1259    41589    provincia_idprovincia_seq    SEQUENCE     ?   CREATE SEQUENCE public.provincia_idprovincia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.provincia_idprovincia_seq;
       public          appdist    false    218            r           0    0    provincia_idprovincia_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.provincia_idprovincia_seq OWNED BY public.provincia.idprovincia;
          public          appdist    false    217            ?            1259    41601    recurso    TABLE       CREATE TABLE public.recurso (
    idrecurso integer NOT NULL,
    idcategoriarecurso integer NOT NULL,
    iddiscapacidad integer NOT NULL,
    recurso text NOT NULL,
    descripcion text NOT NULL,
    etiquetas text NOT NULL,
    estado boolean NOT NULL,
    ruta text NOT NULL
);
    DROP TABLE public.recurso;
       public         heap    appdist    false            ?            1259    41599    recurso_idrecurso_seq    SEQUENCE     ?   CREATE SEQUENCE public.recurso_idrecurso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.recurso_idrecurso_seq;
       public          appdist    false    220            s           0    0    recurso_idrecurso_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.recurso_idrecurso_seq OWNED BY public.recurso.idrecurso;
          public          appdist    false    219            ?            1259    41740    vwcategoriadiscapacidad    VIEW     ?   CREATE VIEW public.vwcategoriadiscapacidad AS
 SELECT categoriadiscapacidad.idcategoriadiscapacidad,
    categoriadiscapacidad.categoriadiscapacidad
   FROM public.categoriadiscapacidad;
 *   DROP VIEW public.vwcategoriadiscapacidad;
       public          appdist    false    202    202            ?            1259    41744    vwcategoriarecurso    VIEW     ?   CREATE VIEW public.vwcategoriarecurso AS
 SELECT categoriarecurso.idcategoriarecurso,
    categoriarecurso.categoriarecurso
   FROM public.categoriarecurso;
 %   DROP VIEW public.vwcategoriarecurso;
       public          appdist    false    204    204            ?            1259    41748    vwciudad    VIEW     ?   CREATE VIEW public.vwciudad AS
 SELECT c.idciudad,
    c.idprovincia,
    c.ciudad,
    c.estado,
    p.provincia
   FROM (public.ciudad c
     JOIN public.provincia p ON ((c.idprovincia = p.idprovincia)));
    DROP VIEW public.vwciudad;
       public          appdist    false    206    206    218    206    218    206            ?            1259    42213 
   vwconcepto    VIEW     ?   CREATE VIEW public.vwconcepto AS
 SELECT c.idconcepto,
    c.iddiscapacidad,
    d.discapacidad,
    c.descripcion,
    c.etiquetas
   FROM (public.concepto c
     JOIN public.discapacidad d ON ((c.iddiscapacidad = d.iddiscapacidad)));
    DROP VIEW public.vwconcepto;
       public          appdist    false    210    210    208    208    208    208            ?            1259    42209    vwdiscapacidad    VIEW       CREATE VIEW public.vwdiscapacidad AS
 SELECT d.iddiscapacidad,
    d.idcategoriadiscapacidad,
    cd.categoriadiscapacidad,
    d.discapacidad
   FROM (public.discapacidad d
     JOIN public.categoriadiscapacidad cd ON ((d.idcategoriadiscapacidad = cd.idcategoriadiscapacidad)));
 !   DROP VIEW public.vwdiscapacidad;
       public          appdist    false    210    202    202    210    210            ?            1259    43247    vwdiscapacidadcantidad    VIEW     ?   CREATE VIEW public.vwdiscapacidadcantidad AS
SELECT
    NULL::integer AS iddiscapacidad,
    NULL::character varying(50) AS discapacidad,
    NULL::bigint AS recursos,
    NULL::bigint AS conceptos;
 )   DROP VIEW public.vwdiscapacidadcantidad;
       public          appdist    false            ?            1259    41735    vwlugar    VIEW     ?  CREATE VIEW public.vwlugar AS
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
    DROP VIEW public.vwlugar;
       public          appdist    false    212    206    206    212    212    212    212    218    218    218    214    214    212    212    212    206            ?            1259    41760    vwpais    VIEW     w   CREATE VIEW public.vwpais AS
 SELECT pais.idpais,
    pais.pais,
    pais.codigo,
    pais.estado
   FROM public.pais;
    DROP VIEW public.vwpais;
       public          appdist    false    214    214    214    214            ?            1259    41806 	   vwpersona    VIEW        CREATE VIEW public.vwpersona AS
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
    DROP VIEW public.vwpersona;
       public          appdist    false    216    216    216    216    206    206    216    216    216    216    216    216            ?            1259    41764    vwprovincia    VIEW     ?   CREATE VIEW public.vwprovincia AS
 SELECT p.idprovincia,
    pa.pais,
    p.provincia,
    p.estado
   FROM (public.provincia p
     JOIN public.pais pa ON ((p.idpais = pa.idpais)));
    DROP VIEW public.vwprovincia;
       public          appdist    false    218    218    218    218    214    214            ?            1259    43253 	   vwrecurso    VIEW     ?  CREATE VIEW public.vwrecurso AS
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
    DROP VIEW public.vwrecurso;
       public          appdist    false    204    204    210    210    220    220    220    220    220    220    220    220            ?           2604    41511 -   categoriadiscapacidad idcategoriadiscapacidad    DEFAULT     ?   ALTER TABLE ONLY public.categoriadiscapacidad ALTER COLUMN idcategoriadiscapacidad SET DEFAULT nextval('public.categoriadiscapacidad_idcategoriadiscapacidad_seq'::regclass);
 \   ALTER TABLE public.categoriadiscapacidad ALTER COLUMN idcategoriadiscapacidad DROP DEFAULT;
       public          appdist    false    201    202    202            ?           2604    41520 #   categoriarecurso idcategoriarecurso    DEFAULT     ?   ALTER TABLE ONLY public.categoriarecurso ALTER COLUMN idcategoriarecurso SET DEFAULT nextval('public.categoriarecurso_idcategoriarecurso_seq'::regclass);
 R   ALTER TABLE public.categoriarecurso ALTER COLUMN idcategoriarecurso DROP DEFAULT;
       public          appdist    false    204    203    204            ?           2604    41529    ciudad idciudad    DEFAULT     r   ALTER TABLE ONLY public.ciudad ALTER COLUMN idciudad SET DEFAULT nextval('public.ciudad_idciudad_seq'::regclass);
 >   ALTER TABLE public.ciudad ALTER COLUMN idciudad DROP DEFAULT;
       public          appdist    false    205    206    206            ?           2604    41539    concepto idconcepto    DEFAULT     z   ALTER TABLE ONLY public.concepto ALTER COLUMN idconcepto SET DEFAULT nextval('public.concepto_idconcepto_seq'::regclass);
 B   ALTER TABLE public.concepto ALTER COLUMN idconcepto DROP DEFAULT;
       public          appdist    false    207    208    208            ?           2604    41552    discapacidad iddiscapacidad    DEFAULT     ?   ALTER TABLE ONLY public.discapacidad ALTER COLUMN iddiscapacidad SET DEFAULT nextval('public.discapacidad_iddiscapacidad_seq'::regclass);
 J   ALTER TABLE public.discapacidad ALTER COLUMN iddiscapacidad DROP DEFAULT;
       public          appdist    false    209    210    210            ?           2604    41562    lugares idlugar    DEFAULT     r   ALTER TABLE ONLY public.lugares ALTER COLUMN idlugar SET DEFAULT nextval('public.lugares_idlugar_seq'::regclass);
 >   ALTER TABLE public.lugares ALTER COLUMN idlugar DROP DEFAULT;
       public          appdist    false    211    212    212            ?           2604    41575    pais idpais    DEFAULT     j   ALTER TABLE ONLY public.pais ALTER COLUMN idpais SET DEFAULT nextval('public.pais_idpais_seq'::regclass);
 :   ALTER TABLE public.pais ALTER COLUMN idpais DROP DEFAULT;
       public          appdist    false    213    214    214            ?           2604    41584    persona idpersona    DEFAULT     v   ALTER TABLE ONLY public.persona ALTER COLUMN idpersona SET DEFAULT nextval('public.persona_idpersona_seq'::regclass);
 @   ALTER TABLE public.persona ALTER COLUMN idpersona DROP DEFAULT;
       public          appdist    false    215    216    216            ?           2604    41594    provincia idprovincia    DEFAULT     ~   ALTER TABLE ONLY public.provincia ALTER COLUMN idprovincia SET DEFAULT nextval('public.provincia_idprovincia_seq'::regclass);
 D   ALTER TABLE public.provincia ALTER COLUMN idprovincia DROP DEFAULT;
       public          appdist    false    217    218    218            ?           2604    41604    recurso idrecurso    DEFAULT     v   ALTER TABLE ONLY public.recurso ALTER COLUMN idrecurso SET DEFAULT nextval('public.recurso_idrecurso_seq'::regclass);
 @   ALTER TABLE public.recurso ALTER COLUMN idrecurso DROP DEFAULT;
       public          appdist    false    220    219    220            P          0    41508    categoriadiscapacidad 
   TABLE DATA           _   COPY public.categoriadiscapacidad (idcategoriadiscapacidad, categoriadiscapacidad) FROM stdin;
    public          appdist    false    202   ??       R          0    41517    categoriarecurso 
   TABLE DATA           P   COPY public.categoriarecurso (idcategoriarecurso, categoriarecurso) FROM stdin;
    public          appdist    false    204   =?       T          0    41526    ciudad 
   TABLE DATA           G   COPY public.ciudad (idciudad, idprovincia, ciudad, estado) FROM stdin;
    public          appdist    false    206   ??       V          0    41536    concepto 
   TABLE DATA           V   COPY public.concepto (idconcepto, iddiscapacidad, descripcion, etiquetas) FROM stdin;
    public          appdist    false    208   ??       X          0    41549    discapacidad 
   TABLE DATA           ]   COPY public.discapacidad (iddiscapacidad, idcategoriadiscapacidad, discapacidad) FROM stdin;
    public          appdist    false    210   @      Z          0    41559    lugares 
   TABLE DATA           r   COPY public.lugares (idlugar, idciudad, lugar, descripcion, coordendax, coordenday, etiqueta, estado) FROM stdin;
    public          appdist    false    212         \          0    41572    pais 
   TABLE DATA           <   COPY public.pais (idpais, pais, codigo, estado) FROM stdin;
    public          appdist    false    214   $      ^          0    41581    persona 
   TABLE DATA              COPY public.persona (idpersona, idciudad, nombre, apellido, genero, usuario, correo, clave, administrador, estado) FROM stdin;
    public          appdist    false    216   R      `          0    41591 	   provincia 
   TABLE DATA           K   COPY public.provincia (idprovincia, idpais, provincia, estado) FROM stdin;
    public          appdist    false    218   B      b          0    41601    recurso 
   TABLE DATA              COPY public.recurso (idrecurso, idcategoriarecurso, iddiscapacidad, recurso, descripcion, etiquetas, estado, ruta) FROM stdin;
    public          appdist    false    220   n      t           0    0 1   categoriadiscapacidad_idcategoriadiscapacidad_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.categoriadiscapacidad_idcategoriadiscapacidad_seq', 7, true);
          public          appdist    false    201            u           0    0 '   categoriarecurso_idcategoriarecurso_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.categoriarecurso_idcategoriarecurso_seq', 1, true);
          public          appdist    false    203            v           0    0    ciudad_idciudad_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.ciudad_idciudad_seq', 3, true);
          public          appdist    false    205            w           0    0    concepto_idconcepto_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.concepto_idconcepto_seq', 77, true);
          public          appdist    false    207            x           0    0    discapacidad_iddiscapacidad_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.discapacidad_iddiscapacidad_seq', 90, true);
          public          appdist    false    209            y           0    0    lugares_idlugar_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.lugares_idlugar_seq', 40, true);
          public          appdist    false    211            z           0    0    pais_idpais_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.pais_idpais_seq', 1, false);
          public          appdist    false    213            {           0    0    persona_idpersona_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.persona_idpersona_seq', 27, true);
          public          appdist    false    215            |           0    0    provincia_idprovincia_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.provincia_idprovincia_seq', 3, true);
          public          appdist    false    217            }           0    0    recurso_idrecurso_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.recurso_idrecurso_seq', 93, true);
          public          appdist    false    219            ?           2606    41513 .   categoriadiscapacidad pk_categoriadiscapacidad 
   CONSTRAINT     ?   ALTER TABLE ONLY public.categoriadiscapacidad
    ADD CONSTRAINT pk_categoriadiscapacidad PRIMARY KEY (idcategoriadiscapacidad);
 X   ALTER TABLE ONLY public.categoriadiscapacidad DROP CONSTRAINT pk_categoriadiscapacidad;
       public            appdist    false    202            ?           2606    41522 $   categoriarecurso pk_categoriarecurso 
   CONSTRAINT     r   ALTER TABLE ONLY public.categoriarecurso
    ADD CONSTRAINT pk_categoriarecurso PRIMARY KEY (idcategoriarecurso);
 N   ALTER TABLE ONLY public.categoriarecurso DROP CONSTRAINT pk_categoriarecurso;
       public            appdist    false    204            ?           2606    41531    ciudad pk_ciudad 
   CONSTRAINT     T   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT pk_ciudad PRIMARY KEY (idciudad);
 :   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT pk_ciudad;
       public            appdist    false    206            ?           2606    41544    concepto pk_concepto 
   CONSTRAINT     Z   ALTER TABLE ONLY public.concepto
    ADD CONSTRAINT pk_concepto PRIMARY KEY (idconcepto);
 >   ALTER TABLE ONLY public.concepto DROP CONSTRAINT pk_concepto;
       public            appdist    false    208            ?           2606    41554    discapacidad pk_discapacidad 
   CONSTRAINT     f   ALTER TABLE ONLY public.discapacidad
    ADD CONSTRAINT pk_discapacidad PRIMARY KEY (iddiscapacidad);
 F   ALTER TABLE ONLY public.discapacidad DROP CONSTRAINT pk_discapacidad;
       public            appdist    false    210            ?           2606    41567    lugares pk_lugares 
   CONSTRAINT     U   ALTER TABLE ONLY public.lugares
    ADD CONSTRAINT pk_lugares PRIMARY KEY (idlugar);
 <   ALTER TABLE ONLY public.lugares DROP CONSTRAINT pk_lugares;
       public            appdist    false    212            ?           2606    41577    pais pk_pais 
   CONSTRAINT     N   ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pk_pais PRIMARY KEY (idpais);
 6   ALTER TABLE ONLY public.pais DROP CONSTRAINT pk_pais;
       public            appdist    false    214            ?           2606    41586    persona pk_persona 
   CONSTRAINT     W   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT pk_persona PRIMARY KEY (idpersona);
 <   ALTER TABLE ONLY public.persona DROP CONSTRAINT pk_persona;
       public            appdist    false    216            ?           2606    41596    provincia pk_provincia 
   CONSTRAINT     ]   ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT pk_provincia PRIMARY KEY (idprovincia);
 @   ALTER TABLE ONLY public.provincia DROP CONSTRAINT pk_provincia;
       public            appdist    false    218            ?           2606    41609    recurso pk_recurso 
   CONSTRAINT     W   ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT pk_recurso PRIMARY KEY (idrecurso);
 <   ALTER TABLE ONLY public.recurso DROP CONSTRAINT pk_recurso;
       public            appdist    false    220            ?           1259    41514    categoriadiscapacidad_pk    INDEX     t   CREATE UNIQUE INDEX categoriadiscapacidad_pk ON public.categoriadiscapacidad USING btree (idcategoriadiscapacidad);
 ,   DROP INDEX public.categoriadiscapacidad_pk;
       public            appdist    false    202            ?           1259    41523    categoriarecurso_pk    INDEX     e   CREATE UNIQUE INDEX categoriarecurso_pk ON public.categoriarecurso USING btree (idcategoriarecurso);
 '   DROP INDEX public.categoriarecurso_pk;
       public            appdist    false    204            ?           1259    41532 	   ciudad_pk    INDEX     G   CREATE UNIQUE INDEX ciudad_pk ON public.ciudad USING btree (idciudad);
    DROP INDEX public.ciudad_pk;
       public            appdist    false    206            ?           1259    41588    ciudad_tutor_fk    INDEX     G   CREATE INDEX ciudad_tutor_fk ON public.persona USING btree (idciudad);
 #   DROP INDEX public.ciudad_tutor_fk;
       public            appdist    false    216            ?           1259    41545    concepto_pk    INDEX     M   CREATE UNIQUE INDEX concepto_pk ON public.concepto USING btree (idconcepto);
    DROP INDEX public.concepto_pk;
       public            appdist    false    208            ?           1259    41555    discapacidad_pk    INDEX     Y   CREATE UNIQUE INDEX discapacidad_pk ON public.discapacidad USING btree (iddiscapacidad);
 #   DROP INDEX public.discapacidad_pk;
       public            appdist    false    210            ?           1259    41568 
   lugares_pk    INDEX     H   CREATE UNIQUE INDEX lugares_pk ON public.lugares USING btree (idlugar);
    DROP INDEX public.lugares_pk;
       public            appdist    false    212            ?           1259    41578    pais_pk    INDEX     A   CREATE UNIQUE INDEX pais_pk ON public.pais USING btree (idpais);
    DROP INDEX public.pais_pk;
       public            appdist    false    214            ?           1259    41598    pais_provincia_fk    INDEX     I   CREATE INDEX pais_provincia_fk ON public.provincia USING btree (idpais);
 %   DROP INDEX public.pais_provincia_fk;
       public            appdist    false    218            ?           1259    41587 
   persona_pk    INDEX     J   CREATE UNIQUE INDEX persona_pk ON public.persona USING btree (idpersona);
    DROP INDEX public.persona_pk;
       public            appdist    false    216            ?           1259    41533    provincia_ciudad_fk    INDEX     M   CREATE INDEX provincia_ciudad_fk ON public.ciudad USING btree (idprovincia);
 '   DROP INDEX public.provincia_ciudad_fk;
       public            appdist    false    206            ?           1259    41597    provincia_pk    INDEX     P   CREATE UNIQUE INDEX provincia_pk ON public.provincia USING btree (idprovincia);
     DROP INDEX public.provincia_pk;
       public            appdist    false    218            ?           1259    41610 
   recurso_pk    INDEX     J   CREATE UNIQUE INDEX recurso_pk ON public.recurso USING btree (idrecurso);
    DROP INDEX public.recurso_pk;
       public            appdist    false    220            ?           1259    41569    relationship_4_fk    INDEX     I   CREATE INDEX relationship_4_fk ON public.lugares USING btree (idciudad);
 %   DROP INDEX public.relationship_4_fk;
       public            appdist    false    212            ?           1259    41611    relationship_5_fk    INDEX     S   CREATE INDEX relationship_5_fk ON public.recurso USING btree (idcategoriarecurso);
 %   DROP INDEX public.relationship_5_fk;
       public            appdist    false    220            ?           1259    41612    relationship_6_fk    INDEX     O   CREATE INDEX relationship_6_fk ON public.recurso USING btree (iddiscapacidad);
 %   DROP INDEX public.relationship_6_fk;
       public            appdist    false    220            ?           1259    41546    relationship_7_fk    INDEX     P   CREATE INDEX relationship_7_fk ON public.concepto USING btree (iddiscapacidad);
 %   DROP INDEX public.relationship_7_fk;
       public            appdist    false    208            ?           1259    41556    relationship_8_fk    INDEX     ]   CREATE INDEX relationship_8_fk ON public.discapacidad USING btree (idcategoriadiscapacidad);
 %   DROP INDEX public.relationship_8_fk;
       public            appdist    false    210            L           2618    43246    discapacidadcantidad _RETURN    RULE     ?  CREATE OR REPLACE VIEW public.discapacidadcantidad AS
 SELECT d.iddiscapacidad,
    d.discapacidad,
    count(r.iddiscapacidad) AS recursos,
    count(c.iddiscapacidad) AS conceptos
   FROM ((public.discapacidad d
     FULL JOIN public.recurso r ON ((d.iddiscapacidad = r.iddiscapacidad)))
     FULL JOIN public.concepto c ON ((c.iddiscapacidad = d.iddiscapacidad)))
  GROUP BY d.iddiscapacidad;
 ?   CREATE OR REPLACE VIEW public.discapacidadcantidad AS
SELECT
    NULL::integer AS iddiscapacidad,
    NULL::character varying(50) AS discapacidad,
    NULL::bigint AS recursos,
    NULL::bigint AS conceptos;
       public          appdist    false    210    208    220    2979    210    230            M           2618    43250    vwdiscapacidadcantidad _RETURN    RULE     ?  CREATE OR REPLACE VIEW public.vwdiscapacidadcantidad AS
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
 ?   CREATE OR REPLACE VIEW public.vwdiscapacidadcantidad AS
SELECT
    NULL::integer AS iddiscapacidad,
    NULL::character varying(50) AS discapacidad,
    NULL::bigint AS recursos,
    NULL::bigint AS conceptos;
       public          appdist    false    2979    220    210    210    208    231            ?           2606    41613    ciudad fk_ci_provincia_pr    FK CONSTRAINT     ?   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT fk_ci_provincia_pr FOREIGN KEY (idprovincia) REFERENCES public.provincia(idprovincia) ON UPDATE RESTRICT ON DELETE RESTRICT;
 C   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT fk_ci_provincia_pr;
       public          appdist    false    206    2994    218            ?           2606    41618    concepto fk_co_relations_di    FK CONSTRAINT     ?   ALTER TABLE ONLY public.concepto
    ADD CONSTRAINT fk_co_relations_di FOREIGN KEY (iddiscapacidad) REFERENCES public.discapacidad(iddiscapacidad) ON UPDATE RESTRICT ON DELETE RESTRICT;
 E   ALTER TABLE ONLY public.concepto DROP CONSTRAINT fk_co_relations_di;
       public          appdist    false    2979    210    208            ?           2606    41623    discapacidad fk_di_relations_ca    FK CONSTRAINT     ?   ALTER TABLE ONLY public.discapacidad
    ADD CONSTRAINT fk_di_relations_ca FOREIGN KEY (idcategoriadiscapacidad) REFERENCES public.categoriadiscapacidad(idcategoriadiscapacidad) ON UPDATE RESTRICT ON DELETE RESTRICT;
 I   ALTER TABLE ONLY public.discapacidad DROP CONSTRAINT fk_di_relations_ca;
       public          appdist    false    2965    210    202            ?           2606    41628    lugares fk_lu_relations_ci    FK CONSTRAINT     ?   ALTER TABLE ONLY public.lugares
    ADD CONSTRAINT fk_lu_relations_ci FOREIGN KEY (idciudad) REFERENCES public.ciudad(idciudad) ON UPDATE RESTRICT ON DELETE RESTRICT;
 D   ALTER TABLE ONLY public.lugares DROP CONSTRAINT fk_lu_relations_ci;
       public          appdist    false    212    206    2971            ?           2606    41633    persona fk_pe_ciudad_tu_ci    FK CONSTRAINT     ?   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT fk_pe_ciudad_tu_ci FOREIGN KEY (idciudad) REFERENCES public.ciudad(idciudad) ON UPDATE RESTRICT ON DELETE RESTRICT;
 D   ALTER TABLE ONLY public.persona DROP CONSTRAINT fk_pe_ciudad_tu_ci;
       public          appdist    false    206    216    2971            ?           2606    41638    provincia fk_pr_pais_prov_pa    FK CONSTRAINT     ?   ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT fk_pr_pais_prov_pa FOREIGN KEY (idpais) REFERENCES public.pais(idpais) ON UPDATE RESTRICT ON DELETE RESTRICT;
 F   ALTER TABLE ONLY public.provincia DROP CONSTRAINT fk_pr_pais_prov_pa;
       public          appdist    false    2987    214    218            ?           2606    41643    recurso fk_re_relations_ca    FK CONSTRAINT     ?   ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT fk_re_relations_ca FOREIGN KEY (idcategoriarecurso) REFERENCES public.categoriarecurso(idcategoriarecurso) ON UPDATE RESTRICT ON DELETE RESTRICT;
 D   ALTER TABLE ONLY public.recurso DROP CONSTRAINT fk_re_relations_ca;
       public          appdist    false    2968    220    204            ?           2606    41648    recurso fk_re_relations_di    FK CONSTRAINT     ?   ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT fk_re_relations_di FOREIGN KEY (iddiscapacidad) REFERENCES public.discapacidad(iddiscapacidad) ON UPDATE RESTRICT ON DELETE RESTRICT;
 D   ALTER TABLE ONLY public.recurso DROP CONSTRAINT fk_re_relations_di;
       public          appdist    false    2979    220    210            P   `   x?3?t?,NN,HL?LILQH,M?,?,K?2BO;??839??U83?$5'5??41??Uʷ4?$? '??U? hN~q~r&P??TYf1Ƞ=... >4?      R   C   x?3??*MM?/?2?t,M???2?t,J??,??2??LI??2???MLO??2?HL??6/?+F??? ?      T   I  x?]W=?7?G?bB_?"惜	??J?)?"?*?.?	?|???-??C??9??{ݳ??"?=`?F??_?D&?~??????Df??.?y?=??S~??k+o???D???9?[n?Z?dJ8??V??KF??N?9ym????g????3??6~?Bk[??P?????ݹTI?????'@n??F??w??An{_?k+f???]|]?x??Al????ha0ڷ????xݵ????p{?:?+G?Q???????E[wg(??d???::L?=??d??\?? J?????x??????ȂI????a?????j???Jr????hi?m??VV????V-J
?׷??EI	??:7?DY??J?N?]Wߞ/?8?1??Ϗ?$!????\?????????O?v???????2u尰?????	?l{??? ƕ-????=?n??u????_???LB??cGgei4?>?n??K?f???gY-Ztu/CS????l&hh???, q?M'Q??
[N?' k? 譞(7d\?99O?.???i4?V8	?<???
?9?I???z?Sw?>??H?? ????;/??j?d\n:??B??M??=ۓd`B??2?ƭ;????\pJ?4?vgn9?}?ڠ?:?qץ=?
??@?4.?z?LA????y???UKP+\[Kf T???E??0 =?????Y
^?l#i0K?q??t'΀E?=*??Y???'q?)>?X???W?E6?a??
W	?Y	?X??}1|m??{?`?5E?+?oPPO????_??e`V??qGAC߳??$???X?oA?c????G+h???????n??????r"oo9TZ?J#\????>?V????? D??^2??=?>2J?d]ãtB?Sl|?????2W?
Wǌ<W?????????'\v;ll8??G?? %???uR?yз?e8?sX??.????Eߖ<????'?O?T#3?*L?w;Fl?_?Ư6!??Tz<3II}??Ŋ)f??X??6?^c???^?y?O???]fM38?I????_?efR(?mc?t?R8IŔ?F????X??Ͱ?ޞ??*T?7?W?^mk).?*gX^l??b?W(o??'+?߈??l?'4b???Zь?????-#v????&?????G???I ??@?`????c?gO?FPFD??t<'?^dWw??c?h ??=??iOBp???FΪT?!m\??^#{????);&M? ƃ?ɴ5??!?@??d??/&A???#T??V*Q????v?$?????Ke4?8??џ???#3?8???xŬ?
??\<
???iOZ?L?F{?9$M?????_?뉙?X?c??4?|3TAg??[H??????$c?Ɛ??b?'6r?^@.V?\?????ۣ?W??`??y?(?;ݾ	5M???S?h؀???w???(?W?JrK-W????H????x@??.???!?H2(?ꌔ*?Z??L6~??+@1<W?eN~k?Y}??????1???????WR??????F??<?:=hp???ĐLP??ս??`?'i??Wwg?Y3?Bwv`;?Ȩa7s??n?r?(??Ǣ?#9#9?4??s?????@:?f'???r'??#??V?B?!????q?????????%?sg???}g?aY?Mw?V?9ʪZi?C݉????%???]8?A=nP?A?????Q?5???͌?l?????5*}??"ȩ?J????}??m?ѭG???.J?f?T?(?BRZ{M?4lP??c
?3n\???)??j?>3??@B?,?g?AܞP??%????i????A!??d|%?Ql̏?dQ???`??}???b
^?v:q:Nd???*?XPT?h~^^1??d?>?Ӑ?!?@Ɂ????&T0??p>_ Wr$ɡ???Y?6A?O??|?[????'???b8H}?>?I?a|?s?dЌ>?<?????.:?a4??N?Q??v??????	??????Z3???1??K?C??{!??D??;??KW??????R?z?C?e3??s?0??????^??`?yE      V      x??][o9?~v~Ǎb@???$??qOgᤃ?g??j1??(?IYMVɑ؟??<?a??????9???$۲㤭??'???b???ύ??=~??$a6?D??z_?P?}????`caR???#9T??ϭ??,?f(U???T??l??P?,?Ӷ????÷?M???xw?#m?a????s?6?@??=?Fr???if?݇??X????om??????]?\??P???*55ౌ&??e??\ٶF?e???ܿ???M??権?3ߋ???h????/^??ۋ?']l??_U?&O??ٓn???[??(N?L?w3?'??˭M?H?2??[?k/,??????HZiqxp_ʙfRB?"?b????X?	?h?[&Xbt??ڑq?M
&X(m??L?Y?m?[h??4????m??G?0?*?E}??[??3??l?ma?xe~JZpɰ???L
?-?l`K??`???eF
;?8%?~
????T??m??pVζP????*+??*?n<ʸ
u}bt?h?%|p?%?%?ف?Q??P[?&|??????#C?x?~?M2S0y?????0Է1,3LD˽!_!??2?c\v쏈?????/?U?FXh?D ???|U??a??+?|?+?i|??i?f?:9??C?F??AȈ-\?׋?????S?W1s?#  ?^????\E????@?6???ba3n?;?u֎?
D???sѷ?ٞ???H???f@9?{{??6מ????????ς#Xg́????6}??????W?O3?l??M???u?:;u>?y??Tx?f???7fy??5D?l??@??l?????j %jg??v?ԏ?c?`?9o??o?NN??޳?G?U?}?b?[?W@??~???9r??Ì8??G?CtG[Ϟ?rL????VV5-?v?+?}'?L??У$}@?NbD??0???켇?@I??#p??f??????!S????\?׷:{??gWmW?-0????슘m??3??}?N '???[?????ɷY? ?ۊ?urд??v??$H???f???F?:???^	cx??FF????4???.p?3?N&"??`????1!????G;???{? ? Y.???s?_vV?????-c>?R??D?T??jW]?????.??S`c????:?{Z?EׂH&?+ ٓ?À????????????(౅?*@U2?}֦O5????P??yxS??/???xa??:1t??I??6L??&?PI?6PYu???XR?(9??x6???z?(k???r_??uhP???s`@?w!?L ??΅N?n?*?i?,??j7G???V??&???????-??6ב????o=????L҃*???ܻP??$??+q????+/?	?0??K M??|?/r????G?A??p7 ?v?I惪??X?oR?9^򷴼:-?̢?

)??t?.b$?9)?V(P`??J?S?(?@5????@???[M_E???P?w??N?`S?SI:~c෦7????ו???H??$?-a?+7????M?ѱFs; ?~uY???Sʉ??kб??'?????O???j?? 4Zb?a??"???S??B?
I??,l??h?3??z??/???????M????v?j/???I{Dz???v???垪?З?l???????w~Ms???`{%?Ј????[?{????4?~K????kb???@?Ʃϗ?dD?/\	?N???M?,?0?@?????v???W??%0?H4?mP?UQ{?@jԮj?_?ZT?@w?x??+?????S??L]???W??X?e4?H
`??????p?'?0?~??t???">F/?Ma{¯c? ??T???Z?D??5c\9??]?~?͢J?J?Q?bL?\?e??L,˺?lu???wP?k???Zw?????D??y???2?_?U???t?I?}8???;l?>?FF` BO?q????g???e2,?$?Fn?`?ʹ?mހ,?U??F)8:?1??4F??z?[?? ???"G?"???1̣~?h?f"?/"S`Ⱥ?9??`?mZ4?? ??????h?a?5b??C??m?r??G}m??V??Ť?X?~$x??ȭ	n@??l?t6???PabA?۞?1??????'?v(?o?m?????E6???/LO??h?a?????????ٸ?G?b?٧???ׯ/W???_?j?0?#ϖO?r?w?xөd?9?;z?|?rt?×?m A?[g?+?0?x?Hպ??fbl?o@s,??`?F{??*SY??ZU???@:?+E?ag??{	???r???᥺??X?g!/???/?Dn?e???O-??S?F?5??؀#o?KvQ'?s?x?٪i%%??? f?3?0D(5@??vZ??rc>Ky̷???\?4"0?ü??{{???؄c? ???䁄9?l sj???&????lB????*M????^`?(-"??t?S?T??V,S??e	?}U?
5???W.??b
q?7?d?<??B)}?%FSư?к=???TC2%?R??ĩ?ᜢ?"=?֩?P???d%?????X??2??*|
?? s????-???̮??^??n?k????e???\?????????_?vyvv?	 3???
?a҃Ҏ?????d4??=?vFi?????8??Ё?ۛ%???~f??????#??wk?0n?;ߣ??]`??s&?;`?x?#?0Q???;a.?S?]?=?T???6?=?b?F:???l,PP83
??? ???6K?]??+8@D?3?/܂Y?Rt~ ????2?L0??1??rS??@ui?????HX,u
?t???????r	ݭ<?$??oC`+??V???	,?*???6X??YZ??S??`??9?L@n??h???0???????=?q??wi?H|# ?3U??U???*X_Lz??(멅0cʮ???`??VЀE???T?Vn??1?Z,?Y!?!>??z?2]?t?r?ƒ9jɧ??w??=?j8???n???e.????6@U?3???t+UU	WR???oz?7#k(e????׺/1?Oܮ>^?!l??`?.p??'5ߐL???X??*b:?X?̈P?%Ѹ?A??AW?-?r#?E?eazbf?~n?d??*Lѧ?9?}?9?żH????F?d|:????c	???qʁDY???f?\????ړŕ?W???zA?????顣?B	?????Y~\??R&???c?)i?ꐦ???<?i?ʽ?͵???'?8Νz???&?o??aiI??Oa??$I$?vbS?X??1?gl?????/Z?g?:?`?3?b?W?"?%.Ž???a?>|3????/N????㿽9<a/^?t???'????i????T߳??v?;?z???|
?????tm?NJ?)?hR;
O??5?=?#???2r3è
g????5?6??0????0^?k?+???X?]??W?D??-?D????/??8?c?N??
?{?|????????hE??ȏ?I>??-??`?]?K??r?b,??2?9i+-?.?????R?N??Z2$+_T??T???ʬΉ? yʎ?|Q?????X?p??n??'#??Jˍ? ?w?g?uCf??PS?$^~-T??r???<?Y?JVJm??(?y?S?g5????m??]6?4O??Ag?aq?wX???HO&t ?SE4???ǝ??HU??&?D5.$?]z#???????f??{F<;??hgQ??Y ???\?Y????3?Aԙ?o???͍?J???}??E??v;ک?=̭?l?d3??;?Tۏ!%')B?^?u-Y1??A??q?.Z?s.t?HC???:?"F3???v?u?E?h?????DF?)$9?f?T?*\???}_+????I$g?VbkZ?Fe(?????9?H? 3#?L3/??[?yh??H????V?+[???????{??,v?????Mx??mRbdM?!𭕌????;`??Q????s?-*?{??????ؔݽI?7&c?F?T???H?&̻	?n¼ B  ???&̻????};!·??wL6?Re?ó5S"?=???!~(7?=?*???L?????M^݋?#*?K&??G??pKk?Ѐr6慻}?????u?? ?ȝ:A?{T?z????q??A?4?]?^7?monomo?f????S??J;????2?5p'????H?l"ԍ?4%??jAN??מQ?'?3??H[??E?? W?H?????ǁ%?A??>ئ?q???B|?Pڣ?Y
??ȆY?&?~??+?׹?8zi?o`??x5a??6JÁ/˦?l??1yOU?e?Duޫ?b?+???zo?B?k??϶q?[???.2|͛?n????
?ޑo?5??1??????>??֕j?`?4d??8?????/??D?S??Eض??PZ?c??I?{???N\w?v'0?p??F???7w??????Zw3T?;ߵ?9L`???X???fɻ?O\??fMz??P???RQ~1???	L?2rG?7s???0? ?L?H?????w<T??+m??$p?~2???|???A???7?\Iz???\???6r7jt?a??
dU4???f?EJ??Y?	P˪1??:?n!??%?+(֥???Yۢ??l\5?3?羸Q$WX_???EN????{??]u?ǯ???y?)??0?`???J?????0.???8H?7?q???K?i?rJ?)m?@?#À?E)??sa?Yg9?2'??,?E???3?t???\?2*s)(?K???
?-????]??|?!??cܫ??G?cS?mh>???????U?Ӣ?;`?TqfG?M=?????Ԡ'?q?5?w?u?}?s??OEk?4?r???t??ڞ??ٮ??N??s׀QL??{??S ?टsW3??*$??Td???2/?ei??4x4C6??y?Yܼ:??????ڹ??<[d?½????MZ?g??<?g*?+7?!MrH??D?7?!T????k*?W*~??u???[???6r??դ??M<?U$I??L?c????I??͔??????;?H???x??Kڶ?QmA?d?[T???????F????-?	?L??]?)?X??ϖ???8?#???`?0S??et?%l?@???&?R;ӅaK??;*pA???l????1&ʔ?3d????'?4??03E0??bo?cNn}??[W ?02v????ܓ?(???????^Z`# Q9?bnXv?F?,???c?Aaǁ?? ????J?@?R?X_?? &*?K%Ω???r??????E8SU?n?=cƊ۫e??w{	~???}???3??d#??gtTyFͰ?cE>@??V??)?~??(9_???ݮ??X"F?,a^????????y????s?????????&?^?,(N?????8ߠ??U?1????&??k???Xnm????2c?ĨP??N?,?"]䂝Y?%M?6??L+??D?p??xBB;??$?!??ZYRtS8??K<$?r?????Z[????>{I?J?X???`??5??2!?v??n1?֛o?;?)??t??S?,??%EE?????~J?{??^?,?(??f??]?-???׋?7ruԍ.o??NA2??\???;???jXԬ+k"??7??"?z|?M?n7ʹt:S???v??"b??H??_:Iz\??B_???4?(??l?!,D?V???8£z???]???Ń_??o?x~O9??w?RT??>?/???z(ҧ?????+?As?n?:vQ'Ȟ_?</???#?????v??,?ǉ?Db%ol??????6???F?@???ނk??p"?t???]b?a??????݇Tr?3??ܗ*|	K?η?	<?Q???<? ??????@??yn(??؁q??u?v???6??(?Y?S3?rԳǘeDaT?oŀB{??x?ա???b,ܙL??%? ???/S??V???DL?V?g?k?Wd???j??w?G???N|-c?u?t???S?????A?ܬ?҉?g?x???j???Ƞ)?X??U?-QD??Y??7t
*?0C??c?????L??>P?t.w]??%p??? R[ij??)???q?mq'??+???H4Vآ???\O?%O?_,?
sƺ~>0lS^?2??:i5tA"'n?YޖWP?)?
p"??7???F??ns???*???M?Y??o?,~???jl@7u5f??=?N?rNCUM?Ν4???rfe #?D?V?9Ⱦb?T?!?X?7???i?O1????]??`?a???a_?ǿ?|?+?`?-?Bc??Hw?,?J?ٶ?:???v$?D?e???>?`???~?ռz?_?zoogmo?k?????_+??VM??N?n?!?L??o?#?6?\? R?ís?f??w??x|?ŷ??̉??	?!?1?????[?[??????b??(T??!?????y?????Ýyd+?SnL???i]U`A9q?]<?Jc~?)8s?L0-ƃ v?~???
?~?????tʁW???:*?.??c???6????{???????P%B??`???a?y???	?儺???6?ˀ??N 喂Ee??U??J}??L?I???c?l?^???C??C?*?g?ٱ?[???`E?x4C?v7x???B??7????"`Р?V??GF???B??xqW??q????/	?Et?0?U????B??NW?$	I?"????2???%??[???!Tx^?20??=?Z?saj?>V??z?c??~
?(???"+???)???IR?ݳ?KFFv'?-С$??3r?r????????2?8?$cn?zj??$??ޔ5ݾPg^???XN(?QY
?8.(????EuT???.
VC?F\?/=i5XiK?k???7d???U?????pO ?0????A????+??+?=??;
??IC?/?B??????L4???|b?pjd;ٻn??[(? OK???{???????o?J??uO?X?,?;~yqa??+
͌?????(?I$???ʽ??v???????D????m?	?>Muc???m?M?׊F|5??TV?&?e?o??(کIj????a?O/?"Y?9V!gRw1?
??ؘ+融???lΊ?P@!'??Eq6^O???47;tpnV*1^?Ԭ????*?1)y??؅F???)zv?yrxd?B??????
??~???%L)?^?;?1Ų!T?<\@??p?Q??/J??:????r?(Y?R?g?ҏac??PIo????Ws?g?Ʒ?bw???????״Gki%}mVt?R?Ă?P?m???ڗ/n?N???(???]?/4a???v_??: e?}????=Z?N?h~??<??uq??"?Jw@n: a??l????f????E?R
?K?8????M0?>/2<T???,?w??ܕ0?&
,?_?fX8g??????????1??i?-?~
tO?I???n< 3??0?@[q??WͅvG?r???>+?a??ʓ?????2-?>??d8????^	???S?Za@/P?ݘ?z?s??RW?i?K??R???T??r??\S???,bTV?p ??z???S??>fz?m???7?*?x\??Č<?B?Ŗ`Y=Ub?
??迮Z?h?|I???C;??.=?ý?<|?PC???iY???+?˟??J?x?|]Ժ??H ?}{?׹w?????Cu      X   ?   x?e?1?0E??9Z5???,ic?Q?TI+?????r1\$&$/?????k??8!-?)v??Ԓ?FJo'?I?[z?$Ɓ???V??? ????Ѡ2??:???HQv?3??L?Y"1?D.???:a?P.h?˙?{?????Jb?cJ?ﱧ???-eŖ:??T??#? ?]?I?      Z     x??V?r?6<?O??9$%?grR%Q'?=?s?????xH@HM?7?c??C??rՋu??L?i/=??????~?AE??ZIj?8???/?U
???f;?\K??Z?쿳U??M?)XIӊ???~???t???5/?(F?&f??*?????Vu??}?(???b?WY?q???f~??z=???ڋ"??|?
P?Ge??T??*֨V??`iX'Y?%?1^u%????-틇?4{??< ?i????^??/Y?$???0??Uy#̞$??U&Y6Msx6???,X?o?Vw?=?8r?_q(?o(???R??2N?e?Q??ML?I??ϱ{	????Kf????Xݕ?Jͩ"?'??>?D7lϵ????y??A???L?M????$???w???կ???z?t?bO??U??a9l??[*[?=.?\7?^??657?OZ`??k??,?x_0???????????^8*b1_?????????????z?(|?<?I?Uj?(J2??;M&IO7ɒ,x?~???k2?ZR???٣?#ZAh?]?|????????Q??r ??Q?l?I ????}???E?7?d??>??e?|?O:(hl?n??????I?g?7?N?mI??x??f?gRL?R,W??`??鳫????VԮQu?????%??????7-fjz??????m????[z???}g?o?<????e?^?4O&??dV ?ƚL?iR?;-?宫? ????wI?І???[46"?RL??n;)?Y1t?t3??/?dUbS?vX?7?????B???1?8?i<t}:??y?Ae??程?o???9]e?yϷ?Sl????C$W??
X?=g????uAZ??䲺b
?7/?y?u??49??????8??@3?<+?bL3?9?>?v??3l?kQ"???d????l?}m?ѡs;?V?J0$?%?
e?s?#R????7r??^???ss????&靎H?]?~4??Ւ??EM?aO?7??"Lb??Ɉl?O?R??
???ȇ?f???Z?ns?Q~??+??3
?!?Y8?㧮E????׸1oN`=??q??5?J?"*?$qT?	?t\??յ?? ???p??v[-oo?7bo?=??R????>~?ԞLŷ9z??5?0|g??T?L??Х??0w??l??8?&??bų<?5?9?????/WwwH??????y?oXٮ??{t?vW???TOѺ?y?:?X?_?&?piK????-??????@??o?~?S?y F ??y\<?A3?&?8??|?\4?$,?4??S?(I??S~/..?`;?{      \      x?3?tM.ML?/??6?4?,?????? B?      ^   ?   x???9n?0E??)r??EK??p@U?4???!B??$PN?F?>?_????4N?W?C^$.$p?I?8??#;[??L??? ??<QL5?	Z??y?3????;?zk<???6t??6?*??\%??,?JW??V.???,?갗?.e?????$%??????;??{?????????P6??ŗZ??R??:?8l?ѽ???	?~E?^WU?ݑl      `     x?-?KN?0???)|DBy-i?*$???b3I??ȏȎ?6=@??c~???~?=?L????7????Uq?&?xǸ???`??՝d?????| vRW??h9x?`???? ^7?ԉ<??xb????MWTG????~??L?q??Jk2T?	??u֐ؓ$?X@oC}???#?И~??N???R ?C0-O?BJ?w$ͻ?E??}??@tE*?{???P]]?Jo]?;??3+^??????lt?????t?rvm#?T??%v8?b^l?q???]??y????/?      b   K  x??V?v?6]S_??H۲c9?8Vzܓ:?=??t3$A)? !U]?_??"???????H??G??,?̝?;wf6KN??Y?^KCB?B?????!?F?v?j%Mky[(j?Ҋ? ??	i??7?}#?X'????N7????E#??_
kD?|A???Z?e?????Ɵ'???V??^TT+?ȧ?????T?M?6?e??V??a?zkR??a?$???/?J???TewW????[o$??{???? ??{??֕?#?y?D|?f~??z????V
??߱??ɑ(m??ɘ??P*??=?Z???}??*2?}q??|??=?WY?b?
c?N"%^.B??BF?,RYd???	0R??޴?͎?#???nU??_?*$4???h??????Vx?e*?ʹ??ݼ? ?۔s????lA?mhC?ˬ???????W?_???zS??-9µ??Ǖ|???"'?,?W-h4U!'8??@D?gB|?u????=?'2????϶???<C???{+?"{???|?]lϯ?y$XkQ#?7?O?;?}?uwg??o(O-U?Մ?"@O6?j?s??[??茋=;H?9????N?:??l;:L?Ȓ??`,Rv??4?t?D~Ƒ?<?H?E?T?L????Bk[V\????G?{i/?pc?M???T? ?~="]r?!?\?????z{n>,x3M??2?]8???~?Z???)?????®?#A??S?G?܂?}?Q??fa??H?F?|?Z?bGc~F7?W>???[?N??????KN?X??ǥ?>į#???K[??Z?FEp?E	??e????^H?|?W?=c??[(Ħd Cw?ꍞ5??){|\????E???Z?Q4A?L????2?hb!\?;EI?{RW?"??M?v?????? ???>[?55a?݋??^?f???????lz<=~qr?6f1?s<P???H[r]Cn?Z???c?
?????S?G?Ny?N????qL??c? ?az<t??? {???X?؛?=?^?!??SI???`3?S?J?K?bЪA[???u??P8	
?3C?l??J???`/??G-S?]c?c??P3e?6`̀1̓???v?(IKF0?#$·?}?a?T??o????~?H!?,??(?YBt/???-?????9???f?????ϝ?k?6?????15?3?1Uc???j0??`@???릵?ƽ}?%?Y0??U?[?&3?X??'??z?K?	<Ov?<?M?C???vw?3j<J>J$m??R????9???`ņ????|u?z喗+??8?㘾??7???+??>ާ??l%?ږN?/??1?"j5?{???8?P??"????h4?U\?     