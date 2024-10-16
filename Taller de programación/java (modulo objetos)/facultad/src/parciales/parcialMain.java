/*
 * https://github.com/Valen23
 */
package parciales;
import PaqueteLectura.*;

public class parcialMain {

    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        Libreria miLibreria = new Libreria("Tupac", 44);
        
        for(int i = 0; i < 100; i++){
            miLibreria.generarCaja(1 , GeneradorAleatorio.generarInt(50), GeneradorAleatorio.generarInt(50), GeneradorAleatorio.generarInt(1000), GeneradorAleatorio.generarDouble(5000), "Mercado Pago");
            miLibreria.generarCaja(2 , GeneradorAleatorio.generarInt(50), GeneradorAleatorio.generarInt(50), GeneradorAleatorio.generarInt(1000), GeneradorAleatorio.generarDouble(5000), "Mercado Pago");
            miLibreria.generarCaja(3 , GeneradorAleatorio.generarInt(50), GeneradorAleatorio.generarInt(50), GeneradorAleatorio.generarInt(1000), GeneradorAleatorio.generarDouble(5000), "Mercado Pago");
            miLibreria.generarCaja(4 , GeneradorAleatorio.generarInt(50), GeneradorAleatorio.generarInt(50), GeneradorAleatorio.generarInt(1000), GeneradorAleatorio.generarDouble(5000), "Mercado Pago");
        }
        
        //miLibreria.verificarCajas(500);
        //System.out.println(miLibreria.obtenerTicketMayor());
        System.out.println(miLibreria.toString());
        
    }
    
}
