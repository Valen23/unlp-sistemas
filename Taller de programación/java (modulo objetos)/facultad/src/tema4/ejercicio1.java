/*
 * https://github.com/Valen23
 */
package tema4;

public class ejercicio1 {

    public static void main(String[] args) {
        Rectangulo rectangulito = new Rectangulo("naranja", "verde", 6, 3);
        Cuadrado cuadradito = new Cuadrado("azul", "rosa", 7);
        Triangulo triangulito = new Triangulo("verde", "rojo", 15, 21, 9);
        Circulo circulito = new Circulo("amarillo", "violeta", 5);
        cuadradito.despintar();
        System.out.println(rectangulito.toString());
        System.out.println(cuadradito.toString());
        System.out.println(triangulito.toString());
        System.out.println(circulito.toString());
    }
    
}
