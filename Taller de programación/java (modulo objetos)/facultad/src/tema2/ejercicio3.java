/*
 * https://github.com/Valen23
 */
package tema2;
import PaqueteLectura.GeneradorAleatorio;

public class ejercicio3 {

    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        int cantidadPersonas = 8;
        int cantidadDias = 5;
        int i = 0;
        int j = 0;
        
        Persona[][] matriz = new Persona[cantidadDias][cantidadPersonas];
        String nombreAux = GeneradorAleatorio.generarString(1);
        
        while(!nombreAux.equals("Z")&&(i < cantidadDias)){ // Verificamos que el nombre sea distinto de "Z" y que no desborde el indice 'i'
            
            matriz[i][j] = new Persona(); // Inicializo la matriz
            matriz[i][j].setNombre(nombreAux);
            matriz[i][j].setEdad(GeneradorAleatorio.generarInt(100));
            matriz[i][j].setDNI(GeneradorAleatorio.generarInt(100));
            
            System.out.print(matriz[i][j].getNombre() + " ");
            
            nombreAux = GeneradorAleatorio.generarString(1); // Genero nuevo string para la proxima iteracion
            
            j++;
            if(j == cantidadPersonas){
                j = 0;
                i++;
                System.out.println();
            }
        }
        
    }
    
}
