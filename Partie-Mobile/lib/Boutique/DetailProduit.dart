//import 'package:carousel_pro/carousel_pro.dart';
// ignore_for_file: sized_box_for_whitespace, must_be_immutable, avoid_print, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:app_parent/Boutique/boutique.dart';
import 'package:app_parent/Boutique/panier/panier.dart';
import 'package:app_parent/Boutique/recherche.dart';
import 'package:app_parent/PartieJoueurs/Drawer/Outil/Galerie/galerie.dart';
import 'package:app_parent/PartieJoueurs/HomePageJoueur.dart';
import 'package:app_parent/PartieJoueurs/boutique/boutiquejou.dart';
import 'package:app_parent/PartieJoueurs/calender/calenderJoueur.dart';
import 'package:app_parent/models/produit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class DetailProduit extends StatefulWidget {
  Produit produit;
  DetailProduit({Key? key, required this.produit}) : super(key: key);

  @override
  State<DetailProduit> createState() => _DetailProduitState();
}

class _DetailProduitState extends State<DetailProduit> {
  List<Produit> futureData = [];
  @override
  void initState() {
    super.initState();
    getProduit();
  }

  getProduit() async {
    futureData = await FetchProduit();
    setState(() {
      print(futureData);
    });
  }

  Future<List<Produit>> FetchProduit() async {
    List<Produit> product = [];

    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYWVlZCIsInJvbGVzIjpbIkFkbWluIl0sImV4cCI6MTY2NTM0MTU0Mn0.qop7sd9zT_EYA4BM6tJaNRKSMNmTbvEdpnjSLN8Fuyk',
      'Accept-Language': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = await http.get(
        Uri.parse('http://172.16.130.41:8080/projet/produit'),
        headers: headers);

    if (request.statusCode == 200) {
      Iterable l = json.decode(request.body);
      product = List<Produit>.from(l.map((model) => Produit.fromJson(model)));
      return product;
    } else {
      return product;
    }
  }

  String dropdownvalue = 'Couleur';
  String dropdownvalue1 = 'Taille';

  var items = ['Couleur', 'Rouge', 'Blue', 'Vert', 'Gris', 'Noir'];
  var items1 = ['Taille', '37', '38', 'Vert', 'Gris', 'Noir'];
  int _counter = 0;

