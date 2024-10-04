/*
 * https://github.com/Valen23
 */
package tema4;

public class Entrenador extends Empleado {
    
    private int campeonatosGanados;
    
    public Entrenador(String nombre, double sueldo, int antiguedad, int campeonatosGanados){
        super(nombre, sueldo, antiguedad);
        setCampeonatosGanados(campeonatosGanados);
    }
    
    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }
    
    public double getEfectividad(){
        return (getAntiguedad()/getCampeonatosGanados());
    }
    
    public void plusSueldo(){
        if(getCampeonatosGanados() < 5){
            setSueldo(getSueldo() + 5000);
        } else if(getCampeonatosGanados() < 11){
            setSueldo(getSueldo() + 30000);
        } else if(getCampeonatosGanados() > 10){
            setSueldo(getSueldo() + 50000);
        }
    }
}
