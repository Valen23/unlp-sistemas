/*
 * https://github.com/Valen23
 */
package parciales.parcialK;

public class Digital extends Banco {
 
    private String direccionWeb;

    public Digital(String direccionWeb, String nombre, int N, int cantidadEmpleados) {
        super(nombre, N, cantidadEmpleados);
        this.direccionWeb = direccionWeb;
    }
    
    public boolean agregarCuenta(Cuenta cuenta){
        if(getDimL() < getDimF()){
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
                if((getCuentas()[dimL].getMoneda().equals("pesos"))&&(getCuentas()[dimL].getMonto() > 100000)){
                    sePuede = true;
                } else {
                    sePuede = false;
                }
            }
            dimL++;
        }
        return sePuede;
    }
    
}
