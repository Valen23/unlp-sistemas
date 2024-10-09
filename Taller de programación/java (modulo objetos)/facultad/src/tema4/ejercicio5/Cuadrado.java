/*
 * https://github.com/Valen23
 */
package tema4.ejercicio5;

public class Cuadrado extends Figuras {
    
    private double lado;
    
    public Cuadrado(String cC, String cR, double lado){
        super(cC, cR);
        this.lado = lado;
    }

    public double getLado() {
        return lado;
    }

    public void setLado(double lado) {
        this.lado = lado;
    }
    
    public double getArea(){
        return getLado() * 4;
    }
}
