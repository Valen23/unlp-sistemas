/*
 * https://github.com/Valen23
 */
package tema5.ejercicio2;

public class Estacionamiento {
    
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    private int N;                                  // piso
    private int M;                                  // plaza
    private Auto[][] matrizEstacionamiento;

    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = "08:00";
        this.horaCierre = "21:00";
        this.N = 5;
        this.M = 10;
        matrizEstacionamiento = new Auto[N][M];
    }

    public Estacionamiento(String nombre, String direccion, String horaApertura, String horaCierre, int N, int M) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        this.N = N;
        this.M = M;
        matrizEstacionamiento = new Auto[N][M];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(String horaApertura) {
        this.horaApertura = horaApertura;
    }

    public String getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(String horaCierre) {
        this.horaCierre = horaCierre;
    }

    public int getN() {
        return N;
    }

    public void setN(int N) {
        this.N = N;
    }

    public int getM() {
        return M;
    }

    public void setM(int M) {
        this.M = M;
    }

    public Auto[][] getMatrizEstacionamiento() {
        return matrizEstacionamiento;
    }

    public void setMatrizEstacionamiento(Auto[][] matrizEstacionamiento) {
        this.matrizEstacionamiento = matrizEstacionamiento;
    }
    
    public void agregarAuto(int piso, int plaza, Auto auto){
        getMatrizEstacionamiento()[piso-1][plaza-1] = auto;
    }
    
    public String buscarAuto(String patente){
        boolean seEncontro = false;
        String MensajeSeEncontro = "Auto inexistente.";
        for(int i = 0; i < getN(); i++){
            for(int j = 0; j < getM(); j++){
                if(getMatrizEstacionamiento()[i][j] != null){
                    if((getMatrizEstacionamiento()[i][j].getPatente()).equals(patente)){
                        seEncontro = true;
                        MensajeSeEncontro = "El auto se encontro en el piso " + (i + 1) + " en la plaza numero " + (j + 1);
                    }
                }
                
            }
        }
        return MensajeSeEncontro;
    }
    
    public int contarPlaza(int numero){
        int cantidad = 0;
        for(int i = 0; i < getN(); i++){
            if(getMatrizEstacionamiento()[i][numero] != null){
                cantidad++;
            }
        }
        return cantidad;
    }
    
    public String toString(){
        String aux = "";
        for(int i = 0; i < getN(); i++){
            for(int j = 0; j < getM(); j++){
                if(getMatrizEstacionamiento()[i][j] != null){
                    aux += "Piso " + (i+1) + " plaza " + (j+1) + getMatrizEstacionamiento()[i][j].toString() + "\n";
                } else {
                    aux += "Piso " + (i+1) + " plaza " + (j+1) + " libre\n";
                }
            }
        }
        return aux;
    }
}
