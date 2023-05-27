import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:untitled/productmodel.dart';
import 'package:untitled/utils.dart';
import '../cartmodel.dart';

class cartprovider  with ChangeNotifier{

void addtocart(productmodel product)async{
  final user = FirebaseAuth.instance.currentUser;
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  final firebase = await FirebaseFirestore.instance.collection('cartmodel');
  firebase.doc(id).set({
    'cartid': product.productid,
    'cartname':product.productname,
    'cartquantity':product.productquantity,
    'cartimages':product.productimages,
    'cartprice':product.productprice,



  }).then((value) {
    utils().toastmessage('Item Added Succesfully');

  }).onError((error, stackTrace) {error.toString();});


}
List<cartmodel> _getcartitem=[];
List<cartmodel> get cartitems => _getcartitem;
Future<dynamic >getcartitems() async{
  final user = FirebaseAuth.instance.currentUser;
 // final id = DateTime.now().millisecondsSinceEpoch.toString();
  final firebase  = await FirebaseFirestore.instance.collection('cartmodel').get();

 _getcartitem = firebase.docs.map((e) => cartmodel(cartimages: e['cartimages'], cartid: e['cartid'],
     cartname: e['cartname'], cartprice: e['cartprice'], cartquantity: e['cartquantity'])).toList();
 notifyListeners();
}
int  totalprice() {
  int total=0;
for (var i in _getcartitem){
  total = total+(i.cartprice ?? 0) * (i.cartquantity ?? 0);
}
notifyListeners();
print(total);
return total;
}

void increasequantity(cartmodel cart){
cart.cartquantity++;
notifyListeners();

}
void decreasequantity(cartmodel cart){
  if(cart.cartquantity>1){

    cart.cartquantity--;
    notifyListeners();
  }
}


// Future<List<Map<String, dynamic>>> getDataFromFirestore() async {
//   CollectionReference<Map<String, dynamic>> myCollection = FirebaseFirestore.instance.collection('cartmodel');
//   QuerySnapshot<Map<String, dynamic>> querySnapshot = await myCollection.get();
//   List<Map<String, dynamic>> data = querySnapshot.docs.map((doc) =>doc.data()).toList();
//
//   print('data ha $data');
//   return data;
// }




  //  // Add this line to print the retrieved data in the console
  //
}























