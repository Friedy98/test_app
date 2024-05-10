import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/Page_2.dart';
import 'package:test_app/color_constants.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String language = "Selecte a language";
  bool loading = false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar:
      Container(
        height: MediaQuery.of(context).size.height / 1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              TextFormField(
                  obscureText: false,
                  controller: name,
                  decoration: InputDecoration(
                    hintText: "Enter your Name",
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                    prefixIcon: Icon(Icons.person),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                  )
              ),
              SizedBox(height: 20),
              TextFormField(
                  obscureText: false,
                  controller: email,
                  decoration: InputDecoration(
                    hintText: "Enter your Email",
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                    prefixIcon: Icon(Icons.mail),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                          color: Colors.grey
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                  )
              ),
              SizedBox(height: 20),
              TextFormField(
                  obscureText: false,
                  controller: phone,
                  decoration: InputDecoration(
                    hintText: "Enter your Contact",
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                    prefixIcon: Icon(Icons.phone_android),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: EdgeInsets.all(10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                          color: Colors.grey
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                  )
              ),
              SizedBox(height: 90),
              InkWell(
                  onTap: ()async{
                    await register();
                  },
                  child: Container(
                      width: 300,
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        // borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(
                        child: Text("Save", style: TextStyle(color: Colors.white)),
                      )
                  )
              ),

              SizedBox(height: 40),
              InkWell(
                  onTap: ()async{

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Page_2()),
                    );
                  },
                  child: Container(
                      width: 300,
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        // borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(
                        child: Text("View Client List", style: TextStyle(color: Colors.white)),
                      )
                  )
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              SizedBox(height: 100),
              Text("Welcome Back to INTIA", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text("Enter the information of a Client", style: TextStyle(color: Colors.white, fontSize: 14)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future register() async {
    print(name.text);
    print(email.text);
    print(phone.text);
    setState(() {
      loading = true;
    });

    var headers = {
      'Accept': 'application/json',
      'Authorization': "Basic dGhlb3BoYW5lQHNoaW50aGVvLmNvbTpPbml6dWtAMjI="
    };
    var request = http.Request('POST',Uri.parse('https://willonhair.shintheo.com/api/v1/create/res.partner?values={ '
        '"name": "${name.text}",'
        '"email": "${email.text}",'
        '"mobile": "${phone.text}",'
        '}'
    ));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200)  {
      setState(() {
        loading = false;
      });

      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message:
          "Good job, You just added one client",
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Page_2()),
      );

    }
    else {
      print(response.reasonPhrase);
      loading = false;
    }
  }
}
