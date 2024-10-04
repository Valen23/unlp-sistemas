/*
 * https://github.com/Valen23
 */
package tema4;

public class Cuadrado extends Figura {
    private double lado;
    
    public Cuadrado(String cC, String cR, double lado){
        super(cC, cR);
        setLado(lado);
    }

    public double getLado() {
        return lado;
    }

    public void setLado(double lado) {
        this.lado = lado;
    }
    
    @Override
    public double getArea(){
        return (lado * lado);
    }
    
    @Override
    public double getPerimetro(){
        return (lado * 4);
    }
}
