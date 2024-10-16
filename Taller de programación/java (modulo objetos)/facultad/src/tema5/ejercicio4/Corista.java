/*
 * https://github.com/Valen23
 */
package tema5.ejercicio4;

public class Corista {

    private String nombre;
    private int DNI;
    private int edad;
    private int tonoFundamental;

    public Corista(String nombre, int DNI, int edad, int tonoFundamental) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.edad = edad;
        this.tonoFundamental = tonoFundamental;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getTonoFundamental() {
        return tonoFundamental;
    }

    public void setTonoFundamental(int tonoFundamental) {
        this.tonoFundamental = tonoFundamental;
    }

    @Override
    public String toString() {
        return "nombre: " + nombre + ", dni: " + DNI + ", edad: " + edad + ", tono fundamental: " + tonoFundamental + "\n";
    }

    
}
