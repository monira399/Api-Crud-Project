// import 'package:app_project/model/product_model.dart';
// import 'package:flutter/material.dart';
//
// class UpdateProduct extends StatefulWidget {
//   final Product product;
//   final int index;
//
//   const UpdateProduct({super.key, required this.product, required this.index});
//
//   @override
//   State<UpdateProduct> createState() => _AddNewProductState();
// }
//
//
// class _AddNewProductState extends State<UpdateProduct> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _codeController = TextEditingController();
//   final TextEditingController _quantityController = TextEditingController();
//   final TextEditingController _unitpriceController = TextEditingController();
//   final TextEditingController _imageurlController = TextEditingController();
//
//   void initState(){
//     super.initState();
//     _nameController.text =widget.product.name;
//     _codeController.text = widget.product.code;
//     _quantityController.text = widget.product.quantity.toString();
//     _unitpriceController.text = widget.product.unitPrice.toString();
//     _imageurlController.text = widget.product.imageUrl;
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:AppBar(
//         title:Text('Update Product'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           margin: const EdgeInsets.all(12.0),
//           padding: const EdgeInsets.all(15.0),
//           child: Form(
//             key:_formKey,
//             child: Column(
//               children: [
//                 TextFormField(
//                   controller: _nameController,
//                   textInputAction: TextInputAction.next,
//                   decoration: InputDecoration(
//                     hintText:' Product name',
//                     labelText: ' Product name',
//                   ),
//                 ),
//                 TextFormField(
//                   controller: _codeController,
//                   textInputAction: TextInputAction.next,
//                   decoration: InputDecoration(
//                     hintText:'code',
//                     labelText: 'code',
//                   ),
//                 ),
//                 TextFormField(
//                   controller: _quantityController,
//                   keyboardType: TextInputType.number,
//                   textInputAction: TextInputAction.next,
//                   decoration: InputDecoration(
//                     hintText:' Quantity',
//                     labelText: 'Quantity',
//                   ),
//                 ),
//                 TextFormField(
//                   controller: _unitpriceController,
//                   keyboardType: TextInputType.number,
//                   textInputAction: TextInputAction.next,
//                   decoration: InputDecoration(
//                     hintText:'Unit Price',
//                     labelText: 'Unit Price',
//                   ),
//                 ),
//                 TextFormField(
//                   controller: _imageurlController,
//                   decoration: InputDecoration(
//                     hintText:'image url',
//                     labelText: 'image url',
//                   ),
//                 ),
//                 SizedBox(height: 8,),
//                 FilledButton(onPressed: (){
//                   if(_formKey.currentState!.validate()){
//                     final updatedProduct = Product(
//                         name: _nameController.text,
//                         quantity: int.parse(_quantityController.text),
//                         unitPrice: double.parse(_unitpriceController.text),
//                         code: _codeController.text,
//                         imageUrl: _imageurlController.text,
//                     );
//                     Navigator.pop(context, updatedProduct);
//                   }
//                 }, child: Text('Update'))
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//
//   }
//   @override
//   void dispose(){
//     _nameController.dispose();
//     _codeController.dispose();
//     _quantityController.dispose();
//     _unitpriceController.dispose();
//     _imageurlController.dispose();
//
//     super.dispose();
//
//   }
// }
