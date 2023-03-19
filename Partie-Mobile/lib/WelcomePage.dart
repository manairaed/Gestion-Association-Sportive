import 'package:app_parent/Login/SeConnecter.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  static String get routeName => '@routes/welcome-page';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  static String get routeName => '@routes/home-page';
  late AnimationController _scaleController;

  bool hide = false;

  @override
  void initState() {
    super.initState();
    _scaleController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:  AssetImage('assets/102.jpg'),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.4),
          ])),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
              
                    
                    const Text(
                      "Bienvenu",
                      style:  TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                const SizedBox(
                  height: 20,
                ),
              
                    const Text(
                      "Ne demandez pas ce que vos coéquipiers peuvent faire pour vous. Demandez ce que vous pouvez faire pour vos coéquipiers",
                      style:  TextStyle(color: Colors.white, fontSize: 20),
                    ),
                const SizedBox(
                  height: 100,
                ),
               
                    
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(
               MaterialPageRoute(builder: (context)=>  const SeConnecter()));
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}