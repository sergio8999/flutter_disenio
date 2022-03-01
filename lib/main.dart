// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:disenio_flutter/detalle.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comida sana',
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top:  15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                ),
                Container(
                  width: 125.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.filter_list),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                      )
                  ]),
                )
              ])
              ),
              SizedBox(height: 25.0),
              Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: Row(
                  children: const [
                    Text("Películas",
                      style: TextStyle(
                        fontFamily: 'Monserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0
                      )
                    ),
                    SizedBox(width: 10.0),
                    Text("Bluray",
                      style: TextStyle(
                        fontFamily: 'Monserrat',
                        color: Colors.white,
                        fontSize: 25.0
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              Container(
                height: MediaQuery.of(context).size.height -105.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)) 
                ),
                child: ListView(
                  primary: false,
                  padding: EdgeInsets.only(left: 25.0, right: 20.0),
                  children: [
                    Padding(padding: EdgeInsets.only(top: 45.0),
                      child:Container(
                        height: MediaQuery.of(context).size.height - 300,
                        child: ListView(
                          children: [
                            itemPlato('assets/captainMarvel.jpg', 'Capitana Marvel', '20€'),
                            itemPlato('assets/civilWar.jpg', 'Civil War', '20€'),
                            itemPlato('assets/fast.jpg', 'Fast and Furious', '22€'),
                            itemPlato('assets/ironMan3.jpg', 'Iron Man 3', '23€'),
                            itemPlato('assets/soyLeyenda.jpg', 'Soy Leyenda', '18€'),
                            itemPlato('assets/thor.jpg', 'Thor', '24€'),                           
                          ],
                        ),
                      ) ,
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 65.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1.0
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Icon(Icons.search,color: Colors.black),
                          ),
                        ),
                        Container(
                          height: 65.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1.0
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Icon(Icons.shopping_basket,color: Colors.black),
                          ),
                        ),
                        Container(
                          height: 65.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1.0
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFF1C1428)
                          ),
                          child: Center(
                            child: Text("Comprar",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 15.0
                            ),)
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
        ]),
    );
  }

  Widget itemPlato(String imagen, String nombre, String precio){
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right:10.0, top: 10.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=> PaginaDetalle(imagen: imagen, nombre: nombre, precio: precio))
            );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Hero(
                    tag: imagen,
                    child: Image(
                      image: AssetImage(imagen),
                      fit: BoxFit.contain,
                      height: 100.0,
                      width: 75.0
                    )
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nombre,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(precio,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                          color: Colors.grey
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.add),
              color: Colors.black,)
          ],
        ),
      )
    );
  }
}