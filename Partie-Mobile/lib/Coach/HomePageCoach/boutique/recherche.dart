import 'package:app_parent/Boutique/boutique.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class TestPageco extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}
class _TestPageState extends State<TestPageco> {
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
          color: Color.fromARGB(255, 14, 21, 110),
                ),

           Padding(
             padding: const EdgeInsets.all(16.0),
             child:
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: Container(
                    height: screenHeight/23,
                   // width: screenWidth*2,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)
                    ),
                    child: 
                    Padding(
                      padding: const EdgeInsets.only(left:0.0,bottom: 0,top:0),
                      
                      child: TextField(
                        
                        decoration:new InputDecoration(
                          hintText: 'Recherche dans boutique',
                          hintStyle: TextStyle(),
                          suffixIcon: IconButton(icon:Icon(Icons.close),color: Color.fromARGB(255, 126, 126, 126),onPressed: (){},alignment: Alignment.topLeft,),
                          prefixIcon: IconButton(icon:Icon(Icons.arrow_back),color: Color.fromARGB(255, 14, 21,110),onPressed: (){
                             Navigator.of(context).push(
                             MaterialPageRoute(builder: (context)=> boutique()));
                  
                          }),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,),
                        style: TextStyle(fontFamily: 'Poppins',fontSize:12,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 14, 21, 110), ),
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

            
            /*if (filteredList.length == 0 && _textController.text.isEmpty)
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
                  MaterialPageRoute(builder: (context)=> choix()))
                  },
                           child: Text(initialList[index],style: TextStyle(fontFamily:'Poppins',fontSize: 12,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 30, 32, 34)),),
                            )  );
                        }),
                  ))
            else if (filteredList.length==0 && _textController.text.isNotEmpty)
              Expanded(
                child: Container(
                  child: Text('Aucune donnée'),
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
                  MaterialPageRoute(builder: (context)=> choix()))
                  },
                           
                          child: Text(filteredList[index],style: TextStyle(fontFamily:'Poppins',fontSize: 12,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 30, 32, 34)),),
                        ));
                      }),
                ),
              ),*/
          ],
        ));
  }
}