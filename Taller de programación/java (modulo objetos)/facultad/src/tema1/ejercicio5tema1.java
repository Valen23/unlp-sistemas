/*
 * https://github.com/Valen23
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;

public class ejercicio5tema1 {

    public static void main(String[] args) {
        
        int tipoCalif = 4;
        int cantClientes = 5;
        double[][] calificaciones = new double[cantClientes][tipoCalif];
        double[] promedio = new double[tipoCalif];
        
        for(int i=0; i<cantClientes; i++){
            System.out.print("Cliente numero " + (i + 1) + ": ");
            for(int j=0; j<tipoCalif; j++){
                calificaciones[i][j] = GeneradorAleatorio.generarDouble(10)+1;
                promedio[j] += calificaciones[i][j];
                System.out.printf("(" + j + "): " + "%.2f ", calificaciones[i][j]);
            }
            System.out.println();
        }
        
        for(int i=0; i<tipoCalif; i++){
            promedio[i] = promedio[i] / 5.0; 
            System.out.printf("Promedio de " + "(" + i + "): " + "%.2f. ", promedio[i]);
        }
        System.out.println("\n(0) Atencion al cliente, (1) Calidad de la comida, (2) Precio, (3) Ambiente.");
    }
    
}
