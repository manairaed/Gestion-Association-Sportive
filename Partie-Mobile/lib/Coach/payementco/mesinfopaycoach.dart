import 'package:flutter/material.dart';
class mesinfoCo extends StatefulWidget {
  const mesinfoCo({Key? key}) : super(key: key);

  @override
  State<mesinfoCo> createState() => _mesinfoState();
}

class _mesinfoState extends State<mesinfoCo> {

  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(

    backgroundColor: const Color.fromARGB(255, 244, 247, 250),
     appBar: AppBar(
    title: const Text('Mes informations',style: TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
    titleSpacing: 0.0,
    elevation: 0,
    centerTitle: true,
    backgroundColor:const Color.fromARGB(255, 14, 21, 110) ),
    body:SingleChildScrollView( 
    child: Column(children: [
     Container(
             height: screenHeight/4.7,
             width: screenWidth,
             color: const Color.fromARGB(255, 14, 21, 110),
             child: Column(
               
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 const SizedBox(height: 10,),
               Padding(
                 padding: const EdgeInsets.all(5.0),
                 child: Image.asset("assets/pic.png",height: 61,width: 61,),
               ),
               const Text("Michelangelo Flores",style: TextStyle(fontSize: 13,fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: Colors.white),),
               const Text("michelangeloflores@gmail.com",style: TextStyle(fontSize: 11,fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: Colors.white)),
               const Text("Un Coach",style:  TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight: FontWeight.w700,color: Color.fromARGB(255, 190, 195, 254)))
               

             ]),
           ),
           SizedBox(height: 25,),
            Container(
            width: screenWidth/1.2,
            height: 45,
            child: TextFormField(
                       
                        //maxLength: 25,
                        decoration: const InputDecoration(
                          suffixIcon: 
                           Icon(Icons.person,color: Color.fromARGB(255, 0, 73, 133),),
                        fillColor:  Color.fromARGB(255, 226, 227, 244), 
                        filled: true,
                       labelText: 'Nom*',
                       // hintText:'Saisissez votre nom ' ,
                        hintStyle:  TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w400,color: Color.fromARGB(255, 180, 180, 180)),
                        labelStyle: TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),
                              ),
                        validator: (value) {
                        if (value!.isEmpty) {
                        return 'Veuillez saisir un texte';
                              }
                        return null;
                              },
                              ),
          ),
                            const SizedBox(height :17),
                            Container(
                              width: screenWidth/1.2,
                               height: 45,
                              child: TextFormField(
                     
                      //maxLength: 25,
                      decoration: const InputDecoration(
                        suffixIcon: 
                        Icon(Icons.person,color: Color.fromARGB(255, 0, 73, 133),),
                      fillColor: Color.fromARGB(255, 226, 227, 244), 
                      filled: true,
                     labelText: 'Prénom*',
                      //hintText:'Saisissez votre prénom' ,
                      hintStyle: TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w400,color: Color.fromARGB(255, 180, 180, 180)),
                      labelStyle: TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),
                              ),
                      validator: (value) {
                      if (value!.isEmpty) {
                      return 'Veuillez saisir un texte';
                              }
                      return null;
                              },
                     ),
                            ),
                
          const SizedBox(height:17 ),
          
          Container(
            width: screenWidth/1.2,
             height: 45,
            child: TextFormField(
                     
                      //maxLength: 25,
                      decoration: const InputDecoration(
                        suffixIcon: 
                         Icon(Icons.phone,color: Color.fromARGB(255, 0, 73, 133),),
                      fillColor: Color.fromARGB(255, 226, 227, 244), 
                      filled: true,
                      labelText: 'Télephone*',
                      
                      
                      
                      hintText:' (+33) xx xx xx xx' ,
                      
                      
                      hintStyle:  TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w400,color:  Color.fromARGB(255, 180, 180, 180)),
                      labelStyle:  TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),
                            ),
                      validator: (value) {
                      if (value!.isEmpty) {
                      return 'Veuillez saisir un texte';
                            }
                      return null;
                            },
                            ),
                            ),
                              const SizedBox(height: 17,),
                             Container(
                              width: screenWidth/1.2,
                               height: 45,
                               child: TextFormField(
                     
                      //maxLength: 25,
                      decoration: const InputDecoration(
                        suffixIcon: 
                         Icon(Icons.mail,color: Color.fromARGB(255, 0, 73, 133),),
                      fillColor:  Color.fromARGB(255, 226, 227, 244), 
                      filled: true,
                      labelText: 'E-mail*',
                     // hintText:'exemple@mail.com ' ,
                      hintStyle: TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w400,color: Color.fromARGB(255, 180, 180, 180)),
                      labelStyle: TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),
                            ),
                      validator: (value) {
                      if (value!.isEmpty) {
                      return 'Veuillez saisir un texte';
                            }
                      return null;
                            },
                            ),
                             ),
                            const SizedBox(height :17),
                             Container(
            width: screenWidth/1.2,
             height: 45,
            child: TextFormField(
                       
                        //maxLength: 25,
                        decoration: const InputDecoration(
                          suffixIcon: 
                           Icon(Icons.location_on_outlined,color: Color.fromARGB(255, 0, 73, 133),),
                        fillColor:  Color.fromARGB(255, 226, 227, 244), 
                        filled: true,
                       labelText: 'Adresse*',
                        //hintText:'Saisissez votre nom ' ,
                        hintStyle:  TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w400,color: Color.fromARGB(255, 180, 180, 180)),
                        labelStyle: TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),
                              ),
                        validator: (value) {
                        if (value!.isEmpty) {
                        return 'Veuillez saisir un texte';
                              }
                        return null;
                              },
                              ),
          ),
                            const SizedBox(height :17),
                            Container(
                              width: screenWidth/1.2,
                               height: 45,
                              child: TextFormField(
                     
                      //maxLength: 25,
                      decoration: const InputDecoration(
                        suffixIcon: 
                        Icon(Icons.location_on_outlined,color: Color.fromARGB(255, 0, 73, 133),),
                      fillColor: Color.fromARGB(255, 226, 227, 244), 
                      filled: true,
                     labelText: "Complément d'adresse*",
                      //hintText:'Saisissez votre prénom' ,
                      hintStyle: TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w400,color: Color.fromARGB(255, 180, 180, 180)),
                      labelStyle: TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),
                              ),
                      validator: (value) {
                      if (value!.isEmpty) {
                      return 'Veuillez saisir un texte';
                              }
                      return null;
                              },
                     ),
                            ),
                
          const SizedBox(height:17 ),
          
          Container(
            width: screenWidth/1.2,
             height: 45,
            child: TextFormField(
                     
                      //maxLength: 25,
                      decoration: const InputDecoration(
                        suffixIcon: 
                         Icon(Icons.navigate_next_outlined,color: Color.fromARGB(255, 0, 73, 133),),
                      fillColor:  Color.fromARGB(255, 226, 227, 244), 
                      filled: true,
                      labelText: 'Code Postal*',
                      
                      
                      
                      //hintText:' (+33) xx xx xx xx' ,
                      
                      
                      hintStyle: const TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w400,color: const Color.fromARGB(255, 180, 180, 180)),
                      labelStyle: const TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),
                            ),
                      validator: (value) {
                      if (value!.isEmpty) {
                      return 'Veuillez saisir un texte';
                            }
                      return null;
                            },
                            ),
                            ),
                              const SizedBox(height: 17,),
                             Container(
                              width: screenWidth/1.2,
                               height: 45,
                               child: TextFormField(
                     
                      //maxLength: 25,
                      decoration: const InputDecoration(
                        suffixIcon: 
                        const Icon(Icons.navigate_next_outlined,color: Color.fromARGB(255, 0, 73, 133),),
                      fillColor: const Color.fromARGB(255, 226, 227, 244), 
                      filled: true,
                      labelText: 'Ville*',
                      //hintText:'exemple@mail.com ' ,
                      hintStyle: TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w400,color: const Color.fromARGB(255, 180, 180, 180)),
                      labelStyle: const TextStyle(fontSize:12, fontFamily: 'Poppins', fontWeight: FontWeight.w500,color: Color.fromARGB(255, 14, 21, 110)),
                            ),
                      validator: (value) {
                      if (value!.isEmpty) {
                      return 'Veuillez saisir un texte';
                            }
                      return null;
                            },
                            ),
                             ),
                             

    ]
    )
    )
    );
  }
}