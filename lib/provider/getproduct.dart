import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../productmodel.dart';

class productprovider with ChangeNotifier{

  List<productmodel> _productlist =[];
List<productmodel> get getproductlist => _productlist;

 Future<void> fetchproductdata()async{
//     List<productmodel> newproductlist =[];
//     QuerySnapshot query = await FirebaseFirestore.instance.collection('products').get();
//
// query.docs.forEach((element) {
//  // print(element.data());
// productmodel product;
// product = productmodel(productid: element.get('id'),
//     productquantity: element.get('quantity') ,
//     productprice:element.get('price') ,
//     productimages:element.get('images') ,
//     productname:element.get('name')
// );
// newproductlist.add(product);
// //newproductlist.add(product);
//
//
//
//
// });
// productlist=newproductlist;
//     notifyListeners();

 final firebase = await  FirebaseFirestore.instance.collection('products').get();

 _productlist= firebase.docs.map((e) => productmodel(
   productname: e['name'],
   productimages: e['images'],
   productprice: e['price'],
   productquantity: e['quantity'],
   productid: e['id'],


 )).toList();
notifyListeners();

 }











}