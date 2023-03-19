import 'dart:convert';
import 'package:app_parent/Coach/HomePageCoach/HOMEPAGECoach.dart';
import 'package:app_parent/HomeScreen/home/homescreen.dart';
import 'package:app_parent/PartieJoueurs/HomePageJoueur.dart';
import 'package:app_parent/WelcomePage.dart';

import 'package:app_parent/models/Utilisateur.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SeConnecter extends StatefulWidget {
  const SeConnecter({Key? key}) : super(key: key);
  static String name = "";
  static String nom = "";
  static String prenom = "";
  static String numTel = "";
  static String email = "";
  static int idUtil = 0;
  @override
  State<SeConnecter> createState() => _SeConnecterState();
}

class _SeConnecterState extends State<SeConnecter> {
  List<Utilisateur> futureData = [];
  void initState() {
    super.initState();
    getRole();
  }

  getRole() async {
    futureData = await FetchRole();
    setState(() {
      print(futureData);
    });
  }

  List<Utilisateur> user = [];
  Future<List<Utilisateur>> FetchRole() async {
    List<Utilisateur> utilisateur = [];
    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYWVlZCIsInJvbGVzIjpbIkFkbWluIl0sImV4cCI6MTY2NTM0MTU0Mn0.qop7sd9zT_EYA4BM6tJaNRKSMNmTbvEdpnjSLN8Fuyk',
      'Accept-Language': 'application/json',
      'Content-Type': 'application/json'
    };

    var request = await http.get(
      Uri.parse('http://172.16.130.41:8080/projet/user/allusers'),
      headers: headers,
    );

    if (request.statusCode == 200) {
      Iterable l = json.decode(request.body);
      utilisateur =
          List<Utilisateur>.from(l.map((model) => Utilisateur.fromJson(model)));
      user = utilisateur;
      return utilisateur;
    } else {
      return utilisateur;
    }
  }

// This widget is the root of your application.
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rolesController = TextEditingController();
  Future<void> login() async {
    print(passwordController.text);
    var response = await http
        .post(
          Uri.parse(
            "http://172.16.130.41:8080/projet/login",
          ),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            "username": usernameController.text,
            "password": passwordController.text,
          }),
        )
        .timeout(
          const Duration(seconds: 5000),
        );

    if (response.statusCode == 200) {
      user.forEach((element) {
        if (element.roles!.isNotEmpty) {
          print(element.roles?[0].role);

          if (element.username == usernameController.text) {
            SeConnecter.name = element.username!;
            SeConnecter.nom = element.nomUtil!;
            SeConnecter.prenom = element.prenomUtil!;
            SeConnecter.email = element.emailUtil!;
            SeConnecter.numTel = element.numTelUtil!;
            SeConnecter.idUtil = element.idUtil!;
            if (element.roles?[0].role.toString().toUpperCase() == "COACH") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CoachHome(),
                ),
              );
            } else if (element.roles?[0].role.toString().toUpperCase() ==
                "JOUEUR") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeJoueur(),
                ),
              );
            } else if (element.roles?[0].role.toString().toUpperCase() ==
                "PARENT") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            }
          }
        }
      });
    } else {
      setState(() {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(
                    "Veuillez saisir correctement le USERNAME et le MOT DE PASSE"),
                actions: [
                  ElevatedButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      });
    }
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 14, 21, 110),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WelcomePage()));
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
                size: 25,
              ),
            ),
            titleSpacing: 0.0,
            elevation: 0,
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 14, 21, 110)),
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(height: 200),
          Container(
            height: 500,
            width: 370,
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                children: [
                  TextFormField(
                      controller: usernameController,
                      //maxLength: 25,
                      decoration: const InputDecoration(
                        fillColor: Color.fromARGB(255, 226, 227, 244),
                        filled: true,
                        hintText: 'Username*',
                        hintStyle: TextStyle(
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
                      onChanged: (val) {
                        //  user.username = val;
                      }),
                  const SizedBox(height: 17),
                  TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        fillColor: Color.fromARGB(255, 226, 227, 244),
                        filled: true,
                        hintText: 'Mot De Passe*',
                        hintStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 14, 21, 110)),
                      ),
                      validator: (value) {
                        if (value!.length < 4) {
                          return 'Veuillez saisir un texte';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        //  user.password = val;
                      }),
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
                      const Text(
                        "Se Souvenir de moi",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    actions: [
                                      Center(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: const Size(40, 40),
                                              primary: const Color.fromARGB(
                                                  255, 14, 21, 110),
                                            ),
                                            onPressed: () =>
                                                Navigator.of(context).pop(
                                                    false), //  We can return any object from here
                                            child: const Text('OK')),
                                      ),
                                    ],
                                    content: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      //position
                                      mainAxisSize: MainAxisSize.min,
                                      // wrap content in flutter
                                      children: const <Widget>[
                                        Text(
                                            "En activant cette option, votre identifiant est mémorisé sur cet appareil et vous n'aurez plus qu'à saisir votre Mot de passe lors de vos prochaines connexions",
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromARGB(
                                                    255, 14, 21, 110),
                                                height: 1.8),
                                            textAlign: TextAlign.center),
                                      ],
                                    ));
                              });
                        },
                        icon: const Icon(Icons.info_outline),
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            login();
                          });
                        },
                        child: const Text(
                          "Se Connecter ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.red),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(153, 46),
                          primary: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Mot de passe oublié ?",
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )),
                      const SizedBox(height: 50),
                      Row(
                        children: const [
                          Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            "Vos informations sont traitées par xxxx et transmises \n\n au Brand B app afin de gérer votre demande.Pour plus \n\n d'information, vous pouvez également consulter notre ",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                height: 0.7),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text(
                          "Politique générale de protection des données.",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                              decoration: TextDecoration.underline))
                    ],
                  )
                ],
              ),
            ),
          ),
        ])));
  }
}
