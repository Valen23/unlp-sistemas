/*
 * https://github.com/Valen23
 */
package tema5.ejercicio3;

public class ejercicio3 {

    public static void main(String[] args) {
        Fecha unaFecha = new Fecha("9 de Julio", 14);
        Gira miGira = new Gira("Los Tuertos Locos", 10, "Los Locos Tuertos", 7);
        Ocasional miOcasional = new Ocasional("Show privado", "Anibal Pachano", "04/10", "El Gaucho Rengo", 8);
        
        miGira.agregarFecha(unaFecha);
        
        System.out.println(miGira.calcularCosto());
        System.out.println(miOcasional.calcularCosto());
        
        System.out.println(miOcasional.actuar());
        System.out.println(miGira.actuar());
        
    }
    
}
