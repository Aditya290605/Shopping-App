import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/cart_detail.dart';
import 'package:shopping_app/pages/product_list.dart';


class ShoppingScreen extends StatefulWidget{

  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState()=> _ShoppingScreen();
}

class _ShoppingScreen extends State<ShoppingScreen>{

  final List<String> filter = const ['All','Addidas','Nike','Bata','Jorden'];
  late String filterVal;
  int currentPage = 0;
  String categery = 'All';

  @override
  Widget build(BuildContext context){
    
    List<Widget> page = const[
      ProductList(),
      CartDetail()
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
      
      onTap: (value){
        setState(() {
          currentPage = value;
        }
        );
      },
      currentIndex: currentPage,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      iconSize: 35,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home,),
        label: ''),

        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),
        label: ''),

      ]
      ),

      body: IndexedStack(
        index: currentPage,
        children: page,
      ),
    );
  }
}