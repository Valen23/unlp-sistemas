/*
 * https://github.com/Valen23
 */
package tema4;

public abstract class Figura {
    
    private String colorRelleno;
    private String colorContorno;
    
    public Figura(String cR, String cC){
        setColorRelleno(cR);
        setColorContorno(cC);
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorContorno() {
        return colorContorno;
    }

    public void setColorContorno(String colorContorno) {
        this.colorContorno = colorContorno;
    }
    
    public String toString(){
        return "Color del relleno: " + getColorRelleno() +
                ", color de contorno: " + getColorContorno() +
                ", area: " + this.getArea() +
                ", perimetro: " + this.getPerimetro();
    }
    
    public void despintar(){
        setColorRelleno("blanco");
        setColorContorno("negro");
    }
    
    public abstract double getArea();
    public abstract double getPerimetro();
}
