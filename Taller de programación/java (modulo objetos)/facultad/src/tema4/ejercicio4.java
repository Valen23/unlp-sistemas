/*
 * https://github.com/Valen23
 */
package tema4;

public class ejercicio4 {

    public static void main(String[] args) {
        
        Estaciones miEstacion = new Estaciones("9 de Julio", -34.921, 57.955);
        SistemaAnual sistAnual = new SistemaAnual(3, 2021, miEstacion);
        SistemaMensual sistMensual = new SistemaMensual(3, 2021, miEstacion);
        
        System.out.println(sistAnual);
        System.out.println(sistMensual);
        
    }
    
}
