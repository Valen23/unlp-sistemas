/*
 * https://github.com/Valen23
 */
package tema2;

import PaqueteLectura.Lector;

public class ejercicio1 {

    public static void main(String[] args) {
        
        Persona nuevaPersona1 = new Persona(); // Creo un objeto de tipo 'Persona' y le pongo como nombre 'nuevaPersona1'.
        
        System.out.print("Ingrese el nombre de la persona: "); // Asigno datos.
        nuevaPersona1.setNombre(Lector.leerString());
        System.out.print("Ingrese la edad de la persona: ");
        nuevaPersona1.setEdad(Lector.leerInt());
        System.out.print("Ingrese el DNI de la persona: ");
        nuevaPersona1.setDNI(Lector.leerInt());
        
        System.out.println(nuevaPersona1.toString());
        
    }
    
}
