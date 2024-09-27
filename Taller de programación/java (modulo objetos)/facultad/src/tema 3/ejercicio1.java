package tema3;
import PaqueteLectura.Lector;

public class ejercicio1 {

    public static void main(String[] args) {
        
        double A = Lector.leerDouble();
        double B = Lector.leerDouble();
        double C = Lector.leerDouble();
        String colorR = Lector.leerString();
        String colorC = Lector.leerString();
        
        triangulo miTriangulito = new triangulo(A, B, C, colorR, colorC);
        
        System.out.println("Area: " + miTriangulito.calcularArea(A, B, C) + ", Perimetro: " + miTriangulito.calcularPerimetro(A, B, C));
    }
    
}
