import 'package:app_project/model/product_model.dart';
import 'package:flutter/material.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Add New Product'),
      ),
      body: Container(
        margin: const EdgeInsets.all(12.0),
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key:_formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText:' Product Title',
                  labelText: ' Product Title',
                ),
                validator: (value) => value!.isEmpty ? "Title": null,
              ),
              TextFormField(
                controller: _idController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText:'Id',
                  labelText: 'Id',
                ),
                validator: (value) => value!.isEmpty ? "Enter Id": null,
              ),
              TextFormField(
                controller: _stockController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText:' Stock',
                  labelText: 'Stock',
                ),
                validator: (value) => value!.isEmpty ? "Enter Stock": null,
              ),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText:'Price',
                  labelText: 'Price',
                ),
                validator: (value) => value!.isEmpty ? "Enter price": null,
              ),

              SizedBox(height: 8,),
              FilledButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  final newProduct = Product(
                    title: _titleController.text,
                    id: int.parse(_idController.text),
                    stock: int.parse(_stockController.text),
                    price: double.parse(_priceController.text)
                  );

                  Navigator.pop(context, newProduct);
                }
              }, child: Text('Add Product')),

            ],
          ),
        ),
      ),
    );

  }
  @override
  void dispose(){
    _titleController.dispose();
    _idController.dispose();
    _stockController.dispose();
    _priceController.dispose();

    super.dispose();

  }
}
