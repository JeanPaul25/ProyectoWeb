package Beans;

public class CestaBeans {
    String cod;
    String img;
    String nombre;
    Double precio;
    Double descuento;
    Double precioFinal;
    int cantidad;

    public CestaBeans(String cod, int cantidad){
        this.cod = cod;
        this.cantidad = cantidad;
    }
    
    public CestaBeans(String cod, String img, String nombre, Double precio, Double descuento, Double precioFinal, int cantidad) {
        this.cod = cod;
        this.img = img;
        this.nombre = nombre;
        this.precio = precio;
        this.descuento = descuento;
        this.precioFinal = precioFinal;
        this.cantidad = cantidad;
    }

    public String getCod() {
        return cod;
    }

    public void setCod(String cod) {
        this.cod = cod;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public Double getDescuento() {
        return descuento;
    }

    public void setDescuento(Double descuento) {
        this.descuento = descuento;
    }

    public Double getPrecioFinal() {
        return precioFinal;
    }

    public void setPrecioFinal(Double precioFinal) {
        this.precioFinal = precioFinal;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

        
    
            
}
