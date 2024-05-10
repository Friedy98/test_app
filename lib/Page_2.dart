import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/Page_3.dart';
import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'color_constants.dart';

class Page_2 extends StatefulWidget {
  const Page_2({super.key});

  @override
  State<Page_2> createState() => _Page_2State();
}

class _Page_2State extends State<Page_2> {

  @override
  void initState() {

    getAllClient();
    super.initState();
  }

  List client = [];
  bool loading = false;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  getAllClient()async{
    setState(() {
      loading = true;
    });
    var headers = {
      'Accept': 'application/json',
      'Authorization': "Basic dGhlb3BoYW5lQHNoaW50aGVvLmNvbTpPbml6dWtAMjI=",
    };
    var request = http.Request('GET', Uri.parse('https://willonhair.shintheo.com/api/v1/search_read/res.partner'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var data = json.decode(result);
      setState(() {
        loading = false;
      });

      setState(() {
        client = data;
      });
      print("cleint: $client");

    } else {
      setState(() {
        loading = false;
      });
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('INTIA', style: TextStyle(color: Colors.white, fontSize: 15),),
      ),
      floatingActionButton: FloatingActionButton(
        child: Center(
          child: Icon(Icons.refresh),
        ),
          onPressed: (){
          setState(() {
            loading = true;
          });
            getAllClient();
          }),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(),
            Icon(Icons.group, size: 100 ,color: Colors.grey,),
            SizedBox(),
            Container(
              height: MediaQuery.of(context).size.height/1.8,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                children: [
                  loading ?
                      Center(
                        child: Text("Loading...", style: TextStyle(color: Colors.grey, fontSize: 24),),
                      ) :
                  Expanded(
                      child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: client.length,
                          itemBuilder: (context, index) {
                            client.sort((b,a) {
                              return client[index]['__last_update'].compareTo(client[index]['__last_update']);
                            });
                              return InkWell(
                                  onTap: ()async{
                                    showDialog(
                                        context: context,
                                        builder: (_){
                                          return Container(
                                            padding: EdgeInsets.all(20),
                                            height: 300,
                                            child: Material(
                                              child: Column(
                                                children: [
                                                  IconButton(
                                                      onPressed: (){
                                                        Navigator.pop(context);
                                                      },
                                                      icon: Icon(Icons.arrow_back)),
                                                  SizedBox(height: 10),
                                                  TextFormField(
                                                      obscureText: false,
                                                      initialValue: client[index]['name'].toString(),
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

                                                  SizedBox(height: 10),

                                                  TextFormField(
                                                      obscureText: false,
                                                      initialValue: client[index]['email'].toString(),
                                                      controller: email,
                                                      decoration: InputDecoration(
                                                        hintText: "Enter your Email",
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

                                                  SizedBox(height: 10),
                                                  TextFormField(
                                                      obscureText: false,
                                                      controller: phone,
                                                      initialValue: client[index]['mobile'].toString(),
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

                                                  SizedBox(height: 90),
                                                  InkWell(
                                                      onTap: ()async{
                                                        updateProfile(client[index]["id"]);
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
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)
                                    ),
                                    margin: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ListTile(
                                          title: Text(client[index]['name'].toString(), style: TextStyle(color: Colors.black),),
                                          subtitle: Text(client[index]['email'].toString(), style: TextStyle(color: Colors.black),),
                                          trailing: Text(client[index]['mobile'].toString(), style: TextStyle(color: Colors.black),),
                                        ),
                                        IconButton(
                                            onPressed: (){
                                              setState(() {
                                                client.remove(client[index]);
                                              });
                                              deleteClient(client[index]['id']);
                                            }, icon: Icon(Icons.delete, color: Colors.red,))
                                      ],
                                    ),
                                  )
                              );
                            }
                          )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void deleteClient(int id) async{

    var headers = {
      'Accept': 'application/json',
      'Authorization': "Basic dGhlb3BoYW5lQHNoaW50aGVvLmNvbTpPbml6dWtAMjI="
    };
    var request = http.Request('DELETE', Uri.parse('https://willonhair.shintheo.com/api/v1/unlink/res.users?ids=$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message:
          "Good job, You just added one client",
        ),
      );
    }
    else {
      var result = await response.stream.bytesToString();
      print(response.reasonPhrase);
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message:
          "An error occured !!!",
        ),
      );
    }
  }

  updateProfile(int id)async{

    var headers = {
      'Accept': 'application/json',
      'Authorization': "Basic dGhlb3BoYW5lQHNoaW50aGVvLmNvbTpPbml6dWtAMjI="
    };
    var request = http.Request('PUT', Uri.parse('https://willonhair.shintheo.com/api/v1/write/res.partner?ids=$id&values={'
        '"name": "${name.text}",'
        '"email": "${email.text}",'
        '"mobile": "${phone.text}",'
        '}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message:
          "Good job, You just added one client",
        ),
      );
      Navigator.pop(context);

    }
    else {
      var data = await response.stream.bytesToString();
      print(response.reasonPhrase);
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message:
          "An error occured !!!",
        ),
      );
    }
  }
}
