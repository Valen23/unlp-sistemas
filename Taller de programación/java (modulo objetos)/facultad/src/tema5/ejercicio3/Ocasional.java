/*
 * https://github.com/Valen23
 */
package tema5.ejercicio3;

public class Ocasional extends Recital {
    
    private String motivo;
    private String nombreContratante;
    private String fechaEvento;

    public Ocasional(String motivo, String nombreContratante, String fechaEvento, String nombreBanda, int cantidadCanciones) {
        super(nombreBanda, cantidadCanciones);
        this.motivo = motivo;
        this.nombreContratante = nombreContratante;
        this.fechaEvento = fechaEvento;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public String getMotivo() {
        return motivo;
    }
    
    public String actuar(){
        if(getMotivo().equals("Beneficiencia")){
            return "Recuerden colaborar con " + getNombreContratante();
        } else if(getMotivo().equals("Show de TV")){
            return "Saludos amigos televidentes";
        } else if(getMotivo().equals("Show privado")){
            return "Un feliz cumpleaños para " + getNombreContratante();
        }
        return null;
    }
    
    public double calcularCosto(){
        if(getMotivo().equals("Show de TV")){
            return 50000;
        } else if(getMotivo().equals("Show privado")){
            return 150000;
        }
        return 0;
    }
}
