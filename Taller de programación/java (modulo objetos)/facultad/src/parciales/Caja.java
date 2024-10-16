/*
 * https://github.com/Valen23
 */
package parciales;

public class Caja {
    
    private boolean disponible;
    private Ticket[] tickets;
    private int maxTickets;
    private int cantidadActual = 0;

    public Caja(int T) {
        this.disponible = true;
        tickets = new Ticket[T];
        this.maxTickets = T;
    }

    public boolean isDisponible() {
        return disponible;
    }

    private void setDisponible() {
        disponible = false;
    }

    public Ticket[] getTickets() {
        return tickets;
    }

    public void setTickets(Ticket[] tickets) {
        this.tickets = tickets;
    }

    public int getMaxTickets() {
        return maxTickets;
    }

    public void setMaxTickets(int maxTickets) {
        this.maxTickets = maxTickets;
    }

    public int getCantidadActual() {
        return cantidadActual;
    }

    public void setCantidadActual(int cantidadActual) {
        this.cantidadActual = cantidadActual;
    }
    
    public void generarTicket(int numeroVenta, int dni, int cantidadLibrosComprados, double montoAbonado, String formaDePago){
        if(cantidadActual < maxTickets){
            tickets[cantidadActual] = new Ticket(numeroVenta, dni, cantidadLibrosComprados, montoAbonado, formaDePago);
            cantidadActual++;
        } else {
            System.out.println("Limite alcanzado.");
        }
    }
    
    public void cantidadTotalLibros(int valor){
        int acumulador = 0;
        for(int i = 0; i < cantidadActual; i++){
            acumulador += tickets[i].getCantidadLibrosComprados();
        }
        if(acumulador < valor){
            setDisponible();
        }
    }
    
    public Ticket recorrerTickets(Ticket miTicket, double montoMax){
        for(int i = 0; i < cantidadActual; i++){
            if(tickets[i].getMontoAbonado() > montoMax){
                montoMax = tickets[i].getMontoAbonado();
                miTicket = tickets[i];
            }
        }
        return miTicket;
    }
    
    public String toString(){
        String aux = "";
        for(int i = 0; i < getCantidadActual(); i++){
            System.out.println(":D!!!");
            aux += tickets[i].toString();
        }
        return aux;
    }
}
