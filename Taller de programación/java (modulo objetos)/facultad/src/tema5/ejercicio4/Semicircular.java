/*
 * https://github.com/Valen23
 */
package tema5.ejercicio4;

public class Semicircular extends Coro {
    
    private int cantidadCoristas;
    private int cantidadActual = 0;
    private Corista[] coristas;

    public Semicircular(int cantidadCoristas, String nombre, Director director) {
        super(nombre, director);
        this.cantidadCoristas = cantidadCoristas;
        coristas = new Corista[cantidadCoristas];
    }

    public int getCantidadCoristas() {
        return cantidadCoristas;
    }

    public void setCantidadCoristas(int cantidadCoristas) {
        this.cantidadCoristas = cantidadCoristas;
    }
    
    public void agregarCorista(Corista corista){
        if(cantidadActual < getCantidadCoristas()){
            coristas[cantidadActual] = corista;
            cantidadActual++;
        }
    }
    
    public boolean estaLleno(){
        return (coristas[getCantidadCoristas()-1] != null);
    }
    
    public boolean estaOrdenado(){
        boolean ordenado = true;
        for(int i = 0; i < (cantidadCoristas-1); i++){
            if((coristas[i].getTonoFundamental() < coristas[i+1].getTonoFundamental())&&(ordenado == true)){
                ordenado = true;
            } else {
                ordenado = false;
            }
        }
        return ordenado;
    }
    
    public String toString(){
        String aux = "";
        for(int i = 0; i < cantidadCoristas; i++){
            aux += coristas[i].toString();
        }
        return super.toString() + aux;
    }
}
