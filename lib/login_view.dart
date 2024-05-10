import 'package:flutter/material.dart';

class login_view extends StatefulWidget {
  const login_view({super.key});

  @override
  State<login_view> createState() => _login_viewState();
}

class _login_viewState extends State<login_view> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: <Widget>[
          Column(
            children: [
              SizedBox(height: 100),
              Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text("log into your account by entering your email and password below. Happy to see you back", style: TextStyle(color: Colors.white, fontSize: 14)),
              ),
            ],
          ),
          Spacer(),
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: "Enter your email, phone or ",
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                    prefixIcon: Icon(Icons.alternate_email),
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
                    decoration: InputDecoration(
                      hintText: "Enter your Password",
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                      prefixIcon: Icon(Icons.lock),
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
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Text('Forgot Password', style: TextStyle(color: Colors.blue)),
                ),
                SizedBox(height: 70),
                InkWell(
                    onTap: (){
                      Navigator.pop(context);
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
                          child: Text("Login", style: TextStyle(color: Colors.white)),
                        )
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