  final List<String> images = [
    'assets/chaussur.png',
    'assets/homeImg.png',
    'assets/homeImg.png',
    'assets/homeImg.png'
  ];
  @override
  Widget build(
    BuildContext context,
  ) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 247, 250),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const boutique()));
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
            )),
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TestPage()));
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  // do something
                },
              ),
            ],
          ),
        ],
        title: const Text(
          'Détail Produit',
          style: TextStyle(
              fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w500),
        ),
        titleSpacing: 0.0,
        elevation: 00,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 14, 21, 110),
      ),
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Padding(
                padding: const EdgeInsets.all(43.0),
                child: SizedBox(
                  height: screenHeight / 3.9,
                  width: screenWidth / 1.29,
                  child: Image.memory(const Base64Decoder()
                      .convert(widget.produit.image.toString())),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 21.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.produit.nomProduit.toString(),
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 0, 0))),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text(
                      widget.produit.prix.toString() + "Dinars",
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 7, 44, 75)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 21.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Image.asset("assets/share1.png"),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 15.0),
                              child: LikeButton(
                                circleColor: CircleColor(
                                  start: Color.fromARGB(248, 255, 0, 0),
                                  end: Color.fromARGB(248, 255, 0, 0),
                                ),
                                bubblesColor: BubblesColor(
                                  dotPrimaryColor:
                                      Color.fromARGB(248, 243, 0, 61),
                                  dotSecondaryColor:
                                      Color.fromARGB(248, 243, 0, 61),
                                ),
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 22.0),
              child: Text(
                "Description ",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 32, 32, 32)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, top: 03),
              child: Text(
                  "Categorie:" + widget.produit.categorie!.label.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  )),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 22.0, top: 03),
              child: Text("Marque:" + widget.produit.marque!.nom.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  )),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 22.0),
              child: Text(
                widget.produit.description.toString(),
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                    color: Color.fromARGB(255, 0, 0, 0),
                    height: 1.5),
              ),
            ),

            const SizedBox(height: 30),
            //      const Padding(
            //        padding: EdgeInsets.only(left :22.0),
            //        child: Text("Color", style: TextStyle(fontFamily: 'Poppins',fontSize: 14,fontWeight: FontWeight.w500,color: const Color.fromARGB(255, 0, 0, 0)),),
            //      ),
            //      const SizedBox(height: 18,),
            //     Padding(
            //       padding: const EdgeInsets.only(left:30.0, right: 30.0),
            //       child: Container(

            //          decoration: const ShapeDecoration(

            //   shape: RoundedRectangleBorder(
            //     side: BorderSide(width: 1.0, style: BorderStyle.solid),
            //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
            //   ),
            // ),
            //         width: screenWidth,
            //         child: DropdownButton(
            //            underline: Container(
            //                 height: 1.0,
            //                 decoration: const BoxDecoration(
            //                     border: Border(bottom: BorderSide(color: Colors.transparent, width: 0.0))
            //                 ),
            //               ),
            //               value: dropdownvalue,

            //               icon: const Padding(
            //                 padding:   EdgeInsets.only(left:250.0),
            //                 child:  Icon(Icons.keyboard_arrow_down),
            //               ),

            //               items:items.map((String items) {
            //                 return DropdownMenuItem(
            //                     value: items,
            //                     child: Padding(
            //                       padding: const EdgeInsets.only(left:8.0),
            //                       child: Text(items, style:const TextStyle(fontFamily: 'Poppins', fontSize:14,fontWeight:FontWeight.w500),
            //                     )
            //                  ) );
            //               }
            //               ).toList(),
            //               onChanged: (newValue){
            //                 setState(() {
            //                   dropdownvalue = newValue.toString();
            //                 });
            //               },

            //             ),
            //       ),
            //     ),

            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(left: 22.0),
              child: Text(
                "Taille",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            const SizedBox(
              height: 26,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Container(
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.0, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
                width: screenWidth,
                child: DropdownButton(
                  underline: Container(
                    height: 1.0,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.transparent, width: 0.0))),
                  ),
                  value: dropdownvalue1,
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 250.0),
                    child: Icon(Icons.keyboard_arrow_down),
                  ),
                  items: items1.map((String items1) {
                    return DropdownMenuItem(
                        value: items1,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              items1,
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            )));
                  }).toList(),
                  onChanged: (newValue1) {
                    setState(() {
                      dropdownvalue1 = newValue1.toString();
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: InkWell(
                        key: GlobalKey(),
                        onTap: () {
                          setState(() {
                            _counter--;
                          });
                        },
                        child: Container(
                            child: Image.asset("assets/Icon.png"),
                            height: screenHeight / 31.23,
                            width: screenWidth / 14.42,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 213, 43, 30),
                                borderRadius: BorderRadius.circular(8))),
                      )),
                  Container(
                    height: screenHeight / 31.23,
                    width: screenWidth / 6.7,
                    child: Center(child: Text('$_counter')),
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: InkWell(
                      key: GlobalKey(),
                      onTap: () {
                        setState(() {
                          _counter++;
                        });
                      },
                      child: Container(
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                          height: screenHeight / 31.23,
                          width: screenWidth / 14.42,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 213, 43, 30),
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                icon: const Icon(Icons.shopping_bag,
                    size: 14, color: Color.fromARGB(255, 6, 65, 114)),
                label: const Text(
                  "Continuer mes achats",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 14, 21, 110),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(
                    width: 2.0,
                    color: Color.fromARGB(255, 14, 21, 110),
                  ),
                  fixedSize: const Size(325, 46),
                  primary: const Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: ElevatedButton(
                      child: const Center(
                          child: Icon(
                        Icons.phone,
                        color: Color.fromARGB(255, 213, 43, 30),
                      )),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            width: 2.0,
                            color: Color.fromARGB(255, 213, 43, 30),
                          ),
                          fixedSize: const Size(90, 46),
                          primary: const Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                ),
                const SizedBox(width: 7),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                        size: 15,
                      ),
                      label: const Center(
                        child: Text(
                          "Valider la commande",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                panier1(prod: widget.produit)));
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(220, 46),
                          primary: const Color.fromARGB(255, 213, 43, 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                ),
              ],
            )
          ])),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
            unselectedItemColor: const Color.fromARGB(255, 14, 21, 110),
            selectedLabelStyle: const TextStyle(
                color: Color.fromARGB(255, 14, 21, 110),
                decorationColor: Color.fromARGB(255, 14, 21, 110),
                fontFamily: 'Poppins',
                fontSize: 11,
                fontWeight: FontWeight.w500),
            unselectedLabelStyle: const TextStyle(
                color: Color.fromARGB(255, 14, 21, 110),
                decorationColor: Color.fromARGB(255, 14, 21, 110),
                fontFamily: 'Poppins',
                fontSize: 11,
                fontWeight: FontWeight.w500),
            backgroundColor: const Color.fromARGB(255, 14, 21, 110),
            fixedColor: const Color.fromARGB(255, 14, 21, 110),
            showUnselectedLabels: true,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8.0,
                      right: 12,
                    ),
                    child: Container(
                        height: 30,
                        width: 30,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomeJoueur()));
                            },
                            icon: const Icon(
                              Icons.home_outlined,
                              size: 25,
                              color: Color.fromARGB(255, 14, 21, 110),
                            ))),
                  ),
                  label: ("Acceuil"),
                  backgroundColor: const Color.fromARGB(255, 214, 228, 255)),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, right: 12),
                    child: Container(
                        height: 30,
                        width: 30,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CalendarJou()));
                            },
                            icon: const Icon(
                              Icons.calendar_today,
                              size: 25,
                              color: Color.fromARGB(255, 14, 21, 110),
                            ))),
                  ),
                  label: ("Calendrier"),
                  backgroundColor: const Color.fromARGB(255, 214, 228, 255)),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, right: 12),
                    child: Container(
                        height: 30,
                        width: 30,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Galerie()));
                            },
                            icon: const Icon(
                              Icons.photo_album,
                              size: 25,
                              color: Color.fromARGB(255, 14, 21, 110),
                            ))),
                  ),
                  label: ("Galerie"),
                  backgroundColor: const Color.fromARGB(255, 214, 228, 255)),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, right: 12),
                    child: Container(
                        height: 30,
                        width: 30,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const boutiquejou()));
                            },
                            icon: const Icon(
                              Icons.shopping_bag_outlined,
                              size: 25,
                              color: Color.fromARGB(255, 14, 21, 110),
                            ))),
                  ),
                  label: ("Boutique"),
                  backgroundColor: const Color.fromARGB(255, 214, 228, 255)),
            ]),
      ),
    );
  }
}
