/*
 * https://github.com/Valen23
 */
package parciales.parcialK;

public class Tradicional extends Banco {
    
    private String direccion;
    private String localidad;
    private int cantidadCuentasDolares = 0;

    public Tradicional(String direccion, String localidad, String nombre, int N, int cantidadEmpleados) {
        super(nombre, N, cantidadEmpleados);
        this.direccion = direccion;
        this.localidad = localidad;
    }
    
    public boolean agregarCuenta(Cuenta cuenta){
        if(cantidadCuentasDolares < 100){
            getCuentas()[getDimL()] = cuenta;
            return true;
        } else {
            return false;
        }
    }

    public boolean puedeRecibirTarjeta(int cbu){
        int dimL = 0;
        boolean sePuede = false;
        while(dimL < getDimF()){
            if(getCuentas()[dimL].getCBU() == cbu){
                if((getCuentas()[dimL].getMoneda().equals("pesos"))){
                    if(getCuentas()[dimL].getMonto() > 70000){
                        sePuede = true;
                    }
                } else if((getCuentas()[dimL].getMoneda().equals("dolares"))){
                    if(getCuentas()[dimL].getMonto() > 500){
                        sePuede = true;
                    }
                }
            }
            dimL++;
        }
        return sePuede;
    }
    
}
