import 'package:app_parent/HomeScreen/ModePay.dart';
import 'package:app_parent/PartieJoueurs/HomePageJoueur.dart';
import 'package:app_parent/PartieJoueurs/boutique/panier/Profil/panier/ModePayjou.dart';
import 'package:flutter/material.dart';


class PayementJou extends StatefulWidget {
  const PayementJou({Key? key}) : super(key: key);

  @override
  State<PayementJou> createState() => _PayementState();
}

class _PayementState extends State<PayementJou> {
   @override
   bool isChecked = false;
   bool isChecked1 = false;
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
      return Color.fromARGB(255, 120, 129, 248);
    }
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(

    backgroundColor: const Color.fromARGB(255, 244, 247, 250),
    appBar: AppBar(
       
    title: const Text('Licence & Payement ',style: TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
    titleSpacing: 0.0,
     elevation: 0,
    centerTitle: true,
    backgroundColor:const Color.fromARGB(255, 14, 21, 110),
     automaticallyImplyLeading: false,
        leading :IconButton(onPressed: (){
           Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const HomeJoueur()));
        },
icon:const Icon(Icons.arrow_back_outlined,size: 25,)),  
     ),
    body:SingleChildScrollView(

        child: Column( 
          children: [
            const SizedBox(height:22),
            Container(
              height: screenHeight/3.11,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 22,),
                const Center(child: Text("Licence Actuelle",style:  TextStyle(fontSize: 14 , fontFamily: 'Poppins',fontWeight: FontWeight.w500, color: Colors.black) )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left:17.0, top:30),
                      child: Text("TOTAL PAYE PAR ANS : ", style: TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w400, color: Color.fromARGB(255, 147, 146, 150)) ),
                    ),
                    Padding(
                       padding: EdgeInsets.only(right:17.0, top:30),
                      child: Text("215.000£", style: TextStyle(fontSize: 15 , fontFamily: 'Poppins',fontWeight: FontWeight.w500, color: Color.fromARGB(255, 14, 21, 110))),
                    ),
                  ],
                ),
                const SizedBox(height: 23,),
                Center(
                  child: Container(
                    height: 1,
                    width: screenWidth/1.10,
                    color: const Color.fromARGB(255, 230, 230, 230),
                  ),
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left:17.0, top:10),
                      child: Text("DATE DE RENOUVELLEMENT ", style: TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w400, color: Color.fromARGB(255, 147, 146, 150)) ),
                    ),
                    Padding(
                       padding: const EdgeInsets.only(right:17.0, top:22),
                      child: Column(
                        children: const [
                          Text("01.21-2022", style: TextStyle(fontSize: 15 , fontFamily: 'Poppins',fontWeight: FontWeight.w500, color: Color.fromARGB(255, 14, 21, 110))),
                          Text("Dans 212 jours" , style: TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w300, color: Color.fromARGB(255, 14, 21, 110)))
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 9,),
                 Center(
                  child: Container(
                    height: 1,
                    width: screenWidth/1.10,
                    color: const Color.fromARGB(255, 230, 230, 230),
                  ),
                ),
                Padding(
                       padding: const EdgeInsets.only(right:17.0, top:22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                      padding: EdgeInsets.only(left:17.0, top:10),
                      child: Text("DATE DE RENOUVELLEMENT ", style: TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w400, color: Color.fromARGB(255, 147, 146, 150)) ),
                    ),
                    Padding(
                       padding: EdgeInsets.only(right:5.0, top:10),
                      child: Text("01.21-2022", style: TextStyle(fontSize: 15 , fontFamily: 'Poppins',fontWeight: FontWeight.w500, color: Color.fromARGB(255, 14, 21, 110))),
                    ),
                    ]
                      ),
                    ), 
              ]),
            ),
            const SizedBox(height: 20,),
            Container(
              height: screenHeight/3.4,
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
              ),
              child: Column(children: [
                const SizedBox(height: 20,),
                const Text("Carte de Crédit",style: TextStyle(fontSize: 14 , fontFamily: 'Poppins',fontWeight: FontWeight.w500, color: Colors.black)),
                const SizedBox(height: 10,),
                Image.asset("assets/visa.png"),
                const SizedBox(height: 5,),
                const Text("**************512",style:  TextStyle(fontSize: 12 , fontFamily: 'Poppins',fontWeight: FontWeight.w200, color: Colors.black)),
                 const SizedBox(height: 30,),
                 ElevatedButton(onPressed:() {
                   Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const ModepaiJou()
                  ));
                 },
                        child: 
                           const Text("Mise a jour mode de paiement",style: TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight:FontWeight.w500 ) ,),
                          style:
                          
                          ElevatedButton.styleFrom(
                            
                          fixedSize: const Size(284, 46),
                          primary: const Color.fromARGB(255, 213, 43, 30),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                           )  ,
                          ),
                    ),
              ]),
            ),
            const SizedBox(height: 20,),
            Container(
              height: screenHeight/2.6,
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    const Center(child: Padding(
                      padding: EdgeInsets.only(top:20.0),
                      child: Text("Information de facturation",style:TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Colors.black ) ,),
                    )),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left:49.0, top:25),
                          child: Text("Titulaire de la carte :",style:TextStyle(fontSize: 10,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 14, 21, 110) )),
                        ),
                        Padding(
                           padding: EdgeInsets.only(left:49.0, top:25),
                          child: Text("Emna testttesst ",style:TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight:FontWeight.w400, color: Color.fromARGB(255, 0, 0, 3) )),
                        )
                      ],
                    ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left:49.0, top:21),
                            child: Text("Adresse :",style:TextStyle(fontSize: 10,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 14, 21, 110) )),
                          ),
                          Padding(
                           padding: EdgeInsets.only(left:49.0, top:21),
                          child: Text("Nabeul  ",style:TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight:FontWeight.w400, color: Color.fromARGB(255, 0, 0, 3) )),
                        )
                        ],
                      ),
                       Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left:49.0, top:21),
                            child: Text("Complément d'adresse :",style:TextStyle(fontSize: 10,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 14, 21, 110) )),
                          ),
                          Padding(
                           padding: EdgeInsets.only(left:49.0, top:21),
                          child: Text("Nabeul  ",style:TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight:FontWeight.w400, color: Color.fromARGB(255, 0, 0, 3) )),
                        )
                        ],
                      ),
                       Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left:49.0, top:21),
                            child: Text("Code Postal :",style:TextStyle(fontSize: 10,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 14, 21, 110) )),
                          ),
                          Padding(
                           padding: EdgeInsets.only(left:49.0, top:21),
                          child: Text("8011  ",style:TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight:FontWeight.w400, color: Color.fromARGB(255, 0, 0, 3) )),
                        )
                        ],
                      ),
                       Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left:49.0, top:21),
                            child: Text("Ville :",style:TextStyle(fontSize: 10,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 14, 21, 110) )),
                          ),
                          Padding(
                           padding: EdgeInsets.only(left:49.0, top:21),
                          child: Text("Nabeul  ",style:TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight:FontWeight.w400, color: Color.fromARGB(255, 0, 0, 3) )),
                        )
                        ],
                      ),
                      const SizedBox(height: 20,),
                      /*Center(
                        child: ElevatedButton(onPressed:() {
                           Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const mesinfo()));
                        },
                          child: 
                             const Text("Mise a jour informations",style:TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight:FontWeight.w500 ) ,),
                            style:
                            
                            ElevatedButton.styleFrom(
                              
                            fixedSize: const Size(220, 46),
                            primary: const Color.fromARGB(255, 213, 43, 30),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),
                             )  ,
                            ),
                    ),
                      ),*/
              ]
              )
            ),
            const SizedBox(height: 21,),
          Container(
              height: screenHeight/3.1,
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Center(child: Padding(
                      padding: EdgeInsets.only(top:20.0),
                      child: Text("Demande Facture Fiscal",style:TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Colors.black ) ,),
                    )), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:15.0),
                          child: Checkbox(
                       
                       checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked,
                      onChanged: (bool? value) {
                      setState(() {
                      isChecked = value!;
                      });
                          },
                      ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top :15.0),
                        child: Text("Facture 4588",style:TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight:FontWeight.w400, color: Color.fromARGB(255, 147, 146, 150) ) ,),
                      )
                      ],
                      
                    ),
                    Padding(
                       padding: const EdgeInsets.only(top:15.0, right:30),
                      child: Column(
                        children: [
                          Text("215.00£",style:TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 14, 21, 110)) ),
                          Text("01-06-2021" ,style:TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight:FontWeight.w400, color: Color.fromARGB(255, 14, 21, 110)))
                        ],
                      ),
                    )
                  ],
                  
                ),
                Center(
                  child: Container(
                    height: 1,
                    width: screenWidth/1.1,
                    color: Color.fromARGB(255, 209, 209, 209),
                  ),
                ),
                SizedBox(height: 20,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:1.0, left:0),
                          child: Checkbox(
                       
                       checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked1,
                      onChanged: (bool? value) {
                      setState(() {
                      isChecked1 = value!;
                      });
                          },
                      ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top :1.0, left: 1),
                        child: Text("Facture 4588",style:TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight:FontWeight.w400, color: Color.fromARGB(255, 147, 146, 150) ) ,),
                      )
                      ],
                      
                    ),
                    Padding(
                       padding: const EdgeInsets.only(top:15.0, right:30),
                      child: Column(
                        children: [
                          Text("215.00£",style:TextStyle(fontSize: 15,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 14, 21, 110)) ),
                          Text("01-06-2021" ,style:TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight:FontWeight.w400, color: Color.fromARGB(255, 14, 21, 110)))
                        ],
                      ),
                    )
                  ],
                  
                ),
                   Center(
                  child: Container(
                    height: 1,
                    width: screenWidth/1.1,
                    color: Color.fromARGB(255, 209, 209, 209),
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                        child: ElevatedButton(onPressed:() {},
                          child: 
                             const Text("Envoyer",style:TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight:FontWeight.w500 ) ,),
                            style:
                            
                            ElevatedButton.styleFrom(
                              
                            fixedSize: const Size(124, 46),
                            primary: const Color.fromARGB(255, 213, 43, 30),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),
                             )  ,
                            ),
                    ),
                      ),
                ]

              ),
              
          ),
          SizedBox(height: 30,),

          ],
        ),
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
// Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context)=> const Outil()));
                  
        },
        icon:const Icon(Icons.shopping_bag_outlined, size: 25,color: Color.fromARGB(255, 14, 21, 110),))),
    ),label:("Mes Outils"),backgroundColor: const Color.fromARGB(255, 214, 228, 255) ),    ]
    ),
          ),
    );
}
}
