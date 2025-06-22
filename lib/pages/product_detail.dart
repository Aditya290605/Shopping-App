import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';


class ProductDetail extends StatefulWidget{

  final Map<String,dynamic> productDetail;


  const ProductDetail({super.key,

  required this.productDetail


  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  int selected = 0;
  @override
  Widget build(BuildContext context) { 
  final detail = widget.productDetail;
  
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            
          },
          icon : const Icon(Icons.arrow_back_ios_new_rounded)),
        title:  Text("Details",
                style: Theme.of(context).textTheme.bodyMedium
                ),
                centerTitle: true,
      ),

      body: SafeArea(
        child: Column(
          children: [
           
            Text(widget.productDetail['title'],
            style: Theme.of(context).textTheme.bodyLarge,
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(widget.productDetail['imgUrl'],
              height: 250,),
            ),

            const Spacer(
              flex: 2,
            ),

            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color.fromRGBO(245, 247, 249, 1),
              ),

              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  Text("\$${widget.productDetail['price']}",
                  style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  const SizedBox(height: 10,),
            
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                                
                      itemCount: widget.productDetail['sizes'].length,
                      itemBuilder: (context,index){
                        
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selected = widget.productDetail['sizes'][index];
                              });
                            },

                            child: Chip(
                              label: Text("${widget.productDetail['sizes'][index]}",
                              ),
                              backgroundColor: selected == widget.productDetail['sizes'][index]?
                              Theme.of(context).colorScheme.primary:
                              const Color.fromRGBO(245, 247, 249, 1),
                            ),
                          ),
                        );
                    }
                    ),
                  ),
            
                  const SizedBox(height: 15,),
            
                  ElevatedButton(
                    
                    onPressed: (){
                    
                    if(selected!=0){

                    Provider.of<CartProvider>(context,
                    listen: false).addToCart({
                      "id":detail['id'],
                      "title":detail['title'],
                      "price":detail['price'],
                      "imgUrl":detail['imgUrl'],
                      "company":detail['company'],
                      "sizes":selected,
                    });
                         
                    Fluttertoast.showToast(
                      msg: "Added to Cart !",
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 16);
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select a size")
                        )
                        );
                  }                
            
                  },
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(254, 206, 1, 1)),
                    foregroundColor: WidgetStatePropertyAll(Colors.black),
                    textStyle: WidgetStatePropertyAll(TextStyle(
                      fontSize: 16
                    )
                    ),
                    fixedSize: WidgetStatePropertyAll(Size(350, 50))
                  ),
                  
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart_outlined),
                      Text("Add to Cart")
                    ],
                  ))
                ],
              ),
            )
             
          ],
        ),
      ),
    );
  }
}