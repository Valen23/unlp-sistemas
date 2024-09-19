/*
 * https://github.com/Valen23
 */
package facultad;
/**
 *
 * @author valen
 */
import PaqueteLectura.GeneradorAleatorio;

public class ejercicio2tema1 {
  
    public static void main(String[] args) {
        
        int dimF = 15;  // Inicializo la dimension del vector.
        double[] vector = new double[dimF]; // Creo un vector[] llamado 'vector' que contiene doubles.
        double acumulador = 0; // Creo una variable 'acumulador' de tipo double que va a sumar las alturas.
        
        for(int i=0;i<dimF;i++){ // Recorro el vector
            vector[i] = GeneradorAleatorio.generarDouble(2); // Por cada posicion del vector genero un double random del 0 al 2.
            acumulador += vector[i]; // Sumo la altura a la variable inicializada en 0
        }
        
        double alturaPromedio = (acumulador/dimF); // Calculo el promedio de altura.
        System.out.println("La altura promedio es: " + alturaPromedio);
        
        int contadorEncimaPromedio = 0; // Declaro una variable para contar la cantidad de jugadores que superan el promedio.
        for(int i=0;i<dimF;i++){ // Recorro el vector
            if(vector[i] > alturaPromedio){ // Pregunto si es superior al promedio
                contadorEncimaPromedio++; // Suma +1 a la variable.
            }
        }
        System.out.println("La cantidad de jugadores con altura mayor al promedio es: " + contadorEncimaPromedio);
    }
    
}
