/*
 * https://github.com/Valen23
 */
package tema5.ejercicio4;

public class Hileras extends Coro {
    
    private int cantidadFilas;
    private int cantidadColumnas;
    private int cantidadActualF = 0;
    private int cantidadActualC = 0;
    private Corista[][] coristas;

    public Hileras(int cantidadFilas, int cantidadColumnas, String nombre, Director director) {
        super(nombre, director);
        this.cantidadFilas = cantidadFilas;
        this.cantidadColumnas = cantidadColumnas;
        coristas = new Corista[this.cantidadFilas][this.cantidadColumnas];
    }

    public int getCantidadFilas() {
        return cantidadFilas;
    }

    public void setCantidadFilas(int cantidadFilas) {
        this.cantidadFilas = cantidadFilas;
    }

    public int getCantidadColumnas() {
        return cantidadColumnas;
    }

    public void setCantidadColumnas(int cantidadColumnas) {
        this.cantidadColumnas = cantidadColumnas;
    }
    
    public void agregarCorista(Corista corista){
        if(cantidadActualC < getCantidadColumnas()){
            if(cantidadActualF < getCantidadFilas()){
                coristas[cantidadActualF][cantidadActualC] = corista;
                cantidadActualC++;
            }
        } else {
            cantidadActualC = 0;
            cantidadActualF++;
            if(cantidadActualF < getCantidadFilas()){
                coristas[cantidadActualF][cantidadActualC] = corista;
                cantidadActualC++;
            }
        }
    }
    
    public boolean estaLleno(){
        return (coristas[getCantidadFilas()-1][getCantidadColumnas()-1] != null);
    }
    
    public boolean estaOrdenado(){
        boolean mayorAMenor = true;
        for(int i = 0; i < (getCantidadFilas()-1); i++){
            for(int j = 0; j < (getCantidadColumnas()-1); j++){
                if((coristas[i+1][j+1] != null)&&(coristas[i][j] != null)&&(coristas[i][j].getTonoFundamental() > coristas[i+1][j+1].getTonoFundamental())&&(mayorAMenor == true)){
                    mayorAMenor = true;
                } else {
                    mayorAMenor = false;
                }
            }
            for(int j = 0; j < (getCantidadColumnas()-1); j++){
                if((coristas[i+1][j+1] != null)&&(coristas[i][j] != null)&&(coristas[j][i].getTonoFundamental() == coristas[i][j].getTonoFundamental())&&(mayorAMenor == true)){
                    mayorAMenor = true;
                } else {
                    mayorAMenor = false;
                }
            }
        }
        return mayorAMenor;
    }
    
    public String toString(){
        String aux = "";
        for(int i = 0; i < getCantidadFilas(); i++){
            for(int j = 0; j < getCantidadColumnas(); j++){
                if(coristas[i][j] != null){
                    aux += coristas[i][j].toString();
                }
            }
        }
        return aux;
    }
}
