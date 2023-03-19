import 'package:app_parent/PartieJoueurs/Drawer/Outil/Outil.dart';
import 'package:app_parent/PartieJoueurs/HomePageJoueur.dart';
import 'package:app_parent/PartieJoueurs/boutique/boutiquejou.dart';
import 'package:app_parent/PartieJoueurs/boutique/panier/panierjou.dart';
import 'package:app_parent/PartieJoueurs/boutique/recherche.dart';
import 'package:app_parent/PartieJoueurs/calender/calenderJoueur.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dart:async';
import 'package:like_button/like_button.dart';

import '../../models/Evenemenet.dart';
import '../../models/produit.dart';
import '../Drawer/Outil/Galerie/galerie.dart';

class DetailCalender extends StatefulWidget {
  Evenement events;
  DetailCalender({Key? key, required this.events}) : super(key: key);

  @override
  State<DetailCalender> createState() => _DetailCalenderState();
}

class _DetailCalenderState extends State<DetailCalender> {
  List<Evenement> futureData = [];
  @override
  void initState() {
    super.initState();
    getEvenement();
  }

  getEvenement() async {
    futureData = await FetchEvent();
    setState(() {
      print(futureData);
    });
  }

  Future<List<Evenement>> FetchEvent() async {
    List<Evenement> product = [];

    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYWVlZCIsInJvbGVzIjpbIkFkbWluIl0sImV4cCI6MTY2NTM0MTU0Mn0.qop7sd9zT_EYA4BM6tJaNRKSMNmTbvEdpnjSLN8Fuyk',
      'Accept-Language': 'application/json',
      'Accept-Language': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = await http.get(
        Uri.parse('http://172.16.130.41:8080/projet/evenement'),
        headers: headers);

    if (request.statusCode == 200) {
      Iterable l = json.decode(request.body);
      product =
          List<Evenement>.from(l.map((model) => Evenement.fromJson(model)));
      return product;
    } else {
      return product;
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 247, 250),
      appBar: AppBar(
          title: Text(
            'Detail Evenement',
            // ignore: prefer_const_constructors
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          ),
          titleSpacing: 0.0,
          elevation: 0,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 14, 21, 110)),
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
                  child: Image.asset("assets/2.png"),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 21.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("On commence l'evenement",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 0, 0))),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 50.0),
              child: Text(
                widget.events.debut.toString(),
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 7, 44, 75)),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 21.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("L'evenement se termine à",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 0, 0))),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 50.0),
              child: Text(
                widget.events.fin.toString(),
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 7, 44, 75)),
              ),
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.only(left: 22.0),
              child: Text(
                "Description ",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 22.0),
              child: Text(
                widget.events.description.toString(),
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 7, 44, 75)),
              ),
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
