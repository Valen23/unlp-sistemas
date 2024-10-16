/*
 * https://github.com/Valen23
 */
package parciales;

public class Ticket {
    
    private int numeroTicket = 0;
    private int DNICliente;
    private int cantidadLibrosComprados;
    private double montoAbonado;
    private String medioDePago;

    public Ticket(int numeroTicket, int DNICliente, int cantidadLibrosComprados, double montoAbonado, String medioDePago) {
        this.numeroTicket = numeroTicket;
        this.DNICliente = DNICliente;
        this.cantidadLibrosComprados = cantidadLibrosComprados;
        this.montoAbonado = montoAbonado;
        this.medioDePago = medioDePago;
    }

    public int getNumeroTicket() {
        return numeroTicket;
    }

    public void setNumeroTicket(int numeroTicket) {
        this.numeroTicket = numeroTicket;
    }

    public int getDNICliente() {
        return DNICliente;
    }

    public void setDNICliente(int DNICliente) {
        this.DNICliente = DNICliente;
    }

    public int getCantidadLibrosComprados() {
        return cantidadLibrosComprados;
    }

    public void setCantidadLibrosComprados(int cantidadLibrosComprados) {
        this.cantidadLibrosComprados = cantidadLibrosComprados;
    }

    public double getMontoAbonado() {
        return montoAbonado;
    }

    public void setMontoAbonado(double montoAbonado) {
        this.montoAbonado = montoAbonado;
    }

    public String getMedioDePago() {
        return medioDePago;
    }

    public void setMedioDePago(String medioDePago) {
        this.medioDePago = medioDePago;
    }
    
    public String toString() {
        System.out.println(":D!!!");
        return "Numero de ticket: " + numeroTicket +
            ", DNI Cliente: " + DNICliente +
            ", cantidad de Libros Comprados: " + cantidadLibrosComprados +
            ", monto Abonado: " + montoAbonado +
            ", medio De Pago: " + medioDePago + "\n";
    }
}
