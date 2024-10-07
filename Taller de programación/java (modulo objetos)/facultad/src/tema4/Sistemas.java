/*
 * https://github.com/Valen23
 */
package tema4;
import PaqueteLectura.*;

public abstract class Sistemas {
    
    private int N; // años consecutivos
    private int A; // a partir de
    private Estaciones miEstacion;
    private double[][] matrizRegistros;

    public Sistemas(int N, int A, Estaciones nuevaEstacion) {
        this.miEstacion = nuevaEstacion;
        this.N = N;
        this.A = A;
        this.matrizRegistros = matrizRegistros;
        matrizRegistros = new double[getN()][12];
        
        for(int i = 0; i < getN(); i++){
            for(int j = 0; j < 12; j++){
                matrizRegistros[i][j] = GeneradorAleatorio.generarDouble(50);
            }
        }
    }

    public Estaciones getMiEstacion() {
        return miEstacion;
    }

    public void setMiEstacion(Estaciones miEstacion) {
        this.miEstacion = miEstacion;
    }

    public int getN() {
        return N;
    }

    public void setN(int N) {
        this.N = N;
    }

    public int getA() {
        return A;
    }

    public void setA(int A) {
        this.A = A;
    }

    public double[][] getMatrizRegistros() {
        return matrizRegistros;
    }

    public void setMatrizRegistros(double[][] matrizRegistros) {
        this.matrizRegistros = matrizRegistros;
    }
    
    public void registrarTemperatura(int mes, int año, double temperatura){
        double[][] matriz = getMatrizRegistros();
        matriz[año][mes-1] = temperatura;
    }
    
    public double leerTemperatura(int mes, int año){
        double[][] matriz = getMatrizRegistros();
        return matriz[año][mes];
    }
    
    public String mayorTemperatura(){
        double[][] matriz = getMatrizRegistros();
        int mesMayor = 0;
        int añoMayor = 0;
        double tempMayor = 0;
        
        for(int i = 0; i < getN(); i++){
            for(int j = 0; j < 12; j++){
                if(matriz[i][j] > tempMayor){
                    tempMayor = matriz[i][j];
                    añoMayor = i;
                    mesMayor = j;
                }
            }
        }
        
        return "El año " + (getA() + añoMayor) + " en el mes " + mesMayor + " registro la mayor temperatura";
    }
    
    public abstract String obtenerPromedio();
    
    public String toString(){
        return miEstacion.toString() + "\n" + obtenerPromedio();
    }
}
