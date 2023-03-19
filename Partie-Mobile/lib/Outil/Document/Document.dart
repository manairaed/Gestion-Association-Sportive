// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:app_parent/Outil/Document/Filepage.dart';
import 'package:app_parent/models/Document.dart';
import 'package:app_parent/models/Evenemenet.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dart:async';

import '../../Calendrier/Calendrier.dart';
import '../../HomeScreen/home/homescreen.dart';
import '../Outil.dart';

//import 'package:syncfusion_flutter_pdf/pdf.dart';

class document extends StatefulWidget {
  const document({Key? key}) : super(key: key);

  @override
  State<document> createState() => _documentState();
}

class _documentState extends State<document> {
  Document doc = Document(contenu: " ", titre: " ");
  TextEditingController contenuController = TextEditingController();
  TextEditingController titreController = TextEditingController();
  Future<void> Documentt() async {
    var response = await http
        .post(
          Uri.parse(
            "http://172.16.130.41:8080/projet/document",
          ),
          headers: {
            'Authorization':
                'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJyYWVlZCIsInJvbGVzIjpbIkFkbWluIl0sImV4cCI6MTY2NTM0MTU0Mn0.qop7sd9zT_EYA4BM6tJaNRKSMNmTbvEdpnjSLN8Fuyk',
            'Accept-Language': 'application/json',
          },
          body: json.encode({
            "contenu": contenuController.selection,
            "titre": titreController.selection
          }),
        )
        .timeout(
          Duration(seconds: 5000),
        );
    print(response.body);
  }

  String fileType = 'All';
  var fileTypeList = ['All', 'Image', 'Video', 'Audio', 'MultipleFile'];
  FilePickerResult? result;
  PlatformFile? file;
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 247, 250),
      appBar: AppBar(
          title: const Text(
            'Mes Documents',
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
          child: Column(children: <Widget>[
        const SizedBox(
          height: 25,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: InkWell(
              onTap: () {
                if (file != null) fileDetails(file!);
                if (file != null)
                  ElevatedButton(
                    onPressed: () {
                      viewFile(file!);
                    },
                    child: Text('View Selected File'),
                  );
                pickFiles(fileType);
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () async {
                            validator:
                            (value) {
                              if (value!.isEmpty) {
                                return 'Veuillez saisir un texte';
                              }
                              return null;
                            };
                            onChanged:
                            (val) {
                              doc.contenu = val;
                            };
                            if (file != null) fileDetails(file!);
                            if (file != null)
                              ElevatedButton(
                                onPressed: () {
                                  viewFile(file!);
                                },
                                child: Text('View Selected File'),
                              );
                            pickFiles(fileType);
                          },
                          icon: const Icon(Icons.add, color: Colors.red)),
                      const Text(
                        "Transmettre 'Certificat médical' ",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 213, 43, 30)),
                      )
                    ],
                  ),
                ),
                height: screenHeight / 11,
                width: screenWidth / 1.10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
              ),
            )),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        if (file != null) fileDetails(file!);
                        if (file != null)
                          ElevatedButton(
                            onPressed: () {
                              viewFile(file!);
                            },
                            child: Text('View Selected File'),
                          );
                        pickFiles(fileType);
                      },
                      icon: const Icon(Icons.add, color: Colors.red)),
                  const Text(
                    "Transmettre 'Pièce d'identité'",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 213, 43, 30)),
                  )
                ],
              ),
            ),
            height: screenHeight / 11,
            width: screenWidth / 1.10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        if (file != null) fileDetails(file!);
                        if (file != null)
                          ElevatedButton(
                            onPressed: () {
                              viewFile(file!);
                            },
                            child: Text('View Selected File'),
                          );
                        pickFiles(fileType);
                      },
                      icon: const Icon(Icons.add, color: Colors.red)),
                  const Text(
                    "Transmettre '  Pass Sanitaire ' ",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 213, 43, 30)),
                  )
                ],
              ),
            ),
            height: screenHeight / 11,
            width: screenWidth / 1.10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        if (file != null) fileDetails(file!);
                        if (file != null)
                          ElevatedButton(
                            onPressed: () {
                              viewFile(file!);
                            },
                            child: Text('View Selected File'),
                          );
                        pickFiles(fileType);
                      },
                      icon: const Icon(Icons.add, color: Colors.red)),
                  const Text(
                    "Transmettre '  Aute Doc ' ",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 213, 43, 30)),
                  )
                ],
              ),
            ),
            height: screenHeight / 11,
            width: screenWidth / 1.10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Container(
            child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Planning entrainement U13/14 \n -1er trimestre 2022",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 213, 43, 30)),
                      textAlign: TextAlign.start,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: IconButton(
                          icon: const Icon(
                            Icons.download,
                          ),
                          onPressed: () {},
                          color: Colors.red,
                        )),
                  ],
                )),
            height: screenHeight / 15.3,
            width: screenWidth / 1.10,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 241, 226, 224)),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Container(
            child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Planning entrainement U13/14 \n -2éme trimestre 2022",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 213, 43, 30)),
                      textAlign: TextAlign.start,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: IconButton(
                          icon: const Icon(
                            Icons.download,
                          ),
                          onPressed: () {},
                          color: Colors.red,
                        )),
                  ],
                )
                //Text("Transmettre '  Aute Doc ' ",style: TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: Color.fromARGB(255, 213, 43, 30)),)

                ),
            height: screenHeight / 15.3,
            width: screenWidth / 1.10,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 241, 226, 224)),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Container(
            child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Planning entrainement U13/14 \n -3eme trimestre 2022",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 213, 43, 30)),
                      textAlign: TextAlign.start,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: IconButton(
                          icon: const Icon(
                            Icons.download,
                          ),
                          onPressed: () {},
                          color: Colors.red,
                        )),
                  ],
                )
                //Text("Transmettre '  Aute Doc ' ",style: TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: Color.fromARGB(255, 213, 43, 30)),)

                ),
            height: screenHeight / 15.3,
            width: screenWidth / 1.10,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 241, 226, 224)),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              Documentt();
            },
            child: Text("Envoyer"))
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

  Widget fileDetails(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('File Name: ${file.name}'),
          Text('File Size: $size'),
          Text('File Extension: ${file.extension}'),
          Text('File Path: ${file.path}'),
        ],
      ),
    );
  }

  void pickFiles(String? filetype) async {
    switch (filetype) {
      case 'Image':
        result = await FilePicker.platform.pickFiles(type: FileType.image);
        if (result == null) return;
        file = result!.files.first;
        setState(() {});
        break;
      case 'Video':
        result = await FilePicker.platform.pickFiles(type: FileType.video);
        if (result == null) return;
        file = result!.files.first;
        setState(() {});
        break;
      case 'Audio':
        result = await FilePicker.platform.pickFiles(type: FileType.audio);
        if (result == null) return;
        file = result!.files.first;
        setState(() {});
        break;
      case 'All':
        result = await FilePicker.platform.pickFiles();
        if (result == null) return;
        file = result!.files.first;
        setState(() {});
        break;
      case 'MultipleFile':
        result = await FilePicker.platform.pickFiles(allowMultiple: true);
        if (result == null) return;
        loadSelectedFiles(result!.files);
        break;
    }
  }

  // multiple file selected
  // navigate user to 2nd screen to show selected files
  void loadSelectedFiles(List<PlatformFile> files) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FileList(files: files, onOpenedFile: viewFile)));
  }

  // open the picked file
  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}
