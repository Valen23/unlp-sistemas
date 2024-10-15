/*
 * https://github.com/Valen23
 */
package tema5.ejercicio3;

public abstract class Recital {
    
    private String nombreBanda;
    private int cantidadMax;
    private int cantidad;
    private String[] listaTemas;

    public Recital(String nombreBanda, int cantidadCanciones) {
        this.nombreBanda = nombreBanda;
        this.cantidadMax = cantidadCanciones;
    }

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
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

    public String[] getListaTemas() {
        return listaTemas;
    }
    
    public boolean hayEspacio(){
        return (this.cantidad < getCantidadMax());
    }
    
    public void agregarTema(String nombreTema){
        if(hayEspacio()){
            getListaTemas()[getCantidad()] = nombreTema;
            setCantidad(getCantidad() + 1);
        }
    }
    
    public String actuar(){
        String aux = this.actuar();
        for(int i = 0; i < getCantidad(); i++){
            aux += "y ahora tocaremos... " + getListaTemas()[i] + "\n";
        }
        return aux;
    }
    
    public abstract double calcularCosto();
}
