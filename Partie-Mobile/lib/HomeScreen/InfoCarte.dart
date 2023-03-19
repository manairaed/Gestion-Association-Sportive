import 'package:app_parent/HomeScreen/ModePay.dart';
import 'package:flutter/material.dart';

import '../Calendrier/Calendrier.dart';
import '../Outil/Outil.dart';
import '../models/Evenemenet.dart';
import 'home/homescreen.dart';

class InfoCarte extends StatefulWidget {
  const InfoCarte({Key? key}) : super(key: key);

  @override
  State<InfoCarte> createState() => _InfoCarteState();
}

bool isChecked = false;

class _InfoCarteState extends State<InfoCarte> {
  @override
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Color.fromARGB(255, 11, 21, 110);
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
                    MaterialPageRoute(builder: (context) => const Modepai()));
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
                size: 25,
              )),
          title: const Text(
            'Information Carte ',
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
          SizedBox(
            height: 25,
          ),
          Center(
            child: Container(
              width: screenWidth / 1.1,
              child: TextFormField(
                //maxLength: 25,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.credit_card,
                    color: Color.fromARGB(255, 0, 73, 133),
                  ),
                  fillColor: Color.fromARGB(255, 226, 227, 244),
                  filled: true,
                  labelText: 'Numéro du carte*',
                  hintText: 'Saisissez votre numéro ',
                  hintStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 180, 180, 180)),
                  labelStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 14, 21, 110)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir un texte';
                  }
                  return null;
                },
              ),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Center(
            child: Container(
              width: screenWidth / 1.1,
              child: TextFormField(
                //maxLength: 25,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.calendar_today,
                    color: Color.fromARGB(255, 0, 73, 133),
                  ),
                  fillColor: Color.fromARGB(255, 226, 227, 244),
                  filled: true,
                  labelText: "Date d'expiration*",
                  hintStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 180, 180, 180)),
                  labelStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 14, 21, 110)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir un texte';
                  }
                  return null;
                },
              ),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Center(
            child: Container(
              width: screenWidth / 1.1,
              child: TextFormField(
                //maxLength: 25,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.person_outline,
                    color: Color.fromARGB(255, 0, 73, 133),
                  ),
                  fillColor: Color.fromARGB(255, 226, 227, 244),
                  filled: true,
                  labelText: "Titulaire de la carte*",
                  hintStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 180, 180, 180)),
                  labelStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 14, 21, 110)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir un texte';
                  }
                  return null;
                },
              ),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Center(
            child: Container(
              width: screenWidth / 1.1,
              child: TextFormField(
                //maxLength: 25,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.lock_outlined,
                    color: Color.fromARGB(255, 0, 73, 133),
                  ),
                  fillColor: Color.fromARGB(255, 226, 227, 244),
                  filled: true,
                  labelText: "Numéro de CCV2*",
                  hintStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 180, 180, 180)),
                  labelStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 14, 21, 110)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir un texte';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 38.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.info_outline_rounded,
                        color: Color.fromARGB(255, 14, 62, 101),
                      )),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Un cryptogramme visuel de sécurité est une série unique de trois ou quatre chiffres, imprimée au dos sur la plupart des cartes Bancaire, juste après le numéro de votre carte, dans l'espace réservé à la signature.",
                    style: TextStyle(
                        color: Color.fromARGB(255, 14, 21, 110),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        height: 1.6),
                  ),
                ))
              ],
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Container(
            height: screenHeight / 3.8,
            width: screenWidth / 1.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Column(children: [
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Text(
                      "En cochant cette case vous autorisez 'AppFFBB'  à envoyer des instructions à votre banque pour débiter votre compte du montant de votre commande .",
                      style: TextStyle(
                          color: Color.fromARGB(255, 14, 21, 110),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          height: 2),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                "Transaction sécurisée par ",
                style: TextStyle(
                    color: Color.fromARGB(255, 14, 21, 110),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
              SizedBox(height: 12),
              Image.asset("assets/pay.png")
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70.0, top: 20),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Modepai()));
                  },
                  child: const Text(
                    "Annuler",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 213, 43, 30),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(124, 46),
                    primary: Color.fromARGB(255, 255, 255, 255),
                    side: BorderSide(
                      width: 2.0,
                      color: Color.fromARGB(255, 213, 43, 30),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      //   Navigator.of(context).push(
                      // MaterialPageRoute(builder: (context)=> const InfoCarte()));
                    },
                    child: const Text(
                      "Valider",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(124, 46),
                      primary: Color.fromARGB(255, 14, 21, 110),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
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
