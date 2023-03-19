// ignore_for_file: sized_box_for_whitespace
import 'package:app_parent/Boutique/DetailProduit.dart';
import 'package:app_parent/Boutique/panier/InfoLivraison.dart';
import 'package:app_parent/Boutique/recherche.dart';
import 'package:app_parent/models/produit.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class panier1 extends StatefulWidget {
  Produit prod;
  panier1({Key? key, required this.prod}) : super(key: key);

  @override
  State<panier1> createState() => _panierState();
}

class _panierState extends State<panier1> {
  List<Produit> futureData = [];
  @override
  void initState() {
    getProduit();
    super.initState();
  }

  getProduit() async {
    futureData = await FetchProduit();
    setState(() {
      print(futureData);
    });
  }

  Future<List<Produit>> FetchProduit() async {
    List<Produit> produiit = [];

    var headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYWVlZCIsInJvbGVzIjpbIkFkbWluIl0sImV4cCI6MTY2NTM0MTU0Mn0.qop7sd9zT_EYA4BM6tJaNRKSMNmTbvEdpnjSLN8Fuyk',
      'Accept-Language': 'application/json',
      'Content-Type': 'application/json'
    };

    var request = await http.get(
        Uri.parse("http://172.16.130.41:8080/projet/produit"),
        headers: headers);

    if (request.statusCode == 200) {
      Iterable l = json.decode(request.body);
      produiit = List<Produit>.from(l.map((model) => Produit.fromJson(model)));
      return produiit;
    } else {
      return produiit;
    }
  }

  int _counter = 0;
  Widget Article(Produit prod) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: 500,
      height: screenHeight / 4.7,
      child: ListView(
          shrinkWrap: true,
          primary: false,
          addSemanticIndexes: true,
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              height: screenHeight / 4.7,
              width: screenWidth / 1.10,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            height: 100,
                            width: 100,
                            child: Image.memory(const Base64Decoder()
                                .convert(widget.prod.image.toString())))),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 17),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 90),
                          child: Text(
                            widget.prod.nomProduit.toString(),
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 30, 32, 34)),
                          ),
                        ),
                        const SizedBox(
                          height: 13,
                          width: 5,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 14,
                              ),
                              Icon(Icons.star, color: Colors.yellow, size: 14),
                              Icon(Icons.star, color: Colors.yellow, size: 14),
                            ],
                          ),
                        ),
                        const SizedBox(height: 7),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text(
                            widget.prod.prix.toString() + "Dinars",
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 14, 21, 110)),
                          ),
                        ),
                      ],
                    )),
                  ]),
                  Container(
                    height: 1,
                    width: screenWidth / 1.10,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 214, 214, 214),
                    ),
                  ),
                  Container(
                    height: screenWidth / 10,
                    width: screenWidth / 1.10,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Container(
                                    height: 32,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 14, 21, 110),
                                        borderRadius:
                                            BorderRadius.circular(7))),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(left: 9.5),
                                  child: LikeButton(
                                    size: 25,
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share_outlined,
                              color: Colors.red,
                            )),
                        Padding(
                            padding: const EdgeInsets.only(left: 120.0),
                            child: InkWell(
                              key: GlobalKey(),
                              onTap: () {
                                setState(() {
                                  _counter--;
                                });
                              },
                              child: Container(
                                  child: Image.asset("assets/Icon.png"),
                                  height: screenHeight / 31.23,
                                  width: screenWidth / 14.42,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 213, 43, 30),
                                      borderRadius: BorderRadius.circular(8))),
                            )),
                        Container(
                          height: screenHeight / 31.23,
                          width: screenWidth / 6.7,
                          child: Center(child: Text('$_counter')),
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: InkWell(
                            key: GlobalKey(),
                            onTap: () {
                              setState(() {
                                _counter++;
                              });
                            },
                            child: Container(
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                height: screenHeight / 31.23,
                                width: screenWidth / 14.42,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 213, 43, 30),
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
              width: 70,
              color: const Color.fromARGB(255, 244, 247, 250),
              child: Center(child: Image.asset("assets/poubelle.png")),
            )
          ]),
    );
  }

  Widget build(BuildContext context) {
    int _counter = 0;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 247, 250),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              'Panier',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500),
            ),
            titleSpacing: 0.0,
            elevation: 00.5,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DetailProduit(produit: widget.prod)));
                },
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  size: 25,
                )),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 14, 21, 110),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TestPage()));
                },
              ),
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 38),
              const Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: Center(
                    child: Text(
                  "1 Article",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1),
                )),
              ),
              const SizedBox(height: 26),
              // ignore: sized_box_for_whitespace
              Container(
                height: screenHeight / 5.38,
                width: screenWidth / 1.10,
                child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 17,
                        ),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 1,
                    addSemanticIndexes: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Article(Produit());
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: screenHeight / 2.5,
                width: screenWidth,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(22),
                      topLeft: Radius.circular(22),
                    )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 47),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              "Subtotal ",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 147, 146, 150)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 17.0),
                            child: Text(
                              widget.prod.prix.toString() + "Dinars",
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 14, 21, 110)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      const Divider(
                          height: 20, color: Color.fromARGB(255, 65, 68, 65)),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              "Tax ",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 147, 146, 150)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 17.0),
                            child: Text(
                              "1%",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 14, 21, 110)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      const Divider(
                          height: 20, color: Color.fromARGB(255, 65, 68, 65)),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              "Total ",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 147, 146, 150)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 17.0),
                            child: Text(
                              "303.0Dinars",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 14, 21, 110)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Image.asset("assets/phone.png"),
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                  width: 2.0,
                                  color: Color.fromARGB(255, 213, 43, 30),
                                ),
                                fixedSize: const Size(68, 46),
                                primary:
                                    const Color.fromARGB(255, 255, 255, 255),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const InfoLIv()));
                            },
                            icon: const Icon(Icons.payment,
                                size: 14,
                                color: Color.fromARGB(255, 255, 255, 255)),
                            label: const Text(
                              "Passer au payement",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                width: 2.0,
                                color: Color.fromARGB(255, 213, 43, 30),
                              ),
                              fixedSize: const Size(224, 50),
                              primary: const Color.fromARGB(255, 213, 43, 30),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
              )
            ],
          ),
        ));
  }
}
