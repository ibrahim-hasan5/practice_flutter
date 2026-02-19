import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice/module_13/CRUD/productcontroller.dart';
import 'model/productModel.dart';

class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  ProductController productController = ProductController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future fetchData() async {
    await productController.fetchProducts();
    if (mounted) setState(() {});
  }

  // Optional [item] and [id] parameters: when provided, dialog is in Edit mode.
  // When absent, dialog is in Create mode.
  productDialog({Data? item, String? id}) {
    final bool isEditing = id != null && item != null;

    // Pre-populate controllers with existing data when editing,
    // or leave empty when creating.
    TextEditingController productNameController =
    TextEditingController(text: isEditing ? item!.productName ?? '' : '');
    TextEditingController productIMGController =
    TextEditingController(text: isEditing ? item!.img ?? '' : '');
    TextEditingController productQTYController =
    TextEditingController(text: isEditing ? item!.qty?.toString() ?? '' : '');
    TextEditingController productUnitPriceController =
    TextEditingController(text: isEditing ? item!.unitPrice?.toString() ?? '' : '');
    TextEditingController productTotalPriceController =
    TextEditingController(text: isEditing ? item!.totalPrice?.toString() ?? '' : '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isEditing ? 'Edit Product' : 'Add Product'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: productNameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: productIMGController,
                decoration: InputDecoration(labelText: 'Image'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: productQTYController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'QTY'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: productUnitPriceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Unit price'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: productTotalPriceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Total price'),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final data = Data(
                        productName: productNameController.text,
                        img: productIMGController.text,
                        qty: int.parse(productQTYController.text),
                        unitPrice: int.parse(productUnitPriceController.text),
                        totalPrice: int.parse(productTotalPriceController.text),
                      );

                      bool success;

                      if (isEditing) {
                        // Update existing product
                        success = await productController.updateProduct(id!, data);
                      } else {
                        // Create new product
                        success = await productController.createProduct(data);
                      }

                      await fetchData();
                      Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            success
                                ? isEditing
                                ? 'Product Updated'
                                : 'Product Created'
                                : 'Something went wrong...!',
                          ),
                        ),
                      );
                    },
                    child: Text(
                      isEditing ? 'Update' : 'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product from API'),
      ),
      body: productController.isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 0.8),
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final item = productController.products[index];
            return Card(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 140,
                      child: Image.network(item.img.toString()),
                    ),
                    Text(
                      item.productName.toString(),
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text('Price: \$${item.unitPrice} | QTY:${item.qty}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {
                              // Pass the item and its id to open in Edit mode
                              productDialog(item: item, id: item.sId);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.orange,
                            )),
                        IconButton(
                            onPressed: () async {
                              await productController
                                  .deleteProduct(item.sId.toString())
                                  .then((value) async {
                                if (value) {
                                  await fetchData();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        content: Text('Product Deleted')),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Something went wrong ...!')),
                                  );
                                }
                              });
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // No arguments = Create mode
          productDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}