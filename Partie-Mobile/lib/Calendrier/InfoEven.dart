// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:app_parent/Calendrier/Calendrier.dart';
import 'package:app_parent/Calendrier/calender.dart';
import 'package:app_parent/HomeScreen/home/homescreen.dart';
import 'package:app_parent/Outil/Outil.dart';
import 'package:app_parent/models/Evenemenet.dart';
import 'package:flutter/material.dart';

class InfoEven extends StatefulWidget {
  const InfoEven({Key? key}) : super(key: key);

  @override
  State<InfoEven> createState() => _InfoEvenState();
}

class _InfoEvenState extends State<InfoEven> {
// This widget is the root of your application.

  bool info = true;
  bool stats = false;
  bool team1 = false;
  bool team2 = false;
  bool convo = false;
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
            )),
        title: const Text(
          'Info évenement',
          style: TextStyle(
              fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
            height: screenHeight / 14.55,
            width: screenWidth,
            color: const Color.fromARGB(255, 213, 43, 30),
            child: const Center(
                child: Text(
              "Opens Plus Access U17 +18",
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ))),
        const SizedBox(height: 13),
        Container(
            height: screenHeight / 8.2,
            width: screenWidth / 1.10,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                color: Colors.white),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                const SizedBox(
                  width: 22,
                ),
                Image.asset("assets/team0.png",
                    alignment: Alignment.centerLeft),
                const SizedBox(
                  width: 7,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Mar 14 Déc 17:00 pm",
                          style: TextStyle(
                              color: Color.fromARGB(255, 119, 131, 143),
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                      Text("VS",
                          style: TextStyle(
                              color: Color.fromARGB(255, 213, 43, 30),
                              fontSize: 15,
                              fontWeight: FontWeight.w800))
                    ]),
                const SizedBox(
                  width: 7,
                ),
                Image.asset("assets/team1.png"),
              ]),
            ])),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
            height: (screenHeight - (screenHeight / 14.55 + screenHeight / 3)),
            width: screenWidth,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22))),
            child: Column(children: [
              Container(
                height: 60,
                child: ListView(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    shrinkWrap: true,
                    primary: false,
                    addSemanticIndexes: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            info = true;
                            stats = false;
                            team1 = false;
                            team2 = false;
                            convo = false;
                          });
                        },
                        child: Text("Info Match",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: info
                                    ? const Color.fromARGB(255, 255, 255, 255)
                                    : const Color.fromARGB(255, 0, 0, 0))),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(111, 34),
                          primary: info
                              ? const Color.fromARGB(255, 213, 43, 30)
                              : const Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            info = false;
                            stats = true;
                            team1 = false;
                            team2 = false;
                            convo = false;
                          });
                        },
                        child: Text(
                          "Stats",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: stats
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : const Color.fromARGB(255, 0, 0, 0)),
                        ),
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black,
                          fixedSize: const Size(111, 34),
                          primary: stats
                              ? const Color.fromARGB(255, 213, 43, 30)
                              : const Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            info = false;
                            stats = false;
                            team1 = true;
                            team2 = false;
                            convo = false;
                          });
                        },
                        child: Text(
                          "Levallais",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: team1
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : const Color.fromARGB(255, 0, 0, 0)),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(120, 45),
                          primary: team1
                              ? const Color.fromARGB(255, 213, 43, 30)
                              : const Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            info = false;
                            stats = false;
                            team1 = false;
                            team2 = true;
                            convo = false;
                          });
                        },
                        child: Text(
                          "LDLC",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: team2
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : const Color.fromARGB(255, 0, 0, 0)),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(120, 45),
                          primary: team2
                              ? const Color.fromARGB(255, 213, 43, 30)
                              : const Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            info = false;
                            stats = false;
                            team1 = false;
                            team2 = false;
                            convo = true;
                          });
                        },
                        child: Text(
                          "Convocation",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: convo
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : const Color.fromARGB(255, 0, 0, 0)),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(120, 45),
                          primary: convo
                              ? const Color.fromARGB(255, 213, 43, 30)
                              : const Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ]),
              ),
              //Infoev()

              Visibility(visible: info, child: Center(child: Infoev())),
              Visibility(visible: stats, child: stat()),
              Visibility(visible: team1, child: stat()),
              Visibility(visible: team2, child: stat()),
              Visibility(visible: convo, child: stat())
            ]))
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
                                  builder: (context) => Calendrier(
                                        events: Evenement(),
                                      )));
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

  Widget Infoev() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(children: [
      const SizedBox(
        height: 22,
      ),
      Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text(
                        "Categorie",
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ),
                    SizedBox(width: 26),
                    Text(
                      "Open Mars",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 14, 21, 110)),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text(
                        "Phase",
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ),
                    SizedBox(width: 46),
                    Text(
                      "Journée 3",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 14, 21, 110)),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text(
                        "Date",
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ),
                    SizedBox(width: 54),
                    Text(
                      "Lun 16 Déc 18:00 pm",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 14, 21, 110)),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text(
                        "Stade",
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ),
                    SizedBox(width: 47),
                    Text(
                      "Le Chaudron",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 14, 21, 110)),
                    )
                  ],
                ),
              ]),
          height: screenHeight / 5,
          width: screenWidth / 1.1,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 213, 227, 254),
            borderRadius: BorderRadius.circular(10),
          )),
      const SizedBox(
        height: 24,
      ),
      const Center(
          child: Text("Leaders des deux équipes",
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0)))),
      const SizedBox(
        height: 20,
      ),
      const Center(
          child: Text(
        "Points",
        style: TextStyle(
            fontSize: 10,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 119, 131, 143)),
      )),
      const SizedBox(
        height: 5,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Center(
          child: Row(children: [
            const Text(
              "---",
              style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 107, 107, 107)),
            ),
            const SizedBox(
              width: 7,
            ),
            Container(
              height: 10,
              width: 10,
              color: const Color.fromARGB(255, 193, 193, 193),
            ),
            const SizedBox(
              width: 1,
            ),
            Container(
              height: 10,
              width: 10,
              color: const Color.fromARGB(255, 193, 193, 193),
            ),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
              height: 10,
              width: 10,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 7,
            ),
            const Text(
              "---",
              style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 107, 107, 107)),
            ),
          ]),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      const Center(
          child: Text(
        "Rebonds",
        style: TextStyle(
            fontSize: 10,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 119, 131, 143)),
      )),
      const SizedBox(
        height: 5,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Center(
          child: Row(children: [
            const Text(
              "---",
              style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 107, 107, 107)),
            ),
            const SizedBox(
              width: 7,
            ),
            Container(
              height: 10,
              width: 10,
              color: const Color.fromARGB(255, 193, 193, 193),
            ),
            const SizedBox(
              width: 1,
            ),
            Container(
              height: 10,
              width: 10,
              color: const Color.fromARGB(255, 193, 193, 193),
            ),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
              height: 10,
              width: 10,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 7,
            ),
            const Text(
              "--",
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 107, 107, 107)),
            ),
          ]),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Center(
          child: const Text(
        "Passes Décissives",
        style: TextStyle(
            fontSize: 10,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 119, 131, 143)),
      )),
      const SizedBox(
        height: 5,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Center(
          child: Row(children: [
            const Text(
              "---",
              style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 107, 107, 107)),
            ),
            const SizedBox(
              width: 7,
            ),
            Container(
              height: 10,
              width: 10,
              color: const Color.fromARGB(255, 193, 193, 193),
            ),
            const SizedBox(
              width: 1,
            ),
            Container(
              height: 10,
              width: 10,
              color: const Color.fromARGB(255, 193, 193, 193),
            ),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
              height: 10,
              width: 10,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 1,
            ),
            Container(
                height: 10,
                width: 10,
                color: const Color.fromARGB(255, 193, 193, 193)),
            const SizedBox(
              width: 7,
            ),
            const Text(
              "----",
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 107, 107, 107)),
            ),
          ]),
        ),
      ),
    ]);
  }

  Widget stat() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(
          height: 90,
        ),
        Image.asset(
          "assets/Basket.png",
          height: screenHeight / 9,
          width: screenWidth / 4.9,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Pas d'informations disponibles jusqu'à la date du Match",
          style: TextStyle(
              fontSize: 13,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 213, 43, 30)),
        )
      ],
    );
  }
}
