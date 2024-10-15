package tema5.ejercicio3;

public class Gira extends Recital {
    
    private String nombreGira;
    private int cantidadFechasMax;
    private int cantidad;
    private int actual = 0;
    private Fecha[] fechas;

    public Gira(String nombreGira, int cantidadFechas, String nombreBanda, int cantidadCanciones) {
        super(nombreBanda, cantidadCanciones);
        this.nombreGira = nombreGira;
        this.cantidadFechasMax = cantidadFechas;
        fechas = new Fecha[cantidadFechas];
    }

    public int getActual() {
        return actual;
    }

    public void setActual(int actual) {
        this.actual = actual;
    }

    public int getCantidadFechasMax() {
        return cantidadFechasMax;
    }

    public void setCantidadFechasMax(int cantidadFechasMax) {
        this.cantidadFechasMax = cantidadFechasMax;
    }

    public Fecha[] getFechas() {
        return fechas;
    }
    
    public boolean hayEspacio(){
        return (getCantidad() < getCantidadFechasMax());
    }
    
    public void agregarFecha(Fecha fecha){
        if(hayEspacio()){
            getFechas()[getCantidad()] = fecha;
            setCantidad(getCantidad() + 1);
        }
    }
    
    public String actuar(){
        return "Buenas noches " + getFechas()[getActual()].getCiudad() + "\n";
    }
    
    public double calcularCosto(){
        return (30000 * getCantidadFechasMax());
    }
}
