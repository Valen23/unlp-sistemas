/*
 * https://github.com/Valen23
 */
package tema4.ejercicio5;

public abstract class Figuras {
    
    private String colorContorno;
    private String colorRelleno;

    public Figuras(String colorContorno, String colorRelleno) {
        this.colorContorno = colorContorno;
        this.colorRelleno = colorRelleno;
    }

    public String getColorContorno() {
        return colorContorno;
    }

    public void setColorContorno(String colorContorno) {
        this.colorContorno = colorContorno;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }
    
    public String toString(){
        String aux = "";
        aux = "area: " + this.getArea() + ", contorno: " + this.getColorContorno() + ", relleno: " + this.getColorRelleno();
        return aux;
    }
    
    public abstract double getArea();
    
}
