/*
 * https://github.com/Valen23
 */
package tema4;

public class Circulo extends Figura {
    
    private double radio;

    public Circulo(String cR, String cC, double r){
        super(cR, cC);
        setRadio(r);
    }
    
    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    @Override
    public double getArea(){
        return (Math.PI * (radio * radio));
    }
    
    @Override
    public double getPerimetro(){
        return (2 * Math.PI * radio);
    }
}
