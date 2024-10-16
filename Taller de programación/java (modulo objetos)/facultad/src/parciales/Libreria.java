/*
 * https://github.com/Valen23
 */
package parciales;

public class Libreria {
    
    private String nombre;
    private int numeroVentaActual;
    private Caja[] cajas;

    public Libreria(String nombre, int T) {
        this.nombre = nombre;
        this.numeroVentaActual = 0;
        cajas = new Caja[4];
        for(int i = 0; i < 4; i++){
            cajas[i] = new Caja(T);
        }
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNumeroVentaActual() {
        return numeroVentaActual;
    }

    public void setNumeroVentaActual(int numeroVentaActual) {
        this.numeroVentaActual = numeroVentaActual;
    }

    public Caja[] getCajas() {
        return cajas;
    }

    public void setCajas(Caja[] cajas) {
        this.cajas = cajas;
    }
    
    public void generarCaja(int numCaja, int numeroVenta, int dni, int cantidadLibrosComprados, double montoAbonado, String formaDePago){
        cajas[numCaja-1].generarTicket(numeroVenta, dni, cantidadLibrosComprados, montoAbonado, formaDePago);
    }
    
    public void verificarCajas(int valor){
        for(int i = 0; i < 4; i++){
            cajas[i].cantidadTotalLibros(valor);
        }
    }
    
    public Ticket obtenerTicketMayor(){
        Ticket miTicket = null;
        double montoMax = 0;
        for(int i = 0; i < 4; i++){
            miTicket = cajas[i].recorrerTickets(miTicket, montoMax);
            if(miTicket != null){
                
            }
        }
        return miTicket;
    }
    
    public String toString(){
        String aux = "Libreria: " + nombre + "\n";
        for(int i = 0; i < 4; i++){
            aux += "Caja " + (i + 1) + ", disponibilidad: " + cajas[i].isDisponible() + ", tickets emitidos: " + "\n";
            aux += cajas[i].toString();
        }
        return aux;
    }
}
