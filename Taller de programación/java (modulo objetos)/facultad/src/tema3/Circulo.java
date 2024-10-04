/*
 * https://github.com/Valen23
 */
package tema3;

public class Circulo {
    private double radio;
    private String rellenoColor;
    private String lineaColor;

    public Circulo(double radio, String color1, String color2){
        this.radio = radio;
        this.rellenoColor = color1;
        this.lineaColor = color2;
    }
    
    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getRellenoColor() {
        return rellenoColor;
    }

    public void setRellenoColor(String rellenoColor) {
        this.rellenoColor = rellenoColor;
    }

    public String getLineaColor() {
        return lineaColor;
    }

    public void setLineaColor(String lineaColor) {
        this.lineaColor = lineaColor;
    }
    
    public double getPerimetro(){
        return 2 * Math.PI * this.radio;
    }
    
    public double getArea(){
        return Math.PI * (Math.pow(this.radio, 2));
    }
}
