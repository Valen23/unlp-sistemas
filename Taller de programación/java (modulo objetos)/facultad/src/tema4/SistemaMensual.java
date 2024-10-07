/*
 * https://github.com/Valen23
 */
package tema4;

public class SistemaMensual extends Sistemas {

    public SistemaMensual(int N, int A, Estaciones nuevaEstacion) {
        super(N, A, nuevaEstacion);
    }
    
    public String obtenerPromedio(){
        double acumulador = 0;
        double[][] matriz = getMatrizRegistros();
        String aux = "";
        
        for(int j = 0; j < 12; j++){
            for(int i = 0; i < getN(); i++){
                acumulador += matriz[i][j] / getN();
            }
            aux += "Mes " + (j+1) + ": " + acumulador + "\n";
            acumulador = 0;
        }
        return aux;
    }
}
