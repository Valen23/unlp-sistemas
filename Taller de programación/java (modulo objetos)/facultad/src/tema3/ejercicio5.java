/*
 * https://github.com/Valen23
 */
package tema3;
import PaqueteLectura.Lector;

public class ejercicio5 {
    
    public static void main(String[] args) {
        double radio = Lector.leerDouble();
        String color1 = Lector.leerString();
        String color2 = Lector.leerString();
        Circulo miCirculito = new Circulo(radio, color1, color2);
        System.out.println(miCirculito.getArea());
        System.out.println(miCirculito.getRadio()); 
    }
    
}
