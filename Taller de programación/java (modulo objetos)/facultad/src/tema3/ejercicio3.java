/*
 * https://github.com/Valen23
 */
package tema3;
import PaqueteLectura.GeneradorAleatorio;

public class ejercicio3 {

    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        int tamano = 50;
        Estante miEstante = new Estante(tamano);
        
        for(int i = 0; i < tamano; i++){
            Autor autor = new Autor(GeneradorAleatorio.generarString(5),
                                    GeneradorAleatorio.generarString(5),
                                    GeneradorAleatorio.generarString(5));
            
            Libro libro = new Libro(GeneradorAleatorio.generarString(1),
                                    GeneradorAleatorio.generarString(5),
                                    GeneradorAleatorio.generarInt(100),
                                    autor,
                                    GeneradorAleatorio.generarString(5),
                                    GeneradorAleatorio.generarInt(100));
            
            miEstante.agregarLibro(libro);
        }
        
        Libro existeLibro = miEstante.buscarLibro("v");
        if(existeLibro != null){
            System.out.println("El autor del libroe es: " + existeLibro.getPrimerAutor().getNombre());
        } else {
            System.out.println("El libro no se encuentra en el estante.");
        }       
    }
    
}
