/*
 * https://github.com/Valen23
 */
package facultad;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class ejercicio3tema1 {

    public static void main(String[] args) {
        
        int x = 5; // Dimension de la matriz
        int y = 5;
        
        int[][] matriz  = new int[x][y];
        int[] vector = new int[x];
        
        for(int i=0; i<x; i++){
            vector[i] = 0;
            for(int j=0; j<y; j++){
                matriz[i][j] = GeneradorAleatorio.generarInt(30);
                System.out.print(matriz[i][j] + " ");
            }
            System.out.println();
        }
        
        int sumador = 0;
        for(int i=0; i<y; i++){
            sumador += matriz[0][i];
        }
        
        System.out.print("Ingrese el valor a buscar: ");
        int valorABuscar = Lector.leerInt();
        int posX = -1;
        int posY = -1;
        
        for(int i=0; i<x; i++){
            for(int j=0; j<y; j++){
                vector[i]+=matriz[j][i];
                if(matriz[i][j] == valorABuscar){
                    posX = i;
                    posY = j;
                }
            }
        }
        
        System.out.println("La suma total de la primer fila es: " + sumador);
        System.out.println(vector[0] + " " + vector[1] + " " + vector[2] + " " + vector[3] + " " + vector[4]);
        
        if((posX == -1)&&(posY == -1)){
            System.out.println("No se encontro el numero leido.");
        } else {
            System.out.println("Se encontro el numero en la posicion " + posX + "," + posY);
        }
    }
}
