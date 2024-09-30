/*
 * https://github.com/Valen23
 */
package tema3;

/**
 *
 * @author valen
 */
public class Triangulo {
    private double ladoA;
    private double ladoB;
    private double ladoC;
    private String rellenoColor;
    private String contornoColor;

    public Triangulo() {
    }

    public double getLadoA() {
        return ladoA;
    }

    public void setLadoA(double ladoA) {
        this.ladoA = ladoA;
    }

    public double getLadoB() {
        return ladoB;
    }

    public void setLadoB(double ladoB) {
        this.ladoB = ladoB;
    }

    public double getLadoC() {
        return ladoC;
    }

    public void setLadoC(double ladoC) {
        this.ladoC = ladoC;
    }

    public String getRellenoColor() {
        return rellenoColor;
    }

    public void setRellenoColor(String rellenoColor) {
        this.rellenoColor = rellenoColor;
    }

    public String getContornoColor() {
        return contornoColor;
    }

    public void setContornoColor(String contornoColor) {
        this.contornoColor = contornoColor;
    }
    
    public double calcularPerimetro(double a, double b, double c){
        double resultado = a + b + c;
        return resultado;
    }
    
    public double calcularArea(double a, double b, double c){
        double s = (a + b + c)/2;
        double resultado = Math.sqrt(s*(s - a)*(s - b)*(s - c));
        return resultado;
    }
}
