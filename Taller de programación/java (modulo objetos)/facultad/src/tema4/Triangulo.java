/*
 * https://github.com/Valen23
 */
package tema4;

public class Triangulo extends Figura{
    
    private double A, B, C;
    
    public Triangulo(String cR, String cC, double ladoA, double ladoB, double ladoC){
        super(cR, cC);
        setA(ladoA);
        setB(ladoB);
        setC(ladoC);
    }

    public double getA() {
        return A;
    }

    public void setA(double A) {
        this.A = A;
    }

    public double getB() {
        return B;
    }

    public void setB(double B) {
        this.B = B;
    }

    public double getC() {
        return C;
    }

    public void setC(double C) {
        this.C = C;
    }
    
    @Override
    public double getArea(){
        double s = (A + B + C)/2;
        return (Math.sqrt(s * (s - A) * (s - B) * (s - C)));
    }
    
    @Override
    public double getPerimetro(){
        return (A + B + C);
    }
}
