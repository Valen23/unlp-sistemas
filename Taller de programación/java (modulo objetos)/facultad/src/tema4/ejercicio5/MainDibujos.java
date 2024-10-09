/*
 * https://github.com/Valen23
 */
package tema4.ejercicio5;

public class MainDibujos {

    public static void main(String[] args) {
        
        Dibujo miDibujo = new Dibujo("Mi dibujito");
        
        Cuadrado miCuadrado = new Cuadrado("azul", "verde", 10);
        Cuadrado miCuadrado2 = new Cuadrado("rojo", "amarillo", 30);
        
        miDibujo.agregarFigura(miCuadrado);
        miDibujo.agregarFigura(miCuadrado2);
        miDibujo.agregarFigura(miCuadrado);
        miDibujo.agregarFigura(miCuadrado2);
        
        miDibujo.mostrar();
        
    }
    
}
