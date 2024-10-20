/*
 * https://github.com/Valen23
 */
package tema4;

public class Estaciones {
    
    private String nombre;
    private double latitud;
    private double longitud;

    public Estaciones(String nombre, double latitud, double longitud) {
        this.nombre = nombre;
        this.latitud = latitud;
        this.longitud = longitud;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }

    @Override
    public String toString() {
        return "Estacion: " + nombre + " (" + latitud + " S - " + longitud + " O)";
    }
}
