import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class cartmodel{
  String ?cartid;
  int ?cartprice;
  int cartquantity;
  String ?cartname;
  String ?cartimages;
  cartmodel({required this.cartimages,required this.cartid,required this.cartname,required this.cartprice,required this.cartquantity});


// Map<String,dynamic> toMap(){
//   return {
//     'id':cartid,
//     'price':cartprice,
//     'quantity':cartquantity,
//     'name':cartname,
//     'images':cartimages,
//   };
//
// }





}
