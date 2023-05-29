

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/button.dart';
import 'package:untitled/forminformation.dart';
import 'package:untitled/sucesspage.dart';
import 'package:untitled/utils.dart';
class adressinfo extends StatefulWidget {
  adressinfo({Key? key}) : super(key: key);


  @override
  State<adressinfo> createState() => _adressinfo();
}

class _adressinfo extends State<adressinfo> {
  final formm = GlobalKey<FormState>();


  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  final digitRegExp = new RegExp(r'[0-9]');
  final uppercaseRegExp = new RegExp(r'[A-Z]');
  final lowercaseRegExp = new RegExp(r'[a-z]');

  bool loading = false;
  // FirebaseAuth auth = FirebaseAuth.instance;
  dynamic login(){
    return
      InkWell(
        onTap: (){
          loading=loading;
          if(formm.currentState!.validate()){
            setState(() {
              loading=true;
            });
            auth.createUserWithEmailAndPassword(email: email.text.toString(), password: password.text.toString()).then((value) {
              utils().toastmessage('Personal Information');
            }).onError((error, stackTrace) {
              utils().toastmessage('error');
              setState(() {
                loading=false;
              });
            });

          }

        },
        child:   Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              utils().toastmessage('Order Placed Successfuly');
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimatedImage()));

            },
            child: Container(

              height: 50,

              width: double.infinity,

              decoration: BoxDecoration(

                color: Colors.pink,

              ),

              child: Center(

                child: Text('Place Order'),

              ),

            ),
          ),
        ),
      );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(

        appBar: AppBar(

          automaticallyImplyLeading: false,
          backgroundColor: Colors.pink,
          title: Text('Personal Information'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
         return  Navigator.pop(context);
            },

          ),
          centerTitle: true,
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Form(
                    key: formm,
                    child:
                    Column(
                      children: [
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10,left: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),


                              hintText: 'Enter Name',



                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return 'enter please';
                              }
                              else{
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10),
                              focusedBorder:OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                              border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(5),

                              ),

                              hintText: 'Enter email',
                              prefixIcon: Icon(Icons.email),


                            ),
                            validator: (value){
                              email.text.toString();
                              if(value!.isEmpty){
                                return 'Enter email';
                              }
                              else{
                                return null;
                              }

                            },

                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: password,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),

                              hintText: 'Enter Password',
                              prefixIcon: Icon(Icons.password),


                            ),
                            validator: ( var value) {
                              if (value!.isEmpty) {
                                return 'Enter password';
                              }
                              else if(value.length<=6){
                                return 'enter 6 digit';
                              }
                              else if(!value.contains(uppercaseRegExp)){
                                return 'password should contain at least one uppercase letter';
                              }
                              else if(!value.contains(lowercaseRegExp)){
                                return 'password should contain at least one lowercase letter';
                              }
                              else if(!value.contains(digitRegExp)){
                                return 'password should contain at least one digit';
                              }
                              else {
                                return null  ; // validation passed
                              }
                            },




                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(

                            child: TextFormField(

                              //    maxLength: 10,
                              maxLines: 5,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 30,left: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),


                                hintText: 'Enter your Address',
                                //  prefixIcon: Icon(Icons.location_city),


                              ),
                              validator: (value){
                                if (value!.isEmpty){
                                  return 'Enter Address';
                                }
                                else{
                                  return null;
                                }
                              },

                            ),
                          ),
                        ),
                        SizedBox(height: 10,),

                        login(),
                      ],
                    )
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
