import 'package:app_parent/PartieJoueurs/Drawer/Outil/favoris/favoris.dart';

import 'package:app_parent/PartieJoueurs/Drawer/ProfilJoueur.dart';
import 'package:app_parent/PartieJoueurs/Exercice/ExerciceJoueurs.dart';
import 'package:app_parent/PartieJoueurs/Exercice/Formation.dart';
import 'package:app_parent/PartieJoueurs/Exercice/SystemeJeux.dart';
import 'package:app_parent/PartieJoueurs/HomePageJoueur.dart';

import 'package:flutter/material.dart';

class OutilJou extends StatefulWidget {
  const OutilJou({Key? key}) : super(key: key);

  @override
  State<OutilJou> createState() => _OutilState();
}

class _OutilState extends State<OutilJou> {
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeJoueur()));
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
                          builder: (context) => const ExerciceJou()));
                    },
                    child: Container(
                        child: Image.asset("assets/exercice.jpg"),
                        height: screenHeight / 7,
                        width: screenWidth / 3.9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(200))),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Exercice",
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
                              builder: (context) => const Formationjou()));
                        },
                        child: Container(
                            child: Image.asset("assets/sysjeu.png"),
                            height: screenHeight / 7,
                            width: screenWidth / 3.4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(200)))),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Formation",
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
                    InkWell(
                        onTap: () {
                          /*Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SystemeJeuJou()));*/
                        },
                        child: Container(
                            child: Image.asset(
                                "assets/icons8-basketball-field-50.png"),
                            height: screenHeight / 7,
                            width: screenWidth / 3.4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(200)))),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Système de jeux",
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
                              builder: (context) => const favorisJou()));
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
        Padding(
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
                              builder: (context) => const profiljou()));
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
                      "profil",
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
                    InkWell(
                        onTap: () {
                          //       Navigator.of(context).push(
                          //  MaterialPageRoute(builder: (context)=> const panier1jou())
                          // );
                        },
                        child: Container(
                            child: Image.asset("assets/panier.png"),
                            height: screenHeight / 7,
                            width: screenWidth / 3.4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(200)))),
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
                )
              ]),
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
                              // Navigator.of(context).push(
                              //         MaterialPageRoute(builder: (context)=> const Home()));
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
                              // Navigator.of(context).push(
                              //         MaterialPageRoute(builder: (context)=> const Calendrier()));
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
                              // Navigator.of(context).push(
                              //         MaterialPageRoute(builder: (context)=> const ListMsg()));
                            },
                            icon: const Icon(
                              Icons.message_outlined,
                              size: 25,
                              color: Color.fromARGB(255, 14, 21, 110),
                            ))),
                  ),
                  label: ("Message"),
                  backgroundColor: const Color.fromARGB(255, 214, 228, 255)),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, right: 12),
                    child: Container(
                        height: 30,
                        width: 30,
                        child: IconButton(
                            onPressed: () {
// Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context)=> const Outil()));
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
