import 'package:flutter/material.dart';
import 'package:test_app/login_view.dart';
import 'color_constants.dart';

class Page_3 extends StatefulWidget {
  const Page_3({super.key});

  @override
  State<Page_3> createState() => _Page_3State();
}

class _Page_3State extends State<Page_3> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(),
            Icon(Icons.car_crash_sharp, size: 200,color: Colors.blue,),
            SizedBox(),
            Container(
              height: 300,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 15),
                      Text("Automatic Capture of vehicle Number Plate", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: 15),
                      Text("Manage vehicle by scanning vehicle plate numbers automatically and keeping track of all information", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.lightBlueAccent),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.arrow_back, color: Colors.lightBlueAccent,)
                          )
                      ),
                      InkWell(
                          onTap: (){

                          },
                          child: Container(
                              width: 200,
                              height: 50,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                // borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Center(
                                child: Text("Capture now", style: TextStyle(color: Colors.white)),
                              )
                          )
                      ),
                      InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const login_view()),
                            );
                          },
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.lightBlueAccent),
                                shape: BoxShape.circle,
                                // borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Icon(Icons.arrow_forward_sharp, color: Colors.lightBlueAccent,)
                          )
                      ),
                    ],
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
