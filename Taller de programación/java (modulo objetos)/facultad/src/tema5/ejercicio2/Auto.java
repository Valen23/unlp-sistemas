/*
 * https://github.com/Valen23
 */
package tema5.ejercicio2;

public class Auto {
    
    private String nombreCliente;
    private String patente;
    
    public Auto(String nombreCliente, String patente){
        this.nombreCliente = nombreCliente;
        this.patente = patente;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public String getPatente() {
        return patente;
    }
    
    public String toString(){
        return " nombre del cliente: " + getNombreCliente() + ", patente: " + getPatente();
    }
}
