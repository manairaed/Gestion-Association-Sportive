

import 'package:app_parent/PartieJoueurs/message/message1.dart';
import 'package:flutter/material.dart';
class Message2jou extends StatefulWidget {
  const Message2jou ({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}
class _MessageState extends State<Message2jou> {

  List<Map> messageList=[{
    'isMe':false,
    'Msg':'Bonjour'
  },
  {
    'isMe':true,
    'Msg':'Bonjour'
  },
  {
    'isMe':true,
    'Msg':'test'
  },
  {
    'isMe':true,
    'Msg':'hi'
  }];
  String mymsg='';
 @override
  Widget build(BuildContext context) {
    
    final screenHeight=MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
         backgroundColor: const Color.fromARGB(255, 246, 246, 246),
         appBar: PreferredSize(
           preferredSize: Size.fromHeight( screenHeight/6.29),
           child:  Container(
               height: screenHeight/6.29,
               width: screenWidth,
               color: const Color.fromARGB(255, 14, 21, 110),
               child: Row(children: [
               IconButton(onPressed: (){
                 Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const ListMsg1jou()));
               },
                icon:const Icon(Icons.navigate_before,color: Colors.white,),
                ),
                Stack(
                  children:[
                  Image.asset("assets/chat.png"),
                  Padding(
                  padding: const EdgeInsets.only(left:29.0,top:29),
                  child: Container(height: 10,width: 10,
                  decoration: BoxDecoration(color: const Color.fromARGB(255, 128, 234, 78),
                  borderRadius: BorderRadius.circular(10)
                  ),
                  ),
                ),
               ]
                ),
                Padding(
                  padding: const EdgeInsets.only(left:15.0,top:45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                    Text("Nom Prénom",style: TextStyle(fontSize: 15 , fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: Colors.white),),
                    Text("San Francisco",style: TextStyle(fontSize: 13 , fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: Colors.white),),
                  ],),
                ),
                 Padding(
                   padding: const EdgeInsets.only(left:120.0),
                   child: Container(
                     height: 23,
                     width: 23,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
                     child: const Padding(
                       padding: EdgeInsets.only(right:0,bottom:0),
                       child: Icon(Icons.call_outlined,color: Color.fromARGB(255, 14, 21, 110),size: 20,),
                     ),
                   ),
                 ),
                  Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: Container(
                     height: 23,
                     width: 23,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
                     child: const Padding(
                       padding: EdgeInsets.only(right:0,bottom:0),
                       child: Icon(Icons.video_call_outlined,color: Color.fromARGB(255, 14, 21, 110),size: 20,),
                     ),
                 ),
                  ),
                 ],
                 ),
             ),),
         body:SafeArea(child:  Column(children: [
          Expanded(
          child: Container(
            child: ListView.builder(
                        itemCount: messageList.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          return Align(alignment:messageList[index]['isMe'] ==true?Alignment.centerRight:Alignment.centerLeft,
                          child: Container(child: 
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(//height:screenHeight/9.09,
                              width: screenWidth/1.5,
                              decoration: BoxDecoration(
                                 color: const Color.fromARGB(255, 214, 228, 255),
                                 borderRadius: BorderRadius.circular(10)
                              ),
                             
                              child: Padding(
                                padding: const EdgeInsets.only(left:20.0,top: 5),
                                child: Text(messageList[index]['Msg']),
                              )
                               ),
                            ),
                          )
                           )
                           );
                          
                          //Text(messageList[index]['Msg'])),);
                        }),
          ),
          ),
          Row(
          
          children: [
          
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top:12.0),
              child: Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.symmetric(
                  horizontal:20
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  
                  children:  [
                    const Icon(Icons.attach_file_outlined, color: Colors.grey),
                    const SizedBox(width: 20 ),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: "Saisir le message",
                          border: InputBorder.none,
                          
                        ),
                        onChanged: (value){
setState(() {
 mymsg=value;
});
                        },
                      ),
                    ),
                   
                    //SizedBox(width: 200 / 4),
                 IconButton(onPressed: (){
setState(() {
  messageList.add( {
    'isMe':true,
    'Msg':mymsg
  }

  );

});
                 }, icon:    const Icon(
                      Icons.send,
                      color:Colors.red
                    )),
                  ],
                ),
              ),
            ),
          ),
            
         ]),
         
    
         ])
    ));
 }
}
