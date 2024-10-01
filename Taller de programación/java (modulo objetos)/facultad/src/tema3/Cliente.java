/*
 * https://github.com/Valen23
 */
package tema3;

public class Cliente {
    private int edad;
    private String nombre;
    private String dni;

    public Cliente(int edad, String nombre, String dni) {
        this.edad = edad;
        this.nombre = nombre;
        this.dni = dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    @Override
    public String toString() {
        return "edad: " + edad + ", nombre: " + nombre + ", dni: " + dni + ", ";
    }
}
