import 'package:app_parent/Coach/HomePageCoach/HOMEPAGECoach.dart';
import 'package:app_parent/Coach/HomePageCoach/outil/outilco.dart';
import 'package:app_parent/PartieJoueurs/Jeux/SysJeux.dart';
import 'package:app_parent/models/SystemeJeu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetJeuJou extends StatefulWidget {
  SystemeJeu ssys;

  DetJeuJou({Key? key, required this.ssys}) : super(key: key);

  @override
  State<DetJeuJou> createState() => _DetJeuState();
}

// ignore: camel_case_types
class _DetJeuState extends State<DetJeuJou> {
  List<SystemeJeu> futureData = [];
  @override
  void initState() {
    super.initState();
    getSysteme();
  }

  getSysteme() async {
    futureData = await FetchSysteme();
    setState(() {
      print(futureData);
    });
  }

  Future<List<SystemeJeu>> FetchSysteme() async {
    List<SystemeJeu> Systeme = [];

    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYWVlZCIsInJvbGVzIjpbIkFkbWluIl0sImV4cCI6MTY2NTM0MTU0Mn0.qop7sd9zT_EYA4BM6tJaNRKSMNmTbvEdpnjSLN8Fuyk',
      'Accept-Language': 'application/json',
      'Content-Type': 'application/json'
    };

    var request = await http.get(
        Uri.parse("http://172.16.130.41:8080/projet/systemejeux"),
        headers: headers);

    if (request.statusCode == 200) {
      Iterable l = json.decode(request.body);
      Systeme =
          List<SystemeJeu>.from(l.map((model) => SystemeJeu.fromJson(model)));
      return Systeme;
    } else {
      return Systeme;
    }
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SysJeuJou()));
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
                size: 25,
              )),
          title: const Text(
            'NC STATE WOLFPACK...',
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: const EdgeInsets.all(43.0),
            child: SizedBox(
              height: screenHeight / 3.9,
              width: screenWidth / 1.29,
              child: Image.memory(
                  Base64Decoder().convert(widget.ssys.image.toString())),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 28),
                  child: Container(
                    height: screenHeight / 33.8,
                    width: screenWidth / 15.62,
                    color: Colors.white,
                    child: Image.asset("assets/share.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 28),
                  child: Container(
                    height: screenHeight / 33.8,
                    width: screenWidth / 15.62,
                    color: Colors.white,
                    child: Image.asset("assets/mark.png"),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0, right: 20),
              child: Container(
                height: screenHeight / 36,
                width: screenWidth / 3.9,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 14, 21, 110),
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                    child: Text(
                  'Attaque placée',
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20),
          child: Text(
              widget.ssys.auteur.toString() +
                  " - " +
                  widget.ssys.dateCreation.toString(),
              style: const TextStyle(
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 153, 153, 160))),
        ),
        //   const Padding(
        //    padding: EdgeInsets.only(left :20.0, top:5),
        //    child: Text("NC STATE WOLFPACK WBB - FLARE SLOB", style:  TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w500, color: Color.fromARGB(255, 30, 32, 40))),
        //  ),
        Padding(
          padding: EdgeInsets.only(left: 20.0, top: 5),
          child: Text(widget.ssys.description.toString(),
              style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  color: const Color.fromARGB(255, 30, 32, 40))),
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
