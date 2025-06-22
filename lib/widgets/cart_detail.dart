import 'package:flutter/material.dart';
import '../providers/cart_provider.dart';
import "package:provider/provider.dart";


class CartDetail extends StatefulWidget {
  const CartDetail({super.key});

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
  @override
  Widget build(BuildContext context) {
  debugPrint(Provider.of<CartProvider>(context).product.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Details",
        style: Theme.of(context).textTheme.bodyMedium),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: Provider.of<CartProvider>(context).product.length,
        itemBuilder: (context,index){
        
      
        final  data = Provider.of<CartProvider>(context).product[index];
        

        return ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("${data['imgUrl']}"),
          ),

          trailing: IconButton(
          onPressed: (){
           showDialog(context: context, 
           barrierDismissible: false,
           builder: (context){

            return AlertDialog.adaptive(
            
              title: Text("Warning !",
              style: Theme.of(context).textTheme.bodyLarge
              ,),
              content: const Text("Are you sure you want to remove this product from the cart ?"),
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child:  const Text("No",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
                )
                
                ),

                TextButton(onPressed: (){
                  Provider.of<CartProvider>(context,listen: false).removeFromCart(data);
                  Navigator.pop(context);
                }, child: const Text("Yes",
                style:  TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                )
                ),
                
                )
              ],
              
            );
            
           }
           );
          },
          icon: const Icon(Icons.delete),
          color: Colors.red,),

          title: Text(data['title'].toString(),
          style: Theme.of(context).textTheme.bodyMedium,
          ),

          subtitle: Text("Size :- ${data['sizes']}",
          style: Theme.of(context).textTheme.bodySmall,
          ),

          
        );    
      }
      ),

    );
  }
}