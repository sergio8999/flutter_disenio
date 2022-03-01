// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class PaginaDetalle extends StatefulWidget {
  final String imagen;
  final String nombre;
  final String precio;

  const PaginaDetalle({ Key? key, required this.imagen, required this.nombre, required this.precio }) : super(key: key);

  @override
  _PaginaDetalleState createState() => _PaginaDetalleState();
}

class _PaginaDetalleState extends State<PaginaDetalle> {
  var nombreTarjeta = "DIRECTOR";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF7A9BEE),
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text("Detalles",
                style: TextStyle(
                  fontFamily: 'Monserrat',
                  fontSize: 18.0,
                  color: Colors.white
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.more_horiz),
                  color: Colors.white)
              ],
      ), 
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 82,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75.0,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(45.0), topRight: Radius.circular(45.0)),
                    color: Colors.white
                  ),
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width,
                )
                ),
                Positioned(
                  top: 30.0,
                  left: (MediaQuery.of(context).size.width / 2) - 100.0,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.imagen),
                        fit: BoxFit.contain
                      )
                    ),
                    height: 200.0,
                    width: 200,
                  )
                ),
                Positioned(
                  top: 250.0,
                  left: 25.0,
                  right: 25.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.nombre,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold
                      )
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.precio,
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20.0,
                            color: Colors.grey
                          )),
                          Container(height: 25.0, color: Colors.grey, width: 1.0),
                      Container(
                        width: 125.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17.0),
                          color: const Color(0XFF7A9BEE)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: (){},
                              child: Container(
                                height: 25.0,
                                width: 25.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: const Color(0XFF7A9BEE)
                                  ),
                                  child: const Center(
                                    child: Icon(Icons.remove,
                                    color: Colors.white,
                                    size: 20.0,)
                                    ),
                               ),
                             ),
                             const Text("3",
                             style: TextStyle(
                               color: Colors.white,
                               fontFamily: 'Montserrat',
                               fontSize: 15.0
                             )),
                             InkWell(
                               onTap: (){},
                               child: Container(
                                 height: 25.0,
                                 width: 25.0,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(7.0),
                                   color: Colors.white
                                 ),
                                 child: const Center(
                                   child: Icon(Icons.add,
                                   color: Color(0XFF7A9BEE),
                                   size: 20.0,)
                                 ),
                               ),
                             )
                            ],
                          ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        height: 150.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            obtenerInformacion("DIRECTOR", "Robert", "1976."),
                            const SizedBox(width: 10.0),
                            obtenerInformacion("ACTOR", "Chris", "1981"),
                            const SizedBox(width: 10.0),
                            obtenerInformacion("ACTOR", "Paul", "1983"),
                            const SizedBox(width: 10.0),
                            obtenerInformacion("ACTOR", "Emily", "1988"),
                            const SizedBox(width: 10.0)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                               bottomLeft: Radius.circular(25.0), 
                              bottomRight: Radius.circular(25.0)
                            ),
                            color: Colors.black
                          ),
                          height: 50.0,
                          child: const Center(
                            child: Text("22 €" ,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat'
                            ),),
                          ),
                        ),
                      )
                    ],
                  )
                )
            ],
          )
        ],
      ),     
    );
  }

  Widget obtenerInformacion(String titulo, String info, String cantidad) {
    return InkWell(
      onTap: () {
       tarjetaSeleccionada(titulo);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: titulo == nombreTarjeta ? const Color(0xFF7A9BEE) : Colors.white,
          border: Border.all(
            color: titulo == nombreTarjeta ? 
            Colors.transparent :
            Colors.grey.withOpacity(0.3),
            style: BorderStyle.solid,
          width: 0.75
          ),          
        ),
        height: 100.0,
        width: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15.0),
              child: Text(titulo,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12.0,
                    color:
                        titulo == nombreTarjeta ? Colors.white : Colors.grey.withOpacity(0.7),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(info,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: titulo == nombreTarjeta
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold)),
                  Text(cantidad,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12.0,
                        color: titulo == nombreTarjeta
                            ? Colors.white
                            : Colors.black,
                      ))
                ],
              ),
            )
          ]
        )
      )
    );
  }

  tarjetaSeleccionada(titulo){
    setState(() {
      nombreTarjeta = titulo;
    });
  }
}