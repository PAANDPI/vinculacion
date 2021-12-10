CREATE FUNCTION insertarPersona(varIDCiudad INTEGER, varNombre VARCHAR(50), varApellido VARCHAR(50),
		varFechaNacimiento DATE, varTelefono VARCHAR(15), varGenero VARCHAR(9), 
		varDireccion TEXT, varUsuario VARCHAR(25), varCorreo VARCHAR(50), varClave TEXT, varAdmin BOOLEAN) RETURNS void AS $$
BEGIN
INSERT INTO Persona (IDCiudad, Nombre, Apellido, FechaNacimiento, Telefono, Genero, 
		Direccion, Usuario, Correo, Clave, Administrador, Estado) 
	VALUES (varIDCiudad, varNombre, varApellido, varFechaNacimiento, varTelefono, varGenero, 
			varDireccion, varUsuario, varCorreo, varClave, varAdmin, TRUE);
END;
$$ LANGUAGE plpgsql;

SELECT insertarPersona(1, 'Ariel', 'Fernández', '2000-02-28', '0987654321', 'Masculino', 'NID', 'Arialdo', 
					   'Arialdo999@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', TRUE)
					   
SELECT TO_DATE('20000228', 'YYYYMMDD')

SELECT * FROM Persona