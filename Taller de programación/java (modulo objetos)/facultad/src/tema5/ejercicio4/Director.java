/*
 * https://github.com/Valen23
 */
package tema5.ejercicio4;

public class Director {
    
    private String nombre;
    private int DNI;
    private int edad;
    private int antiguedad;

    public Director(String nombre, int DNI, int edad, int antiguedad) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.edad = edad;
        this.antiguedad = antiguedad;
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

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    public String toString(){
        return "nombre: " + nombre + ", dni: " + DNI + ", edad: " + edad + ", antiguedad: " + antiguedad + "\n";
    }
}
