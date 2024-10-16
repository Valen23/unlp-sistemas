/*
 * https://github.com/Valen23
 */
package tema5.ejercicio4;

public abstract class Coro {
    
    private String nombre;
    private Director director;

    public Coro(String nombre, Director director) {
        this.nombre = nombre;
        this.director = director;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }
    
    public String toString(){
        String aux = "";
        return "Nombre del coro: " + getNombre() + director.toString();
    }
}
