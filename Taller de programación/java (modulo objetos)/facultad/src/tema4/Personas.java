/*
 * https://github.com/Valen23
 */
package tema4;

public class Personas {
    
    private String nombre;
    private String DNI;
    private int edad;
    
    public Personas(String nombre, String DNI, int edad){
        setNombre(nombre);
        setDNI(DNI);
        setEdad(edad);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
    
    public String toString(){
        return "Nombre: " + getNombre() + ", edad: " + getEdad() + ", DNI: " + getDNI();
    }
}
