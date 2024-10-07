/*
 * https://github.com/Valen23
 */
package tema4;

public class ejercicio3 {

    public static void main(String[] args) {
        
        Personas nuevaPersona = new Personas("Danielito Caos", "33.444.555", 24);
        Trabajadores nuevoTrabajador = new Trabajadores("Luquitas Rodriguez", "15.777.999", 30, "Repartidor de diario");
        System.out.println(nuevaPersona.toString());
        System.out.println(nuevoTrabajador.toString());
    }
    
}
