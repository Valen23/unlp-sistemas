/*
 * https://github.com/Valen23
 */
package parciales.parcialK;

public abstract class Banco {
    
    private String nombre;
    private int cantidadEmpleados;
    private Cuenta[] cuentas;
    private int dimF;
    private int dimL = 0;

    public Banco(String nombre, int N, int cantidadEmpleados) {
        this.nombre = nombre;
        this.cantidadEmpleados = cantidadEmpleados;
        this.dimF = N;
        cuentas = new Cuenta[N];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantidadEmpleados() {
        return cantidadEmpleados;
    }

    public void setCantidadEmpleados(int cantidadEmpleados) {
        this.cantidadEmpleados = cantidadEmpleados;
    }

    public Cuenta[] getCuentas() {
        return cuentas;
    }

    public int getDimF() {
        return dimF;
    }

    public void setDimF(int dimF) {
        this.dimF = dimF;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    public Cuenta obtenerCuenta(int cbu){
        int dimL = 0;
        while(dimL < dimF){
            if(cuentas[dimL].getCBU() == cbu){
                return cuentas[dimL];
            }
            dimL++;
        }
        return null;
    }
    
    public void depositarDinero(int cbu, double monto){
        int dimL = 0;
        Cuenta aux = null;
        while((dimL < dimF)&&(aux == null)){
            if(cuentas[dimL].getCBU() == cbu){
                aux = cuentas[dimL];
                cuentas[dimL].setMonto(cuentas[dimL].getMonto() + monto);
            }
            dimL++;
        }
    }
    
    public abstract boolean puedeRecibirTarjeta(int cbu);
}
