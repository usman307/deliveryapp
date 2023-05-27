import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/adressinfo.dart';
import 'package:untitled/cartmodel.dart';
import 'package:untitled/firrstoreservices.dart';
import 'package:untitled/productcategory.dart';
import 'package:untitled/provider/cartprocider.dart';

import 'package:untitled/provider/getproduct.dart';
import 'package:untitled/provider/timerclass.dart';
import 'package:untitled/provider/timerclass.dart';
import 'package:untitled/provider/timerclass.dart';
import 'package:untitled/sucesspage.dart';

class cartscreen extends StatefulWidget {
  const cartscreen({Key? key}) : super(key: key);

  @override
  State<cartscreen> createState() => _cartscreenState();
}

class _cartscreenState extends State<cartscreen> {


@override


  void initState() {
final providerofcart = Provider.of<cartprovider>(context,listen: false).getcartitems();
final Timerclass = Provider.of<timerclass>(context,listen: false).start();
    super.initState();
  }
  @override

  @override

   Widget build(buildcontext) {


   final providerofcart = Provider.of<cartprovider>(context,listen: false);

   final Productprovider =Provider.of<productprovider>(context);
    final Timeprovider = Provider.of<timerclass>(context,listen: false);



   return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: SafeArea(
         child: Scaffold(
           appBar: AppBar(
             backgroundColor: Colors.pink,
            leading: IconButton(
              icon:Icon( Icons.arrow_back),
              onPressed: ()=> Navigator.pop(context),

            ),
             title: Text('Your Cart Details'),
             centerTitle: true,
           ),
           body: Column(
              children: [
                SizedBox(height: 30,),
               Row(
                 children: [

                   Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: Container(
                       width: 395,
                       height: 200,
                       decoration: BoxDecoration(
                       //  color: Colors.red,
                         border: Border.all(color: Colors.grey),
                         borderRadius: BorderRadius.circular(10)
                       ),
                       child: Row(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.all(20),
                                 child: ClipRRect(
                                     borderRadius: BorderRadius.circular(50),
                                     child: Image.asset(
                                         'assets/rider.jpg', height: 100)),
                               ),
                               Transform.translate(
                                   offset: Offset(5, 70),
                                   child: Column(
                                     children: [

                                       Text('Estimated Delivery',style: TextStyle(fontSize: 15),),
                                       Consumer<timerclass>(
                                         builder: (context,timercount,child){

                                           print('only this widget builds');
                                           return  Text(timercount.currentTime.second.toString(),

style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),

                                           );
                                         }
                                         ),



                                     ],
                                   )

                               ),
                             ],


                         ),
                   ),

                   )],
               ),
                SizedBox(height: 20,),

                Expanded(
flex: 5,
           child:FutureBuilder(
             future: Future.value(providerofcart.cartitems),
             builder: (context,snapshot){
   if(!snapshot.hasData){
     return Center(child: CircularProgressIndicator());
   }
// else if(snapshot.connectionState==ConnectionState.waiting){
// return Text('please wait');
//    }
  else if (snapshot.hasData){
  return ListView.builder(
    itemCount: snapshot.data!.length,
    itemBuilder: (context,index) {
      final cartitemlist = snapshot.data![index];
      return Card(
        child: ListTile(
          title: Row(
            children: [
            Container(
            //   height:30,
            // width:55,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.pink,
                ),
borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Consumer<cartprovider>(
                builder: (context,value,child){
                  return Row(
                    children: [
                      InkWell(
                        onTap:(){

                          value.increasequantity(cartitemlist);
                          },
                        child: Container(
                            child: Icon(Icons.add,color: Colors.red,)
                        ),
                      ),
                      Text(cartitemlist.cartquantity.toString()),
                      InkWell(
                        onTap:(){
                          value.decreasequantity(cartitemlist);
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Icon(Icons.minimize_sharp,color: Colors.pink,),
                          ),
                        ),
                      ),
                    ],
                  );


                },

              )
            ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child:
                      Image.asset(cartitemlist.cartimages.toString(),width: 80,height: 70,fit: BoxFit.cover,),
                ),
              ),
              Container(
                  height: 20,
                  width:100,
                  child: Text(cartitemlist.cartname.toString().toUpperCase())),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  child: Transform.translate(
                    offset: Offset(80,0),
                      child
                      : Text('Rs.'+ cartitemlist.cartprice.toString())),
                ),
              )

            ],
          )
        )
      );

    },
  );
  }
  else{
return Text('something occurs');
  }

     }),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>mainfairestore()));
                  },
                  child: Container(


                    alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Icon(Icons.add,color: Colors.pink,),
                      Text('Add more items',style: TextStyle(fontSize: 19,color: Colors.pink),),
                    ],
                  ),
              ),
                ),
              ),
                Spacer(flex: 1,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Popular with your order',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('Other customers also bought these',style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                             itemCount:Productprovider.getproductlist.length,
                             scrollDirection: Axis.horizontal,
                             itemBuilder: (context,index){
                               final product = Productprovider.getproductlist[index];
                               return Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Container(
                                   decoration: BoxDecoration(
                                     border: Border.all(
                                       color: Colors.grey,
                                     )
                                   ),
                                   child: Card(
                                     child: ClipRRect(
                                       borderRadius: BorderRadius.all(Radius.circular(10),
                                       ),
                                       child: Image.asset(product.productimages.toString()),
                                     ),
                                   ),
                                 ),
                               );
                             }),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total(incl.VAT)'),
                    Text('Rs.'+ providerofcart.totalprice().toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                  ],
                ),
              ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimatedImage()));
                      Timeprovider.dispose();


                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(child: Text('Confirm Payment'),),
                    ),
                  ),
                )
   ]
             )
   )
    )

    );

  }
}