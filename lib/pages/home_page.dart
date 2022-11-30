import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLogged = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/im_party.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.6),
                Colors.black.withOpacity(.4),
                Colors.black.withOpacity(.2),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _slideAnimation(300, -100, 0.0,  const Text(
                "Find the best parties near you",
                style: TextStyle(fontSize: 45,color: Colors.white,),
              ),),

              const SizedBox(height: 10,),
              _slideAnimation(300, -100, 0.0,
                  const Text(
                    "Let us you a tutorial foryou interest",
                    style: TextStyle(fontSize: 25,color: Colors.greenAccent,
                    ),
                  )),
              const SizedBox(height: 200,),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  isLogged ?
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.yellow.shade900
                    ),
                    child: const Center(child: Text("start",style: TextStyle(fontSize: 20,color: Colors.white),)),
                  ) :
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: MaterialButton(
                            height: 50,
                            color: Colors.red.shade900,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            onPressed: (){},
                            child: Text("Google", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ),),
                          ),
                        ),
                      ),



                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: MaterialButton(
                            height: 50,
                            color: Colors.blue.shade900,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            onPressed: (){},
                            child: Text("Fasebook", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  final SpringController springController = SpringController(initialAnim: Motion.play);
  Widget _slideAnimation(delay, y1,y2,child){
    return Spring.slide(
      springController: springController,
      slideType: SlideType.slide_in_top,
      withFade: true,
      cutomTweenOffset: Tween(begin: Offset(0,y1),end: Offset(0,y2)),
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }
}