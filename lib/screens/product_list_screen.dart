import 'dart:convert';

import 'package:app_project/Product%20_List/add_new_product.dart';
import 'package:app_project/model/product_model.dart';
import 'package:app_project/Product%20_List/update_product.dart';
import 'package:app_project/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Product> _products = [];

  void initState() {
    super.initState();
    _getProducts();
  }

  Future<void> _getProducts() async {
    Uri uri = Uri.parse(Urls.getProductUrl);
    Response response = await get(uri);

    debugPrint (response.statusCode.toString());
    debugPrint (response.body);

    if(response.statusCode == 200){
      final decodeJson = jsonDecode(response.body);
      for(Map<String, dynamic> productJson in decodeJson['products']){
         Product product = Product(title: '', id: 0, stock: 0, price: 0);

         product.title = productJson['title'];
         product.id = productJson['title'];
         product.stock = productJson['title'];
         product.price = productJson['title'];

         _products.add(product);


      }
    }
    setState(() {

    });

  }




  void _addNewProduct(Product item){
    setState(() {
      _products.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Product List'),
      ),
      body:_products.isEmpty
      ? Center(child: Text('No Products added'),):
      ListView.separated(
         itemCount: _products.length,
          itemBuilder: (context, index){
           final product = _products[index];
           return ListTile(
             leading: CircleAvatar(
             ),
             title: Text(product.title, style: TextStyle(fontWeight: FontWeight.bold),),
             subtitle: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('Id:${product.id}'),
                 Row(
                   children: [
                     Expanded(child: Text('stock:${product.stock}')),
                     SizedBox(width: 16,),
                     Expanded(child: Text('price:${product.price}')),
                   ],

                 ),
               ],
             ),
             trailing:PopupMenuButton<ProductOptions>(
                 itemBuilder:(context) {
                   return [
                     PopupMenuItem(
                     value: ProductOptions.update,
                       child: Text('Update')),
                     PopupMenuItem(
                     value: ProductOptions.delete,
                       child: Text('Delete')),
                   ];
                 },
             onSelected:(ProductOptions selectedOption){
                  if(selectedOption == ProductOptions.delete){
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Confirm Delete'),
                          content: Text('Are You Want to Delete?'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Cancle')),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    _products.removeAt(index);
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text('Delete')),
                          ],
                        ));



                  }else if(selectedOption == ProductOptions.update){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProduct(product: product, index: index),)).
                    // then((updatedProduct) {
                    //   if (updatedProduct != null) {
                    //     setState(() {
                    //       _products[index] = updatedProduct;
                    //     });
                    //   }
                    // });

                  }
             },
             ),

           );

          }, separatorBuilder: (context,index) {
           return Divider(
             indent: 70,

           );
      },),

      floatingActionButton: FloatingActionButton(onPressed: () async{


        final newProduct = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddNewProduct()),
        );
        if (newProduct != null) {
            _addNewProduct(newProduct);
        }
      },
        child:Icon(Icons.add),)
    );
  }
}

enum ProductOptions {
  update,
  delete
}

