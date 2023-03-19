// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, prefer_final_fields


import 'package:app_parent/PartieJoueurs/boutique/boutiquejou.dart';
import 'package:app_parent/PartieJoueurs/boutique/filtre/ChoixRecherche.dart';
import 'package:flutter/material.dart';

class TestPagejou extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}
class _TestPageState extends State<TestPagejou> {
  TextEditingController _textController = TextEditingController();
    List<String> initialList = ["Chaussure", "Pull", "Rat", "Cheval", "Ours"];
  // ignore: deprecated_member_use
  List<String> filteredList = [];
  @override
  Widget build(BuildContext context) {
    
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
        
        body: Column(
          children: <Widget>[ 
            Stack(children: [
                Container(
          height: screenHeight/10.4,
          width: screenWidth,
          color: const Color.fromARGB(255, 14, 21, 110),
                ),

           Padding(
             padding: const EdgeInsets.all(16.0),
             child:
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: Container(
                    height: screenHeight/23,
                   
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)
                    ),
                    child: 
                    Padding(
                      padding: const EdgeInsets.only(left:0.0,bottom: 0,top:0),
                      
                      child: TextField(
                        
                        decoration:InputDecoration(
                          hintText: 'Recherche dans boutique',
                          hintStyle: const TextStyle(),
                          suffixIcon: IconButton(icon:const Icon(Icons.close),color: const Color.fromARGB(255, 126, 126, 126),onPressed: (){},alignment: Alignment.topLeft,),
                          prefixIcon: IconButton(icon:const Icon(Icons.arrow_back),color: const Color.fromARGB(255, 14, 21,110),onPressed: (){
                             Navigator.of(context).push(
                             MaterialPageRoute(builder: (context)=> const boutiquejou()));
                  
                          }),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,),
                        style: const TextStyle(fontFamily: 'Poppins',fontSize:12,fontWeight: FontWeight.w400,color: const Color.fromARGB(255, 14, 21, 110), ),
                        controller: _textController,
                        onChanged: (text) {
                          text = text.toLowerCase();
                          setState(() {
                            filteredList = initialList
                                .where((element) => element.toLowerCase().contains(text))
                                .toList();
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
           ),
            ],),

            
            if (filteredList.isEmpty && _textController.text.isEmpty)
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:12.0),
                    child: ListView.builder(
                        itemCount: initialList.length,
                        itemBuilder: (BuildContext context, index) {
                          return 
                          Container(
                            height: 50,
                            child: InkWell(onTap: ()=>{
                     Navigator.of(context).push(
                 MaterialPageRoute(builder: (context)=> choixjou()))
                  },
                           child: Text(initialList[index],style: const TextStyle(fontFamily:'Poppins',fontSize: 12,fontWeight: FontWeight.w400,color: const Color.fromARGB(255, 30, 32, 34)),),
                            )  );
                        }),
                  ))
            else if (filteredList.isEmpty && _textController.text.isNotEmpty)
              Expanded(
                child: Container(
                  child: const Text('Aucune donnée'),
                ),
              )
            else
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left:12.0),
                  child: ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          height: 50, child: InkWell(onTap: ()=>{
                     Navigator.of(context).push(
                   MaterialPageRoute(builder: (context)=> choixjou()))
                  },
                           
                          child: Text(filteredList[index],style: const TextStyle(fontFamily:'Poppins',fontSize: 12,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 30, 32, 34)),),
                        ));
                      }),
                ),
              ),
          ],
        ));
  }
}