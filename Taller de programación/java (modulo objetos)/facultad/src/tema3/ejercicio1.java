/*
 * https://github.com/Valen23
 */
package tema3;
import PaqueteLectura.Lector;

public class ejercicio1 {

    public static void main(String[] args) {
        double a = Lector.leerDouble();
        double b = Lector.leerDouble();
        double c = Lector.leerDouble();
        Triangulo triangulito = new Triangulo();
        System.out.println("Area: " + triangulito.calcularArea(a, b, c));
        System.out.println("Perimetro: " + triangulito.calcularPerimetro(a, b, c));
    }
    
}
