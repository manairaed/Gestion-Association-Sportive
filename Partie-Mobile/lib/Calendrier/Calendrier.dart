// ignore_for_file: sized_box_for_whitespace

import 'package:app_parent/Calendrier/InfoEven.dart';
import 'package:app_parent/Calendrier/calender.dart';

import 'package:app_parent/Outil/Outil.dart';
import 'package:app_parent/models/Evenemenet.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:async';
import '../HomeScreen/home/homescreen.dart';

class Calendrier extends StatefulWidget {
  Evenement events;
  Calendrier({Key? key, required this.events}) : super(key: key);

  @override
  State<Calendrier> createState() => _CalendrierState();
}

class _CalendrierState extends State<Calendrier> {
// This widget is the root of your application.
  List<Evenement> futureData = [];
  @override
  void initState() {
    super.initState();

    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted =
        formatter.format(DateTime.parse(widget.events.date.toString()));
    print(formatted);

    getevent(formatted);
  }

  getevent(date) async {
    futureData = await FetchEvenement(date);
    setState(() {
      print(futureData);
    });
  }

  Future<List<Evenement>> FetchEvenement(date) async {
    List<Evenement> even = [];

    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYWVlZCIsInJvbGVzIjpbIkFkbWluIl0sImV4cCI6MTY2NTM0MTU0Mn0.qop7sd9zT_EYA4BM6tJaNRKSMNmTbvEdpnjSLN8Fuyk',
      'Accept-Language': 'application/json',
    };
    var request = await http.get(
        Uri.parse('http://172.16.130.41:8080/projet/evenement/alljour/$date'),
        headers: headers);

    if (request.statusCode == 200) {
      Iterable l = json.decode(request.body);

      even = List<Evenement>.from(l.map((model) => Evenement.fromJson(model)));

      return even;
    } else {
      return even;
    }
  }

  Widget event(Evenement event) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(children: [
      Container(
        height: screenHeight / 23.6,
        width: screenWidth / 1.10,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            color: Colors.white),
        child: Center(
            child: Text(
          event.titre.toString(),
          style: TextStyle(
              color: Color.fromARGB(255, 14, 21, 110),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 13),
          textAlign: TextAlign.center,
        )),
      ),
      const SizedBox(height: 2),
      GestureDetector(
          onTap: () {
            //
          },
          child: Stack(children: [
            Container(
                height: screenHeight / 5.7,
                width: screenWidth / 1.10,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Container(
                                height: 79,
                                width: 80,
                                child: Image.memory(
                                    const Base64Decoder()
                                        .convert(event.equipe.toString()),
                                    alignment: Alignment.centerLeft)),
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("VS",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18)),
                                Text(widget.events.date.toString(),
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 119, 131, 143),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(event.debut.toString(),
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 119, 131, 143),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(event.fin.toString(),
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 119, 131, 143),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600)),
                                    ]),
                              ]),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Container(
                                height: 79,
                                width: 80,
                                child: Image.memory(const Base64Decoder()
                                    .convert(event.equipeadvers.toString()))),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Container(
                      height: 35,
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                          //crossAxisAlignment:  CrossAxisAlignment. ,
                          children: [
                            ElevatedButton(
                              child: const Text('',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const InfoEven()));
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0)),
                                primary: const Color.fromARGB(255, 14, 21, 110),
                                fixedSize: const Size(186, 35),
                              ),
                            ),
                            ElevatedButton(
                              child: const Text('',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(188, 35),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0)),
                                primary:
                                    const Color.fromARGB(255, 119, 129, 248),
                              ),
                            )
                          ]),
                    ),
                  )
                ])),
          ]))
    ]);
  }

  Widget even(Evenement even) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Row(children: [
        Container(
            child: Image.asset("assets/ballon.png"),
            margin: const EdgeInsets.all(12),
            height: screenHeight / 16.8,
            width: screenWidth / 7.04,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: const Color.fromARGB(255, 236, 238, 255))),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              even.entainement.toString(),
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500),
            ),
            Text(
              even.debutEntainement.toString() +
                  ' - ' +
                  even.finEntainement.toString(),
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 153, 153, 160)),
            ),
          ],
        )
      ]),
      height: screenHeight / 8.39,
      width: screenWidth / 1.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 14, 21, 110),

        //actions: <Widget>[

        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Calendar()));
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            size: 25,
          ),
        ),
        title: const Text(
          'Calendrier',
          style: const TextStyle(
              fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: (() {}),
                  icon: const Icon(
                    Icons.navigate_before_outlined,
                    color: Colors.white,
                  ),
                ),
                Center(
                    child: Text(
                  widget.events.date.toString(),
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                )),
                IconButton(
                    onPressed: (() {}),
                    icon: const Icon(
                      Icons.navigate_next_outlined,
                      color: Colors.white,
                    )),
              ],
            ),
            height: screenHeight / 14.55,
            width: screenWidth,
            color: const Color.fromARGB(255, 213, 43, 30),
          ),
          const SizedBox(height: 23),
          Container(
            child: Row(children: [
              Container(
                  child: Image.asset("assets/clock.png"),
                  margin: const EdgeInsets.all(12),
                  height: screenHeight / 16.8,
                  width: screenWidth / 7.04,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: const Color.fromARGB(255, 236, 238, 255))),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.events.date.toString(),
                    style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ]),
            height: screenHeight / 10.86,
            width: screenWidth / 1.1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 23),
          ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
              scrollDirection: Axis.vertical,
              addSemanticIndexes: true,
              key: GlobalKey(),
              itemCount: futureData.length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const InfoEven()));
                    },
                    child: Center(child: even(futureData[index])));
              }),
          const SizedBox(height: 23),
          const SizedBox(height: 23),
          ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                    height: 17,
                  ),
              primary: false,
              shrinkWrap: true,
              itemCount: futureData.length,
              addSemanticIndexes: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return event(futureData[index]);
              }),
          SizedBox(
            height: 10,
          )
        ]),
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
