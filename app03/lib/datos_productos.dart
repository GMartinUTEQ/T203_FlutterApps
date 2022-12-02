class Datos_Productos {
  String IDProd = "";
  String Nombre = "";
  String Precio = "";
  String Img = "";

  Datos_Productos(this.IDProd, this.Nombre, this.Precio, this.Img);

  Datos_Productos.fromJson(Map<String, dynamic> json) {
    IDProd = json['IDProd'];
    Nombre = json['Nombre'];
    Precio = json['Precio'];
    Img = json['Img'];
  }
}
