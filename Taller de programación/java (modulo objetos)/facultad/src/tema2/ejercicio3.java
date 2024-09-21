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
        
        Persona[][] matriz = new Persona[cantidadPersonas][cantidadDias];
        
        for(int i=0; i<cantidadDias; i++){
            System.out.print("Dia " + (i+1) + ": ");
            for(int j=0; j<cantidadPersonas; j++){
                
                String aux = GeneradorAleatorio.generarString(3);
                
                if(aux != "ZZZ"){
                    matriz[j][i] = new Persona();
                    matriz[j][i].setNombre(aux);
                    matriz[j][i].setEdad(GeneradorAleatorio.generarInt(100));
                    matriz[j][i].setDNI(GeneradorAleatorio.generarInt(100));
                    System.out.print(matriz[j][i].getNombre() + ", Turno " + (j+1) + ". ");
                }
                
            }
            System.out.println();
        }
        
    }
    
}
