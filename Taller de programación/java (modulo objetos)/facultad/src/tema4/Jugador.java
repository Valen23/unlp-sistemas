/*
 * https://github.com/Valen23
 */
package tema4;

public class Jugador extends Empleado {
    
    private int partidosJugados;
    private int cantidadGoles;
    
    public Jugador(String nombre, double sueldo, int antiguedad, int partidosJugados, int cantidadGoles){
        super(nombre, sueldo, antiguedad);
        setPartidosJugados(partidosJugados);
        setCantidadGoles(cantidadGoles);
    }

    public int getPartidosJugados() {
        return partidosJugados;
    }

    public void setPartidosJugados(int partidosJugados) {
        this.partidosJugados = partidosJugados;
    }

    public int getCantidadGoles() {
        return cantidadGoles;
    }

    public void setCantidadGoles(int cantidadGoles) {
        this.cantidadGoles = cantidadGoles;
    }
    
    public double getEfectividad(){
        return (getCantidadGoles()/getPartidosJugados());
    }
    
    public void plusSueldo(){
        if(getEfectividad() > 0.5){
            setSueldo(this.getSueldo() * 2);
        } else {
            System.out.println("El jugador no cumple con los requisitos para el aumento de sueldo.");
        }
    }
}
