// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names

import 'package:app_parent/Outil/Media/detail.dart';
import 'package:app_parent/PartieJoueurs/Drawer/Outil/detail/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:app_parent/models/MediaModel.dart';

import 'package:flutter/material.dart';

import '../../Calendrier/Calendrier.dart';
import '../../HomeScreen/home/homescreen.dart';
import '../../models/Evenemenet.dart';
import '../Outil.dart';

class media extends StatefulWidget {
  const media({Key? key}) : super(key: key);

  @override
  State<media> createState() => _mediaState();
}

class _mediaState extends State<media> {
  List<MediaModel> futureData = [];
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
                          style: (const TextStyle(
                              fontSize: 9,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 156, 156, 156)))),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(midi.titre.toString(),
                            style: const TextStyle(
                                fontSize: 11,
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
      appBar: AppBar(
          title: const Text(
            'Actualité',
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
        const SizedBox(height: 35),
        const Center(
            child: Text("Suivre le club sur les reseaux sociaux",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Colors.black))),
        const SizedBox(height: 35),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () {},
                child: Container(
                  height: screenHeight / 11.6,
                  width: screenWidth / 7.5,
                  child: Image.asset("assets/twitterimage.png"),
                )),
            GestureDetector(
                onTap: () {},
                child: Container(
                  height: screenHeight / 11.6,
                  width: screenWidth / 7.5,
                  child: Image.asset("assets/facebook1.png"),
                )),
            GestureDetector(
                onTap: () {},
                child: Container(
                  height: screenHeight / 11.6,
                  width: screenWidth / 7.5,
                  child: Image.asset("assets/insta.png"),
                )),
            GestureDetector(
                onTap: () {},
                child: Container(
                  height: screenHeight / 11.6,
                  width: screenWidth / 7.5,
                  child: Image.asset("assets/youtube.png"),
                ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 1,
          width: screenWidth,
          color: const Color.fromARGB(255, 228, 225, 225),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset("assets/actualite.png"),
              const SizedBox(
                width: 10,
              ),
              const Text(" Actualité ",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700))
            ],
          ),
        ),
        /*Container(
            height: 100,
            child: ListView(
                padding: const EdgeInsets.all(30),
                shrinkWrap: true,
                primary: false,
                addSemanticIndexes: true,
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Tous",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 255, 255, 255))),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      fixedSize: const Size(120, 45),
                      primary: const Color.fromARGB(255, 212, 10, 10),
                    ),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Nutrition",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      fixedSize: const Size(120, 45),
                      primary: const Color.fromARGB(255, 247, 247, 247),
                    ),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Préparation Physique",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 0, 0, 0))),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      fixedSize: const Size(165, 45),
                      primary: const Color.fromARGB(255, 247, 247, 247),
                    ),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Championnat",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 0, 0, 0))),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      fixedSize: const Size(120, 45),
                      primary: const Color.fromARGB(255, 247, 247, 247),
                    ),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Photos",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 0, 0, 0))),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      fixedSize: const Size(120, 45),
                      primary: const Color.fromARGB(255, 247, 247, 247),
                    ),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("LIVE",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 0, 0, 0))),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      fixedSize: const Size(120, 45),
                      primary: const Color.fromARGB(255, 247, 247, 247),
                    ),
                  ),
                ])),*/
        Container(
            height: screenHeight,
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
                                  builder: (context) =>
                                      Calendrier(events: Evenement())));
                            },
                            icon: const Icon(
                              Icons.calendar_today,
                              size: 25,
                              color: Color.fromARGB(255, 14, 21, 110),
                            ))),
                  ),
                  label: ("Calendrier"),
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
                                  builder: (context) => const ListMsg()));
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
                                  builder: (context) => const Outil()));
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
