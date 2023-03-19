// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names

import 'package:app_parent/HomeScreen/LicencePayement.dart';
import 'package:app_parent/Login/SeConnecter.dart';
import 'package:app_parent/Outil/Outil.dart';
import 'package:app_parent/PartieJoueurs/Drawer/Outil/Galerie/galerie.dart';
import 'package:app_parent/PartieJoueurs/Drawer/Outil/Outil.dart';
import 'package:app_parent/PartieJoueurs/Drawer/Outil/detail/detail.dart';
import 'package:app_parent/PartieJoueurs/Drawer/ProfilJoueur.dart';

import 'package:app_parent/PartieJoueurs/boutique/boutiquejou.dart';
import 'package:app_parent/PartieJoueurs/calender/calenderJoueur.dart';
import 'package:app_parent/models/Utilisateur.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:app_parent/models/MediaModel.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<MediaModel> futureData = [];
  List<Utilisateur> futureData1 = [];
  void initState() {
    super.initState();
    getMediaModel();
  }

  getMediaModel() async {
    futureData = await FetchMedia();
    setState(() {
      print(futureData);
    });
  }

  Future<List<MediaModel>> FetchMedia() async {
    List<MediaModel> midia = [];
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYWVlZCIsInJvbGVzIjpbIkFkbWluIl0sImV4cCI6MTY2NTM0MTU0Mn0.qop7sd9zT_EYA4BM6tJaNRKSMNmTbvEdpnjSLN8Fuyk',
      'Accept-Language': 'application/json',
      'Content-Type': 'application/json'
    };

    var request = await http.get(
      Uri.parse('http://172.16.130.41:8080/projet/actualite'),
      headers: headers,
    );

    if (request.statusCode == 200) {
      List<Map<String, dynamic>> midi = [];
      Iterable l = json.decode(request.body);
      midia =
          List<MediaModel>.from(l.map((model) => MediaModel.fromJson(model)));
      return midia;
    } else {
      return midia;
    }
  }

  @override
  Widget Acualite(MediaModel midi) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String image1 = midi.image.toString();
    String image2 = image1.substring(image1.indexOf(',') + 1, image1.length);
    return
        // ignore: unnecessary_new
        GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => detailJou(mediaModel: midi)));
            },
            child: Container(
              height: screenHeight / 3.40003,
              width: screenWidth / 1.18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 30,
                      child: Text(midi.actualitedate.toString(),
                          textAlign: TextAlign.center,
                          style: (const TextStyle(
                              fontSize: 11,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 14, 21, 110)))),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(midi.titre.toString(),
                            style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                  Container(
                      height: screenHeight / 4.8,
                      width: screenWidth,
                      child: Image.memory(
                        Base64Decoder().convert(image2),
                      ))
                ],
              ),
            ));
  }

  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 247, 250),
      drawer: Drawer(
        child: Stack(
          children: [
            ListView(
              children: [
                Center(
                  child: UserAccountsDrawerHeader(
                    accountName: Text(
                      SeConnecter.prenom + ' ' + SeConnecter.nom,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                    accountEmail: Text(
                      SeConnecter.email + '\n @Parent',
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400),
                    ),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 14, 21, 110)),
                  ),
                ),
                ListTile(
                    leading: const Icon(Icons.payment_outlined),
                    title: const Text(
                      "Licence et Payement",
                      style: TextStyle(
                          color: Color.fromARGB(255, 90, 90, 90),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Payement()));
                    }),
                ListTile(
                    leading: const Icon(Icons.badge_outlined),
                    title: const Text(
                      "Mes Outils",
                      style: TextStyle(
                          color: Color.fromARGB(255, 90, 90, 90),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Outil()));
                    }),
                ListTile(
                    leading: const Icon(Icons.offline_bolt_outlined),
                    title: const Text(
                      "Déconnecter",
                      style: TextStyle(
                          color: Color.fromARGB(255, 90, 90, 90),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SeConnecter()));
                    }),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
          title: const Text(
            'Acceuil',
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
          child: Column(children: [
        Container(
            height: screenHeight,
            width: screenWidth,
            child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                      height: 40,
                    ),
                scrollDirection: Axis.vertical,
                addSemanticIndexes: true,
                itemCount: futureData.length,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Acualite(futureData[index]);
                }))
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
                                  builder: (context) => const Home()));
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
