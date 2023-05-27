

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/appetizer.dart';
import 'package:untitled/fries.dart';
import 'package:untitled/helper.dart';
import 'package:untitled/modelclass.dart';
import 'package:untitled/productcategory.dart';
import 'package:untitled/productmodel.dart';
import 'package:untitled/provider/getproduct.dart';
import 'package:untitled/sandwitch.dart';
import 'package:untitled/tabbarviewclass.dart';
class detail extends StatefulWidget {
  String image;
  String productname;
   detail({Key? key,required this.image,required this.productname}) : super(key: key);

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> with SingleTickerProviderStateMixin {
  late TabController _tabController;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    final Productprovider = Provider.of<productprovider>(context,listen: false).fetchproductdata();

    _tabController = TabController(length:4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    final Productprovider = Provider.of<productprovider>(context,listen: true);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink,
        bottom:PreferredSize(
          preferredSize: Size.fromHeight(60),
          child:Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            // color: Colors.black,

                        ),
                        child: CupertinoTextField(


                          prefix: Icon(Icons.search),

                           // borderRadius: BorderRadius.circular(20),
                          //  color: Colors.red,

                          placeholder: 'Enter Resturant',
                          placeholderStyle: TextStyle(
                            fontSize: 15,
                          //  fontWeight: FontWeight.bold
                          ),

                        ),
                      ),
                      TabBar(
                        controller: _tabController,
                          tabs: [
                            Tab(
                              text: 'Popular',
                            ),
                            Tab(
                              text: 'Appetizer',
                            ),
                            Tab(
                              text: 'Frieds',
                            ),
                            Tab(
                              text: 'Sandwitches',
                            ),
                          ],
                      ),


                    ],
                  ),
                ),
              )
            ],
          ) ,
        ),
      ),
      body: FutureBuilder(
        future: Future.value(Productprovider.getproductlist),
        builder: (context,snapshot){
          if(!snapshot.hasData) {
            return Text('no data');

          }
          else if (snapshot.connectionState==ConnectionState.waiting){
            return CircularProgressIndicator();
          }
          else if(snapshot.connectionState==ConnectionState.done){
            return  TabBarView(
                controller: _tabController,
                children:[

              tabbarview(prodductlist: snapshot.data!),
                  appetizer(prodductlist: snapshot.data!),
                  fries(prodductlist: snapshot.data!),
                  sandwitch(prodductlist: snapshot.data!),


            ]);
          }
          // else if(snapshot.hasData){
          //   return tabbarview(
          //       tabController: _tabController, prodductlist: snapshot.data!);
          // }
          else {
            return  Text('something happens');
          }
          },

      ),
    );
  }
}

