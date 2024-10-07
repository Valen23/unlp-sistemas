/*
 * https://github.com/Valen23
 */
package tema4;

public class SistemaAnual extends Sistemas {

    public SistemaAnual(int N, int A, Estaciones nuevaEstacion) {
        super(N, A, nuevaEstacion);
    }
    
    public String obtenerPromedio(){
        double[][] matriz = getMatrizRegistros();
        double acumulador = 0;
        String aux = "";
        
        for(int i = 0; i < getN(); i++){
            for(int j = 0; j < 12; j++){
                acumulador += matriz[i][j];
            }
            acumulador = acumulador / 12.0;
            aux += "Año " + (i + getA()) + ": " + acumulador + "\n";
            acumulador = 0;
        }
        
        return aux;
    }
}
