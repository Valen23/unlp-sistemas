/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
/**
 *
 * @author Alumnos
 */
public class triangulo {
    private double ladoA;
    private double ladoB;
    private double ladoC;
    private String colorRelleno;
    private String colorContorno;

    public triangulo(double ladoA, double ladoB, double ladoC, String colorRelleno, String colorContorno) {
        this.ladoA = ladoA;
        this.ladoC = ladoB;
        this.ladoA = ladoC;
        this.colorRelleno = colorRelleno;
        this.colorContorno = colorContorno;
    }

    public double getLadoA() {
        return ladoA;
    }

    public double getLadoB() {
        return ladoB;
    }

    public double getLadoC() {
        return ladoC;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }
    
    public String getColorContorno() {
        return colorContorno;
    }

    public void setColorContorno(String colorContorno) {
        this.colorContorno = colorContorno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public void setLadoA(double ladoA) {
        this.ladoA = ladoA;
    }

    public void setLadoB(double ladoB) {
        this.ladoB = ladoB;
    }

    public void setLadoC(double ladoC) {
        this.ladoC = ladoC;
    }
    
    public double calcularPerimetro(double ladoA, double ladoB, double ladoC){
        double perimetro = ladoA + ladoB + ladoC;
        return perimetro;
    }
    
    public double calcularArea(double ladoA, double ladoB, double ladoC){
        double s = (ladoA + ladoB + ladoC)/2;
        double area = Math.sqrt(s*(s - ladoA)*(s - ladoB)*(s - ladoC));
        return area;
    }
}
