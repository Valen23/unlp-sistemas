/*
 * https://github.com/Valen23
 */
package tema4;

public class ejercicio2 {
    
    public static void main(String[] args) {
        Entrenador nuevoEntrenador = new Entrenador("Lionel Scaloni", 7000, 5, 4);
        Jugador nuevoJugador = new Jugador("Lionel Messi", 35000, 21, 1070, 843);
        System.out.println(nuevoEntrenador.toString());
        System.out.println(nuevoJugador.toString());
    }
    
}
