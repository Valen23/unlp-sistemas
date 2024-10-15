/*
 * https://github.com/Valen23
 */
package tema5;

public class Proyecto {

    private String nombre;
    private int codigo;
    private String nombreDirector;
    private Investigador[] investigadores;
    private int cantidadMax = 50;
    private int cantidad = 0;
    
    public Proyecto(String nombre, int codigo, String nombreDirector){
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreDirector = nombreDirector;
        investigadores = new Investigador[cantidadMax];
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }
    

    public Investigador[] getInvestigadores() {
        return investigadores;
    }

    public void setInvestigadores(Investigador[] investigadores) {
        this.investigadores = investigadores;
    }
    
    public void agregarInvestigador(Investigador unInvestigador){
        if(cantidad < cantidadMax){
            getInvestigadores()[cantidad] = unInvestigador;
            cantidad++;
        }
    }
    
    public double dineroTotalOtorgado(){
        double total = 0;
        
        for(int i = 0; i < cantidad; i++){
            int cantidadSubsidios = investigadores[i].getCantidad();        // del investigador actual obtengo la cantidad de subsidios
            for(int j = 0; j < cantidadSubsidios; j++){
                total += investigadores[i].getSubsidios()[j].getMonto();   // accedo al monto del subsidio del investigador y lo sumo
            }
        }
        
        return total;
    }
    
    public void otorgarTodos(String nombre_completo){
        int i = 0;
        do{
            if(investigadores[i].getNombre().equals(nombre_completo)){
                for(int j = 0; j < investigadores[i].getCantidad(); j++){
                    investigadores[i].getSubsidios()[j].setOtorgado(true);
                }
            }
            i++;
        }while(!(investigadores[i].getNombre()).equals(nombre_completo));
    }
    
    public String toString(){
        String aux = "";
        for(int i = 0; i < getCantidad(); i++){
            aux += investigadores[i].toString();
        }
        return getNombre() + ", " + getNombreDirector() + ", " + getCodigo() + "\n" + aux;
    }
    
}
