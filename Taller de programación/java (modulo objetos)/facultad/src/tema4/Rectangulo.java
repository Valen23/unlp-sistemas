/*
 * https://github.com/Valen23
 */
package tema4;

public class Rectangulo extends Figura {
    
    private double base, altura;

    public Rectangulo(String cC, String cR, double b, double h){
        super(cC, cR);
        setBase(b);
        setAltura(h);
    }

    public double getBase() {
        return base;
    }

    public void setBase(double base) {
        this.base = base;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }
    
    @Override
    public double getArea(){
        return (altura * base);
    }
    
    @Override
    public double getPerimetro(){
        return ((base + altura) * 2);
    }
}
