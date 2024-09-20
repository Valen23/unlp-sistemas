/*
 * https://github.com/Valen23
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class ejercicio2 {

    public static void main(String[] args) {
        
        int dimF = 15;
        int indexMenor = 0;
        int DNIMenor = 999;
        int cantidadMayor = 0;
        int i = 0;
        
        Persona[] vector = new Persona[dimF];
        
        do {
            vector[i] = new Persona(); // inicializo el vector
            
            vector[i].setEdad(GeneradorAleatorio.generarInt(100)); // asigno datos
            vector[i].setDNI(GeneradorAleatorio.generarInt(100)+400);
            vector[i].setNombre(GeneradorAleatorio.generarString(15));
            
            System.out.println(vector[i].toString());
            
            if(vector[i].getEdad() > 65){ cantidadMayor++; }
            if(vector[i].getDNI() < DNIMenor){
                DNIMenor = vector[i].getDNI();
                indexMenor = i;
            }
            
            i++;
        } while ((vector[i-1].getEdad() != 0)&&(i < dimF));
        
        System.out.println("La cantidad de personas mayores a 65 años es: " + cantidadMayor);
        System.out.println(vector[indexMenor].toString());
    }
    
}
