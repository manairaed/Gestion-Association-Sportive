import 'package:app_parent/Coach/HomePageCoach/HOMEPAGECoach.dart';
import 'package:app_parent/Coach/HomePageCoach/outil/MediaCoach.dart/entrainementco.dart';
import 'package:app_parent/Coach/HomePageCoach/outil/convocation/presenceco.dart';
import 'package:app_parent/Coach/HomePageCoach/outil/favorisco.dart';
import 'package:app_parent/PartieJoueurs/Drawer/Outil/Galerie/galerie.dart';
import 'package:app_parent/PartieJoueurs/boutique/boutiquejou.dart';
import 'package:app_parent/PartieJoueurs/calender/calenderJoueur.dart';
import 'package:flutter/material.dart';

class Outilco extends StatefulWidget {
  const Outilco({Key? key}) : super(key: key);

  @override
  State<Outilco> createState() => _OutilState();
}

class _OutilState extends State<Outilco> {
// This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 247, 250),
      appBar: AppBar(
          title: const Text(
            'Mes Outils',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          ),
          titleSpacing: 0.0,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => CoachHome()));
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
                size: 25,
              )),
          backgroundColor: const Color.fromARGB(255, 14, 21, 110)),
      body: SingleChildScrollView(
          child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(35.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const entrainementco()));
                    },
                    child: Container(
                        child: Image.asset("assets/3970262.png"),
                        height: screenHeight / 7,
                        width: screenWidth / 5.4,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(200))),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Planifier une séance \n d'entraînement",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 231, 30, 43)),
                  ),
                ]),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const presenceco()));
                        },
                        child: Container(
                            child: Image.asset("assets/xx.png"),
                            height: screenHeight / 7,
                            width: screenWidth / 3.4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(200)))),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Marquer Présence",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 231, 30, 43)),
                    ),
                  ],
                )
              ]),
        ),
        Padding(
          padding: const EdgeInsets.all(35.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                        child: Image.asset("assets/panier.png"),
                        height: screenHeight / 7,
                        width: screenWidth / 3.4,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(200))),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Mon Panier",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 231, 30, 43)),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const panierco()));
                        },
                        child: Container(
                            child: Image.asset("assets/Favoris.png"),
                            height: screenHeight / 7,
                            width: screenWidth / 3.4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(200)))),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Mes favoris",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 231, 30, 43)),
                    ),
                  ],
                )
              ]),
        ),
        /*Padding(
          padding: const EdgeInsets.all(35.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Factureco()));
                        },
                        child: Container(
                            child: Image.asset("assets/facture.png"),
                            height: screenHeight / 7,
                            width: screenWidth / 3.4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(200)))),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Factures",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 231, 30, 43)),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const documentCo()));
                        },
                        child: Container(
                            child: Image.asset("assets/document.png"),
                            height: screenHeight / 7,
                            width: screenWidth / 3.4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(200)))),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Mes documents",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 231, 30, 43)),
                    ),
                  ],
                )
              ]),
        )*/
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
