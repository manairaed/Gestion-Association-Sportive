import 'package:app_parent/Boutique/panier/SuccesPay.dart';
import 'package:app_parent/Boutique/panier/informationcarte.dart';
import 'package:flutter/material.dart';

class Code extends StatefulWidget {
  const Code({Key? key}) : super(key: key);

  @override
  State<Code> createState() => _CodeState();
}
class _CodeState extends State<Code> {
   @override
   Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(

    backgroundColor: const Color.fromARGB(255, 244, 247, 250),
    appBar: AppBar(
      automaticallyImplyLeading: false,
        leading :IconButton(onPressed: (){
           Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const Infocar()));
        },
icon:const Icon(Icons.arrow_back_outlined,size: 25,)),  
    title: const Text(' Code',style: TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w500),),
    titleSpacing: 0.0,
     elevation: 0,
    centerTitle: true,
    backgroundColor:const Color.fromARGB(255, 14, 21, 110) ),
    body:SingleChildScrollView(

        child: Column( 
          children: [
            Padding(
              padding: const EdgeInsets.only(left :0.0, top:200),
              child: Center(child: Text("Saisissez le code que vous l'avez \n          reçu par messages",style: TextStyle(fontSize: 16 , fontFamily: 'Poppins',fontWeight: FontWeight.w600, color: Color.fromARGB(255, 14, 21, 110)),)),
            ),
            Padding(
              padding: const EdgeInsets.only(left :70.0, top:70),
              child: Row(children: [
                Container(
                  height: 58,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 200, 203, 255),
                    borderRadius: BorderRadius.circular(22)
                  ),
                  
                  child:TextField(
  decoration: InputDecoration(
      border: OutlineInputBorder(
       borderSide: BorderSide(color: Color.fromARGB(255, 14, 21, 110)),
        borderRadius: BorderRadius.circular(22.0),
      ),
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[800], fontSize: 16, fontWeight: FontWeight.w500),
      hintText: "..",
      fillColor: Colors.white70),
)
                ),
                SizedBox(width: 20,),
                Container(
                  height: 58,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 200, 203, 255),
                    borderRadius: BorderRadius.circular(22)
                  ),
                  
                  child:TextField(
  decoration: InputDecoration(
      border: OutlineInputBorder(
       borderSide: BorderSide(color: Color.fromARGB(255, 14, 21, 110)),
        borderRadius: BorderRadius.circular(22.0),
      ),
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[800], fontSize: 16, fontWeight: FontWeight.w500),
      hintText: "..",
      fillColor: Colors.white70),
)
                ),
                 SizedBox(width: 20,),
                Container(
                  height: 58,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 200, 203, 255),
                    borderRadius: BorderRadius.circular(22)
                  ),
                  
                  child:TextField(
  decoration: InputDecoration(
      border: OutlineInputBorder(
       borderSide: BorderSide(color: Color.fromARGB(255, 14, 21, 110)),
        borderRadius: BorderRadius.circular(22.0),
      ),
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[800], fontSize: 16, fontWeight: FontWeight.w500),
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: 24.0
      ),
      hintText: "..",
      fillColor: Colors.white70),
)
                ),
                 SizedBox(width: 20,),
                Container(
                  height: 58,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 200, 203, 255),
                    borderRadius: BorderRadius.circular(22)
                  ),
                  
                  child:TextField(
  decoration: InputDecoration(
      border: OutlineInputBorder(
       borderSide: BorderSide(color: Color.fromARGB(255, 14, 21, 110)),
        borderRadius: BorderRadius.circular(22.0),
      ),
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[800], fontSize: 16, fontWeight: FontWeight.w500),
      hintText: "..",
      fillColor: Colors.white70),
)
                )
              ],),
            ),
            SizedBox(height: 20,),
             Column( mainAxisAlignment: MainAxisAlignment.center,

          children: [
          const Text("Dans 12h si vous n'avez pas reçu le code",style:  TextStyle(color:Color.fromARGB(255, 14, 21, 110),fontSize: 12,fontFamily: 'Poppins',fontWeight: FontWeight.w400)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Text("Cliquer sur ",style: TextStyle(color:Color.fromARGB(255, 14, 21, 110),fontSize: 12,fontFamily: 'Poppins',fontWeight: FontWeight.w400)),
            TextButton(onPressed: () {},
             child:const Text("Je n'ai pas reçu le code",style: TextStyle(color: Color.fromARGB(255, 213, 43, 40),fontSize: 12,fontFamily: 'Poppins',fontWeight: FontWeight.w500,decoration: TextDecoration.underline)),
        )],),
        SizedBox(height: 30,),
        ElevatedButton(onPressed:() {
                   Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const Succes()));
                 },
                            child: 
                               const Text("Confirmer",style:TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight:FontWeight.w500, color: Color.fromARGB(255, 213, 43, 30), ) ,),
                              style:
                              
                              ElevatedButton.styleFrom(
                                
                              fixedSize: const Size(124, 46),
                              primary: Color.fromARGB(255, 255, 255, 255),
                              side: BorderSide(width: 2.0, color: Color.fromARGB(255, 213, 43, 30),),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),
                              
                               )  ,
                              ),
                      ),
        ],)
          ],
        )
    )
    );
   }
   }