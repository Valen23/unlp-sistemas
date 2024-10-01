/*
 * https://github.com/Valen23
 */
package tema3;

public class Hotel {
    
    private int tamanoPersonalizado;
    private Habitacion[] habitaciones;

    public Hotel(int tamano){
        this.tamanoPersonalizado = tamano;
        this.habitaciones = new Habitacion[tamano];
        for(int j = 0; j<tamano; j++){
            habitaciones[j] = new Habitacion();
        }
    }
    
    public Hotel(){
        habitaciones = new Habitacion[tamanoPersonalizado];
    }
    
    public void aumentarPrecio(double aumento){
        for(int i = 0; i < tamanoPersonalizado; i++){
            habitaciones[i].setPrecio(habitaciones[i].getPrecio() + aumento);
        }
    }
    
    public void agregarCliente(Cliente c, int habitacion){
        this.habitaciones[habitacion].setUnCliente(c);
        this.habitaciones[habitacion].setOcupado(true);
    }

    @Override
    public String toString() {
        String aux = "";
        for(int i = 0; i < tamanoPersonalizado; i++){
            aux += "Habitacion " + (i+1) + ":" + this.habitaciones[i].toString() + "\n";
        }
        return aux;
    }
}
