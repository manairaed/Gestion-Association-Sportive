// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, camel_case_types, annotate_overrides

import 'dart:convert';

import 'package:app_parent/Login/SeConnecter.dart';
import 'package:app_parent/PartieJoueurs/Drawer/Outil/Galerie/galerie.dart';
import 'package:app_parent/PartieJoueurs/Drawer/Outil/Outil.dart';
import 'package:app_parent/PartieJoueurs/HomePageJoueur.dart';
import 'package:app_parent/PartieJoueurs/boutique/boutiquejou.dart';

import 'package:app_parent/PartieJoueurs/calender/calenderJoueur.dart';
import 'package:app_parent/PartieJoueurs/message/message1.dart';

import 'package:app_parent/models/Utilisateur.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class profiljou extends StatefulWidget {
  const profiljou({Key? key}) : super(key: key);

  @override
  State<profiljou> createState() => _profilState();
}

class _profilState extends State<profiljou> {
  Utilisateur user = Utilisateur(
    nomUtil: SeConnecter.nom,
    prenomUtil: SeConnecter.prenom,
    numTelUtil: SeConnecter.numTel,
    emailUtil: SeConnecter.email,
  );
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController numTelController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> utilisateeur() async {
    var response = await http
        .put(
            Uri.parse(
              "http://172.16.130.41:8080/projet/user/edit",
            ),
            headers: {
              'Authorization':
                  'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYWVlZCIsInJvbGVzIjpbIkFkbWluIl0sImV4cCI6MTY2NTM0MTU0Mn0.qop7sd9zT_EYA4BM6tJaNRKSMNmTbvEdpnjSLN8Fuyk',
              'Accept-Language': 'application/json',
              'Content-Type': 'application/json',
            },
            body: json.encode({
              "idUtil": SeConnecter.idUtil,
              "username": SeConnecter.name,
              "nomUtil": nomController.text,
              "prenomUtil": prenomController.text,
              "numTelUtil": numTelController.text,
              "emailUtil": emailController.text,
              "image": '',
              "enable": true,
            }))
        .timeout(
          Duration(seconds: 5000),
        );
    print(response.body);
  }

  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 247, 250),
      appBar: AppBar(
          title: const Text(
            'Profil',
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
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: SeConnecter.nom.toString()),
                    controller: nomController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        user.nomUtil = SeConnecter.nom;
                      }
                    },
                    onChanged: (val) {
                      user.nomUtil = val;
                    })),
            Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: SeConnecter.prenom.toString()),
                    controller: prenomController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        user.prenomUtil = SeConnecter.prenom;
                      }
                    },
                    onChanged: (val) {
                      user.prenomUtil = val;
                    })),
            Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: SeConnecter.email.toString()),
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        user.emailUtil = SeConnecter.email;
                      }
                    },
                    onChanged: (val) {
                      user.emailUtil = val;
                    })),
            Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: SeConnecter.numTel.toString()),
                    controller: numTelController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        user.numTelUtil = SeConnecter.numTel;
                      }
                    },
                    onChanged: (val) {
                      user.numTelUtil = val;
                    })),
            /*Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  controller: passwordController,
                  
                )),*/
            SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 31.0),
              child: Container(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                      onPressed: () {
                        utilisateeur();
                      },
                      child: Text("Modifier"))),
            ),
          ],
        ),
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
