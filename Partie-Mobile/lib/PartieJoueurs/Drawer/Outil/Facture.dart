
import 'package:flutter/material.dart';


import 'Outil.dart';
class FactureJou extends StatefulWidget {
  const FactureJou({Key? key}) : super(key: key);

  @override
  State<FactureJou> createState() => _FactureState();
}

class _FactureState extends State<FactureJou> {
  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
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
      return const Color.fromARGB(255, 14, 21, 110);
    }
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 244, 247, 250),
    appBar: AppBar(
      automaticallyImplyLeading: false,
        leading :IconButton(onPressed: (){
           Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> OutilJou()));
        },
icon:const Icon(Icons.arrow_back_outlined,size: 25,)),  
    title: const Text(' Demande Facture ',style: TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
    titleSpacing: 0.0,
     elevation: 0,
    centerTitle: true,
    backgroundColor:const Color.fromARGB(255, 14, 21, 110) ),
    body:SingleChildScrollView(

        child: Column( 
          children: [
            Padding(
              padding: const EdgeInsets.only(top:60.0),
              child: Center(child: Text("Vous souhaitez envoyer  une demande de ",style: TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500, color: Color.fromARGB(255, 14, 21, 110)),)),
            ),
            SizedBox(height: 40,),
             Row(
                  
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(left :25.0),
                      child: Container(
                        child: Row(children: [
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
                  const Text("Facture de licence",style: TextStyle(fontSize: 14,fontFamily: 'Poppins' , fontWeight: FontWeight.w700,color: Color.fromARGB(255, 14, 21, 110)),),
                        ]),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft:  Radius.circular(10),
                          ),
                          color: Colors.white,
                        ),
                        height: screenHeight/14.7,
                        width: screenWidth/1.4,
                        
                      ),
                    ),



                    
                    Container(
                       child: IconButton(onPressed: () {},
                        icon: const Icon(Icons.info_outline,color: Colors.white,size: 30,),
                       ),
                       height: screenHeight/14.7,
                      width: screenWidth/5.7,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 14, 21, 110),
                        borderRadius:  BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                      ),
                      
                    ),
                  ]
                  ),
                  SizedBox(height: 20,),
                   Row(
                  
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(left :25.0),
                      child: Container(
                        child: Row(children: [
                          Checkbox(
                   checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked1,
                  onChanged: (bool? value) {
                  setState(() {
                  isChecked1 = value!;
                  });
                    },
                  ),
                  const Text("Certificat de sur classement",style: TextStyle(fontSize: 14,fontFamily: 'Poppins' , fontWeight: FontWeight.w700,color: Color.fromARGB(255, 14, 21, 110)),),
                        ]),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft:  Radius.circular(10),
                          ),
                          color: Colors.white,
                        ),
                        height: screenHeight/14.7,
                        width: screenWidth/1.4,
                        
                      ),
                    ),



                    
                    Container(
                       child: IconButton(onPressed: () {},
                        icon: const Icon(Icons.info_outline,color: Colors.white,size: 30,),
                       ),
                       height: screenHeight/14.7,
                      width: screenWidth/5.7,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 14, 21, 110),
                        borderRadius:  BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                      ),
                      
                    ),
                  ]
                  ),
                   SizedBox(height: 20,),
                   Row(
                  
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(left :25.0),
                      child: Container(
                        child: Row(children: [
                          Checkbox(
                   checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked2,
                  onChanged: (bool? value) {
                  setState(() {
                  isChecked2 = value!;
                  });
                    },
                  ),
                  const Text("Attestation",style: TextStyle(fontSize: 14,fontFamily: 'Poppins' , fontWeight: FontWeight.w700,color: Color.fromARGB(255, 14, 21, 110)),),
                        ]),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft:  Radius.circular(10),
                          ),
                          color: Colors.white,
                        ),
                        height: screenHeight/14.7,
                        width: screenWidth/1.4,
                        
                      ),
                    ),



                    
                    Container(
                       child: IconButton(onPressed: () {},
                        icon: const Icon(Icons.info_outline,color: Colors.white,size: 30,),
                       ),
                       height: screenHeight/14.7,
                      width: screenWidth/5.7,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 14, 21, 110),
                        borderRadius:  BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                      ),
                      
                    ),
                  ]
                  ),
                  SizedBox(height: 40,),
                  ElevatedButton(onPressed:() {
                   //Navigator.of(context).push(
                  //MaterialPageRoute(builder: (context)=> const Succes()));
                 },
                            child: 
                               const Text("Envoyer",style:TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 255, 255, 255), ) ,),
                              style:
                              
                              ElevatedButton.styleFrom(
                                
                              fixedSize: const Size(124, 46),
                              primary: Color.fromARGB(255, 213, 43, 30),
                              side: BorderSide(width: 2.0, color: Color.fromARGB(255, 213, 43, 30),),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),
                              
                               )  ,
                              ),
                      ),
          ],
        )
    ),
    bottomNavigationBar: Container(
            
            child: BottomNavigationBar(
     
      
      unselectedItemColor: const Color.fromARGB(255, 14, 21, 110),
      
      selectedLabelStyle: const TextStyle(color:  Color.fromARGB(255, 14, 21, 110),decorationColor: Color.fromARGB(255, 14, 21, 110),fontFamily: 'Poppins',fontSize: 11,fontWeight: FontWeight.w500),
      unselectedLabelStyle: const TextStyle(color:  Color.fromARGB(255, 14, 21, 110),decorationColor: Color.fromARGB(255, 14, 21, 110),fontFamily: 'Poppins',fontSize: 11,fontWeight: FontWeight.w500),
      backgroundColor: const Color.fromARGB(255, 14, 21, 110),
      fixedColor: const Color.fromARGB(255, 14, 21, 110),
      showUnselectedLabels:true,  
      items:  <BottomNavigationBarItem> [
        
    
    BottomNavigationBarItem(icon:Padding(
      padding: const EdgeInsets.only(bottom:8.0,right:12,),
      child: Container(
        height: 30,
        width: 30,
        child: IconButton(onPressed: (){
          // Navigator.of(context).push(
          //         MaterialPageRoute(builder: (context)=> const Home()));
                  
  },
  icon:const Icon(Icons.home_outlined, size: 25,color: Color.fromARGB(255, 14, 21, 110),))),
    ),label:("Acceuil"),backgroundColor: const Color.fromARGB(255, 214, 228, 255) ),
     BottomNavigationBarItem(icon:Padding(
      padding: const EdgeInsets.only(bottom:8.0,right:12),
      child: Container(
        height: 30,
        width: 30,
        child: IconButton(onPressed: (){
          // Navigator.of(context).push(
          //         MaterialPageRoute(builder: (context)=> const Calendrier()));
                  
        },
        icon:const Icon(Icons.calendar_today, size: 25,color: Color.fromARGB(255, 14, 21, 110),))),
    ),label:("Calendrier"),backgroundColor: const Color.fromARGB(255, 214, 228, 255) ),
  BottomNavigationBarItem(icon:Padding(
      padding: const EdgeInsets.only(bottom:8.0,right:12),
      child: Container(
        height: 30,
        width: 30,
        child: IconButton(onPressed: (){
          // Navigator.of(context).push(
          //         MaterialPageRoute(builder: (context)=> const ListMsg()));
                  },
        icon:const Icon(Icons.message_outlined, size: 25,color: Color.fromARGB(255, 14, 21, 110),))),
    ),label:("Message"),backgroundColor: const Color.fromARGB(255, 214, 228, 255) ),
  BottomNavigationBarItem(icon:Padding(
      padding: const EdgeInsets.only(bottom:8.0,right:12),
      child: Container(
        height: 30,
        width: 30,
        child: IconButton(onPressed: (){
                //  Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context)=> const Outil()));
                  
        },
        icon:const Icon(Icons.shopping_bag_outlined, size: 25,color: Color.fromARGB(255, 14, 21, 110),))),
    ),label:("Mes Outils"),backgroundColor: const Color.fromARGB(255, 214, 228, 255) ),    ]
    ),
          ),
    );
  }
}