/*
 * https://github.com/Valen23
 */
package tema1;

import PaqueteLectura.Lector;

public class ejercicio4tema1 {

    public static void main(String[] args) {
        
        int cantOficinas = 4;
        int cantPisos = 8;
        int[][] edificio = new int[cantOficinas][cantPisos];
        
        for(int i=0; i<cantPisos; i++){
            for(int j=0; j<cantOficinas; j++){
                edificio[j][i] = 0;
            }
        }
        
        int nPiso;
        int nOficina;
        
        do {
            System.out.print("Ingrese el numero de piso: ");
            nPiso = Lector.leerInt();
            System.out.print("Ingrese el numero de oficina: ");
            nOficina = Lector.leerInt();
            if ((nPiso <= cantPisos)&&(nOficina <= 4)&&(nPiso > 0)&&(nOficina > 0)){
                edificio[nOficina-1][nPiso-1]++;
            } else if (nPiso != 9){
                System.out.println("Posicion incorrecta.");
            }
        } while (nPiso != 9);
        
        for(int i=0; i<cantPisos; i++){
            for(int j=0; j<cantOficinas; j++){
                System.out.print(edificio[j][i] + " ");
            }
            System.out.println();
        }
        
    }
    
}
