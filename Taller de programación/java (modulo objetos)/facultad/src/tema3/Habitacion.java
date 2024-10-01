/*
 * https://github.com/Valen23
 */
package tema3;
import PaqueteLectura.GeneradorAleatorio;

public class Habitacion {
    private Cliente unCliente;
    private boolean ocupado;
    private double precio;
    
    public Habitacion(){
        precio = GeneradorAleatorio.generarDouble(6001)+2000;
        ocupado = false;
        unCliente = null;
    }
    
    public Cliente getUnCliente() {
        return unCliente;
    }

    public void setUnCliente(Cliente unCliente) {
        this.unCliente = unCliente;
    }

    public boolean isOcupado() {
        return ocupado;
    }

    public void setOcupado(boolean ocupado) {
        this.ocupado = ocupado;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
        
    @Override
    public String toString(){
        String aux = " costo: " + precio + ", ocupada: " + ocupado;
        if(ocupado){
            aux += unCliente.toString();
        }
        return aux;
    }
}
