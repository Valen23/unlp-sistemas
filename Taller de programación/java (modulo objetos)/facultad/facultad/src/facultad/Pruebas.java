package facultad;

import PaqueteLectura.GeneradorAleatorio; // Importo el generador desde el paquete a mi programa.

public class pruebas {

    public static void main(String[] args) {
        
        int N = 15;
        int x = 5; // Dimension x de la matriz 'miMatriz'.
        int y = 5; // Dimension y de la matriz 'miMatriz'.
        
        String[] misNumeros = new String[N]; // Declaro el arreglo y creo los elementos del mismo.
        for(int i=0; i<N; i++){
            misNumeros[i] = GeneradorAleatorio.generarString(1+GeneradorAleatorio.generarInt(10)); // Genero un string aleatorio con una longitud aleatoria.
            //System.out.println(i + ": " + misNumeros[i]);
        }
        
        String[][] miMatriz = new String[x][y];
        
        for(int i=0; i<x; i++){ // Recorro la matriz empezando por la fila 0.
            for(int j=0; j<y; j++){ // Recorro la matriz empezando por la columna 0.
                miMatriz[i][j] = GeneradorAleatorio.generarString(1); // Genero valores aleatorios para cada posicion.
                System.out.print("(" + i + ","+ j + "): " + miMatriz[i][j] + " |"); // Imprimo
            }
            System.out.println();
            System.out.println("--------------------------------------------------");
        }
        
    }
    
}