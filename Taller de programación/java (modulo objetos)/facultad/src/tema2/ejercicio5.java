/*
 * https://github.com/Valen23
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class ejercicio5 {

    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        Partido[] vector = new Partido[20];
        int i = 0;
        String nombreAuxVis = " ";
        
        while((i < 20)&&(!nombreAuxVis.equals("Z"))){
            
            nombreAuxVis = GeneradorAleatorio.generarString(1);
            
            if(!nombreAuxVis.equals("Z")){
                vector[i] = new Partido();
                vector[i].setVisitante(nombreAuxVis);
                vector[i].setLocal(GeneradorAleatorio.generarString(1));
                vector[i].setGolesLocal(GeneradorAleatorio.generarInt(10));
                vector[i].setGolesVisitante(GeneradorAleatorio.generarInt(10));
                i++;
            }
            
        }
        
        int cantidadTotalJugados = i;
        int cantidadPartidosRiver = 0;
        int contadorGolesBoca = 0;
        i = 0;
        
        while((i < cantidadTotalJugados)&&(vector[i] != null)){
            System.out.println(vector[i].getLocal() + " " + vector[i].getGolesLocal() + " VS " + vector[i].getVisitante() + " " + vector[i].getGolesVisitante());
            
            if((vector[i].getGanador()).equals("River")){
                cantidadPartidosRiver++;
            }
            
            if((vector[i].getLocal()).equals("Boca")){
                contadorGolesBoca+=vector[i].getGolesLocal();
            }
            
            i++;
        }
    }
    
}
