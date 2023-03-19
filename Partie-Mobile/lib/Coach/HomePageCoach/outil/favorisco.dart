// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:app_parent/Coach/HomePageCoach/HOMEPAGECoach.dart';
import 'package:app_parent/Coach/HomePageCoach/outil/outilco.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class panierco extends StatefulWidget {
  const panierco({Key? key}) : super(key: key);

  @override
  State<panierco> createState() => _panierState();
}

class _panierState extends State<panierco> {
  Widget Articlee() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight / 2.9,
      width: screenWidth / 2.53,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Image.asset("assets/chaussur.png"),
            ),
            Column(
              children: [
                const Align(
                  alignment: Alignment.topRight,
                  child: LikeButton(
                    size: 20,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share, color: Colors.red),
                    alignment: Alignment.topLeft,
                  ),
                ),
              ],
            ),
          ],
        ),
        //SizedBox(height:15 ),
        const Padding(padding: EdgeInsets.all(10)),
        const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            "Nike Air Zoom Pegasus 38 - Homme - Gris",
            style: TextStyle(
              fontSize: 11,
              color: Color.fromARGB(255, 105, 105, 105),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 75),
          child: Text(
            "ID 12345678/",
            style: TextStyle(
                fontSize: 10,
                color: Color.fromARGB(255, 119, 131, 143),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: const [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 14,
                ),
                Icon(Icons.star, color: Colors.yellow, size: 14),
                Icon(Icons.star, color: Colors.yellow, size: 14),
                Icon(Icons.star, color: Colors.yellow, size: 14),
                Icon(Icons.star, color: Colors.yellow, size: 14),
              ],
            )),
        const SizedBox(
          height: 7,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 80),
          child: Text("120.00D",
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 14, 21, 110),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500)),
        ),
        // SizedBox(height: 10,),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.shop, size: 9),
          label: const Text(
            "Ajouter au panier",
            style: TextStyle(
                fontSize: 9,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          ),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(127, 29),
            primary: const Color.fromARGB(255, 213, 43, 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 247, 250),
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Outilco()));
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
                size: 25,
              )),
          automaticallyImplyLeading: false,
          title: const Text(
            'Mes favoris',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          ),
          titleSpacing: 0.0,
          elevation: 0,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 14, 21, 110)),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 190,
                childAspectRatio: 1.8 / 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: 6,
            itemBuilder: (BuildContext ctx, index) {
              return Articlee();
            }),
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
