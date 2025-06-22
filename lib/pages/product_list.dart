import "package:flutter/material.dart";
import 'package:shopping_app/global_variable.dart';
import 'package:shopping_app/widgets/product_card.dart';
import 'package:shopping_app/pages/product_detail.dart';



class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  final List<String> filter = const ['All','Addidas','Nike','Bata','Jorden'];
  String categery = 'All';
  late String filterVal;

   @override
  void initState() {
    super.initState();
    filterVal = filter[0];
  }

  @override
  Widget build(BuildContext context) {

     final screenSize = MediaQuery.of(context).size;
     const border = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
      borderSide: BorderSide(
        color: Color.fromARGB(255, 218, 218, 218)
      )
    );
    return SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding:EdgeInsets.all(20.0),
                  child: Text("Shoes\nCollection",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                    
                Expanded(
                  child: TextField(
                    decoration:const InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      
                    ),
                    style: Theme.of(context).textTheme.bodySmall
                  ),
                )
              ],
            ),

            const SizedBox(height: 15,),


            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filter.length,
                itemBuilder: (context, index) {
                final data = filter[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        filterVal = filter[index];
                        categery = filter[index];
                      });
                      
                    },
                    child: Chip(label: Text(data,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: Color.fromRGBO(245, 247, 249, 1)
                     
                      ),
                      
                    ),
                    
                    backgroundColor: filterVal == filter[index]?
                      Theme.of(context).colorScheme.primary:
                       const Color.fromRGBO(245, 247, 249, 1),
                    ),
                  ),
                );
              },
              ),
            ),

            const SizedBox(height: 20,),

            Expanded(
              child: screenSize.width>1080 ? 
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.75),
                itemCount: products.length,
                
                itemBuilder: (context,index){
                  final product = products[index];
              
                  return Builder(
                    builder: (context) {
                      if(categery == product['company'] || categery == 'All'){
                      return GestureDetector(
                      
                        onTap: (){
                          final product = products[index];
                      
                          Navigator.of(context).push( 
                          MaterialPageRoute(builder: (context) => ProductDetail(
                            productDetail: product,
                            )
                            )
                            );
                        },
                      
                        
                        child: ProductCard(
                          title: product['title'].toString(),
                          url: product['imgUrl'].toString(),
                          price: product['price'] as double,
                          ind: index,
                        ),
                      );
                      }
                      return const SizedBox();
                    }
                  );
              }
              ):
              ListView.builder(
                itemCount: products.length,
                itemBuilder: (context,index){
                  final product = products[index];
              
                  return Builder(
                    builder: (context) {
                      if(categery == product['company'] || categery == 'All'){
                      return GestureDetector(
                      
                        onTap: (){
                          final product = products[index];
                      
                          Navigator.of(context).push( 
                          MaterialPageRoute(builder: (context) => ProductDetail(
                            productDetail: product,
                            )
                            )
                            );
                        },
                        
                        child: ProductCard(
                          title: product['title'].toString(),
                          url: product['imgUrl'].toString(),
                          price: product['price'] as double,
                          ind: index,
                        ),
                      );
                      }
                      return const SizedBox();
                    }
                  );
              }
              )
              
            )
        
          ],
        ),
      );
    
  }
}