// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, override_on_non_overriding_member, non_constant_identifier_names
import 'package:app_parent/Login/SeConnecter.dart';
import 'package:app_parent/PartieJoueurs/Drawer/Outil/Galerie/galerie.dart';
import 'package:app_parent/PartieJoueurs/HomePageJoueur.dart';
import 'package:app_parent/PartieJoueurs/boutique/boutiquejou.dart';
import 'package:app_parent/PartieJoueurs/calender/calenderJoueur.dart';
import 'package:app_parent/models/MediaModel.dart';
import 'package:app_parent/models/comment.dart';
import 'package:flutter/material.dart';
import '../../../../models/Utilisateur.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../Outil.dart';

class detailJou extends StatefulWidget {
  MediaModel mediaModel;
  detailJou({Key? key, required this.mediaModel}) : super(key: key);

  @override
  State<detailJou> createState() => _detailJouState();
}

class _detailJouState extends State<detailJou> {
  List<Utilisateur> utilisateur = [];
  Future<List<Utilisateur>> FetchUtilisateur() async {
    List<Utilisateur> utilisateur = [];
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYWVlZCIsInJvbGVzIjpbIkFkbWluIl0sImV4cCI6MTY2NTM0MTU0Mn0.qop7sd9zT_EYA4BM6tJaNRKSMNmTbvEdpnjSLN8Fuyk',
      'Accept-Language': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = await http.get(
      Uri.parse('http://172.16.130.41:8080/projet/user'),
      headers: headers,
    );
    if (request.statusCode == 200) {
      Iterable l = json.decode(request.body);
      utilisateur =
          List<Utilisateur>.from(l.map((model) => Utilisateur.fromJson(model)));
      return utilisateur;
    } else {
      return utilisateur;
    }
  }

  comment comments = comment(
    label: '',
    likes: 0,
    dislikes: 0,
    commentdate: '',
  );

  TextEditingController commentaireController = TextEditingController();
  TextEditingController likeController = TextEditingController();
  TextEditingController dislikeController = TextEditingController();

  Future<void> Commentaire() async {
    var response = await http
        .post(
            Uri.parse(
              "http://172.16.130.41:8080/projet/comment",
            ),
            headers: {
              'Authorization':
                  'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYWVlZCIsInJvbGVzIjpbIkFkbWluIl0sImV4cCI6MTY2NTM0MTU0Mn0.qop7sd9zT_EYA4BM6tJaNRKSMNmTbvEdpnjSLN8Fuyk',
              'Accept-Language': 'application/json',
              'Content-Type': 'application/json',
            },
            body: json.encode({
              "label": commentaireController.text,
              "likes": 0,
              "dislikes": 0,
            }))
        .timeout(
          Duration(seconds: 5000),
        );
    print(response.body);
  }

  getComment() async {
    futureData1 = await FetchComment();
    setState(() {
      print(futureData1);
    });
  }

  List<comment> futureData1 = [];

  Future<List<comment>> FetchComment() async {
    List<comment> comm = [];

    var request = await http.get(
      Uri.parse(
        "http://172.16.130.41:8080/projet/comment",
      ),
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYWVlZCIsInJvbGVzIjpbIkFkbWluIl0sImV4cCI6MTY2NTM0MTU0Mn0.qop7sd9zT_EYA4BM6tJaNRKSMNmTbvEdpnjSLN8Fuyk',
        'Accept-Language': 'application/json',
        'Content-Type': 'application/json',
      },
    ).timeout(
      Duration(seconds: 5000),
    );
    print(request.statusCode);
    if (request.statusCode == 200) {
      Iterable l = json.decode(request.body);
      comm = List<comment>.from(l.map((model) => comment.fromJson(model)));
      return comm;
    } else {
      return comm;
    }
  }

// This widget is the root of your application.
  @override
  List<MediaModel> futureData = [];
  @override
  void initState() {
    super.initState();
    getMedia();
    getComment();
  }

  getMedia() async {
    futureData = await FetchActualite();
    setState(() {
      print(futureData);
    });
  }

  Future<List<MediaModel>> FetchActualite() async {
    List<MediaModel> midi = [];
    var request = await http.get(
      Uri.parse(
        "http://172.16.130.41:8080/projet/actualite",
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
      midi =
          List<MediaModel>.from(l.map((model) => MediaModel.fromJson(model)));
      return midi;
    } else {
      return midi;
    }
  }

  Widget Comments(comment commentaire1) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        height: screenHeight / 6,
        width: screenWidth / 1.1,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: 250.0),
              child: Text(
                commentaire1.commentdate.toString(),
                style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(children: [
                const SizedBox(width: 10),
                Text(SeConnecter.name.toString(),
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        wordSpacing: 3,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 0, 0, 0))),
              ]),
            ),
            const SizedBox(height: 10),
            Container(
              width: screenWidth / 1.2,
              height: screenHeight / 15,
              color: const Color.fromARGB(255, 226, 227, 244),
              child: Row(children: [
                Image.asset(
                  "assets/comm.png",
                  color: const Color.fromARGB(255, 18, 83, 136),
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(commentaire1.label.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 0, 0, 0))),
              ]),
            )
          ],
        ));
  }

  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    String image1 = widget.mediaModel.image.toString();
    String image2 = image1.substring(image1.indexOf(',') + 1, image1.length);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 247, 250),
      appBar: AppBar(
          title: const Text(
            'Detail Actualité',
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
          child: Image.memory(Base64Decoder().convert(image2)),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Image.asset("assets/comments.png"),
                const Text("18",
                    style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500))
              ],
            ),
            Row(
              children: [
                Image.asset("assets/dislike.png"),
                const Text("18",
                    style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500))
              ],
            ),
            Row(
              children: [
                Image.asset("assets/like.png"),
                const Text("18",
                    style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500))
              ],
            ),
            Image.asset("assets/share.png"),
            Image.asset("assets/test.png"),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 25, right: 10),
          child: Text(
            widget.mediaModel.contenu.toString(),
            style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 30, 32, 34),
                height: 1.75),
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: screenHeight / 10,
          width: screenWidth / 1.2,
          // alignment: Alignment.centerLeft,

          child: TextFormField(
              controller: commentaireController,
              textAlignVertical: TextAlignVertical.bottom,
              maxLines: 6,
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                fillColor: Color.fromARGB(255, 226, 227, 244),
                filled: true,
                hintText: "Commenter L'article",
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 14, 21, 110),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez saisir un texte';
                }
                return null;
              },
              onChanged: (val) {
                comments.label = val;
              }),
        ),
        SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 31.0),
          child: Container(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Commentaire();
                      (context as Element).reassemble();
                    });
                  },
                  child: Text("Envoyer"))),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: screenWidth / 1.1,
          child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
              scrollDirection: Axis.vertical,
              addSemanticIndexes: true,
              itemCount: futureData1.length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Comments(futureData1[index]);
              }),
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
