import 'package:app_parent/Outil/Media/detail.dart';
import 'package:app_parent/PartieJoueurs/Drawer/Outil/Galerie/galerie.dart';
import 'package:app_parent/PartieJoueurs/Drawer/Outil/Outil.dart';
import 'package:app_parent/PartieJoueurs/Drawer/Outil/detail/detail.dart';
import 'package:app_parent/PartieJoueurs/HomePageJoueur.dart';
import 'package:app_parent/PartieJoueurs/boutique/boutiquejou.dart';
import 'package:app_parent/PartieJoueurs/calender/calenderJoueur.dart';
import 'package:app_parent/PartieJoueurs/calender/detailcalender.dart';
import 'package:app_parent/models/Match.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

import '../../models/Evenemenet.dart';

class calenEntrainement extends StatefulWidget {
  const calenEntrainement({Key? key}) : super(key: key);

  @override
  State<calenEntrainement> createState() => _calenEntrainementState();
}

class _calenEntrainementState extends State<calenEntrainement> {
  List<Evenement> futureData = [];
  List<Match> futureData1 = [];
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
    List<Evenement> midia = [];
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYWVlZCIsInJvbGVzIjpbIkFkbWluIl0sImV4cCI6MTY2NTM0MTU0Mn0.qop7sd9zT_EYA4BM6tJaNRKSMNmTbvEdpnjSLN8Fuyk',
      'Accept-Language': 'application/json',
      'Content-Type': 'application/json'
    };

    var request = await http.get(
      Uri.parse('http://172.16.130.41:8080/projet/evenement'),
      headers: headers,
    );

    if (request.statusCode == 200) {
      List<Map<String, dynamic>> midi = [];
      Iterable l = json.decode(request.body);
      midia = List<Evenement>.from(l.map((model) => Evenement.fromJson(model)));
      return midia;
    } else {
      return midia;
    }
  }

  @override
  Widget Acualite(Evenement midi) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return
        // ignore: unnecessary_new
        GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailCalender(events: midi)));
            },
            child: Container(
              height: screenHeight / 5.40003,
              width: screenWidth / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 120, 129, 248),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(midi.titre.toString(),
                            style: GoogleFonts.merriweather(
                              // ignore: prefer_const_constructors
                              textStyle: TextStyle(
                                color: Colors.white,
                                letterSpacing: .5,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('Date:  ' + midi.debut.toString(),
                            style: GoogleFonts.cairo(
                              // ignore: prefer_const_constructors
                              textStyle: TextStyle(
                                color: Colors.white,
                                letterSpacing: .5,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }

  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 247, 250),
      appBar: AppBar(
          title: const Text(
            'Entrainement',
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
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Center(
                child: Container(
                    height: screenHeight,
                    width: screenWidth / 1.16,
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
                          return Acualite(futureData[index]);
                        })))
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
