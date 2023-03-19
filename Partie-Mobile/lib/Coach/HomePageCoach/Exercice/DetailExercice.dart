// ignore_for_file: non_constant_identifier_names

import 'package:app_parent/Coach/HomePageCoach/Exercice/Echauffement.dart';
import 'package:app_parent/PartieJoueurs/Exercice/ExerciceJoueurs.dart';
import 'package:app_parent/models/exercice.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailExerciceCo extends StatefulWidget {
  // ignore: non_constant_identifier_names
  Exercice Exercicee;
  DetailExerciceCo({Key? key, required this.Exercicee}) : super(key: key);

  @override
  State<DetailExerciceCo> createState() => _DetailExerciceCoState();
}

// ignore: camel_case_types
class _DetailExerciceCoState extends State<DetailExerciceCo> {
  List<Exercice> futureData = [];
  @override
  void initState() {
    getExercice();
    super.initState();
  }

  getExercice() async {
    futureData = await FetchExercice();
    setState(() {
      print(futureData);
    });
  }

  Future<List<Exercice>> FetchExercice() async {
    List<Exercice> Systeme = [];

    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYWVlZCIsInJvbGVzIjpbIkFkbWluIl0sImV4cCI6MTY2NTM0MTU0Mn0.qop7sd9zT_EYA4BM6tJaNRKSMNmTbvEdpnjSLN8Fuyk',
      'Accept-Language': 'application/json',
      'Content-Type': 'application/json'
    };

    var request = await http.get(
        Uri.parse("http://172.16.130.41:8080/projet/exercice"),
        headers: headers);

    if (request.statusCode == 200) {
      Iterable l = json.decode(request.body);
      Systeme = List<Exercice>.from(l.map((model) => Exercice.fromJson(model)));
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ListExercice()));
                },
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  size: 25,
                )),
            title: const Text(
              ' Exercices',
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
                child: Image.memory(const Base64Decoder()
                    .convert(widget.Exercicee.image.toString())),
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
                    'Exercices Prép',
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
            child: Text(widget.Exercicee.description.toString(),
                style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0))),
          ),
        ])));
  }
}
