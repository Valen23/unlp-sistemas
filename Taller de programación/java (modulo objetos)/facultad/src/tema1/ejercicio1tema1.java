/*
 * https://github.com/Valen23
 */
package tema1;
/**
 *
 * @author valen
 */
import PaqueteLectura.GeneradorAleatorio;

public class ejercicio1tema1 {

    public static void main(String[] args) {
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        for (int i=0;i<DF;i++)
            tabla2[i]=2*i;
        
        int n;
        
        do {
            n = GeneradorAleatorio.generarInt(15);
            System.out.println("Numero generado: " + n);
            for(int i=0;i<DF;i++)
                System.out.println("v[" + i + "]" + n * tabla2[i]);
        } while (n != 11);
    }
    
}
