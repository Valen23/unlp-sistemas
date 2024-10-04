/*
 * https://github.com/Valen23
 */
package tema4;

public abstract class Empleado {
    
    private String nombre;
    private double sueldo;
    private int antiguedad;
    
    public Empleado(String nombre, double sueldo, int antiguedad){
        setNombre(nombre);
        setAntiguedad(antiguedad);
        setSueldo(sueldo);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    public double sueldoACobrar(){
        return (getSueldo() + (1.1 * getAntiguedad()));
    }
    
    public String toString(){
        return "Nombre: " + this.getNombre() + ", sueldo: " + this.getSueldo() + ", antiguedad: " + this.getAntiguedad();
    }
    
    public abstract void plusSueldo();
}
