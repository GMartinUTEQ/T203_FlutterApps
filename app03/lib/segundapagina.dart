import 'package:app03/detalle_producto.dart';
import "package:flutter/material.dart";
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'datos_productos.dart';

// ignore: use_key_in_widget_constructors
class SegundaPagina extends StatefulWidget {
  @override
  State<SegundaPagina> createState() => _HomeState();
}

class _HomeState extends State<SegundaPagina> {
  //Mapa completo
  List<Datos_Productos> data = List<Datos_Productos>.empty(growable: true);
  Future<List<Datos_Productos>> obtenerProductos() async {
    var url = Uri.https("grupojj.com.mx", 'WSLogin/Producto.php');
    var map = <String, dynamic>{};
    map['apikey'] = 'UTEQ';

    var response =
        await http.post(url, body: map).timeout(const Duration(seconds: 90));

    var datos = jsonDecode(response.body);

    //Toma 1 x 1
    var registros = List<Datos_Productos>.empty(growable: true);

    for (datos in datos) {
      registros.add(Datos_Productos.fromJson(datos));
    }

    return registros;
  }

  @override
  void initState() {
    super.initState();
    obtenerProductos().then((value) {
      setState(() {
        data.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Productos"),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.red, width: 1)),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: <Widget>[
                            FadeInImage(
                              placeholder: const NetworkImage(
                                  "https://flevix.com/wp-content/uploads/2020/01/Bounce-Bar-Preloader-1.gif"),
                              image: NetworkImage(data[index].Img),
                              fit: BoxFit.fitHeight,
                              height: 45.0,
                            ),
                            const Padding(padding: EdgeInsets.all(5)),
                            Text(
                              "${data[index].IDProd} - ${data[index].Nombre}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              data[index].Precio,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: Image.asset(
                                'ojo.png',
                                height: 25,
                              ),
                              iconSize: 50,
                              onPressed: () {
                                /*print(data[index].IDProd);
                                print("Indice: ${index}");
                                print(int.parse(data[index].IDProd));*/
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetalleProducto(
                                            int.parse(data[index].IDProd),
                                            index)));
                              },
                            ),
                            IconButton(
                              icon: Image.asset(
                                'carrito.png',
                                height: 25,
                              ),
                              iconSize: 50,
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Image.asset(
                                'fav.png',
                                height: 25,
                              ),
                              iconSize: 50,
                              onPressed: () {},
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: data.length,
          ),
        )
      ]),
    );
  }
}
