import 'package:flutter/material.dart';
import 'package:untitled/appfonts.dart';
import 'package:untitled/productcategory.dart';
import 'package:untitled/productmodel.dart';


class tabbarview extends StatelessWidget {
  final  List<productmodel> prodductlist;




  const tabbarview({Key? key,required this.prodductlist}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/flame.jpg',width: 40),
              Text('Popular',style: TextStyle(fontFamily: 'fontfamily',fontWeight: FontWeight.bold,fontSize: 18)),
            ],
          ),

          Transform.translate(
              offset: Offset(40,0),
              child: Text('Most Ordered Right Now',style: TextStyle(fontFamily: 'fontfamily',fontWeight: FontWeight.bold,fontSize: 18),)),


          Expanded(
            child: GridView.builder(
              itemCount: prodductlist.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                //  mainAxisSpacing: 1,
              ),
              itemBuilder: (context, index) {
                final pro = prodductlist[index];
                return
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>productcategory()));
                },
                          child: Container(
                            decoration: BoxDecoration(

                              //  borderRadius: BorderRadius.all(Radius.circular(4)),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Stack(
                                  children:[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(pro.productimages.toString(),fit: BoxFit.contain,),
                                    ),
                                    Positioned(
                                        right: 20,
                                        child: Text(pro.productname.toString().toUpperCase(),style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),)),
                                    Positioned(
                                      bottom:0,
                                      top:90,
                                      right:0,

                                      child: Container(
                                        width: 60,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white,
                                        ),
                                        child: Center(child: Text('Rs.'+pro.productprice.toString())),
                                      ),

                                    ),
                                  ]



                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
              }
    ),
          ),
        ],
      );
  }
}
