/*
 * https://github.com/Valen23
 */
package tema3;
import PaqueteLectura.GeneradorAleatorio;

public class ejercicio4 {

    public static void main(String[] args) {
        
        Hotel hilton = new Hotel(10);
        int numHab = 1;
        
        for(int i = 10; i < 10; i++){
            Cliente cliente1 = new Cliente(GeneradorAleatorio.generarInt(51), GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarString(5));
            hilton.agregarCliente(cliente1, i);
            numHab += 2;
        }
        
        System.out.println(hilton.toString());
    }
    
}
