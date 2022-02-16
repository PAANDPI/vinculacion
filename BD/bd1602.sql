PGDMP         .                z            vinculacion    13.4 (Debian 13.4-1.pgdg100+1)    14.1 �    S           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            T           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            U           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            V           1262    41505    vinculacion    DATABASE     _   CREATE DATABASE vinculacion WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE vinculacion;
                appdist    false            �            1255    43056    cambiarclave(integer, text)    FUNCTION     �   CREATE FUNCTION public.cambiarclave(varidpersona integer, varclave text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.persona
	SET clave = varclave
	WHERE idpersona=varidpersona;
END;
$$;
 H   DROP FUNCTION public.cambiarclave(varidpersona integer, varclave text);
       public          appdist    false            �            1255    41720 7   editarcategoriadiscapacidad(integer, character varying)    FUNCTION     �  CREATE FUNCTION public.editarcategoriadiscapacidad(varidcategoriadiscapacidad integer, varcategoriadiscapacidad character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.categoriadiscapacidad
		SET idcategoriadiscapacidad=varidcategoriadiscapacidad, categoriadiscapacidad=varcategoriadiscapacidad
		WHERE idcategoriadiscapacidad=varidcategoriadiscapacidad;
END;
$$;
 �   DROP FUNCTION public.editarcategoriadiscapacidad(varidcategoriadiscapacidad integer, varcategoriadiscapacidad character varying);
       public          appdist    false            �            1255    41728 2   editarcategoriarecurso(integer, character varying)    FUNCTION     U  CREATE FUNCTION public.editarcategoriarecurso(varidcategoriarecurso integer, varcategoriarecurso character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.categoriarecurso
	SET idcategoriarecurso=varidcategoriarecurso, categoriarecurso=varcategoriarecurso
	WHERE  idcategoriarecurso=varidcategoriarecurso;
END;
$$;
 s   DROP FUNCTION public.editarcategoriarecurso(varidcategoriarecurso integer, varcategoriarecurso character varying);
       public          appdist    false                       1255    41729 :   editarciudad(integer, integer, character varying, boolean)    FUNCTION     I  CREATE FUNCTION public.editarciudad(varidciudad integer, varidprovincia integer, varciudad character varying, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.ciudad
	SET idciudad=varidciudad, idprovincia=varidprovincia, ciudad=varciudad, estado=varestado
	WHERE idciudad=varidciudad;
END;
$$;
 �   DROP FUNCTION public.editarciudad(varidciudad integer, varidprovincia integer, varciudad character varying, varestado boolean);
       public          appdist    false                       1255    41731 ,   editarconcepto(integer, integer, text, text)    FUNCTION     j  CREATE FUNCTION public.editarconcepto(varidconcepto integer, variddiscapacidad integer, vardescripcion text, varetiquetas text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.concepto
	SET idconcepto=varidconcepto, iddiscapacidad=variddiscapacidad, descripcion=vardescripcion, etiquetas=varetiquetas
	WHERE idconcepto=varidconcepto;
	
END;
$$;
    DROP FUNCTION public.editarconcepto(varidconcepto integer, variddiscapacidad integer, vardescripcion text, varetiquetas text);
       public          appdist    false                       1255    41732 7   editardiscapacidad(integer, integer, character varying)    FUNCTION     �  CREATE FUNCTION public.editardiscapacidad(variddiscapacidad integer, varidcategoriadiscapacidad integer, vardiscapacidad character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.discapacidad
	SET iddiscapacidad=variddiscapacidad, idcategoriadiscapacidad=varidcategoriadiscapacidad, discapacidad=vardiscapacidad
	WHERE iddiscapacidad=variddiscapacidad;
END;
$$;
 �   DROP FUNCTION public.editardiscapacidad(variddiscapacidad integer, varidcategoriadiscapacidad integer, vardiscapacidad character varying);
       public          appdist    false            �            1255    41689 J   editarlugar(integer, integer, text, text, numeric, numeric, text, boolean)    FUNCTION     �  CREATE FUNCTION public.editarlugar(varidlugar integer, varidciudad integer, varlugar text, vardescripcion text, varcoordendax numeric, varcoordenday numeric, varetiquetas text, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

	update lugares set idciudad=varIDCiudad, lugar=varlugar,descripcion=vardescripcion,coordendax=varcoordendax,coordenday=varcoordenday,etiqueta=varetiquetas,estado=varestado
  where idlugar=varidlugar;
END;
$$;
 �   DROP FUNCTION public.editarlugar(varidlugar integer, varidciudad integer, varlugar text, vardescripcion text, varcoordendax numeric, varcoordenday numeric, varetiquetas text, varestado boolean);
       public          appdist    false                       1255    41727 B   editarpais(integer, character varying, character varying, boolean)    FUNCTION     k  CREATE FUNCTION public.editarpais(varidpais integer, varpais character varying, varcodigo character varying, varestado boolean) RETURNS void
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
       public          appdist    false                       1255    43055 �   editarpersona(integer, integer, character varying, character varying, character varying, character varying, character varying, boolean, boolean)    FUNCTION       CREATE FUNCTION public.editarpersona(varidpersona integer, varidciudad integer, varnombre character varying, varapellido character varying, vargenero character varying, varusuario character varying, varcorreo character varying, varadmin boolean, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE public.persona
	SET idciudad=varidciudad, nombre=varnombre, apellido=varapellido, genero=vargenero, usuario=varusuario, correo=varcorreo, administrador=varadmin, estado=varestado
	WHERE idpersona=varidpersona;
END;
$$;
   DROP FUNCTION public.editarpersona(varidpersona integer, varidciudad integer, varnombre character varying, varapellido character varying, vargenero character varying, varusuario character varying, varcorreo character varying, varadmin boolean, varestado boolean);
       public          appdist    false                       1255    41733 =   editarprovincia(integer, integer, character varying, boolean)    FUNCTION     =  CREATE FUNCTION public.editarprovincia(varidprovincia integer, varidpais integer, varprovincia character varying, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

	UPDATE public.provincia
	SET idpais=varidpais, provincia=varprovincia, estado=varestado
	WHERE idprovincia=varidprovincia;
END;
$$;
 �   DROP FUNCTION public.editarprovincia(varidprovincia integer, varidpais integer, varprovincia character varying, varestado boolean);
       public          appdist    false                       1255    41734 j   editarrecurso(integer, integer, integer, character varying, character varying, character varying, boolean)    FUNCTION       CREATE FUNCTION public.editarrecurso(varidrecurso integer, varcategoriarecurso integer, variddiscapacidad integer, varrecurso character varying, vardescripcion character varying, varetiquetas character varying, varestado boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

	UPDATE public.recurso
	SET  idcategoriarecurso=varcategoriarecurso, iddiscapacidad=variddiscapacidad, recurso=varrecurso, descripcion=vardescripcion, etiquetas=varetiquetas, estado=varestado
	WHERE idrecurso=varidrecurso;
END;
$$;
 �   DROP FUNCTION public.editarrecurso(varidrecurso integer, varcategoriarecurso integer, variddiscapacidad integer, varrecurso character varying, vardescripcion character varying, varetiquetas character varying, varestado boolean);
       public          appdist    false            �            1255    41653 &   eliminarcategoriadiscapacidad(integer)    FUNCTION     �   CREATE FUNCTION public.eliminarcategoriadiscapacidad(varidcategoriadiscapacidad integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM CategoriaDiscapacidad 
	WHERE varIdCategoriaDiscapacidad = idCategoriaDiscapacidad;
END;
$$;
 X   DROP FUNCTION public.eliminarcategoriadiscapacidad(varidcategoriadiscapacidad integer);
       public          appdist    false            �            1255    43057 !   eliminarcategoriarecurso(integer)    FUNCTION     �   CREATE FUNCTION public.eliminarcategoriarecurso(varidcategoriarecurso integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM CategoriaRecurso 
	WHERE varidcategoriarecurso = idcategoriarecurso;
END;
$$;
 N   DROP FUNCTION public.eliminarcategoriarecurso(varidcategoriarecurso integer);
       public          appdist    false            �            1255    41654    eliminarciudad(integer)    FUNCTION     �   CREATE FUNCTION public.eliminarciudad(varidciudad integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM ciudad 
	WHERE varIdCiudad = idCiudad;
END;
$$;
 :   DROP FUNCTION public.eliminarciudad(varidciudad integer);
       public          appdist    false            �            1255    41655    eliminarconcepto(integer)    FUNCTION     �   CREATE FUNCTION public.eliminarconcepto(varidconcepto integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM concepto 
	WHERE varIdConcepto = idConcepto;
END;
$$;
 >   DROP FUNCTION public.eliminarconcepto(varidconcepto integer);
       public          appdist    false            �            1255    41656    eliminardiscapacidad(integer)    FUNCTION     �   CREATE FUNCTION public.eliminardiscapacidad(variddiscapacidad integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM discapacidad 
	WHERE varIdDiscapacidad = idDiscapacidad;
END;
$$;
 F   DROP FUNCTION public.eliminardiscapacidad(variddiscapacidad integer);
       public          appdist    false            �            1255    41657    eliminarlugares(integer)    FUNCTION     �   CREATE FUNCTION public.eliminarlugares(varidlugar integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM lugares 
	WHERE varIdLugar = idLugar;
END;
$$;
 :   DROP FUNCTION public.eliminarlugares(varidlugar integer);
       public          appdist    false            �            1255    41658    eliminarpais(integer)    FUNCTION     �   CREATE FUNCTION public.eliminarpais(varidpais integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM pais 
	WHERE varIdPais = idPais;
END;
$$;
 6   DROP FUNCTION public.eliminarpais(varidpais integer);
       public          appdist    false            �            1255    41659    eliminarpersona(integer)    FUNCTION     �   CREATE FUNCTION public.eliminarpersona(varidpersona integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM persona 
	WHERE varIdPersona = idPersona;
END;
$$;
 <   DROP FUNCTION public.eliminarpersona(varidpersona integer);
       public          appdist    false            �            1255    41660    eliminarprovincia(integer)    FUNCTION     �   CREATE FUNCTION public.eliminarprovincia(varidprovincia integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM provincia 
	WHERE varIdProvincia = idProvincia;
END;
$$;
 @   DROP FUNCTION public.eliminarprovincia(varidprovincia integer);
       public          appdist    false            �            1255    41661    eliminarrecurso(integer)    FUNCTION     �   CREATE FUNCTION public.eliminarrecurso(varidrecurso integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM recurso 
	WHERE varIdRecurso = idRecurso;
END;
$$;
 <   DROP FUNCTION public.eliminarrecurso(varidrecurso integer);
       public          appdist    false            �            1255    41662 $   habilitardeshabilitarciudad(integer)    FUNCTION     �   CREATE FUNCTION public.habilitardeshabilitarciudad(varidciudad integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE ciudad SET Estado = !Estado
	WHERE varIdCiudad = idCiudad;
END;
$$;
 G   DROP FUNCTION public.habilitardeshabilitarciudad(varidciudad integer);
       public          appdist    false            �            1255    41663 %   habilitardeshabilitarlugares(integer)    FUNCTION     �   CREATE FUNCTION public.habilitardeshabilitarlugares(varidlugar integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE lugares SET Estado = !Estado
	WHERE varIdLugar = IdLugar;
END;
$$;
 G   DROP FUNCTION public.habilitardeshabilitarlugares(varidlugar integer);
       public          appdist    false            �            1255    41664 "   habilitardeshabilitarpais(integer)    FUNCTION     �   CREATE FUNCTION public.habilitardeshabilitarpais(varidpais integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE pais SET Estado = !Estado
	WHERE varIdPais = idPais;
END;
$$;
 C   DROP FUNCTION public.habilitardeshabilitarpais(varidpais integer);
       public          appdist    false            �            1255    41665 %   habilitardeshabilitarpersona(integer)    FUNCTION     �   CREATE FUNCTION public.habilitardeshabilitarpersona(varidpersona integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE Persona SET Estado = !Estado
	WHERE varIDPersona = IDPersona;
END;
$$;
 I   DROP FUNCTION public.habilitardeshabilitarpersona(varidpersona integer);
       public          appdist    false            �            1255    41666 '   habilitardeshabilitarprovincia(integer)    FUNCTION     �   CREATE FUNCTION public.habilitardeshabilitarprovincia(varidprovincia integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE provincia SET Estado = !Estado
	WHERE varIdProvincia = idProvincia;
END;
$$;
 M   DROP FUNCTION public.habilitardeshabilitarprovincia(varidprovincia integer);
       public          appdist    false            �            1255    41667 %   habilitardeshabilitarrecurso(integer)    FUNCTION     �   CREATE FUNCTION public.habilitardeshabilitarrecurso(varidrecurso integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE recurso SET Estado = !Estado
	WHERE varIdRecurso = idRecurso;
END;
$$;
 I   DROP FUNCTION public.habilitardeshabilitarrecurso(varidrecurso integer);
       public          appdist    false            �            1255    41668 0   insertarcategoriadiscapacidad(character varying)    FUNCTION     �   CREATE FUNCTION public.insertarcategoriadiscapacidad(varcategoriadiscapacidad character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO CategoriaDiscapacidad (CategoriaDiscapacidad) 
	VALUES (varCategoriaDiscapacidad);
END;
$$;
 `   DROP FUNCTION public.insertarcategoriadiscapacidad(varcategoriadiscapacidad character varying);
       public          appdist    false            �            1255    41690 +   insertarcategoriarecurso(character varying)    FUNCTION     �   CREATE FUNCTION public.insertarcategoriarecurso(varcategoriarecurso character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO categoriarecurso (categoriarecurso) 
	VALUES (varcategoriarecurso);
END;
$$;
 V   DROP FUNCTION public.insertarcategoriarecurso(varcategoriarecurso character varying);
       public          appdist    false            �            1255    41669 *   insertarciudad(integer, character varying)    FUNCTION     �   CREATE FUNCTION public.insertarciudad(varidprovincia integer, varciudad character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Ciudad (IDProvincia, Ciudad, Estado) 
	VALUES (varIDProvincia, varCiudad, TRUE);
END;
$$;
 Z   DROP FUNCTION public.insertarciudad(varidprovincia integer, varciudad character varying);
       public          appdist    false                       1255    41670 %   insertarconcepto(integer, text, text)    FUNCTION     !  CREATE FUNCTION public.insertarconcepto(variddiscapacidad integer, vardescripcion text, varetiquetas text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO Concepto (IDDiscapacidad, Descripcion, Etiquetas) 
	VALUES (varIDDiscapacidad, varDescripcion, varEtiquetas);
END;
$$;
 j   DROP FUNCTION public.insertarconcepto(variddiscapacidad integer, vardescripcion text, varetiquetas text);
       public          appdist    false            �            1255    42046 0   insertardiscapacidad(character varying, integer)    FUNCTION     ,  CREATE FUNCTION public.insertardiscapacidad(vardiscapacidad character varying, varidcategoriadiscapacidad integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO public.discapacidad(discapacidad,idcategoriadiscapacidad)
	VALUES (vardiscapacidad, varidcategoriadiscapacidad);
END;
$$;
 r   DROP FUNCTION public.insertardiscapacidad(vardiscapacidad character varying, varidcategoriadiscapacidad integer);
       public          appdist    false                       1255    41685 :   insertarlugar(integer, text, text, numeric, numeric, text)    FUNCTION     �  CREATE FUNCTION public.insertarlugar(varidciudad integer, varlugar text, vardescripcion text, varcoordendax numeric, varcoordenday numeric, varetiqueta text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Lugares (IDCiudad, Lugar, Descripcion, CoordendaX, CoordendaY, Etiqueta,Estado) 
	VALUES (varIDCiudad, varLugar, varDescripcion, varCoordendaX, varCoordendaY, varEtiqueta,TRUE);
END;
$$;
 �   DROP FUNCTION public.insertarlugar(varidciudad integer, varlugar text, vardescripcion text, varcoordendax numeric, varcoordenday numeric, varetiqueta text);
       public          appdist    false            �            1255    41673 2   insertarpais(character varying, character varying)    FUNCTION     �   CREATE FUNCTION public.insertarpais(varpais character varying, varcodigo character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Pais (Pais, Codigo, Estado) 
	VALUES (varPais, varCodigo, TRUE);
END;
$$;
 [   DROP FUNCTION public.insertarpais(varpais character varying, varcodigo character varying);
       public          appdist    false                       1255    41674 �   insertarpersona(integer, character varying, character varying, character varying, character varying, character varying, text, boolean)    FUNCTION       CREATE FUNCTION public.insertarpersona(varidciudad integer, varnombre character varying, varapellido character varying, vargenero character varying, varusuario character varying, varcorreo character varying, varclave text, varadmin boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Persona (IDCiudad, Nombre, Apellido,  Genero, 
		Usuario, Correo, Clave, Administrador, Estado) 
	VALUES (varIDCiudad, varNombre, varApellido,vargenero, varUsuario, varCorreo, varClave, varAdmin, TRUE);
END;
$$;
 �   DROP FUNCTION public.insertarpersona(varidciudad integer, varnombre character varying, varapellido character varying, vargenero character varying, varusuario character varying, varcorreo character varying, varclave text, varadmin boolean);
       public          appdist    false            �            1255    41675 -   insertarprovincia(integer, character varying)    FUNCTION     �   CREATE FUNCTION public.insertarprovincia(varidpais integer, varprovincia character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO Provincia (IDPais, Provincia, Estado) 
	VALUES (varIDPais, varProvincia, TRUE);
END;
$$;
 [   DROP FUNCTION public.insertarprovincia(varidpais integer, varprovincia character varying);
       public          appdist    false                       1255    42133 F   insertarrecurso(integer, integer, character varying, text, text, text)    FUNCTION     �  CREATE FUNCTION public.insertarrecurso(varcategoriarecurso integer, variddiscapacidad integer, varrecurso character varying, vardescripcion text, varetiquetas text, varruta text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO recurso (idcategoriarecurso, iddiscapacidad, recurso, descripcion, etiquetas, estado, ruta) 
	VALUES (varcategoriarecurso, variddiscapacidad, varrecurso, vardescripcion, varetiquetas, TRUE, varruta);
END;
$$;
 �   DROP FUNCTION public.insertarrecurso(varcategoriarecurso integer, variddiscapacidad integer, varrecurso character varying, vardescripcion text, varetiquetas text, varruta text);
       public          appdist    false            �            1259    41508    categoriadiscapacidad    TABLE     �   CREATE TABLE public.categoriadiscapacidad (
    idcategoriadiscapacidad integer NOT NULL,
    categoriadiscapacidad character varying(25) NOT NULL
);
 )   DROP TABLE public.categoriadiscapacidad;
       public         heap    appdist    false            �            1259    41506 1   categoriadiscapacidad_idcategoriadiscapacidad_seq    SEQUENCE     �   CREATE SEQUENCE public.categoriadiscapacidad_idcategoriadiscapacidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public.categoriadiscapacidad_idcategoriadiscapacidad_seq;
       public          appdist    false    201            W           0    0 1   categoriadiscapacidad_idcategoriadiscapacidad_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.categoriadiscapacidad_idcategoriadiscapacidad_seq OWNED BY public.categoriadiscapacidad.idcategoriadiscapacidad;
          public          appdist    false    200            �            1259    41517    categoriarecurso    TABLE     �   CREATE TABLE public.categoriarecurso (
    idcategoriarecurso integer NOT NULL,
    categoriarecurso character varying(25) NOT NULL
);
 $   DROP TABLE public.categoriarecurso;
       public         heap    appdist    false            �            1259    41515 '   categoriarecurso_idcategoriarecurso_seq    SEQUENCE     �   CREATE SEQUENCE public.categoriarecurso_idcategoriarecurso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.categoriarecurso_idcategoriarecurso_seq;
       public          appdist    false    203            X           0    0 '   categoriarecurso_idcategoriarecurso_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.categoriarecurso_idcategoriarecurso_seq OWNED BY public.categoriarecurso.idcategoriarecurso;
          public          appdist    false    202            �            1259    41526    ciudad    TABLE     �   CREATE TABLE public.ciudad (
    idciudad integer NOT NULL,
    idprovincia integer NOT NULL,
    ciudad character varying(30) NOT NULL,
    estado boolean NOT NULL
);
    DROP TABLE public.ciudad;
       public         heap    appdist    false            �            1259    41524    ciudad_idciudad_seq    SEQUENCE     �   CREATE SEQUENCE public.ciudad_idciudad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.ciudad_idciudad_seq;
       public          appdist    false    205            Y           0    0    ciudad_idciudad_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.ciudad_idciudad_seq OWNED BY public.ciudad.idciudad;
          public          appdist    false    204            �            1259    41536    concepto    TABLE     �   CREATE TABLE public.concepto (
    idconcepto integer NOT NULL,
    iddiscapacidad integer,
    descripcion text NOT NULL,
    etiquetas text NOT NULL
);
    DROP TABLE public.concepto;
       public         heap    appdist    false            �            1259    41534    concepto_idconcepto_seq    SEQUENCE     �   CREATE SEQUENCE public.concepto_idconcepto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.concepto_idconcepto_seq;
       public          appdist    false    207            Z           0    0    concepto_idconcepto_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.concepto_idconcepto_seq OWNED BY public.concepto.idconcepto;
          public          appdist    false    206            �            1259    41549    discapacidad    TABLE     �   CREATE TABLE public.discapacidad (
    iddiscapacidad integer NOT NULL,
    idcategoriadiscapacidad integer,
    discapacidad character varying(50) NOT NULL
);
     DROP TABLE public.discapacidad;
       public         heap    appdist    false            �            1259    41547    discapacidad_iddiscapacidad_seq    SEQUENCE     �   CREATE SEQUENCE public.discapacidad_iddiscapacidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.discapacidad_iddiscapacidad_seq;
       public          appdist    false    209            [           0    0    discapacidad_iddiscapacidad_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.discapacidad_iddiscapacidad_seq OWNED BY public.discapacidad.iddiscapacidad;
          public          appdist    false    208            �            1259    41559    lugares    TABLE     $  CREATE TABLE public.lugares (
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
       public         heap    appdist    false            �            1259    41557    lugares_idlugar_seq    SEQUENCE     �   CREATE SEQUENCE public.lugares_idlugar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.lugares_idlugar_seq;
       public          appdist    false    211            \           0    0    lugares_idlugar_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.lugares_idlugar_seq OWNED BY public.lugares.idlugar;
          public          appdist    false    210            �            1259    41572    pais    TABLE     �   CREATE TABLE public.pais (
    idpais integer NOT NULL,
    pais character varying(40) NOT NULL,
    codigo character(4) NOT NULL,
    estado boolean NOT NULL
);
    DROP TABLE public.pais;
       public         heap    appdist    false            �            1259    41570    pais_idpais_seq    SEQUENCE     �   CREATE SEQUENCE public.pais_idpais_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.pais_idpais_seq;
       public          appdist    false    213            ]           0    0    pais_idpais_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.pais_idpais_seq OWNED BY public.pais.idpais;
          public          appdist    false    212            �            1259    41581    persona    TABLE     �  CREATE TABLE public.persona (
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
       public         heap    appdist    false            �            1259    41579    persona_idpersona_seq    SEQUENCE     �   CREATE SEQUENCE public.persona_idpersona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.persona_idpersona_seq;
       public          appdist    false    215            ^           0    0    persona_idpersona_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.persona_idpersona_seq OWNED BY public.persona.idpersona;
          public          appdist    false    214            �            1259    41591 	   provincia    TABLE     �   CREATE TABLE public.provincia (
    idprovincia integer NOT NULL,
    idpais integer NOT NULL,
    provincia character varying(30) NOT NULL,
    estado boolean NOT NULL
);
    DROP TABLE public.provincia;
       public         heap    appdist    false            �            1259    41589    provincia_idprovincia_seq    SEQUENCE     �   CREATE SEQUENCE public.provincia_idprovincia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.provincia_idprovincia_seq;
       public          appdist    false    217            _           0    0    provincia_idprovincia_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.provincia_idprovincia_seq OWNED BY public.provincia.idprovincia;
          public          appdist    false    216            �            1259    41601    recurso    TABLE     +  CREATE TABLE public.recurso (
    idrecurso integer NOT NULL,
    idcategoriarecurso integer NOT NULL,
    iddiscapacidad integer NOT NULL,
    recurso character varying(25) NOT NULL,
    descripcion text NOT NULL,
    etiquetas text NOT NULL,
    estado boolean NOT NULL,
    ruta text NOT NULL
);
    DROP TABLE public.recurso;
       public         heap    appdist    false            �            1259    41599    recurso_idrecurso_seq    SEQUENCE     �   CREATE SEQUENCE public.recurso_idrecurso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.recurso_idrecurso_seq;
       public          appdist    false    219            `           0    0    recurso_idrecurso_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.recurso_idrecurso_seq OWNED BY public.recurso.idrecurso;
          public          appdist    false    218            �            1259    41740    vwcategoriadiscapacidad    VIEW     �   CREATE VIEW public.vwcategoriadiscapacidad AS
 SELECT categoriadiscapacidad.idcategoriadiscapacidad,
    categoriadiscapacidad.categoriadiscapacidad
   FROM public.categoriadiscapacidad;
 *   DROP VIEW public.vwcategoriadiscapacidad;
       public          appdist    false    201    201            �            1259    41744    vwcategoriarecurso    VIEW     �   CREATE VIEW public.vwcategoriarecurso AS
 SELECT categoriarecurso.idcategoriarecurso,
    categoriarecurso.categoriarecurso
   FROM public.categoriarecurso;
 %   DROP VIEW public.vwcategoriarecurso;
       public          appdist    false    203    203            �            1259    41748    vwciudad    VIEW     �   CREATE VIEW public.vwciudad AS
 SELECT c.idciudad,
    c.idprovincia,
    c.ciudad,
    c.estado,
    p.provincia
   FROM (public.ciudad c
     JOIN public.provincia p ON ((c.idprovincia = p.idprovincia)));
    DROP VIEW public.vwciudad;
       public          appdist    false    205    217    217    205    205    205            �            1259    42213 
   vwconcepto    VIEW     �   CREATE VIEW public.vwconcepto AS
 SELECT c.idconcepto,
    c.iddiscapacidad,
    d.discapacidad,
    c.descripcion,
    c.etiquetas
   FROM (public.concepto c
     JOIN public.discapacidad d ON ((c.iddiscapacidad = d.iddiscapacidad)));
    DROP VIEW public.vwconcepto;
       public          appdist    false    207    207    207    209    209    207            �            1259    42209    vwdiscapacidad    VIEW       CREATE VIEW public.vwdiscapacidad AS
 SELECT d.iddiscapacidad,
    d.idcategoriadiscapacidad,
    cd.categoriadiscapacidad,
    d.discapacidad
   FROM (public.discapacidad d
     JOIN public.categoriadiscapacidad cd ON ((d.idcategoriadiscapacidad = cd.idcategoriadiscapacidad)));
 !   DROP VIEW public.vwdiscapacidad;
       public          appdist    false    209    209    209    201    201            �            1259    41735    vwlugar    VIEW     �  CREATE VIEW public.vwlugar AS
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
       public          appdist    false    211    211    213    213    217    217    217    205    205    205    211    211    211    211    211    211            �            1259    41760    vwpais    VIEW     w   CREATE VIEW public.vwpais AS
 SELECT pais.idpais,
    pais.pais,
    pais.codigo,
    pais.estado
   FROM public.pais;
    DROP VIEW public.vwpais;
       public          appdist    false    213    213    213    213            �            1259    41806 	   vwpersona    VIEW        CREATE VIEW public.vwpersona AS
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
       public          appdist    false    215    205    205    215    215    215    215    215    215    215    215    215            �            1259    41764    vwprovincia    VIEW     �   CREATE VIEW public.vwprovincia AS
 SELECT p.idprovincia,
    pa.pais,
    p.provincia,
    p.estado
   FROM (public.provincia p
     JOIN public.pais pa ON ((p.idpais = pa.idpais)));
    DROP VIEW public.vwprovincia;
       public          appdist    false    217    217    217    217    213    213            �            1259    42217 	   vwrecurso    VIEW     �  CREATE VIEW public.vwrecurso AS
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
       public          appdist    false    219    203    219    219    219    219    219    219    219    209    209    203            y           2604    41511 -   categoriadiscapacidad idcategoriadiscapacidad    DEFAULT     �   ALTER TABLE ONLY public.categoriadiscapacidad ALTER COLUMN idcategoriadiscapacidad SET DEFAULT nextval('public.categoriadiscapacidad_idcategoriadiscapacidad_seq'::regclass);
 \   ALTER TABLE public.categoriadiscapacidad ALTER COLUMN idcategoriadiscapacidad DROP DEFAULT;
       public          appdist    false    201    200    201            z           2604    41520 #   categoriarecurso idcategoriarecurso    DEFAULT     �   ALTER TABLE ONLY public.categoriarecurso ALTER COLUMN idcategoriarecurso SET DEFAULT nextval('public.categoriarecurso_idcategoriarecurso_seq'::regclass);
 R   ALTER TABLE public.categoriarecurso ALTER COLUMN idcategoriarecurso DROP DEFAULT;
       public          appdist    false    202    203    203            {           2604    41529    ciudad idciudad    DEFAULT     r   ALTER TABLE ONLY public.ciudad ALTER COLUMN idciudad SET DEFAULT nextval('public.ciudad_idciudad_seq'::regclass);
 >   ALTER TABLE public.ciudad ALTER COLUMN idciudad DROP DEFAULT;
       public          appdist    false    204    205    205            |           2604    41539    concepto idconcepto    DEFAULT     z   ALTER TABLE ONLY public.concepto ALTER COLUMN idconcepto SET DEFAULT nextval('public.concepto_idconcepto_seq'::regclass);
 B   ALTER TABLE public.concepto ALTER COLUMN idconcepto DROP DEFAULT;
       public          appdist    false    206    207    207            }           2604    41552    discapacidad iddiscapacidad    DEFAULT     �   ALTER TABLE ONLY public.discapacidad ALTER COLUMN iddiscapacidad SET DEFAULT nextval('public.discapacidad_iddiscapacidad_seq'::regclass);
 J   ALTER TABLE public.discapacidad ALTER COLUMN iddiscapacidad DROP DEFAULT;
       public          appdist    false    208    209    209            ~           2604    41562    lugares idlugar    DEFAULT     r   ALTER TABLE ONLY public.lugares ALTER COLUMN idlugar SET DEFAULT nextval('public.lugares_idlugar_seq'::regclass);
 >   ALTER TABLE public.lugares ALTER COLUMN idlugar DROP DEFAULT;
       public          appdist    false    210    211    211                       2604    41575    pais idpais    DEFAULT     j   ALTER TABLE ONLY public.pais ALTER COLUMN idpais SET DEFAULT nextval('public.pais_idpais_seq'::regclass);
 :   ALTER TABLE public.pais ALTER COLUMN idpais DROP DEFAULT;
       public          appdist    false    212    213    213            �           2604    41584    persona idpersona    DEFAULT     v   ALTER TABLE ONLY public.persona ALTER COLUMN idpersona SET DEFAULT nextval('public.persona_idpersona_seq'::regclass);
 @   ALTER TABLE public.persona ALTER COLUMN idpersona DROP DEFAULT;
       public          appdist    false    214    215    215            �           2604    41594    provincia idprovincia    DEFAULT     ~   ALTER TABLE ONLY public.provincia ALTER COLUMN idprovincia SET DEFAULT nextval('public.provincia_idprovincia_seq'::regclass);
 D   ALTER TABLE public.provincia ALTER COLUMN idprovincia DROP DEFAULT;
       public          appdist    false    217    216    217            �           2604    41604    recurso idrecurso    DEFAULT     v   ALTER TABLE ONLY public.recurso ALTER COLUMN idrecurso SET DEFAULT nextval('public.recurso_idrecurso_seq'::regclass);
 @   ALTER TABLE public.recurso ALTER COLUMN idrecurso DROP DEFAULT;
       public          appdist    false    218    219    219            >          0    41508    categoriadiscapacidad 
   TABLE DATA           _   COPY public.categoriadiscapacidad (idcategoriadiscapacidad, categoriadiscapacidad) FROM stdin;
    public          appdist    false    201   o�       @          0    41517    categoriarecurso 
   TABLE DATA           P   COPY public.categoriarecurso (idcategoriarecurso, categoriarecurso) FROM stdin;
    public          appdist    false    203   ��       B          0    41526    ciudad 
   TABLE DATA           G   COPY public.ciudad (idciudad, idprovincia, ciudad, estado) FROM stdin;
    public          appdist    false    205    �       D          0    41536    concepto 
   TABLE DATA           V   COPY public.concepto (idconcepto, iddiscapacidad, descripcion, etiquetas) FROM stdin;
    public          appdist    false    207   y�       F          0    41549    discapacidad 
   TABLE DATA           ]   COPY public.discapacidad (iddiscapacidad, idcategoriadiscapacidad, discapacidad) FROM stdin;
    public          appdist    false    209   X�      H          0    41559    lugares 
   TABLE DATA           r   COPY public.lugares (idlugar, idciudad, lugar, descripcion, coordendax, coordenday, etiqueta, estado) FROM stdin;
    public          appdist    false    211   �      J          0    41572    pais 
   TABLE DATA           <   COPY public.pais (idpais, pais, codigo, estado) FROM stdin;
    public          appdist    false    213   ��      L          0    41581    persona 
   TABLE DATA              COPY public.persona (idpersona, idciudad, nombre, apellido, genero, usuario, correo, clave, administrador, estado) FROM stdin;
    public          appdist    false    215   Ι      N          0    41591 	   provincia 
   TABLE DATA           K   COPY public.provincia (idprovincia, idpais, provincia, estado) FROM stdin;
    public          appdist    false    217   ��      P          0    41601    recurso 
   TABLE DATA              COPY public.recurso (idrecurso, idcategoriarecurso, iddiscapacidad, recurso, descripcion, etiquetas, estado, ruta) FROM stdin;
    public          appdist    false    219   $�      a           0    0 1   categoriadiscapacidad_idcategoriadiscapacidad_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.categoriadiscapacidad_idcategoriadiscapacidad_seq', 7, true);
          public          appdist    false    200            b           0    0 '   categoriarecurso_idcategoriarecurso_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.categoriarecurso_idcategoriarecurso_seq', 1, true);
          public          appdist    false    202            c           0    0    ciudad_idciudad_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.ciudad_idciudad_seq', 3, true);
          public          appdist    false    204            d           0    0    concepto_idconcepto_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.concepto_idconcepto_seq', 59, true);
          public          appdist    false    206            e           0    0    discapacidad_iddiscapacidad_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.discapacidad_iddiscapacidad_seq', 77, true);
          public          appdist    false    208            f           0    0    lugares_idlugar_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.lugares_idlugar_seq', 27, true);
          public          appdist    false    210            g           0    0    pais_idpais_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.pais_idpais_seq', 1, false);
          public          appdist    false    212            h           0    0    persona_idpersona_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.persona_idpersona_seq', 23, true);
          public          appdist    false    214            i           0    0    provincia_idprovincia_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.provincia_idprovincia_seq', 3, true);
          public          appdist    false    216            j           0    0    recurso_idrecurso_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.recurso_idrecurso_seq', 13, true);
          public          appdist    false    218            �           2606    41513 .   categoriadiscapacidad pk_categoriadiscapacidad 
   CONSTRAINT     �   ALTER TABLE ONLY public.categoriadiscapacidad
    ADD CONSTRAINT pk_categoriadiscapacidad PRIMARY KEY (idcategoriadiscapacidad);
 X   ALTER TABLE ONLY public.categoriadiscapacidad DROP CONSTRAINT pk_categoriadiscapacidad;
       public            appdist    false    201            �           2606    41522 $   categoriarecurso pk_categoriarecurso 
   CONSTRAINT     r   ALTER TABLE ONLY public.categoriarecurso
    ADD CONSTRAINT pk_categoriarecurso PRIMARY KEY (idcategoriarecurso);
 N   ALTER TABLE ONLY public.categoriarecurso DROP CONSTRAINT pk_categoriarecurso;
       public            appdist    false    203            �           2606    41531    ciudad pk_ciudad 
   CONSTRAINT     T   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT pk_ciudad PRIMARY KEY (idciudad);
 :   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT pk_ciudad;
       public            appdist    false    205            �           2606    41544    concepto pk_concepto 
   CONSTRAINT     Z   ALTER TABLE ONLY public.concepto
    ADD CONSTRAINT pk_concepto PRIMARY KEY (idconcepto);
 >   ALTER TABLE ONLY public.concepto DROP CONSTRAINT pk_concepto;
       public            appdist    false    207            �           2606    41554    discapacidad pk_discapacidad 
   CONSTRAINT     f   ALTER TABLE ONLY public.discapacidad
    ADD CONSTRAINT pk_discapacidad PRIMARY KEY (iddiscapacidad);
 F   ALTER TABLE ONLY public.discapacidad DROP CONSTRAINT pk_discapacidad;
       public            appdist    false    209            �           2606    41567    lugares pk_lugares 
   CONSTRAINT     U   ALTER TABLE ONLY public.lugares
    ADD CONSTRAINT pk_lugares PRIMARY KEY (idlugar);
 <   ALTER TABLE ONLY public.lugares DROP CONSTRAINT pk_lugares;
       public            appdist    false    211            �           2606    41577    pais pk_pais 
   CONSTRAINT     N   ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pk_pais PRIMARY KEY (idpais);
 6   ALTER TABLE ONLY public.pais DROP CONSTRAINT pk_pais;
       public            appdist    false    213            �           2606    41586    persona pk_persona 
   CONSTRAINT     W   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT pk_persona PRIMARY KEY (idpersona);
 <   ALTER TABLE ONLY public.persona DROP CONSTRAINT pk_persona;
       public            appdist    false    215            �           2606    41596    provincia pk_provincia 
   CONSTRAINT     ]   ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT pk_provincia PRIMARY KEY (idprovincia);
 @   ALTER TABLE ONLY public.provincia DROP CONSTRAINT pk_provincia;
       public            appdist    false    217            �           2606    41609    recurso pk_recurso 
   CONSTRAINT     W   ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT pk_recurso PRIMARY KEY (idrecurso);
 <   ALTER TABLE ONLY public.recurso DROP CONSTRAINT pk_recurso;
       public            appdist    false    219            �           1259    41514    categoriadiscapacidad_pk    INDEX     t   CREATE UNIQUE INDEX categoriadiscapacidad_pk ON public.categoriadiscapacidad USING btree (idcategoriadiscapacidad);
 ,   DROP INDEX public.categoriadiscapacidad_pk;
       public            appdist    false    201            �           1259    41523    categoriarecurso_pk    INDEX     e   CREATE UNIQUE INDEX categoriarecurso_pk ON public.categoriarecurso USING btree (idcategoriarecurso);
 '   DROP INDEX public.categoriarecurso_pk;
       public            appdist    false    203            �           1259    41532 	   ciudad_pk    INDEX     G   CREATE UNIQUE INDEX ciudad_pk ON public.ciudad USING btree (idciudad);
    DROP INDEX public.ciudad_pk;
       public            appdist    false    205            �           1259    41588    ciudad_tutor_fk    INDEX     G   CREATE INDEX ciudad_tutor_fk ON public.persona USING btree (idciudad);
 #   DROP INDEX public.ciudad_tutor_fk;
       public            appdist    false    215            �           1259    41545    concepto_pk    INDEX     M   CREATE UNIQUE INDEX concepto_pk ON public.concepto USING btree (idconcepto);
    DROP INDEX public.concepto_pk;
       public            appdist    false    207            �           1259    41555    discapacidad_pk    INDEX     Y   CREATE UNIQUE INDEX discapacidad_pk ON public.discapacidad USING btree (iddiscapacidad);
 #   DROP INDEX public.discapacidad_pk;
       public            appdist    false    209            �           1259    41568 
   lugares_pk    INDEX     H   CREATE UNIQUE INDEX lugares_pk ON public.lugares USING btree (idlugar);
    DROP INDEX public.lugares_pk;
       public            appdist    false    211            �           1259    41578    pais_pk    INDEX     A   CREATE UNIQUE INDEX pais_pk ON public.pais USING btree (idpais);
    DROP INDEX public.pais_pk;
       public            appdist    false    213            �           1259    41598    pais_provincia_fk    INDEX     I   CREATE INDEX pais_provincia_fk ON public.provincia USING btree (idpais);
 %   DROP INDEX public.pais_provincia_fk;
       public            appdist    false    217            �           1259    41587 
   persona_pk    INDEX     J   CREATE UNIQUE INDEX persona_pk ON public.persona USING btree (idpersona);
    DROP INDEX public.persona_pk;
       public            appdist    false    215            �           1259    41533    provincia_ciudad_fk    INDEX     M   CREATE INDEX provincia_ciudad_fk ON public.ciudad USING btree (idprovincia);
 '   DROP INDEX public.provincia_ciudad_fk;
       public            appdist    false    205            �           1259    41597    provincia_pk    INDEX     P   CREATE UNIQUE INDEX provincia_pk ON public.provincia USING btree (idprovincia);
     DROP INDEX public.provincia_pk;
       public            appdist    false    217            �           1259    41610 
   recurso_pk    INDEX     J   CREATE UNIQUE INDEX recurso_pk ON public.recurso USING btree (idrecurso);
    DROP INDEX public.recurso_pk;
       public            appdist    false    219            �           1259    41569    relationship_4_fk    INDEX     I   CREATE INDEX relationship_4_fk ON public.lugares USING btree (idciudad);
 %   DROP INDEX public.relationship_4_fk;
       public            appdist    false    211            �           1259    41611    relationship_5_fk    INDEX     S   CREATE INDEX relationship_5_fk ON public.recurso USING btree (idcategoriarecurso);
 %   DROP INDEX public.relationship_5_fk;
       public            appdist    false    219            �           1259    41612    relationship_6_fk    INDEX     O   CREATE INDEX relationship_6_fk ON public.recurso USING btree (iddiscapacidad);
 %   DROP INDEX public.relationship_6_fk;
       public            appdist    false    219            �           1259    41546    relationship_7_fk    INDEX     P   CREATE INDEX relationship_7_fk ON public.concepto USING btree (iddiscapacidad);
 %   DROP INDEX public.relationship_7_fk;
       public            appdist    false    207            �           1259    41556    relationship_8_fk    INDEX     ]   CREATE INDEX relationship_8_fk ON public.discapacidad USING btree (idcategoriadiscapacidad);
 %   DROP INDEX public.relationship_8_fk;
       public            appdist    false    209            �           2606    41613    ciudad fk_ci_provincia_pr    FK CONSTRAINT     �   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT fk_ci_provincia_pr FOREIGN KEY (idprovincia) REFERENCES public.provincia(idprovincia) ON UPDATE RESTRICT ON DELETE RESTRICT;
 C   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT fk_ci_provincia_pr;
       public          appdist    false    2978    205    217            �           2606    41618    concepto fk_co_relations_di    FK CONSTRAINT     �   ALTER TABLE ONLY public.concepto
    ADD CONSTRAINT fk_co_relations_di FOREIGN KEY (iddiscapacidad) REFERENCES public.discapacidad(iddiscapacidad) ON UPDATE RESTRICT ON DELETE RESTRICT;
 E   ALTER TABLE ONLY public.concepto DROP CONSTRAINT fk_co_relations_di;
       public          appdist    false    209    207    2963            �           2606    41623    discapacidad fk_di_relations_ca    FK CONSTRAINT     �   ALTER TABLE ONLY public.discapacidad
    ADD CONSTRAINT fk_di_relations_ca FOREIGN KEY (idcategoriadiscapacidad) REFERENCES public.categoriadiscapacidad(idcategoriadiscapacidad) ON UPDATE RESTRICT ON DELETE RESTRICT;
 I   ALTER TABLE ONLY public.discapacidad DROP CONSTRAINT fk_di_relations_ca;
       public          appdist    false    2949    209    201            �           2606    41628    lugares fk_lu_relations_ci    FK CONSTRAINT     �   ALTER TABLE ONLY public.lugares
    ADD CONSTRAINT fk_lu_relations_ci FOREIGN KEY (idciudad) REFERENCES public.ciudad(idciudad) ON UPDATE RESTRICT ON DELETE RESTRICT;
 D   ALTER TABLE ONLY public.lugares DROP CONSTRAINT fk_lu_relations_ci;
       public          appdist    false    205    2955    211            �           2606    41633    persona fk_pe_ciudad_tu_ci    FK CONSTRAINT     �   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT fk_pe_ciudad_tu_ci FOREIGN KEY (idciudad) REFERENCES public.ciudad(idciudad) ON UPDATE RESTRICT ON DELETE RESTRICT;
 D   ALTER TABLE ONLY public.persona DROP CONSTRAINT fk_pe_ciudad_tu_ci;
       public          appdist    false    205    2955    215            �           2606    41638    provincia fk_pr_pais_prov_pa    FK CONSTRAINT     �   ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT fk_pr_pais_prov_pa FOREIGN KEY (idpais) REFERENCES public.pais(idpais) ON UPDATE RESTRICT ON DELETE RESTRICT;
 F   ALTER TABLE ONLY public.provincia DROP CONSTRAINT fk_pr_pais_prov_pa;
       public          appdist    false    217    2971    213            �           2606    41643    recurso fk_re_relations_ca    FK CONSTRAINT     �   ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT fk_re_relations_ca FOREIGN KEY (idcategoriarecurso) REFERENCES public.categoriarecurso(idcategoriarecurso) ON UPDATE RESTRICT ON DELETE RESTRICT;
 D   ALTER TABLE ONLY public.recurso DROP CONSTRAINT fk_re_relations_ca;
       public          appdist    false    219    2952    203            �           2606    41648    recurso fk_re_relations_di    FK CONSTRAINT     �   ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT fk_re_relations_di FOREIGN KEY (iddiscapacidad) REFERENCES public.discapacidad(iddiscapacidad) ON UPDATE RESTRICT ON DELETE RESTRICT;
 D   ALTER TABLE ONLY public.recurso DROP CONSTRAINT fk_re_relations_di;
       public          appdist    false    209    2963    219            >   g   x�3�t�,NN,HL�LILQH,M�,�,K�2BO;��839��U83�$5'5��41��Uʷ4�$� '��U� hN~q~r&P��TYf1� s΀���=... �'6�      @   *   x�3�t,J��,�/�2��LI2�9=s�S�R��b���� �c
J      B   I  x�]W=�7�G�bB_�"惜	��J�)�"�*�.�	�|���-��C��9��{ݳ��"�=`�F��_�D&�~������Df��.�y�=��S~��k+o���D���9�[n�Z�dJ8��V��KF��N�9ym���?g����3��6~�Bk[��P���ݹTI�����'@n��F��w��An{_�k+f���]|]�x��Al����ha0ڷ����xݵ����p{�:�+G�Q�������E[wg(��d��::L�=�d��\�� J�����x������ȂI����a�����j���Jr����hi�m��VV����V-J
�׷��EI	��:7�DY��J�N�]Wߞ/�8�1��Ϗ�$!����\�����?���O�v����?��2u尰�����	�l{��� ƕ-����=�n��u����_���LB��cGgei4�>�n��K�f���gY-Ztu/CS���l&hh���, q�M'Q��
[N�' k� 譞(7d\�99O�.���i4�V8	�<���
�9�I���z�Sw�>��H�� ����;/��j�d\n:��B��M��=ۓd`B�?2�ƭ;����\pJ�4?vgn9�}�ڠ�:�qץ=�
��@�4.�z�LA���y��UKP+\[Kf T���E��0 =����Y
^�l#i0K�q��t'΀E�=*��Y���'q�)>�X���W�E6�a��
W	�Y	�X�}1|m��{�`�5E�+�oPPO��?�_��e`V��qGAC߳��$���X�oA�c����G+h�������n������r"oo9TZ�J#\����>�V���� D��^2��=�>2J�d]ãtB�Sl|�����2W�
Wǌ<W���?����'\v;ll8��G�� %���uR�yз�e8�sX��.����Eߖ<����'�O�T#3�*L�w;Fl�_�Ư6!��Tz<3II}��Ŋ)f��X��6�^c���^�y�O���]fM38�I����_�efR(�mc�t�R8IŔ�F����X��Ͱ�ޞ��*T�7�W�^mk).�*gX^l��b�W(o��'+�߈��l�'4b�Zь�����-#v����&�����G���I ��@�`���c�gO�FPFD��t<'�^dWw��c�h ?�=��iOBp���FΪT�!m\��^#{����);&M� ƃ�ɴ5��!�@��d��/&A���#T��V*Q����v�$�����Ke4�8��џ���#3�8���xŬ�
��\<
���iOZ�L�F{�9$M��?�_�뉙�X�c��4�|3TAg��[H�����$c�Ɛ��b�'6r�^@.V�\�����ۣ�W��`��y�(�;ݾ	5M��S�h؀���w���(�W�JrK-W����H����x@��.���!�H2(�ꌔ*�Z��L6~?�+@1<W�eN~k�Y}������1�������WR������F��<�:=hp���ĐLP��ս��`�'i��Wwg�Y3�Bwv`;�Ȩa7s�n�r�(��Ǣ�#9#9�4��s�����@:�f'���r'��#��V�B�!����q���������%�sg���}g�aY�Mw�V�9ʪZi�C݉����%���]8�A=nP�A�����Q�5���͌�l�����5*}��"ȩ�J����}��m�ѭG���.J�f�T�(�BRZ{M�4lP��c
�3n\���)��j�>3�@B�,�g�AܞP?�%����i����A!��d|%�Ql̏�dQ���`��}���b
^�v:q:Nd���*�XPT�h~^^1��d�>�Ӑ�!�@Ɂ����&T0��p>_ Wr$ɡ���Y�6A�O��|�[����'���b8H}�>�I�a|�s�dЌ>�<����.:�a4��N�Q��v����	�����Z3?��1��K�C�{!��D��;��KW������R�z�C�e3�s�0������^��`�yE      D      x��ɒ�H�(x��
��'U���Y��$A�;y)���;d}��\g}�CZ�������1��K��ΜyR!���LMwU�P%��-����O���/��wM'��7Ovb���7������w��[u3&�o�<ɫ�*��=��i��|J�����	)�7��i��{��n�ǧ�t���_�;�������J�?>Yy�Շ��bx��$t����	��k� �zy�|W��^|G����xf&��O��l�揇0k��Ch�Uf���ۧ��ͷOJ���ۧڭB�O	x,9�f�㛟��3��z�/t�� ��'��x�rg\�9ݬ���ε�|^�3~@�+Hm3���� !�bB
�(��&�3�c71��h��3� ���� 8�������6���ǚ�|�~�*��� C�wj��g0a3f�����#��	���&�>р> �C�	�2�&���_����M���ef���BN �� ���SP�ޏo��)��aح��a��� ?���`�?Y�����]�L�Af9��Qo�=�i�v�Wy�9߅��Ddy�~r�#{��3���{_{R��k6_f6�i)��ן�UxG�מ�IX�z�u����$�c@���
���0�}���G 3�?��������C/<덟�"A�8n�Z�Lh��q���0-�1��W=�O��������k�l��4�]���]V��7��OEw����e������ џ��w�;|������_>�z/i�7`����[�8�~|s��Lnp �����?�[�����m33�O?4&0�/���˭|��v��Q��󙙤�UF���'A>e�W����^~�����]��7�V}�n1�ڇ"�H�w~W�	`z0�LO`��|���491���6�:㧙Q���O0�Tf���5l�rm�2�R �6����f��wf� �pE�}��V�� � Ϲs��0�E��4ͳ�`����?=S�O��wE�?��c}O��B�,nc �/�>sW�(b���^��+O 9?�A����e�6�D��������19�8�`�gp�3����|��W�o���^����
gX�E�G7����5"@Y��Of����K\ԕ��#'6A�Z�^������+�}9����,�?�1�1��<$��7��7�|������.��U��)�+� �%��Uf �k3`@_:fc��%q�{^,�(�����jv��YN���<�v^ �����|nU?=d���a�W/���z�[��~(^�~-�Q[7�7~m�#?�į�-�O�ˬ����O�g�����ȭ������L��J.��0u��?�6��l6��p>�CX��fOv�V��ЬH�&�<�lZ+�ܶ2�o�ɓ@H�W��
��Z�� �s���Uq6��|gc4O��U��'���& �O��5i�������ת���p�k�q8���e1 ���֯y���S4��p���=`� �����l�N���k��3!��MM,�X�~J�zF���.W } OfeN9@����T��{u��1Ӛm�)���c|a������;/��N��Ynϲ�t �����]d�{��vӚ��M�&���_.:˟ ÃA ����b��� ��`���q�|۬��Ŝ���/0�D�n��t4~�p�fJ�[�Ռ�O���>ln�3� ����J�˒�=p������!�r��_�_Yx*ܪ|�d_[��9���}�"4����h�$P1��y�m�P�ݯʏ�]h�>��'������L��y9�	�|
L@��uں3�t!��c}I�-����C�{��61�{b,P�1��K���	��fy��i�>W��yf�J��6 ��o�c~2�}��س��c�}*Z���'�� t/(�y�6S@�#��{�� ~��dz��6g�0X���3�4wf��e`@��`��*$�C��x{����@jf}��`��O��Z�fh�Vy���~83Ӭ��Y8�Y fqy,if�g{���3`ƹ��-ǌ#Ti����6w���	xq ��y�ջ'�����3�:�V�"w��+Y ��<�����y��&��^�	M���l����*��?,��U�tG	�����H���|�b�&@�i���6����Ν��i��j&���<d����YZ�4+�{?�����LL�3W�y�
Ew�x��;�����0��z�4�}$|�[�����W�P6�#�K)}��g��� �����̲}�ǽ�A G��-�����.�&w�x�x�?tޕ[fޕ�]��}�fϦ+�	D̳Ӆ������3``��|����=3?Ϣ3����w�&r����ї���WF���<��9>en�/��ْ `̙YghR7ʫ�
��9V��
=��g�7k�׊�~�2��=W�8��M��O�5�R����w�_�d�[���ݜ�n�#n���v���u��{���g�� �]|��,����YE|x�3��M�Ǐ�_x״��p;����Գ<�X�#�����>^��ig��:�V����8Yܝا���s�[��@b���o���݌5��*������l�o;�v4��h�}d���h�פ���o;�;���g���՘S��\�������p�?� E���&X�"Ƿ��K�+�7��a�]\���I���� �\&�q�e�߭�ƒ\�����d�����-�����4$r�F�Ӥ
0S����-�+���ݲ���%ޭ�^]_�ê�o\p7K������[]��Ȇ�������G傜�tvV���q�����=�ƹ�/��r�Nٍ��?��,�]���}��B��I��(�̱K��6�[�>�Y���[^������=� ��%�WK��Y^.���w�Vl�r�E�w�f�N��b��t��6X�N���4�������n�
��v�{��	��<�U�4��9>q�z�e.TTҴĹ�ZݶZz��H'�1n��'�Oț wwᵔcR֒½��2�)9)J7/�r�2�T.�Zժ���P{�Ѯd�Q4��SD+Ƥke�9+i�01��1pDB�? '���ܗ��������K����[9��]iɪ��r�/�_N�E�r��V���K�C���#r���Z	����� ��)���R�%N�JH�����i7C�$���[��^L�a�n.�����p���u=!�[Z
Q!�iA�EY	Ssбf�m}XGc;��~l
z2t��nX{�ȳ��PTP�'�1Y�_y[q3?�i��s���v���~v�\���e��ZS��5����*���ݵkJ;v�+!^l�Պ�\.���!*��d�����)`��Jo��䪼�'$�"���6i>�L}�6Z��i�!���j7N�������ן��q}aֺg�5Z��r���\RZH�H�I�P�!U���dQ�t��1�!p¢E�:�?MΥ$ T����z��]Q�[_�\�ԚvP8f~�pϚS`��-e��(w�J�a�\n�q-������إ$I�׾(-63��(n��>7&Im[m~�M{�d$UQ̆k3�hL��E3L�a��⋨�����b���V��h{h%Yj����:f��ޘ2�ݭ�`��}�q���6(�"dg3�(�j:�+�!0��\�Sp�W���Kt@D�w����c���D�N��A���4������ޚ�j��u��W�[9�V
i�(�ָԨ�v؉�ᘍ��Q(��PZ�D��q���b+2�r����2�ԪI�6m�������2fhƨ����p19Q�H>*�7�&﮾�,�AY����s.n�u��j�t�;w0��[΂`FژM���&�'c���q%>�j�g�l�LyAm=�5��sj����̀�m\nW�--cg��:��CcaC�n��#�*39��a�����=������r�ٟ.ͮ���v��m��-OiS�X$����6*�$]1���Y]Ğ3x�H˛5�}nّ�K��Q�٦�nG�{���zFWX\N�rMM�C���	���2N�.��[�ݜ��r���4���eZ���~|+-�L    �f�ZA=����RgrКr�R<@*MM�Ê�d���}�Q4��� ۞�[w��N� |�0� �U]��}�T�r*���*2��8]t����-yme�j��8��J������p2��[)��t�[e��9�\2g�l�1�_$d'^�qBjE�n��
Yh�ms�3��c��#+*t��j�\�l&�����	���~\	��!뽣"���`�1����ze'���au���؁�.������m�c��k��la<�2�D�Nn��M�l%����Y�^�]1�y�GB%����ְ�hô*�QDSUm�m��T�=s�EO��Z�[Ξ��E#f�l2�Ci]���D���3�Q �&#��R��QQVk��6�����c�P�Y���4�N�����3���X�OW�r"d����6@��8n�q�+{D�#�TڢwlNƛR�WuQ4]��Y��-�|(܀�=��X*^^���\F)���,�kF ,��c'b��e�5D����$+��E[2��@�l�e"i*�$G�����Q�������㵇T2��K$↚{4K��Z�N"��G�1���}2�%��Mvk��10��X�'�� ��l]��dWb¹S�4F����f�G����3�������<T-�h�G����OVmg,�y�9-�J9�$�Ք 'U#~���^Kmb��mp.��!7�ڶm�ٕ���hr�H/܌n��0�E���q�!��$�e�8ˈn�azR�[�Ė��k�_�4	�É� 
Xh70�i*�F��[�h_�c��h(�<�̀iDy�a�趈j�fE`�\_��2E��t�i�Y�Aԏ@ʂw��8^�
�f<��8�Qٞ�4�b�!ܵDHၚ\ŉÕ�� ����
���5�	G�r�`V�YѨ܌��v-�+��di�3�vۺ��4�Iq�@�:i+��橥zᙧ��r,z���^�~�@�����94%�d��&m�ѝ�w ��U�:>�n�s�^ec)�#X���s����ve�n+�Id��Fק�\+%Ln�s2��D$�W��3�,\5��-�'Mq� *�8 ����s�e�޼�"!�:�cX�@�E�3�Z�U���z1cA�>"dI�i���۸��8�Ŝ�9�0�T���.c�Z&J`�=)�%ՀX}d裙ؓ�gKW�.g���<�ɀ�FɊ�:�(��.F��V�Ko�jk^\s�^+���%/��A624:�U7��9�
�3���{�9��>{�*���.���V��	=����Z��1�Q�����t)�-�,�S��sIʒN��@��j��E&ɬ���x9rQ)����,���p����jb[����'ո��i��	2����j��'M��fVB��<#�P:��b�x*�(L� ]NȔ�+���6�TLWE��S��i r�i;d,kvg'�{=�d?�E7��=Fj����Y�Y�^��}l/��Ē_�Ӡ���qD0��uքK[�:�T����&W�X�&�}OhD�&����*����]oy��5�f�1gG(����vm�'�M��[��	��;���D����9%�'[)�J1IZ>�5#�"����>� �B�"����ɛ�8/X,;�N�չ>]��$JL��M�=����[�n��zy�Q�K���T���M��:�d����c��,��[�b͙v(Yd��u,Q��ۧ�ro���W��\���p���j��_%3�"-�k&�4�����wA�d��Yx7�s�M���VgR�o�Z��޼t��/��l�-��CCyvUꭙ��i ��5�b�z-SΈ��(���_c������@���=�x���`po��'S''>ũ�V�0:ߋ�+�D�6� ����-ap��Z��Kyd"L$��^7|}����E����_Ш� ���!EN�A]�%��zU/�nu�n8p��3hBV��Gd`H� �n��z����E�rB�R�5�A{��1?�Bc��ZeҔ�"�.
B���db�3�:���h�FVX�P�kW����׃�F����4�7Q*�
p�Ed�C�l:(�zV���~��L�j8���m	S"�`��Pߚd���c�9o;�!�M�����p&;�G��|wX�4�M�Z%�v��% �A9D�ø+�0,o< J)�6�{ʶ0$�]�Z��8��$�;�#���mGx���%L���Q>�/MAq����t���_{�cr�����`�~ȃn�N�^q簁�r�U0p�JUM�S���\ĝ���.h��tɚ�8���������h��%yK�m~��Q^JP�^�s�fQnM�L��6t4�l��>q���-�tK>б3����jU���0���K4��ùV��@F-� \��;:%E�e���~�ߵ9��8f)Ux��K*���,�X��0�۬�b�^��&T�'\�%�y�D`���N0�Gs4��.�EA�*0|��u���"WO#�Z�]��$���M���b5��ZϨ�6�B�����d��t�+B��f/*�j��B���\��G�fiAe'�\;��%ŪV���#��J�e��e	�3=��T��:޲�.�[O�W�5v�O�����r�(tFp`	6S.fry�
5��5G�+�VY�Q"�M�9Fisj2�%�V�d�Ѳ��E��xy$b�6��.l>���H�?�Sqs��~��Ѱ��4����e�����*�Fv�kk�Y�Y��A���f'4����{FK�-���v�G�p��x�U�'!�	]<j�(���=�92M�	,glCa<�o�-I |r��YT����@����Ӹ��-A�Թ;8��o�5PCi��12n�;�$�2��\9Q.s�2��
/R���j8��ا�#��"=ӗ!�	S�ڑu��e*�
B0σ7��8{��u��j�2�p����iAF9g7qs���n��� �\H�
��2r�p�Վ��ur�L�Bq2�T����F��[
4���\zkC��P��e8�0���@�b۠�����E��+�j�4c+��r3�rV�2]P�@�y��2^۔�1:�!�/���8H몔W�S��z��%�v��t>DJ�j� D��d+h�9�i�:���r�z�1��n*��e"L:+�"T�/�Bm�n*Zl�}�)3���ʐq���paڰ_�:.���n�!�f[��A<��l�	-'��*'�7]ђyu8Z���$���Z��P�1ȅmf�Z:LB�sp�^Ȉ���m��'�]�H�n�;˛)=�&I�
b4��}-kBV�>���օ��������Q$�	-cךQh���б�vg�?-;B�%�8y��;*����h��kGq_5�"�.^�D�3��4�f�$��u�y�-���F@m���A�D��� qP�6�-h8Ԧ����s��b�>2$�������4�W�����$��o	5ۑT��ԅBغ��ʴ6U�@RG��7̓�[rIw�@�[���@�s���
�5�<������j�h�~��~γ�$N���X-rI|v�ږ�����h��Uɕl��z�斶#VYH|މ����PE����X���q%c�2�f��ZNU��;�T���62R�@�D\��,+;D�p�]U�``����D>�:퉃�ź�҅Kh��SK�g>�1)����5��(��5EV����Bd<�8�"�g��YgU�v )5A�6��Ԝ
񆋵U�$(o�����+�e�.�#Xp�
d�u�cwȌ�j�J�'k��UӰ�U�[M/���7De����@8j'�e��I'�ᘝQ{�ڇ,�|^��+�a�Uj��q�f8��6�,X�v�K�3]��� ��MR,M�E�0K{�.��h[��v]`j�ү�(��8rru̶�ĕ������.����(U�@�E������v���5��ѭ�V1����E#R�j���f[��Bɵ@�"��Ƴ� ��6'vi8���3@�_���+#r�嫘d����������0��WA^�ِ��&�L<>�"���_��]�A�\��Q �_��n�j!�Y�\B��І1aN	     �(n��g�ˎѲ�V���[���]!s0���iT`,�C�-ND�T��iwM�`*Lp^�jg��|��j�C�F�+��Y�{���
��kG�"��1��1L<�����6�vhX��*Z��k: ���BM���GDǈ=�7�}�77���݂�l�:Ix*�����*�{�`��>vOA0�<c��z��ܐd��r�@��zSR��c�f�j7�6n�� ?���s�� w	~��!
\�V��:�ݡ��Q�!�`*����~�9hb#�R���H@����n�Qy�\������2h�����f����$��N�� H2ՆUʊ��=BUd�Mx�V�{D�M�c�;�1.�Kw�o����n2�]�J��fv��h�'��u�y�Q��D��[�t{R|��]��Ւ�H7Έc��v�/���ˊ�yN��ӂ�=
��� �� fM�S�9S'�D{8�y��ĉ � �b	l�8!���@-
�:����nh:K���|��Eh��������Yζ��V7��D�g	�7������-Vz�MP;^jFt�%L�Y��	,�/ᥳ/m�3,m��9㹥^�$� X����4)�C�Wʲ-�e{�wʫ��Q��&��猚��J��]����ܺ����]|���N�
�LV	�h�ȳ��q=$��n�R�:-�Ù�NoG�֩3�r;����ѧ5_��Zw�]uA\{�v�9'�|�+��	�Vd\�Ȍ9��������`m���[�siO�R��EWρ$�S�J�Ȳs�lv;����ދz�h.sv��.Η%��i�d<���BP���F�8�X�������]�g�:�Rh6�M\� ��J��)%�9�+V*��኿�+m�
��@�l�CZ�����67���Q$}���.,��ڻ�j�W�8��9���[l�GmP��,�b�ǥKX���:
5�7'Yi�v�UV�n�����*�]�J����MC&��nn���xQ�H���"��n��U��Oz�dF5w��p���n����]m��jO����C'�8t ��!��'b�j"I�]��^����B�W����J�BSY�t��Yj���/�U^��--v��[�,QW8�HCg~W�#*G���$��$Q#���]��Y�\�����'Qqe}�ۋh9��� �c�0�V*!MϹ_C��±s���z����Գ�-VG������߲Cy��	M�W���n�*��=��-(�bL��n|���(���O�Es�H«���1��I�RYN��m����BW/�B�c��5��E��A�/7��l{��-)x;�'����E�I'=bcJ���[>,7y��}�ڶ������+^�Ĩt˗b�O�����:5�d���C��ғ"�&�cv�� *��T�!�z�@:���"��#��GQqS
�y�s��!u�$�ULj4E�O��D�e"Ϧ���N�$#:��m��Q��`trI��s�b��0�T³����q��Ŗ:Gk��k-y���U�yݞ��U#�u�^*qM�c"�B[!��~X�����H���9�g�X (�*YJt��z���#��8�+;vVB��1���_��%|��}�^��.�8�q�J�����oʨ_8�贰�.�ҒxT��3�1�6C�g|#�����$���I��^-��-��N�)��IWntw�vYP^���N6{o��N��+�c���sPx���0;#*��Z\�h�"�6�whI�-ᩎ9��N��KQ��M��vN�6;􆋊�"����#��Eo�l�s/qH�XrsC�5y��?��W�塼!���n�i�>�/��@�(r���c|�<��� L����n�*�w]�Z9�hs�N�����F�Z�7 �(�ǁ$�*{x-��F28Ι����(V�1k�j��,��\ ��M�U�đpta��HZ�Z7'��"��ݟv���%���A��i0D�r=s��G|�.������爙5;�%.6'�Ņ����ͪ��Pc�N��ijwm�P��&�,��P���n*������g���6{&AS,�����|ضU��K�-*��#HHWa\�3��9��"[����w2#��B1o��e������^g@��tŅq`o�.��������Z"�ZD�C�)��M��H�P�n���Q��/q��>#YQ	CW�r��P-sZ��IC��n�+Wg2V|H�}�&��8��\��J�և
O��ʠ�*j�0���^5=�3�sCB�{�Et���>���!��΀���>�&��Z���4ުY�7?QpU�q�9�;3Xu����0o�3�\�aD®�u,ݪ��d:�B��������q�,j%�f<Mh�4�3b���:C���%�"���M:udVz���
�:�s�z�"a��325Ȏ!l6�EN'�I�ɻY�>��~�8t��R��K���6@�C\���6m�7�6�lB��v �aǂY�1��,�3u^�,����PT��]ߵ�ۜ��)F����5�;���������@)Vi�'7��Y�[�E�8액7�A佑�Xm�R�&FK�L(,���L���	�E�箐��	�vJ*��5�/��o�L�3{J?{��,RC����`Z��_��6�!��*R/�5Itq:��̇}�D���D���Pv7D�Y�D_.|tp�
ې�����\�A�0��YA�+��^����us�N�|\$b�@���KE��Mwn&�:�z(���r�]�5��C7��7�|��:o>I��]s��օ�D[YTE 1��F_Rܶ��# �?�qY�R;7�xBÝ+��1ixO�����AD�n;��'�B�� ��]�����M%��:4i;&�Lu��=�.fC�v���E}ӊBGPsu�R�����h��@�M�N>8�y@!�\׋X�d��,,�<��(�M�pm�R�?8��p��:��(��(�A���K�\�ҧ��8��U�±��b��]#�
o���G �¤8*����N�a2��8lUf_�%;�tK��v�S�P���:�t�'�j��$�;U�U)�0)�}���V}�n��dq �Lh	�$��Ȳ� h�vMqNY��sMv>�c|T}��9���P�,�L�D�[gk��t�AA٨���_#��"�|�m����K�N�9�u=,�	c_,f��:��~6����z�i������5��[��i4e):��x%���K�)�Thԋ�P��H��ВY�eϟv��lC�R8o]$��%��Z/�s!
b��C����W��J��ӆ?w��U;�Ep��)=|kScR6�y%��m�C{Ϡ�BC�ABl5ouD���8�/�Nmr��&��3�o���*.�D�@|�b�,�L�����f�90Bsf�8𛋾�*m�l�1Iًx�2eyl��`��J^�N�%���U�D��)�2� ��yX �AM�fҒݕ��D��WKK��:w�4/6lsZ��S�اhɘ�e�Y� �c�����ߒ����X�!�s����|Y�3�>#��q�_:�wp�UyI][�u5es�A�����k�H��!�(�&-�k��gٖ�δ�X"�`�v ��Qa`J� �<7�[�=��pI��z�z�(��Dc �8�P@r9��(��Z���t*���D7DƬ
�p�z�Ŭ7������Aup.F[z6{����B`�(�H1�+�g��֚^yt�����@�6g�ia8	٥9�N���h�̭]�"�8w%1ڲМ?Gy�\�`ݳ�����_P�r�T���/�^(7n���M�+��Z���4�b7[9���l��ꩨT�Ə �Pa��:�~y���_��!�7L�(d\���B�� '9�%ڜG���n�:�B�Bk��#_����YTb��6����Ժ\3�	r�}Kn|�p�=9�Ww�>�u�4�d����i�,%G�9�Z�k�=_�����C�I]9���m��B?�}B \Az�F�Y��.tzמ��QU,fw�~��������m�zA7т�`=mv�!�|��$t����8x��}"�Z��t��/^    j��Pv�j�~C�<����c@�n�_�dC�YM��,K���+9�����.�mk ����6?��(�f��A�4�X�RFgsv���U�u�	-�d�%�}�#k	��X�f���U@F�֪pY+�8�����7�%0���É��97.A �����%�!�_��f)����pÏ^�k2��ʫ��ú���D̬��£p�nkkЩ�5^Ec&����b��Ө��dV^�hX�/:�q^C_�u�H�.�=*k�Q�rһ�mUG��خJ��k�����#�rݛCi�� mw�0D��d�"kI�cǻ �15b\[�ѧ5@�H;�.���-�8���2u�C<g�X�Vk�,�t4�đ���[�����Ȇ�!GDWŜ�#Xl�Mp<�=P�����YKr���kz鯙u��j��n�k"Md�ImG�9L��h��1�䘄 m��p��m�qe����D� ��qcj�� �I��Ys��os�Z ��s�F���B�����ހr!7���=A��	��Jw$C�Үa��������U�y��'D�*��.E�frGB]�O��,\U�G;�x|d׺b��J�qb��Yo��Uc녎�RVw����������Y;`Z'\��+���X�[���vUݶ���ڤ�P]���]� �É!�+�	+��/��v='���'�OP�g=�G�̙~E؆Q�+}]7dV�fK�]bh�Q�:�@�/gkY֩P��U~���ց��$��h5>��a�� �r.F;��_x��϶��rp��^ ���Y'.m��M��j�x�W!�4������"�xM��(�ls0��_����|���N�)Z� �f�5��Lg���*�i	�S�E;����l*��v��u!"P�4�����T�&�k����EP9�D+�Tt�X"�"��V���$�8tm�mr9�h�V�"�g��was���~��?}��^J�-a�e��bU˰OG�&e!پ^��0��%.�\<S�^W�:F���7�r��B4@l�暈�
ԘN�%�X�g�T���Ӣ<��F˶:��#J�7	��-��N�6�?@�"1"�p��f��́ _%Mu���{r������:���B��q]n�&_������s.�B���3VMC.vVlp���>ʂ���KX1�
��n��@��y�-��T� ���2:���3�o��-3��֗��_������O\�Լ�s��Y��2��"C/e2Ӟ��ݫ����{�7�j�{5O7R�1��lᇂ��>]���[�e��u��E�����j/ծ���:�>����s-���Za������`T���k}�y��������*_�|
����d" �2��H�df�*`f�^���+!΅;��}�����2�+��Y��N#۹T�KAS����6yY�s	�y�S�F�s����Z_���,|��	M;`�3���뛫��T#����>�������,�o���jcɀtMe�M^�E	�ҞO^���k>��8߽����}Xkݺ	@�Y ��n�\�2�<s^��'�T������3'���}��oE�Σ��Lk��߭?0�s���מK���{��{a�G���n�����j_�8ϳn��Ͳg����� H �;��( IY���\��w��n>����^��c4q|{�3��{���K���$��K	�����0��A���Q����`�7Ti�~���\�嗫������e#��l?���U�����ڛ{��g\����� � �دC���~��皧~{�T�,����i�J�ݹ�5�HOv�:��ߩ;��|��BJ��^��Q9��Ο}ZU�+\�������W5t�-E�f��/sAΙ��z�E��M�cV��Y���	h�$�fT^�"�U���j�/�����p�)��{��&�o����^�7��E(��~��]5x�\D���r\.�
�1>�go��;`�抽�
6ߋ4��5}Γ����@�� �;Y�Λ�tT�z`� ��-�o!����\������?�u��k�&�jC~���6��G��o�!�k��[m�o�!�kC����![�����mr`g�0�٣�ƣm9w1����Gר/n�ϛ?�O��j��!��|����KN1��&�C�9)���%/Y�OF��GydԞc�G����+gΠ�{id�-��=p�#���n��$k��A�ϐ��sȟۀ|����w}�P֞��s6�u�K&h��֫�/�뵏���/H�O��<�[�L<�"͹CB6��0A�|OE=(��'�>�=3��ݴ��'�5+Ǽ���n��!_�Yf�/|�r�n�$�_ZZ�Mfb�����*o��|���y��e<`�����h���ss�G`ǒ���S��d1��)�4��柧�L��ro�1����YjƟ����H��`�s���+Tj� �Q���p�{G��.���] ���$���� 3w��4ѽ����gN�g �K�F>�-;�Y�;I�`��Aηw�>�=�0�T����=>s+��f�����kU���[6���F*s��?9🞥uNo����S9�zv�W7�6��*>S7_����o��Ԝ�v�N9��X�VIs���Ճec<�x��y� ������h���f��1��i�W�Y�q��I���me���߿�a�M���.P��;��;���N�k��u}G}Ƀ��+�%�|%��!��C��P�X��mb>6�nn�s7-@Y>l�#v\ˌ�W*�3|~asΜ�Jݕzb~j�gŚg/*�~t�{(�{�����=,�֜���5{I�}2Sk�'�����n`=�f�>����;\�$w^��p������Y缯�Ƈ֍���aY]���Ͽ��&�xM؏�<H;o���ܹ��~�j��|~��opojf?6 �Yy?o�e�ÙC���m����������s/����c��n8}�c�=��>ɧB�>ܝ����
�ݷb^sۗ��_��̱sON޽��N��e������
�~tb:�I�n���q��W��ۮh~K�K�K��}$Z�%��k��[��[���0�������C�]_�H�����|�Ȭ��q��/"���_����>'�&�G�D�[a��Cg��i��I��:����������{?�9;�@��	������{�	�_���y���:w��i��9Uk����?(�?v�}uw��ۗ����7��	禹�q"�0As�����0���	/`{��<���Gp�f�^��#��8ej��2�Y�����&�Nk�z���ٯ�.������|Xs�Ӟ����2����WG��^Sx�8%�[ͽ�M���I��S����L��A�=l)�C�զK2��~��_Sv|䘟�9���wv?��^�Q�_kg�{�7���ͪ�����`�9�v��� {nͽ���y��8�w?;g>��^�3��	yh���g�����9�������ߘ3��?�=l���W�e��O��Y~�Ǚ�>d�>�|�$>��Ͼc��������OZa�����'.��L�n�|uNλ,�<ЌA�!���uo����o��3��S����=	����xi���l��V�|8��~3<�wK<��G��=��G~�^�������&��T�����V_v`π�����þ�w���!����4������a�A�kg��|$@����<���ޛ,��$�ak�)z)ZҘ�i!�<�S; �y����z
-��h#3���I�s���*vW�%�\�Y�,-�9@ <��?����G������g5�/�_.2�����,������x��ݛ�p��j��s�������}��{$��P������ǿ�v�l�=v=�݁�ټWßl�o�m:ٲ����+��l��x��?����&����Ϥ�U���������ߗ�U�_�(��w�c?�������R���ķm��1l�`8��l�C���_���\���B��:�����f�����m���:�����t����Fiy�`8�D���,|��B�.b��)x^��>t���ҟ�� �H#�x�\�r��z�PY��.�y!��r4KG�HK�X[��p�������9��~��s�    �~S�I�j���R�S��c9K|����3�����?�~�/�O�ʛ��#��
�����_2����XɲN��/l��!i��. �$睢��W��H����=���?o�����ԯkJ���K?%�ٿ(��s�M]��y\�����y�X�|t�xtL*�@�4t�����{\k�� ]67�YP��m�4ԗ_��r zo��ݭ�{�����3�Žc#DG�᏶Q$}Q��R��!y�.9{��I{� %:FE���5�5�7.諡�%�j�k�q�)Ik��;���>@�3Φ/�x������3n��z�#�l>&D٪h�/G��O;G�1�T
z���4C�m8����M]�b�x��$ˤUn���H��Q�W`K��>��j��aa���cE�#/�wA��ܬ��M��������>��#�|Ǥ1+�>%.��� H>��R�4A:�����"�SI r���0���߀�/EȲ�����,2�5��!T	�9��+T�f�M
A�c�&�/Q�d!�Q!_.{5*����L����*"%��c5.���m��%�;�~߹B���+g]\]���N
���|��s�&����Ipb��%[Z��m���ϥ���q{Ɓ��IeZ��gBš,��tH�  ��J��|xiS)�G�B15���j4�9O�x���#�Lȿϡ��� �e���Dț)qa`�j�
4�\.Lwy [���ڀx�����N፵�[�B�H���H;F��{, �n;	�^i���TAW(w�}
!�=����R�[B�����,4�x7Ϭ�=���3S�#U�6�T�!������`HpЩ�b9�h�N��z��|���2-C|g��ns��<��J�gH����3O �
+C�ѩ._\�6��;nե؛�'���c�2�r����t8�?��P3���<bwJ��^�=���7��(��v��,V�:�͗ܗ�_=��)�ɦV��V�ڸ%G^�nI�2���;I6E�E�_�ܙJ ��0������T?��E B���}���ؗ��¤����.�(<�rj�����$��aV3�Cݖb���H�{������J(��U"o2�zW�co���"߳YUs&:t���8 !�S�R��-������ڦ�?5�6ޚp~��0�ׅ�"��ޕL�<����Np��M!��,�4�8P���Ma�%��C�J�դ�6���=��m��U]�8ߊ� ��c���]����\�"���t��#�<5������j�@]γ��H�����kF"sA?�fM�v���MQ7_S�+�bk�s�J70��- 5����%cg���,�A%M��d�����"�׌��s�	z�E��� h���Q��G�>�z�P��7y�������Xm�i����S8����:��{'r��<3�#G"P4#���)�T���;��xN��BGB,>��A���"��[]�q����a��6�ۛ��=b�$�N(���Z�n�"5�H4)��Q*{��ƺ �GV��cr���H��4������\�pS�FA��W8�1�c�O���m�1�����J M�0~Bj�K�V�0E	�Tâ���c���&Ŷ��]��{�����^_�В=������r��J���	�c�$?pq}��Y��-WqR��V"��EaZ��݈�8���		K���C�b���Q`�όD��LzN��+��7~���db+�mqr���{G�Cx1$'��u�ك����,�
dXd��k�k(�xuv���������\���O
�҃Q�
�dx]K>ԓ�q.�-�DU�]W�-اqy���w�g�B�2��m���e!�����#9r&��kɜ#�����䅥vK��$$E�6U
o;w�U��In�-C��g��e��
V+�}��G�]1!u��l����:
�Z�lD4��+�1�� m��;$w�
Z(��a|�5�6&�%[�ݸr�Il�vT�P���"y���D��� ��M��
�F`�TwBe�ޢ��K��KI`�Лmܑ��ߣNZ��"����2�5�#+�Ō�Ӏ�_��BI��=�!�1��p@^5���I�<���
�A,�xw�d@H������V ~z�smbb�}����kН�F68HHQ[����z��>L]��ؒ^���,b=F�����m+�;��$$��̵��6���
�Ƨ�H6�DXsYB7���-�D�`��磁?�C���N��������i^��L���fP��k����@=��\��)��ߵ\����*�q���1�{�÷�q�nu���8^�T���T�:&�G�i  L�R0/,Bƌ��?~�@*~	]���f	y����7��?�HM��AL���D"�e��y�ތ��5-by\X����4��t�p�k��kD����;��*��*�p�M�A��;?
�굼o�7�K@�ϡ��ץ�!HB/�:�7WF��&Q��8�!��u��w�ɳG�`�� ��g1�=%x 8�X�:��.KoUUO?�A�
+]�+�N'�XP*w��$8�ј"���z��/���NP�l�d���q.��8�KX�א��[v�o1��M�������|�-\�m�2�ʬ� �+���r2���4�앆��M%x����O4Z�&"w�`�[�c�$(�Ѷq��݀޷��D^h��J�T\�(�P!0p����?y7;ј�~�7�k�>�A��U�}��2vR��3�-[6w_j7Dp·��� ������,%���h��$BJP�w�r?��������ꌝ���F��
=a���<@c���2k�qu��}NP� �g`��C��e���;L֩��t�y�>�w7��"����/an�f�{�1��l�kDBFp}�g��a�\I ��,��0t��:�9�f�菟�GѝA0�|�a>su�!׿��L{����48R����c�)g͛��!�4�#�ٲS�c�mݳ�Ls�A}�9�`E�o�=�k��N?�	�:����G��)�1�kVvm��4[���&*�ܐ�hW��|щ�!拨!�� �kJRd�Ͻ���v�bm !�s�����V��ݶڨR����a��A�}�fHQ�������n�ުZ|t�f���Ò4��}��OQ.�B��R���?(-S�>N�C�	Q�-ns��p�}�Zi��v� tf�TȦ@<8(��Qk�wޔ��9�Ĕ��Ԃ-�ӤMt| E���Eј�+�l$�ܚ��ڮ�;��`�1���/�����B��3��oђf�Zc���c���$�$�@Bu�qI�ʗ�����F�l{�m�VI>��]&��Î�v�A�Q�wU/��_U'�{�J�U�r�1dS��(�R�o6PC�|�Y�f�Ki�1�3�� }�kGg/�����Ά���gL�J�`�s�c�"�Mp�T�\��vyՀX	�N��aNP�%��i�{h�o�I��O�E��ݚ\���[K�|����.O�#[��wD��g�#ᢉ���;�Z��?3�:��c׶B઀���4M����XL�w�Cip��LmԧގY�\
�{�'��|4|�+�����"�Բ5LU�N��64|)v�����o�������xW-����ɛ��z{���N�b��.'�PT�u�0t���"#�s�I�&<����u�K�+q�6�^��K~�S_����20�SVs�8@U �K!�ذ�Y��ۋ���m{1�_�}�*�S�3}��V�$����H�����B����||�6X��(�ڒȢ��Ը|V����K��5��qq���T��T�Dr��a�F(�h,��\}D ���t�DY��?�0*4�e8���j-@g�%�w�a>��Ì-x:� �vo^��=�O焁^��g�O��f�*Fn���X�
�y��-j����K��p�og.B�3��w�I�� L]�Oާ�u ����}��7�AHR�Qפ�+��}���b|�G/I? �񴌡��?��Q��s�r� T�դ�,����:U���� ��    �3���˱�h�Y.�Z�c�Z�0>J�T/��`�b2a�>�f�����K��m?(̑�)�
��<!Hf�<i�VU�{T��>@f�9 h
���i�:ފ���z_�{�bS�'�O��	���1���8��Z4BF�y�f6_�i�O4
��){a�l9)a�Jw'&���"&�6�%�Uq@���jCD��W%V�]3v���=�饾R7������c~�N�_*`���
�����l�A� S�'�:���pg��
O�L��"c�c�)6�>��Q��l���`I�~D�k��2G����Z
��B��F���^j��`���Rj�"�L���|W���u=��+�P��@/����Ǝ}_�2�taC���D�L��6�������ɑ��f��ޗ���2��9)#D�V���ez�Z $�Ǵm��,�1W.�(%Eoٴ�4���>�twta��]OS��cO�����c�ip>�)����p-]�A<���4$���G�|��)�p,��U��e��O�OUȰ@�������t*�D������G�u�r������خI�M�`��z���Y�!H�C��`�m>��(�a�G�ha"	�8�M�O��7}o?X4^{%a���y�=���]#�� ��D�o:�j�@_/������<a���P[�\�m�KB�2��;�s؎��#�0I!��F�Т�@��+?&do�I�s����=�=)�	�qu��	
�*^�(��$�a��SQ�+myB��+8�!��em`M- ����d�»�/�c1���ȅ~@-C1���p\�o�d��Df�� �'5�{d/gw�<!����c�qq�k3�Ӓސڻ��Ĉ�����OU��B�Z#!��}?g�y8q����'*K���A�j�M�y��}e�	��9��j\d��y�bCBj��~��kaY���gY����.h�ǌ)�a�@�Ĕ6�k�A��x�F��/X��\�{?u�_��+���GC�쌁��Z��P�k
�����%�"��G�Fe�"P�1N��/�֤u�8dP�t�E�zT�����\�[�w9��0��ޱ�qJ����n��G3@�1U��/�2}��8�j�	*�5�KIyM�B��d aR��U:IN�^���q��}gc�NT ���Z�A?�6�f!�Dm�){Z��!Z�GL>����מ���+�*<�����r�ʆ�^�{r�5�./x�}Ty��D��q����+;N�����Ǻ����Ƚ��$�"V��r˨�e�j���Q0[b�V8��쨍�8~�h2�w"O}��R���&9���P��q��M�#Q�ݲޢH����J���q"��]��{D�4FA�!T�W����w��/ Ep̚���|x��r^y��V���0p���{��	^*+y���M;
��T�L�����&��v�c&�ךB2�)�.�����r����~g��?�G����>����;��������������?����/s���8��T�����m����r$�pO~?ɝ�˗.l�'�������C��s~�_y"~η�9��O%��t������P�������;����7ߙ<��C��20��H�Ͽ�	��� �?O��A\����:���!�I���<������폼O+ʱ�����I�1n�47�� �:�����O:�G
���e���/���:	��z���H:���9T���0�K1�E��Ɵ/�ur�'o�#���1�������f��d��>�sRj~���~R��O����AJg�sH�]eX������w��d���Of��?���S��I�����Yg���lJ�[��Ȣ�';�ܖ_Gl����B�u��s���e~w�����'S��Y�IC�!���	Y϶��ٳ�fI��?���S!�7F�/G��V*"^��:�������O�]Vs�+���;��'�c���[0���Z's�7�f������O	���}�=�P�����L��;�����!�ƞ�U��Oԛg��_ġ_,���g��FH������N��Ҽ�z�����ҷ��`�����2S��z�����%3�=y�R����U���嚗��w>�9�?t֟���sE�}����g*�ol�_u=~/8���n���'MP����~:��k{n��8(�&��+�5*�(��x�D�w(�op��D��Cl�9G�oY����樂��R����NJ�os��NJ�;)�_!)寡���I����T|�.���.���)�����X�}���CR!� �t�I�J�CR�f�Y~'����N�?~��:I%�gD���������Tx��!���o$⑀DS��Җ'Ж�s���Bi6MK�f��g�U�h�V�!�<�Ui ��bT*�J}	�]��c���H�x�q<m���2O��;N�E1T�1���O{���rҴ����<#]i ؃�3�_!��y�����"+�b���M��u���To�So���vx"��LW�P�r?�C���[*q�.,# l�#�ة+��:34��#	�\���ʭXqfA.;2[��r���5Sg�0�<p��-kV?5��Sf�w�gjD|8l���W\�&��م���_T�œ��н,Sz������Fw���%��!ؙ��,�q��kaZ��(��@y�>?�E��tE�<H����e�~�:p'�E?�p	��R��!;�^�yq�6e�6|���Yוֹ&��3��b�\ú`���9q,����[װJТH_����yP,'+유Haxs�buF�}��d���I`ǫ���YIm�=�&��g7!�y�w�eė��!Bp`;�&8#�x�n��/�y&�uS7���T����2�"�S�`C;^^�V�{di~�͛�h6t� ��τD.�������q��Ӥ�7-WFSL�u�c濑+���(�Y�������E�-�ؗU�D��^Rmq�9�W��W���X���DcLv��)�r�o6�l�JB	?��)4�%�,���F�ڌ���9�ş��&�`�N	�Ό���rd�a��Y�&Ӻ�}�5�r2�L��q!~M6��W�π޴��up��ɡ��/�H�q�+�O���fϹ����M#�c���9	��_t/>0:]�[��p���U�s�ө���[
� �7(#LqY���&JBe��-!�OPoC��;�GM��S9w9Av��>���@�q�^�nee��i��Ry�~�O��Kc��`�0E"$����րX�i� �1��@I�Y�]~K	R//�UIUoS��F�6�p��T%_F�ZT�}w��'g%F�g�\�agN���"��@�\�nS�2fʦ^S�zr���8<g��+,ϓ[s�~��UL��~���Io�Ʈӱ����
s�&�i0�t7Z��;��~�Il��7����06Ϗ�TwPt�L�t�#�� �ڽݵ9!ZZH�/�?�x������H*�y�3�~ɳ��
�ZS�*�\�5OJt�A�}��d{tڝ���^_kpX#%i��_�K��6��U^C��up�%v��Up�2^��>f�!��-D�����w=g���nș.���7�!����6?�u��<�������������p��y���>�g�
l�+��jl.	+�j�" �m��Huѯ{�# hroE6m��lwV�-�@�h�%<Q��7ÿ�9��rf2TBH���F��:��~�_�a��8���Ōp��G=�
�I��P���<��}�z���k�y���i�^��	��h+�xwзbh;����k�?��\��L�Զ�`EC���(�g�
�I�!���]����x,:�=�v�'h��B�1����4L������6�u�R��hNUhE�p$�����U��T�/�@���6Q��i#�3{Jt*��M����/�$���'}l�JT�"1�c�~����8���h���ҷ�S<v��d��q���/Eà~��}�$���A-�8^bt1̼c�'�f
E�Њ,�\�oB�J����w�v�q��rRU�~��:��jn�=�;'{q�e}�~3Y%a��s���}���**F��+�G���2�    E�傊[�0�*�l��hཱྀ����Z툯�<�ǺP�v��D��n配�%X�	!xu�m�{������73�@�"��~Y�
�� "�ސ�}��'��g|0�t���ҹ{�X�Ae��8s�'�����k������b��u��!?�:[(B�8[��z�:Y��CJ�������Ts��w߳��s��Ѳ�������0����m� ��k�.�by���0�c��5c�AA�>	��@�c`���v��y�m�&�d��6u�`���Ę�lS׿4�dh��f�P�5$����=�/-���c�n!��/&d�X<�ֿ.v�ͩ�D4���⋫��2tq���|�Ca٥�m9�}@�"՘8�G���4�ѾD���؃p��e #m�!U����.��}&)��1�������� b�O'a�E�7?����8�F  �A�x��zc�7��/~z�8�`/{q��r_T}����N�X�x���׈�V⵮��<�9�:OǞ�y�c�,�;H>�0 ���KׂA�	08�%,�1�$G@dgմ�h��eL��D��/]iH�>���v b�?"�#�(b���E���e'�M���`+�Ac=|���4���M�~{��aQ�W��܂d���ce�2��o� �lvr�����`���L`�v�̮"���m�Xu���Vv�L6�)�+���ȑ�'tNs���'�%q�>�3+�$��eNFk-��d�W����f���n=q�]$ЩA:��n;!����\hwb�g�Qۈ��Q؇�,�����K�<%�N*@��\f�t�+"����ϼ,����M��u��Sn������%mY����ƘS�<1�G���tA��{AΛ���)(�Dw���8z!��U�CQ�޽��O�f��s���݀L�0/�P�h^1�ǊB1+�W�����TO x9��7iŃ�8]M��f��A8��l�&�NW�=i�"�jS�N�k��S���͓u�SRoX��*֫�ʃ��l���8�כ�w�.Z�2F����d�j����u���V?��k��*��`�O'��;;��â���{I��5�Oء{J�[f�Q9�֠m�~{�	���1 �	�� >
����k�~ԫoGΨ������ךx�z3��*}
ߏ�'/����Qz��]��i�ɔ�b��(QI����G�=M�9�1�F��`ʂX��Sְ:�b.�m��[ v��	ɽFB(|n7�v�� =.gX5�>�1�L�	t��O�.&��H�||�~?1��N��$��kΚ%�g�� ~�>�oFw�ީK9(��:i Gqݼ�������Wx�DSh��Z�܏�V������I:oF����ǐy�����Ek���3PLס�#|���Ł{|N���^<�`�,�Z�23Zr�*t���mw��� ^@�2�|����>N��Ef�s���HE?�`I��l�Z.?�_��{�'�2!�&�rNG�ܰ���=�����ٻd�V?Q?�"2�H�����z�p#�)9�z����K�1w@2J�����{m��fsn�K��?���U�����m��ץĝ_��D� 6�&Ch~B	��|8d���r��66�ŀ@�~��|��S�W<h���C�T5���}�Y�(�G�%v�m�*���������0��ZB�l��VԈ$����lpc7����i���0���ܫ�tNnFaj����w0��fj_h8�\���ôKy;�)0�`na������4��tV~�܇��W#��[�#�&����`��=
�wf�n��#G~*̾��+Դ�i;�ƨ��������Z�P&�u��F�J�c>0 �2�H���Z�X���%�>�t�"i�O���E^������ڐ�m��c��ȧ�v�l㡽J����&|w��x�j$H	��!w| L�(\����^n���<���q��
����� jûL�7y|�˘H�d��K�`E�Y޲NʯIZ�@?9�8��Q��n P���4��(���1��μ�4�h����`��7;�H�G�:�K�� Z�ʢT=�<`�Z=�M~��w3�/AȰ�~r�9f��:�)Z�$��r���1:�\{O-뗛im�A}}��};.��p�1܂\+$�8X ��j�\�@���X�")brg~3/w�b��/ԁ8qYLң�~,������wOoP�U�X�M�c/@���Q�����" q�@���R����Ż)x��T�*�7�q�Da��u����>!�A�Ǭ���(�>��F�]�Ǥ;	N�o&~/�a��{��v������Ĭ�
TC"O(#��UxE����6��E�2{�>��T�!��c��0��/jy:�dK�M��._�t�e���`�x��+�C!;� *�.O7��z��=��H���2p����8a���U�{,+@�j���%7�~�li���t/fVO����4[̪�&{�2���h�I�X��Ib�h�?xL�d[��b��!D~A^a�
/�3�r�|;i�"�=��U��>ْ���q jxk�%�Q��ڞ�1�@�aI�U��DN)r��-彎�,�W��F]/1���	�s瓚y�<6�W^,�~\s���C�j>���=V��7}"��b+8��[8����Mw[ֵ51�#$�@o����Y�޷�:����ER	�� 0�&w?NӪHl�4���V��WZ�����v2��i	���0+�d�Cx<{��b콆%��>�;��k��h�P�����W���XР�+��]����_��gkO .B��l>v4Z�l)�r�Ӄ�S�A�%�G��&�Og8A�̖�x����~��G��6o��3.[*|ܘ��3w�j;�� �:]�0MðT�Ɖ��7�33���!T	��*����f�0X����
���$��~�Gnٴ.�7����D�i1*�n���vN���d�3n��'������w�3�̺
���	���Gm�vo�6O�qwnIS#t�n���� ]�s�ٱ��N^q�\����㶕B�*���|�گ�֟7'���xl��'�6��Ġۻ��S���Nǉ�4ҍ;1|x��~f�e�$P��J��e߂!i�q�]�~���z-��8Y�e��ؤ6��naQG��#��LhjtkA�$h/�������f�7$���&l݀���|2�#�E7Tu{G�A�6��,�,��D.���k����@��k�K*/�T�#O��[��� ���`�h�ᇤ-�5���>���{}f�	i��z��f0\bs��I�ܶS��/|�q2+������I��.a�}�rE!��S]v���'��@�||bAn��L_��>�!�+=A�`�huFm>���Kr<2�cu7v^r�xkV�$ ����/j���E��j��<�#iwc���EiV13d�!s�<��J�E��k��C8'��������Nv�$�8ȝ�+���g�{� �Z ��q�m5���zB�c�Ʈ���iA`%t�=�H؞z�C�z0��y���o9�N�*�k߯�٥��^�q��پ���^���ʟK�sSj�]T\k�9��+����&G��ؗ��� ^")S5�� {�p�\f����Y:�M?�4��:�����`O�(�9��E����+���Yv�jҩ!��Sp�C֤0�7�M���:I֘wy�vv/қD�z�\����AW�ε�K�Hɹ��M�~�i��-�in���m�F��<L�ˣ�U�4Sa=Z�� �m4K�&f���`�*��<��s�P́a`�R��.�{sҽ=t���{�ŕ֠��:z�,��rYR/�ϊ�O��d���\C��4IX�o��_QG*�(�#e��;�6"`���^�M0E:���M�3����eZ���*�������2�&�3��ǖ�_�����`�`5�����*�N�wd(���
���}x5��fߦ���i�{B���}��@��57����j-��UZ6WU��<H�oM��=J�'�8��XK\Qg��$O�\뢫A    ��{:��Ek���y�S�F�ǣ�9����_ky���l��4��� G�&��*��Ws������:�z�-.B��v����<�p*7��Eg71�:��K4�6�U���L_�/  ʞjq�E��e��*%�!ͨ�Ewd�L#�	m�@�g�;�b���Yp��v̹����8�Pj�ͺ�e%6)LI�F�r�Aۍ^�^����Wp'���!�~8\C��<Z�T��~��d]�&���ix&',G�P�U��t��)(5���B���:I�MPꟃh�̃�s�ۿ
���v�:#�ϴ"�cLZ���Y�X��y��S���k��'�(�awb٫w�Fo�-�K��!S��9��89j��Gc��يCӬFa3��]qW�"E���|[P/��Ԇ�'$���W���#��z�%�rx��%j��r��N��3�+�0����Z��VnZM�ړ����Y��:��ㄕ���G�Ix��[#|���;r�9�m���bù��e����T���-�O�tW$����*�{�O`�q���	�U����,l���p�օ��^H�s=���ڗ��>���s���9;޽F���s֜�L����5T��V\���y@��"'�����V�}-�5W�p�D�X����آz�����{�U�a}�](m0*���|튢k�o����t�nٶ�6$uǁ9�"�WUռT%�`J3>��T��y�����%��m���8���ƌ�����ݖ,�"���0���H-s���8�(��q�-~���~x?1ƃ��3@��3|pvЇ�7b1S���"󭪂1~�Y�4�&���I��hˑ���)��L� �İ�O������Y�HS�a ���#���:m�?mћO��K�J)M85�$�y��NQ|�+��M���?��1Y�%^��4W?��sB�gk��1�D��5�g�3�C�������v�x��3�7�zr��g���m�_�n�D��F!a|yg.~�����:����&;�dizؚ|��^��b��nN����yp7�Mn�<�JzA�Z֢W������Df7ofg��fu�"�m8�?�xN�ߧ��,��>�0���.x�D�W�H�4-ڶ.&��Z���N�`��*�:������甦:�~tr���X�Ͽ��ƽy=��ۿ��ǩ�d}S����8�ˤa�����w؟�������\7���G�E�W~�nJ�d��>8]��g�'�n����������j;�������y�,����q�>���m�捏ޙ��~R<:U3�ٻ��G{緣���kf[=�s��GXͷ���?��i��m����� ��?���������w�̧�>^�%��W�i���oI?�9�?�U�D�A0��t=����1�?�o���/D�~8�=:������ x��?5\L8�����xl�Z?����� s�e
�s<|=峏�Ju��<Hǟ����9{4J�j�I���h�<�o~��4'��~�V�}�aܾ;�U���n�]?�����F�ǫ��I��98��G��r���c�)�:��W��1O}�a	?��z�s���.�}a��w�MY���â��ez[�o^1����}��7w}�������^���G�����v��?z���٫��JބG?O�M[W�7���o�������g�K��mǼw[����Go����:���>��g~R��}9�7E�.�Oi�7��z����o����z�~_��N��������	�v_s���!��}p��>z�F����P:f��9� ���7�����ᰙ�[������`�?du|�i�?�mג����C�]��Bޣ�=�ў���]���������"����]�v�m�:�������� ����j���w#�'_a��~���U���e��5��_���U9n��ۍ��Â��߿\���7*�w��������]��%��۾_����VN�A�V�*@~�����3��[�S\��������\މ���o����r��hl�f4�_W��W�y��}ŏ�&,�����˽�W$�[�9?:��(�r�����3���!������T��:�|x��6�ǯ?}�>����q~�s��f�~�}�@�{�y���5�Sx���õ|R����� ~����1���Nyz������w�G���(�jٯ%~��o{�YNG��g��0�B��A&8�}���+���ַ��s�p�ȷ�?j���w����l���O���`: ?��ڿ�_ ��V�>��=�<\�W~�_������������|��ʨO8��1����P�f�}�_��EE�|i�;�~�������|�g���jO�������,�=����O��2���k-����k-W	���!rg|�S:u�	�ߢ���@���W�=j��B�Wo�o���&�?���h2���l�G������G��M��
��?|Ю��p���n��?a�[;�ѿ��K�W��������6�ߺ����	9�2��BA�XR����DZ-�;���'�<�r�Ji��������w��<�����XL{�~lmG���a�?�iͿ��L��Y��'3��q2���=ǎz�7e�_05�����_�L�x�b�����3�<��Py��E��Q�����8J����7��d�b���&��7j�ד>w��R��Q������(�q|���n����7�[��Y����Y��%��<ƕ�	�84o�>�*�3�=������}o������������29�<"d����gN����w��͝O̱��?�������? ۪)��������z-���g��}�.���(����G��4j������}٦n�����[?�������7���}�{�c�~^��h<Ώ���3Y��q��?
�]���vn��׾�N�?v4� ������_�?0�͉cݎ��]���÷?}��C���}��+=0����0��-��?��j����|���K���8D<���w\C���������=�'�����v)�޽ʚ����@���c7+��� � ������^��c��_�����;��iA����.��R<������2��؈|�e���O�{ȎG������g���ߧ�������osx�c+���@��qv��h�������7���e|�?��Q����)w\{����׾��u>ul3��N�T�t���?����yo��m�~kJ��_����x��]����?�)�}��p�Q~���7���?@�?��޻������>$�U�������"oA=����5�=X�6����_��g���?�F~{42�Q������~����Ǐ�}}𫃑C=~�ا��N��q
��?6��O����������?���� ��_wc�u�|ܿ����ׯK�G���g����Q���8��G��uO�������h�C�>�v���������'_.�����G�:�����F���;N_q���Yo���]H���"�i�q�qV�C|�?�O�{���m�R�]�t�ب�����SE�ߢ�sA�ة��٩m�2n���l���=���쿆m�?�g��\�?�g�؞�׸=�#G�����҃Z��J6ssm&-l:-|���L�x����8��>��.��$�BȖ鸛�(X%�EنU2��}DrATV�t��5\Vl������������gi��u?��B�����"�?�?�� jo�O���u7v�������'�m���^"�J�N3�I뷌OC�ѥBH�lڮڍ`4�HWv���"ʆx�I]@��T�B��{}\#��k�@�M���R(�I)�ӷ�M�L�^��ڊ�ʛ�]��AşD�	�o�{�0�=.�BG:����?h�h-��� MĞ6�=̌èn&�o<��(��/ё�{�d���b6��7ne�3��0K�/�Ψ�o�:S�Js���Fڝ��9C
�e�Y[�e�Ka��|�Imsr݆�{;�w�Ғ�/W8�1��a��Ck]!�{i�m��n �z �?���R�O_&�&h����v])���    0�w"�z�D�\d�Es��qc��5�o�8Bbb&���^��S3gvc�7�rpR��x��Ui�2ySc�����2~�*���=IR��3[�	ج:�5P��2��W��9�9���욈D* $yy%�\�\�g�I�tE���2��<-N��Sn�\Xոn�=^,fV���ӟ]�	)�d,m����%yܚ4mC�!�'X��킗2��T%żw���)r�m\D�<��kw����M4~�]���R�����"n �qH�����ڝ�t�J@"K7#vNb'�����&�=-��ي9�Ύ�=�0����I�e���PU�w�"�'3�vc���G��(��ب������D󅱁ƒW��d�|�&0/3ʾkv�9��Ξ�<��v��}�)�u��d.m��Σۂ)R\�`����Pbt20�|.�,/�i/5�=�n�9b��I�h����^��m�nM;��<{ˆLsX<�"s9~��5 ��
�#_*�z��ۥ��׮��6��Rp�-�y���\uw]#Rd[{W`�{G�O��\�n�u��Q�Lرc�|��[	"���<洱%�gi!A��9V�� 2_���c���D����hR����Jd���h�ﶋ]:{��BVTl��o�xd#'�����Dp,��T�H���}D���j���8�g
OV��v߼�-��][�U�h��' 5	�N\xY��i�l/�@>N܀�.|m��9���#�jA8�#�j1|yƉ�~\(�iw&��L����)--�1)K@��(������8� �n�0'�v�`��jZ�81fs��6�
x	���h��H��!1�+�;x�H2�k�*�#Xd���Jv�`�� f��]dS(zb�*ݰ�C�s�}�+��?w�_�n���k����^^y��ȸ ,��	�R���Fh���C�/W?/��!3}>�]Y�[�h`otYh�L�'��5g��x饽F*.Ä����bb���~@]K��d�dy��]�!fZ�0{�����\8�*�[��f˙X����#��r��8́���(��ΘQ����Ť�7[�	�O�TV�Z��zG5u�,[���H;�z(����h�5{ h�+��5ƴy���:y��{6B>��>>S�?Y7~����^�ӎ����Q%�P�a���ݞZ%��E�������Ō�h�f8l4�� n]t�N����uMw�����wQ�?�!��R��5��Y�����L՞�.vC����ɡ� �/��Ԋ��Є.�r�U�ϐ̬��V̿*�(�'��SM�EO�O��'�EZ�
p�����|�Q�厸1�28<.>尥�*��̖��๶�g.9�,�^-�S*:������X"��a�Z�Z�y�*�@6Ъ�b%� ���N�s�e_�K�ʠ��H��	r`&V�����X��Km��ǔ�����b�J�W��*bt����gn�"oAq����$���vi�cO�s��Y���L/�@ƆE�~g��E���"F@%�9��1�[��u5�� p~���.v�f��+jm��B��#V�u�Xo2�Jq38� �z^����a����n�� '@}�nz(�r'i�����Y�yu
��D�a�%�Μ�(�U�y^8�Qp����d�"��Z�ME�K�QӀ��L.n�'7��/����g��4M �����:��j<+�f��\q6%��W��r9��1E}���qMhS�6��dO�&nAg��E���__nȲ�
�<�
��,:p�y9�$�6k����i9!�s�j����r��EC����
�F`�y�w�����
��Ơf��^1�iz֘m:�qZ��UY5ħ����r�p�Z!�z
���ީ�=8��k5�2b8�	ί�� ׃�Z��M��I.�Vy��{��3�8p�NM����2x�BJ��_�9� l~�/�jϷL4�.�ڻ 1~&�ʵ�����w�?���<̍{׌Ra�%��fWu�^� ��r�w��pa�oȖ|"�u�g�Pռ
��Cl�s3O��Bn��������'�g���,�b�9�t�0��|閯$[�6�0��l��
BC!V�6��ξ��&G4x�:ϽSט�x�B!5��b����u��w�[�r�ޓT�8�^��,��x�~��~�٤�$�+O����㱣)�t	�E�9���CA{��mE3#(���9�i|\GyJ�>�x�C�rhd�=)
_cKM��k#
�9���[��L�IT�m���,��$6B�:ܸ�%>%0{��^�E�p^��&����!4�D���`��k�)l�(f�~�`0LT�}.tn���I	p�0GH�dr�/�m�r����)7��%��֊���)�a�c��E2�Jh�ub�O���>�E K�Ժ�uT��%��L�m�VR��:�vmk����\���ݽ5�`�j6��r"�m�nZܡ�F����%�jb�P����p�o��_��wh�z��Ȑ�ڋ�2���<������D�u�|݋ǍC���gRo�.=�,u���'��R�{��7����7+���̘ۚݗK�n{�4s`=;�!�kK����e����}>l���gh"����q$d���F����H3ᅮ"���T�!���]����r8� ���>�u�>Q�#m����&�8��l�:���7��Ҡ=�1���ݛ.:�������=>=L_.�-r*7��ݡ��@E�v��i�Ls�|e���4:,s���ݴ�ۅ6�%�0�����j�\��I!��˸�{����$�};/�G��),�og���`#���fAb�U��g�5�гȵ�)�Wd˼���y,=ucv�o�2��=�'��^���r�He���lC~��ט�!/͙[��I��=k͓2���/��|h�1Y<����ĥ^)�C��^Բy�w�����2���b�dg�*O�j�P?t2mt��GC6zH���n��04�d����*&5��K�>=�!��m��|SIaV�Kb��=���9&ɑ~/h�dj/��5L�� ���ժ�ɑ�'2�ڣQ��Kk�)c�O4�7I�	 \ �ƚ]+p��,n��3�ĵ�פ)X�Ig��=���\�I�֛�gh�,
�����&��l�)����ʸ��r���+��C�@�H�bz۵,^�r	l�bM���Z�'���\�b�9�H��E5,~�ꋽ�pVCf�T��]���J:`h��z�CcP�gqlv/#���3���PI��޷"�	��{��7ף�a�n_����0!�V�q��8�+'�7��t����v��2H�'5PԋLko���.�3ب4T=�i�H��m��X@|Vd|�\G�L���|�\�� *%pzR����D)��b�؈�BPEľv�n�ULA��6���'��R�����)cc��fOk�̬:`�f�����em��&G``����O�u��VL���ʗ��N^[���ͥ�O�5j��e�����Z����Ӟ�8�X��{��Q��"��f#'��p��2��+arp�n�h?/J.]�'���S2=���Fj�PW6ND��c]����O��/~jRֶ�<lI�~�I�e�j�|�g*������m/Ĕ�)�N��
{7Llv�H1��)Ҟ�(� ��Wo8�g�?���<�mn�h�-�?�A��
�`��%�3��|>�ֻ������Ft�T� �e���U��fxy��z_�"���#
��,��i<�'�Ώ�oyt뽊�ĸ���2�����e���9�͹n�84�I_:����ȀPEAƬ{�]�e��j�2���|QW�Ŏ1��
>�m��+c�n�Exf~H4�	��hjx(M�L��Rg�Ȑ�q��@<���ɢ=[�<�}�.�^v�U:"N�{�����i�T$z�Y(��Ld��2�U��=6D<��ƳZB��� ��Xh�5e|��[��Fa���$<7�|$��Ô�)��"Йc/�#�o����`��[]�3E�.���;��"Y+B9WC<��Ԉ���
S�A`o�w#n@La��uǇnK��&ז�FքXu�K�k�b{خT~�%0�/�    PP8b^��U^G-C�6 (g�������D����$�����'@:��r'[�� �M��Dԥ��u���/ӓH
�SM��yV�n,�b�HZ�-v�K�_  ���Sy�ʿ�S�?�$]�}��T4<��#.p��p�cp��ݨ,M���g���ɱ+�'����*��$L]����g�Z�2�l�TU�It��_��u�P��`TAЋUy���>��ʅ]]"e��3����^��W���X�[c��G�� ��!�{�{�ߋb��;�F��
��,��B�Vn�Ր	��ԩB��.����]%��bnҸ��b#��F[�Z�B9&�����6a�>;̡s�J�6����J����X3m��0�t�;���]��C�x|D�j�C������� �j�Y�	r/ �T�V�a������Pپd��e�GE���f>Ɍ�h<���.�b��WW��"իB�Qq�ȶރ�7�� e��x,��Y��}�ٽ�2�mL;d���^LT�H6�WpZ*��a��Ѷ�Ս�&J�n&kD�I?�aG⍼�����e|���p��K:_@�e[��������e}T+�{q�l9�n ،l:B')
��V����=V�s�q0���f�9���y����+�)#G������ߢj�ç�;B��2�Y.[�N��:��9�T���E�QZH�dӓ�t݅8�W�Ie�r�s�>��P�Ղ�n����,3�a�u�R�B�_���4�Y�p�1S��j�1�wa2����5aU��iaT�w�M���'/*�Z��Ivuv^�����FΈ��A`D�^���I�t���|
˓�UХ�����8�R+}�-ŹW�{���U~�m�#��M,�EM�g��bu�����fIŜ롹�K���mX��3t��K��2N��3ȓYQ�D�FN､�@\��ՆP��}�c���|U��Ջ�`O��
�{ՒI2�C�l6=.R�墎�x�[�r*�����&������(.#͡���<�Up!.�pZ����U@jv� {�-��O�h04M��P��A���귁�g�9'����}1	fe�>�B��+��Uh�{��^Wg4@��0.�7�E��=�>�SG_V_�9dF��ZD_�WmhQ/	�}N��,�;.���J�8z���)�~a3	[km{��!��`Z�
Ǚ��=����H��׀���^ù�'p�_�yE@�+N����K�S�>����Eh���5��J\A*���&������%<3���ݻ#L_�k6��j�/2H���8�ZOF�)/{����=���"�i�S`� y��<-tN��e�D~��
��h]P��̲�ra1�==,�k�P�Z:^��3���k! fffE�WKslJP�;%��^��ad����2	`{�s}zM)�0"�rc��f�����ۡP�I��A$=�����hwrc+5��`��i�67[{g�ݼ�st$P|��b0��?x��l�
���Dx�i�][�u눮̌XHKʠh��f�PY��4�I|"�!� \�����Er$`����;,�Q���H"�.�:���B��J6F��0���^z�j�ȅ��Ś�e5��O#�:�{�шJ��(F�|Y8���$

G}�u��p��1����Q������L�ì.b,���̧��K���O���*j^��*
r�1�,դ�X�+=��f��Sӷ�h�r�'�|n����4��L��Ϝq��'����7v7,�d)V��z>�cƲ�AQ�K:��<S���+7����bn�2):]ѧi��O������G�0A$�!�줁�w�ɀ�j�<���0��I/"��~5�W��� %f�]w��W݉*����ӝ�u���:�a���B�k@��F?]���a���U�i��^�=4�E*��"��F�0�{l��G�F�h�%J�i�c��%�l�||Ib%���F����-��,�x3ǟw1V�����Rc2���Ȩr�-��%������@2,�1	ȾP��ʖ\_b�~D�*Ѕ��lF_Ve.|VN[�ʆΓ��l}h�ul�G���e*c��ƶ�HVʾ�78��u�`Ҷ�8L�����R��>tW�A<%+G��do��EQu�7_pe\3Y�vj	pZ��<�b��	ɪ
k���: ��T���8�˹�V���R^4����ݐ�wO�[h�2�k���wl
(�Q� �?�ǚ�����=���r�V3�ދ��Y��T���ć_���dIL��̚X�&]XG&��n<W�8Zu���:�4������s��5H��M�xlV�4�v��%�j����s�'����(m�9��Ћ�����������)m�JH@�3��V6��R�O/�����zn���F�r8>M��{W���ф�r^B�:x��� &£}�	Q6Jf&.9�n>$�!�c�i����f�mX	|+J�$�e����)�.��bpї�b��q���D��qQx^����v��>��9I�>�(3��b��5ӌ�,HSO%Y������H�.)4�!?V�F�g�,N|oF=�(d��pU��
������mp�����L��{9WE�Aԝ[�������J�;����u.��!���ˬ��@=���pbV������살d	"[�J�_��ґdoy����vFٻr���HW3��+3FO-��Ǧ�����x]b��8�A0�ĊWU�wlӇ���4׸�R��q���NhQ h-�D��W{�P��^�c�!Y�5u��\W~���+�eRm�Q�e�Uf!���AR�7x(lf��7۟��6����y:Qꙸ�ֵEɳ����y�)�*A-�\KN��N@������b(��8�l�}�ט�0�d��&����/�K�^{ZO$�\ZW��[��#y*kr
�`���p��ap%^�k}�{����t>>1핢ln�R�]KB���K���>��ūis��py����7�)E�;��7'��0?��	�bZ�ł%\Q+��	��n圗�!�5л(�c��%�܍����Q^��L�!&��Lt�K�&�(�B������M�{��b�j�5���m�Gb�F�à�y`��w�>��.:v���Z�E��@�A��)�w����iZ�H����B6�ꌡ�n^c&�8��\4�ͺn��'/���n�0�zo\̋��zl�k,Zgnބ��DDg��$����Ǆ5��:�\��L���5�n���0Ѩ�8����GQ�8}/BpOk��a�2��[�0�f,�Y�봖W�R(p.����1|(�t����i(-b�D��aΜ�B<I��r.���F>$K��Ȥ��i.�k��zH��JEJ�r���)�U��8�
 �w���D?�l�B$N����XnO?���&�//U|r���AzMv�a�v��Ш\ϵ
�
�v�� ,�wW0�><��޳L�����9����m^U��n��3nsW��\r����J��^^���Ub-M�6cP;�r�<���~h� rj6�so(��UT���o]���|�6��	uu�������QM>�/�ܚ�+]�8������\2f%@N/��j�\+��ŞgH�d�O�z.�Dv��Ӆޫ���H��1J�HNy�,��B��bO36�i<C���x����&�e4!Zb��,����qM3o��I��I�eB���6��.ؘ���U�z8.aŚzh||@��*�=�`�PB�h-x���Q��	R���J�5��p9ɤn�g��l�s-��#�z(8�\֛~겓L߬��8��/9��a:��a�H�ECw�~�E/���P���_[�3�-d�S'�H>;8���'�^�u�'���K�nc7#��6��.	�SY�Z4J)�=��+J8���6腽�왲��6Ll4�T!hC@��?��d)v/�hƘ!R)W޿�.��J6rz�� ��z�O��h���Ƶ���y7�Ƅ�"�K[Y��؝M�'�c�+��$t���7�Ŭ���2w�p��/\/O��^3���rT�h��i�Br�5w��4�p�L2�<R%d�_���=$�r����% �  �nZ����5'�}hav���A��;��]���*
s�E:c*#×��u��Mz��� ��	0b���b�C
����a�Az���z�Q���Ec�Q��ks��>�V9��)��3�OB�zs0CO:�b �;�R�;W�{i̮���+[

����h�\�-2���n+"����t`o[�S/^,���6T�v�1����09�� �lu��A��=a��OOT/�-����ʌ��ᐫ��w�{H��k طA�2n��4vO�#N 8�)���(`Ubhq��� |9��k(r��ā�����q��F~����9y�T3�	o̿�e,Y��V��?�]����Q��9I�Ϸ��I���
7��Z����z�"-@!M|Z�-�˛�kZS���Ǉ_T�J��4��w�5��4��^Y[%�<�r���6�e�pj�	5l�z����pc�HB�ęƋ29�;��S4f\^�����J�]\*��Ru�tg��V< /}�/-|o�m���'�@Dl|>�hd;I�B+��rXGB�^Z����U�/�s�3{��7p�^�j�T�<�{�r��٭k���ichR]�^�2_7��#��N�#gBO�*�6d���kt/�\$,�}W*ET��,R�B�/F��p��X�<7�.�������P���sqG'
�<n��������D�ҭ5N�J��zq�$_q,y�]��h63��@����QV��CBq�����j��EHP'�q�����h-'w���ϒ��L����n��I_iɬ��C� j�WK��Y]҅�Z+Y�3Vh`��u�W5S/{����q�Qśx�G�x����'�>8�}9��ݜX#U�2{�Buj�>�0��YK��:�jx��� �ȱΌN�f�m���|��f�rXk�_���Y͵p�A����L�,`��_��#eXDT��z��)}�zH�v���5R�Hw�r��T�A��`�5пҐ�9GCn�F��㉚�	��=rP���y�<�=ot�{�\���.��U�-I��5�&n��$
���506c��u��HK��j�)�::�1�-��`nf����m��6���h���{'����@+{�Db�E��\�,@r��K��P�^�ޢ�3\�Y�5�E���ܕ�>��̜�\o�.�N{��a��p&�`<�L�z���F,��
GN��3՟�>nn�(�i���Y�x�3�bn-R;h��L#�م�JR�4��R�77r@��}]�yi���C/J�C"��q�گ��FdR�H� x�#���q�2�X�:�U�n���T�'�dF�p��S�G������J6�p�#"�I�ʶ���-n��]|�|zU�  �]�rc.b�y"�L�j֭�2�̣eE)U��F�.	u)T�ăN�݇A���ߋ'<!����S���Kߋ�2���Vu��Q�wr�'"8~�	�HlI�2M1��"�]��y�Ǩ�Vòٞ�V{�i�')Br��j�����_Q��i�����T�/r"@�u�]�pq�n�7���Ӻ�9*9�aaA������VJ��025O��کs��+5L���Z�p
@ҡ\:I����~�9iݦ���n����V@�o$���آә
&�T�l�[V6� �1Ԏ7k]V	+�*ճ�F�2���X���3�b!К��P�&���Ky���ϩqўj�K��x�ɳT��rp��֌�:��-ڸ��I<|-3?[x�*�h�
��E�(w�BQ9��§"h�W?��yX��,r�����1�i�Y|"������T�&g%T��u#�W��/kQ���^�Ǩ�gۦ!�\s�?�P����Gd��CT���;}�64G�g����ن�Ur��keao�!z�ɳ^~���Y����iE:���d�"Q'}`Ց�th��3����K�\�(�-h�)9������Kj	���V��ÒZܨ�>^I7�kc�[E[=CU ��-ޝ)+��8�{����U*��n�C!��D�q��r^��)�7@��T!�̪]��Ȣ���E*��Η��y	d�"4��Q���Q.̕��M���.�b���r�1�pƆ[S�cfZ��U��b;]	�J���&Jb�a��)�8:=8����y�Vťr.v'!i�������̃�,��zB�c�{䊴u/u�t�}f�,�X�ڼQ�g`^i���H��!ة��gK�蓺S�`"ݯbj�rP.�U�U4�d�^<�>HX�Բ?N��nڜ�,wbs����V�^;Rh	��kXi��	~>YÆ��]޹Ryi'q0��d!ט��kU�тN��0�����e�轚��ܓ�Q��q��gʿ@���/^���:�'�	G���O���-����|�lˠ1���L5�*�8#BC�e�sbZ� ��L���r�\��� qE{�N�b���D,_D���A��l�ǫ1c�J{�ఉ�x,q�C�˳�P�!�(C���hA�=�}�݁��u��C�yh��dw��j�ʦ�9v'��-Ed=OL�-�m���e��\6R��R�F��c$R��c���ɢ�/�;�B#!���D�f'��u|a�mh� ��]�*.G�}nShzؠW�M}��@[R�:ьP�3����Q�r��_�Ux6�r6(ip�$�/P�N�IͲ2x�\r���V��R�H���]�
HXIC����*�Z�竃���+����OM�$7�1	�8=������ϋX������
�孒r�-�%�U]#��'i��y�%�� �|�{ ���dJ~~�XI�<�'T���R)*�R�P�� �+���]����X��86^dh�}�ۣ�X��"��������� �ϹO����$�mȥ �LXB.�{J��c��C��V2�tڂ/A�`F����XG�Gm�{�qE�z��021K�ai�AV�e�BFYwXz��H����0̪������lO�UdlR�r��mSˤj�ʽ���\�V0��!�_�(lk{y"���s�8����ʶn����%?ɢ3W�˞����N�E��ܿC'
����3g�[�m��ϸ䫣��ٓ����䡞i�0��7�95�:P��Fν����G���[ؿ������k�<������v�7��ǯ?(��9 ��5B�OpH?�������n��,�/��_ؠ�]��A��v���7R[������������I�'��ϗ�]�XQ?���������'c��ߐ����3�������wM=O��x�}�������˃*��������U�	����N7����lR�o���K�����7�ǌ�4����s�.�o�����?�xoၝ�-��/���a5�_�~���z�?�׶o�As��|�6x��������A4���~�~��D���&骿�q� ��P�>�����c}2�� {�q��W?�2|	m��۾5o �<T�!��j_�����͢�� ������_��/Ew�)~�_}���gז}����>��X��44��}P_}����Vo�?�owr����m��p����a��y��ж7f���w���_�~�/��N��AD"g�𹼯�-�x�nF�'��A�rh|\g������}z�C�w������}�����>����>���;h������}f���y���Mޝn0�9��H���0�� ?�����ݢ������O8����3�A��γ����ā��倦�0�����E��J��/�1}_kj'ܿ�����i,xlꅄH����Sf��]��J����H�Ml\�U6���'�t�峝K��x�2��:~�Ǣ������c�v�Z�c�b�{U)�S�Ǖ툧�i����n�x�<@��G.H/�����rM��Rh���J������<$�\�=@��[�16��X�8Q�g�<Pp�T�t�nm;�.�O }���>?t��l�A	����ܯ�H=�~6��Ɂ���1�Ęݥ/V��\]�Sq;E�
��M      F   �   x�-���@D뽯�/0"�i/	����q,f�����YZX���c.�nf�̔%���N4�*OE�E_(Mz�z����ee��_1��5��[^�0�)�h�2�T���vy��Ye[�<rH�d��E���B����J2����C�cL$GȠ���7o��[�.8|�Ȓ�`�aL-I�I�SJ� �bIN      H   q  x��W͎��]3OQ�c���i#,��eS�=5��[���e�u�`�Y�E�]�~�{���6%R�{W�������~��i�`��I�M�""AƧ_��a���"��>��$%�,�1N�u���]q-[�v?�Q�u�D��ؑV��	V|n%%�V]I^�(�MU5D6��aN�3�w\��ܛX�����h���5��8ɷ�v�q�8�j��"X�u���OF$IW��խh+������\��j$L@��-���cGC�,huG��&_:�eɋ~�.���9��s��4���Y��N�L��!ZDY��4�/i�a-�\�7
w�"�zД4���� ��!�� ��#����L��UW��ђ�4G.t�%90!��O������e����5�Z~O����2�l$�'9҄���.Y|�u�8�GI���4�!%Q��x��_a���u9�*x#�����"	T ��/�B��;�[�, �E�;�����F�쪶�3\��K#��c�{�M�S!�E^P9��:����s{~�u�j����z����:H�(�@��S`lDsdL����`��@�}�Ux��n� ��t�#��#�x�~G-��e���U�ġ��TnWԿ��82e�KXn���N����mw��3��f7���C�Ip6�SY_��j�N���+�v%?�녥׀�/�^���u�d���~�@�%޸e��p�w{�M8��*V�@�������d�2�c���dEPxN?'��*='M��%B��2�	���S6�94��jޛ�>5b}�_���RWQ /�N�*�ب\���c��9�]���t6�93#��]�
��u�σ�|L��/��� �����f�HK�
L* 2�g����ԏ�o������~`�'��z��Ɵ��;�_j��a�s#D�f��-�<Ȳt�JQ���2�M�����$L���
�)	�Y�3��w� ��z��V�
N�3�����2���� x#`I��.^��&��I(3Gw�ys��Ǻ�Ѹ����[�y�Vq�wҫ&rk�		q�2)J
\Y��"��� �<*%|��=��_{��Jֿñ#��q���G&O��&�����D�t��&ɱ�j�G� �:�rT2)Am�����*i�S��?RV��r.��r³.��37�{s|z�n|���q-�Ps<��B��GyN�]�c@V����=����C�O>V*�TmxB1�?�CE�%{�,������}B�v7��L[УڂSǶ�}Ӛyހ.'��/
��m���7!�1�0��(%�h�h����Y�ptzb�a����������D�7�%��I��Wq�FQ��]�>�&΅�"�.:aF��<��?�~��^�����^������K�W�G����Rr������o�v_��I���SL|�2=~�܁�'cq8U��u������j%���Lb<hY1��^.t���zJQ#w'��+�I�����|:�u�LG9bO����?�u��WX��dY-Sc�te��`�5����ĬzVo@�~d�E���s��x�r�^$�t���i�!�M���1Л�`��O(L:s�?���<�&���1V����p8�E%�6�
�����9��7��i�7?M޽{�_�X��      J      x�3�tM.ML�/��6�4�,����� B�      L     x����N�0Eד��"?�<v�(]�+6��pb����1�xIl���ܑ��ـ�̈́#��"l��~B��L)�1�.��s�ѻ�eiV�}()�P���nj���l:�DWiK���ʵ]%{8±�-H���ӞC`��3j���yv^&6N~./J	٬ґ%�T2A%z+�4��q����V�tΐa�m�3���$hX��#�=>�OY#؋]����H�����8M���Q�-/NH9���0���>��}�?��3�T��,#�����r���x(��x0[��      N     x�-�KN�0���)|DBy-i�*$���b3I��ȏȎ�6=@��c~���~�=�L����7��Uq�&�xǸ���`��՝d�����| vRW��h9x�`���� ^7�ԉ<��xb���MWTG����~��L�q��Jk2T�	��u֐ؓ$�X@oC}��#?И~��N���R �C0-O�BJ�w$ͻ�E�}��@tE*�{���P]]�Jo]�;��3+^������lt���?�t�rvm#�T��%v8�b^l�q���]��y���?/?      P   e  x���]K�0���Wx��ήݦ�!��u�9&�B@�|��mSs�u���Z����Brx9$�t��z=j�ȅ:��P:#���u:і��2�b��p�Z��)�#Em�sSecn�9�a�՜�:��B�4J˪s!sjSB��1��L�%�1�o�|�-�ӫU'��:�T����B ��3��}2�~a�8ٮ�8ݮ��WA�Ջ����o$�M��8�d�ͩՠ`SE()��
ǡa~=�~��1f?��f�L0��6&;0H|�0�o4��YAc
��eY�+e���KU�.����bHEbn�4VA+�`���zt9����c�%��g�xwW�"|���x��{W-�3�v�� �>�H     