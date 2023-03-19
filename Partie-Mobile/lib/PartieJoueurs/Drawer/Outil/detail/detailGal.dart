// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, override_on_non_overriding_member, non_constant_identifier_names
import 'package:app_parent/Calendrier/calender.dart';
import 'package:app_parent/PartieJoueurs/HomePageJoueur.dart';
import 'package:app_parent/PartieJoueurs/calender/calenderJoueur.dart';
import 'package:app_parent/models/GalerieModel.dart';
import 'package:app_parent/models/comment.dart';
import 'package:flutter/material.dart';
import '../../../../models/GalerieModel.dart';
import '../../../../models/Utilisateur.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../Outil.dart';

class detailGal extends StatefulWidget {
  GalerieModel galerieModel;
  detailGal({Key? key, required this.galerieModel}) : super(key: key);

  @override
  State<detailGal> createState() => _detailGalState();
}

class _detailGalState extends State<detailGal> {
  List<GalerieModel> galerie = [];
  Future<List<GalerieModel>> FetchGalerie() async {
    List<GalerieModel> galerie = [];
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYWVlZCIsInJvbGVzIjpbIkFkbWluIl0sImV4cCI6MTY2NTM0MTU0Mn0.qop7sd9zT_EYA4BM6tJaNRKSMNmTbvEdpnjSLN8Fuyk',
      'Accept-Language': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = await http.get(
      Uri.parse('http://172.16.130.41:8080/projet/galerie'),
      headers: headers,
    );
    if (request.statusCode == 200) {
      Iterable l = json.decode(request.body);
      galerie = List<GalerieModel>.from(
          l.map((model) => GalerieModel.fromJson(model)));
      return galerie;
    } else {
      return galerie;
    }
  }

// This widget is the root of your application.
  @override
  List<GalerieModel> futureData = [];
  @override
  void initState() {
    super.initState();
    getgalerie();
  }

  getgalerie() async {
    futureData = await FetchGalerie();
    setState(() {
      print(futureData);
    });
  }

  Future<List<GalerieModel>> FetchActualite() async {
    List<GalerieModel> midi = [];
    var request = await http.get(
      Uri.parse(
        "http://172.16.130.41:8080/projet/Galerie",
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    ).timeout(
      Duration(seconds: 5000),
    );
    print(request.statusCode);
    if (request.statusCode == 200) {
      Iterable l = json.decode(request.body);
      midi = List<GalerieModel>.from(
          l.map((model) => GalerieModel.fromJson(model)));
      return midi;
    } else {
      return midi;
    }
  }

  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 247, 250),
      appBar: AppBar(
          title: const Text(
            'Album',
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
          height: 200,
          width: screenWidth,
          child: Image.memory(
              Base64Decoder().convert(widget.galerieModel.image1.toString())),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 200,
          width: screenWidth,
          child: Image.memory(
              Base64Decoder().convert(widget.galerieModel.image2.toString())),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 200,
          width: screenWidth,
          child: Image.memory(
              Base64Decoder().convert(widget.galerieModel.image3.toString())),
        ),
        const SizedBox(height: 10),
        Container(
          height: 200,
          width: screenWidth,
          child: Image.memory(
              Base64Decoder().convert(widget.galerieModel.image4.toString())),
        ),
        SizedBox(
          height: 7,
        ),
        const SizedBox(
          height: 10,
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
                                  builder: (context) => const OutilJou()));
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
