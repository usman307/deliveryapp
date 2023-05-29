import 'package:flutter/material.dart';
import 'package:untitled/productmodel.dart';
class fries extends StatelessWidget {
  final  List<productmodel> prodductlist;

  const fries({Key? key,required this.prodductlist,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset('assets/flame.jpg',width: 40),
            Text('Fries',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
          ],
        ),

        Text('Most Ordered Right Now',style: TextStyle(fontSize: 15),),
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
                    ],
                  );
              }
          ),
        ),
      ],
    );
  }
}
