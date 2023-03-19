// ignore_for_file: sized_box_for_whitespace, avoid_print, non_constant_identifier_names

import 'package:app_parent/Coach/HomePageCoach/HOMEPAGECoach.dart';
import 'package:app_parent/Coach/HomePageCoach/outil/outilco.dart';
import 'package:app_parent/PartieJoueurs/Jeux/DetailJeu.dart';
import 'package:app_parent/models/SystemeJeu.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../HomePageJoueur.dart';

class SysJeuJou extends StatefulWidget {
  const SysJeuJou({Key? key}) : super(key: key);

  @override
  State<SysJeuJou> createState() => _SysJeuJou();
}

// ignore: camel_case_types
class _SysJeuJou extends State<SysJeuJou> {
  void initState() {
    super.initState();
    getJeu();
  }

  getJeu() async {
    futureData = await FetchJeu();
    setState(() {
      print(futureData);
    });
  }

  List<SystemeJeu> futureData = [];
  @override
  Future<List<SystemeJeu>> FetchJeu() async {
    List<SystemeJeu> Sys = [];

    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYWVlZCIsInJvbGVzIjpbIkFkbWluIl0sImV4cCI6MTY2NTM0MTU0Mn0.qop7sd9zT_EYA4BM6tJaNRKSMNmTbvEdpnjSLN8Fuyk',
      'Accept-Language': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = await http.get(
        Uri.parse('http://172.16.130.41:8080/projet/systemejeux'),
        headers: headers);

    setState(() {});

    if (request.statusCode == 200) {
      Iterable l = json.decode(request.body);
      Sys = List<SystemeJeu>.from(l.map((model) => SystemeJeu.fromJson(model)));
      return Sys;
    } else {
      return Sys;
    }
  }

  Widget SystemeJeux(SystemeJeu jeu) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetJeuJou(
                    ssys: jeu,
                  )));
        },
        child: Container(
            height: screenHeight / 2.87,
            width: screenWidth / 5.18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 25),
                    child: Text(
                      jeu.nom.toString(),
                      style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  )),
                  Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.share,
                            color: Colors.red,
                          ),
                          SizedBox(width: 15),
                          LikeButton(
                            size: 25,
                          )
                        ],
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Text(
                  jeu.auteur.toString() + "-" + jeu.dateCreation.toString(),
                  style: const TextStyle(
                      fontSize: 11,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 72, 72, 72)),
                ),
              ),
              Center(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Container(
                          height: 176,
                          width: 190,
                          child: Image.memory(
                              Base64Decoder().convert(jeu.image.toString()))))),
            ])));
  }

  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 247, 250),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeJoueur()));
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
                size: 25,
              )),
          title: const Text(
            ' Système de jeux',
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
          child: Stack(children: [
        Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: screenWidth / 1.18,
                child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                    scrollDirection: Axis.vertical,
                    addSemanticIndexes: true,
                    itemCount: futureData.length,
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SystemeJeux(futureData[index]);
                    }),
              ),
            ),
            const SizedBox(height: 30),
            const SizedBox(height: 30),
          ],
        ),
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
                                  builder: (context) => const CoachHome()));
                            },
                            icon: const Icon(
                              Icons.home_outlined,
                              size: 25,
                              color: Color.fromARGB(255, 14, 21, 110),
                            ))),
                  ),
                  label: ("Acceuil"),
                  backgroundColor: const Color.fromARGB(255, 214, 228, 255)),
              /*BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, right: 12),
                    child: Container(
                        height: 30,
                        width: 30,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CalendarPhase1Co()));
                            },
                            icon: const Icon(
                              Icons.calendar_today,
                              size: 25,
                              color: Color.fromARGB(255, 14, 21, 110),
                            ))),
                  ),
                  label: ("Calendrier"),
                  backgroundColor: const Color.fromARGB(255, 214, 228, 255)),*/
              /*BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, right: 12),
                    child: Container(
                        height: 30,
                        width: 30,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const ListMsg1()));
                            },
                            icon: const Icon(
                              Icons.message_outlined,
                              size: 25,
                              color: Color.fromARGB(255, 14, 21, 110),
                            ))),
                  ),
                  label: ("Message"),
                  backgroundColor: const Color.fromARGB(255, 214, 228, 255)),*/
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, right: 12),
                    child: Container(
                        height: 30,
                        width: 30,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Outilco()));
                            },
                            icon: const Icon(
                              Icons.shopping_bag_outlined,
                              size: 25,
                              color: Color.fromARGB(255, 14, 21, 110),
                            ))),
                  ),
                  label: ("Mes Outils"),
                  backgroundColor: const Color.fromARGB(255, 214, 228, 255)),
            ]),
      ),
    );
  }
}
