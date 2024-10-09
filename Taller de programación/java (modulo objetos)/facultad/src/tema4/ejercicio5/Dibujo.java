/*
 * https://github.com/Valen23
 */
package tema4.ejercicio5;

public class Dibujo {
    
    private String titulo;
    private Figuras [] vectorFiguras;
    private int figurasGuardadas;
    private int cantidadMax = 10;
    
    public Dibujo(String titulo){
        this.titulo = titulo;
        this.figurasGuardadas = 0;
        this.vectorFiguras = new Figuras[cantidadMax];
    }
    
    public void agregarFigura(Figuras figura){
        if(figurasGuardadas < 10){
            vectorFiguras[figurasGuardadas] = figura;                         // lo almaceno en la primer posicion disponible
            figurasGuardadas++;
            System.out.println("La figura " + figura.toString() + " se ha almacenado.");
        } else {
            System.out.println("Limite alcanzado.");
        }
    }

    public Figuras[] getVectorFiguras() {
        return vectorFiguras;
    }

    public void setVectorFiguras(Figuras[] vectorFiguras) {
        this.vectorFiguras = vectorFiguras;
    }
    
    public double calcularArea(){
        double areaTotal = 0;
        Figuras[] miVector = getVectorFiguras();
        for(int i = 0; i < cantidadMax; i++){
            areaTotal += miVector[i].getArea();
        }
        return areaTotal;
    }
    
    public void mostrar(){
        Figuras[] miVector = getVectorFiguras();
        for(int i = 0; i < figurasGuardadas; i++){
            System.out.println(miVector[i].toString());
        }
    }
    
    public boolean estaLleno(){
        return (figurasGuardadas == cantidadMax);
    }
}
