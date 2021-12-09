package Beans;

public class VentaBeans {
    String apel;
    int dni;
    String dir;
    int tel;

    public VentaBeans(String apel, int dni, String dir, int tel) {
        this.apel = apel;
        this.dni = dni;
        this.dir = dir;
        this.tel = tel;
    }

    public String getApel() {
        return apel;
    }

    public void setApel(String apel) {
        this.apel = apel;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public int getTel() {
        return tel;
    }

    public void setTel(int tel) {
        this.tel = tel;
    }
     
    
}
