/*
 * https://github.com/Valen23
 */
package tema3;

public class Estante {
    
    private Libro[] libros;
    private int dimL;
    private int tamanoPersonalizado;
    
    public Estante(int tamano){
        this.tamanoPersonalizado = tamano;
        libros = new Libro[tamano];
        dimL = 0;
    }
    
    public int getLibrosAlmacenados(){
        return dimL;
    }
    
    public boolean getEstanteLleno(){
        return (dimL == (this.tamanoPersonalizado - 1));
    }
    
    public void agregarLibro(Libro libro){
        if(dimL < tamanoPersonalizado){
            libros[dimL] = libro;
            dimL++;
        }
    }
    
    public Libro buscarLibro(String titulo){
        int i = 0;
        while(i < dimL){
            if(libros[i].getTitulo().equals(titulo)){
                return libros[i];
            }
            i++;
        }
        return null;
    }
}
