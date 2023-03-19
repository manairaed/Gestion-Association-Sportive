// ignore_for_file: sized_box_for_whitespace, camel_case_types, non_constant_identifier_names, avoid_print

import 'package:app_parent/PartieJoueurs/Drawer/Outil/Galerie/galerie.dart';
import 'package:app_parent/PartieJoueurs/HomePageJoueur.dart';
import 'package:app_parent/PartieJoueurs/boutique/boutiquejou.dart';
import 'package:app_parent/PartieJoueurs/calender/calenderJoueur.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:app_parent/Boutique/DetailProduit.dart';
import 'package:app_parent/Boutique/recherche.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../Calendrier/Calendrier.dart';
import '../HomeScreen/home/homescreen.dart';
import '../Outil/Outil.dart';
import '../models/Evenemenet.dart';
import '../models/produit.dart';

class boutique extends StatefulWidget {
  const boutique({
    Key? key,
  }) : super(key: key);

  @override
  State<boutique> createState() => _boutiqueState();
}

class _boutiqueState extends State<boutique> {
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

  Widget Articlee(Produit produit) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailProduit(produit: produit)));
        },
        child: Container(
          height: screenHeight / 2.9,
          width: screenWidth / 2.53,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 18,
            ),
            Row(
              children: [
                Center(
                    child: Container(
                        height: 90,
                        width: 140,
                        child: Image.memory(Base64Decoder()
                            .convert(produit.image.toString())))),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: const [
                    LikeButton(
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
            //SizedBox(height:15 ),

            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 20),
              child: Text(
                produit.nomProduit.toString(),
                style: const TextStyle(
                  fontSize: 11,
                  color: Color.fromARGB(255, 105, 105, 105),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
              ),
            ),

            SizedBox(
              height: 7,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Container(
                height: screenHeight / 25,
                child: RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  itemSize: 25,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 0.1),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(produit.prix.toString() + "Dinars",
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 14, 21, 110),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shop, size: 9),
                label: const Text(
                  "Ajouter au panier",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(160, 29),
                  primary: const Color.fromARGB(255, 213, 43, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 247, 250),
      appBar: AppBar(
        title: const Text(
          'Boutique',
          style: TextStyle(
              fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w500),
        ),
        titleSpacing: 0.0,
        elevation: 00,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 14, 21, 110),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const Home()));
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
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 35,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 21.0),
                child: Text(
                  "Découvriez nos catégories",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                  height: 100,
                  child: ListView(
                      padding: const EdgeInsets.all(30),
                      shrinkWrap: true,
                      primary: false,
                      addSemanticIndexes: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(width: 15),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Tous",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 255, 255, 255))),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            fixedSize: const Size(120, 45),
                            primary: const Color.fromARGB(255, 212, 10, 10),
                          ),
                        ),
                        const SizedBox(width: 15),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Outdoor",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 0, 0))),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            fixedSize: const Size(120, 45),
                            primary: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        const SizedBox(width: 15),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Tennis",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(255, 0, 0, 0))),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            fixedSize: const Size(120, 45),
                            primary: const Color.fromARGB(255, 247, 247, 247),
                          ),
                        ),
                        const SizedBox(width: 15),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Running",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 0, 0, 0))),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            fixedSize: const Size(120, 45),
                            primary: const Color.fromARGB(255, 247, 247, 247),
                          ),
                        ),
                      ])),
              SingleChildScrollView(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Container(
                      height: screenHeight / 1.6727,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 190,
                                  childAspectRatio: 1.8 / 3,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: futureData.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Articlee(futureData[index]);
                          }),
                    ),
                  )
                ],
              ))
            ]),
      ),
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
