/*
 * https://github.com/Valen23
 */
package tema4;

public class Trabajadores extends Personas {
    
    private String rol;
    
    public Trabajadores(String nombre, String DNI, int edad, String rol){
        super(nombre, DNI, edad);
        this.rol = rol;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
    
    public String toString(){
        return super.toString() + ", mi trabajo es: " + getRol();
    }
}
