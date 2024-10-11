/*
 * https://github.com/Valen23
 */
package tema5;

public class Investigador {
    
    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidio[] subsidios;
    private int cantidadMax = 5;
    private int cantidad = 0;

    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
        subsidios = new Subsidio[cantidadMax];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantidadMax() {
        return cantidadMax;
    }

    public void setCantidadMax(int cantidadMax) {
        this.cantidadMax = cantidadMax;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Subsidio[] getSubsidios() {
        return subsidios;
    }

    public void setSubsidios(Subsidio[] subsidios) {
        this.subsidios = subsidios;
    }
    
    public void agregarSubsidio(Subsidio unSubsidio){
        if(cantidad < cantidadMax){
            getSubsidios()[cantidad] = unSubsidio;
            cantidad++;
        }
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }
    
    public double totalDineroSubsidios(){
        double total = 0;
        for(int i = 0; i < getCantidad(); i++){
            total += subsidios[i].getMonto();
        }
        return total;
    }
    
    public String toString(){
        return getNombre() + " " + getCategoria() + " " + totalDineroSubsidios() + "\n";
    }
    
}
